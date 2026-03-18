<?php
    require 'auth.php';
    include 'DatabaseConnect.php';

    $username = $_SESSION['username'];

    // Initialize question queue (20 unique questions) and tracking.
    if (!isset($_SESSION['turks_questions']) || !isset($_SESSION['turks_question_index'])) {
        $result = $conn->query("SELECT turkish_word, dutch_word FROM vocabulary WHERE turkish_word IS NOT NULL AND dutch_word IS NOT NULL AND category = 'Woorden'");
        $all = [];
        while ($row = $result->fetch_assoc()) {
            $all[] = $row;
        }

        shuffle($all);
        $_SESSION['turks_questions'] = array_slice($all, 0, 20);
        $_SESSION['turks_question_index'] = 0;
        $_SESSION['turks_wrong'] = [];
        $_SESSION['turks_status'] = null;
        $_SESSION['turks_repeat_phase'] = false;
        $_SESSION['turks_answered'] = 0;
    }

    // Handle answer submission or restart
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_POST['restart'])) {
            // Reset the quiz
            unset($_SESSION['turks_questions']);
            unset($_SESSION['turks_question_index']);
            unset($_SESSION['turks_wrong']);
            unset($_SESSION['turks_status']);
            unset($_SESSION['turks_repeat_phase']);
            unset($_SESSION['turks_answered']);
            unset($_SESSION['turks_total_questions']);
            header('Location: turkswoordenleren.php');
            exit();
        } elseif (isset($_POST['question_index'])) {
            $index = (int)$_POST['question_index'];
            $answer = $_POST['answer'] ?? '';

            if (isset($_SESSION['turks_questions'][$index])) {
                $question = $_SESSION['turks_questions'][$index];
                $correct = $question['dutch_word'];

                if ($answer === $correct) {
                    $sql = $conn->prepare("UPDATE users SET xp_points = xp_points + 1 WHERE username = ?");
                    $sql->bind_param("s", $username);
                    $sql->execute();

                    $_SESSION['turks_status'] = [
                        'result' => 'correct',
                        'correct' => $correct,
                    ];
                } else {
                    $_SESSION['turks_status'] = [
                        'result' => 'wrong',
                        'correct' => $correct,
                    ];
                    $_SESSION['turks_wrong'][] = $question;
                }

                $_SESSION['turks_question_index']++;

                // When we run out, switch to wrong questions (repeat them)
                if ($_SESSION['turks_question_index'] >= count($_SESSION['turks_questions'])) {
                    if (!empty($_SESSION['turks_wrong']) && !$_SESSION['turks_repeat_phase']) {
                        $_SESSION['turks_questions'] = $_SESSION['turks_wrong'];
                        $_SESSION['turks_wrong'] = [];
                        $_SESSION['turks_question_index'] = 0;
                        $_SESSION['turks_repeat_phase'] = true;
                    } else {
                        $_SESSION['turks_status'] = ['result' => 'finished'];
                    }
                }
            }

            header('Location: turkswoordenleren.php');
            exit();
        }
    }

    $currentIndex = $_SESSION['turks_question_index'];
    $currentQuestion = $_SESSION['turks_questions'][$currentIndex] ?? null;
    $finished = isset($_SESSION['turks_status']['result']) && $_SESSION['turks_status']['result'] === 'finished';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turks Leren</title>
</head>
<body>
    <main>
        <section>
            <div>
                <h1>Turks oefenen</h1>
                <?php
                    $status = $_SESSION['turks_status'] ?? null;

                    if ($finished) {
                        echo '<p style="font-weight: bold;">Je hebt de vragenlijst afgerond!</p>';
                        echo '<form method="post">';
                        echo '<button type="submit" name="restart" value="1">Opnieuw beginnen</button>';
                        echo '</form>';
                    } elseif (!$currentQuestion) {
                        echo '<p>Geen woorden beschikbaar.</p>';
                    } else {
                        $turkish_word = $currentQuestion['turkish_word'];
                        $correct_dutch = $currentQuestion['dutch_word'];

                        $all_dutch = array_column($_SESSION['turks_questions'], 'dutch_word');
                        shuffle($all_dutch);

                        $wrong_options = [];
                        foreach ($all_dutch as $d) {
                            if ($d !== $correct_dutch && count($wrong_options) < 3) {
                                $wrong_options[] = $d;
                            }
                        }

                        $options = array_merge([$correct_dutch], $wrong_options);
                        shuffle($options);

                        echo '<p>Wat is de Nederlandse vertaling van: <strong>' . htmlspecialchars($turkish_word) . '</strong></p>';
                        echo '<form method="post">';
                        foreach($options as $i => $opt) {
                            echo '<input type="radio" name="answer" value="' . htmlspecialchars($opt) . '" id="opt' . $i . '" required>';
                            echo '<label for="opt' . $i . '">' . htmlspecialchars($opt) . '</label><br>';
                        }
                        echo '<input type="hidden" name="question_index" value="' . $currentIndex . '">';
                        echo '<input type="submit" value="Controleer">';
                        echo '</form>';
                    }

                    // Show status message and clear it
                    if (isset($_SESSION['turks_status']) && is_array($_SESSION['turks_status'])) {
                        if ($_SESSION['turks_status']['result'] === 'correct') {
                            echo '<p style="color: green; font-weight: bold;">Correct!</p>';
                        } elseif ($_SESSION['turks_status']['result'] === 'wrong') {
                            echo '<p style="color: red; font-weight: bold;">Fout, het juiste antwoord is: ' . htmlspecialchars($_SESSION['turks_status']['correct']) . '</p>';
                        }
                        unset($_SESSION['turks_status']);
                    }
                ?>
            </div>
        </section>
    </main>
</body>
</html>