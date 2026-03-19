<?php
    require 'auth.php';
    include 'DatabaseConnect.php';

    $username = $_SESSION['username'];


    if (isset($_GET['reset']) && $_GET['reset'] === 'true') {
        unset($_SESSION['koerdisch_questions']);
        unset($_SESSION['koerdisch_question_index']);
        unset($_SESSION['koerdisch_wrong']);
        unset($_SESSION['koerdisch_status']);
        unset($_SESSION['koerdisch_repeat_phase']);
        unset($_SESSION['koerdisch_answered']);
        unset($_SESSION['koerdisch_total_questions']);
        header('Location: koerdischwoordenleren.php');
        exit();
    }

    if (!isset($_SESSION['koerdisch_questions']) || !isset($_SESSION['turks_question_index'])) {
        $result = $conn->query("SELECT kurdish_word, dutch_word FROM vocabulary WHERE kurdish_word IS NOT NULL AND dutch_word IS NOT NULL AND category = 'Getallen'");
        $all = [];
        while ($row = $result->fetch_assoc()) {
            $all[] = $row;
        }

        shuffle($all);
        $_SESSION['koerdisch_questions'] = array_slice($all, 0, 20);
        $_SESSION['koerdisch_question_index'] = 0;
        $_SESSION['koerdisch_wrong'] = [];
        $_SESSION['koerdisch_status'] = null;
        $_SESSION['koerdisch_repeat_phase'] = false;
        $_SESSION['koerdisch_answered'] = 0;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_POST['restart'])) {
            unset($_SESSION['koerdisch_questions']);
            unset($_SESSION['koerdisch_question_index']);
            unset($_SESSION['koerdisch_wrong']);
            unset($_SESSION['koerdisch_status']);
            unset($_SESSION['koerdisch_repeat_phase']);
            unset($_SESSION['koerdisch_answered']);
            unset($_SESSION['koerdisch_total_questions']);
            header('Location: koerdischwoordenleren.php');
            exit();
        } elseif (isset($_POST['back_to_menu'])) {

            unset($_SESSION['koerdisch_questions']);
            unset($_SESSION['koerdisch_question_index']);
            unset($_SESSION['koerdisch_wrong']);
            unset($_SESSION['koerdisch_status']);
            unset($_SESSION['koerdisch_repeat_phase']);
            unset($_SESSION['koerdisch_answered']);
            unset($_SESSION['koerdisch_total_questions']);
            

            header('Location: koerdischmenu.php');
            exit();
        } elseif (isset($_POST['question_index'])) {
            $index = (int)$_POST['question_index'];
            $answer = $_POST['answer'] ?? '';

            if (isset($_SESSION['koerdisch_questions'][$index])) {
                $question = $_SESSION['koerdisch_questions'][$index];
                $correct = $question['dutch_word'];

                if ($answer === $correct) {
                    $sql = $conn->prepare("UPDATE users SET xp_points = xp_points + 1 WHERE username = ?");
                    $sql->bind_param("s", $username);
                    $sql->execute();

                    $_SESSION['koerdisch_status'] = [
                        'result' => 'correct',
                        'correct' => $correct,
                    ];
                } else {
                    $_SESSION['koerdisch_status'] = [
                        'result' => 'wrong',
                        'correct' => $correct,
                    ];
                    $_SESSION['koerdisch_wrong'][] = $question;
                }

                $_SESSION['koerdisch_question_index']++;


                if ($_SESSION['koerdisch_question_index'] >= count($_SESSION['koerdisch_questions'])) {
                    if (!empty($_SESSION['koerdisch_wrong']) && !$_SESSION['koerdisch_repeat_phase']) {
                        $_SESSION['koerdisch_questions'] = $_SESSION['koerdisch_wrong'];
                        $_SESSION['koerdisch_wrong'] = [];
                        $_SESSION['koerdisch_question_index'] = 0;
                        $_SESSION['koerdisch_repeat_phase'] = true;
                    } else {
                        $_SESSION['koerdisch_status'] = ['result' => 'finished'];
                    }
                }
            }

            header('Location: koerdischwoordenleren.php');
            exit();
        }
    }

    $currentIndex = $_SESSION['koerdisch_question_index'];
    $currentQuestion = $_SESSION['koerdisch_questions'][$currentIndex] ?? null;
    $finished = isset($_SESSION['koerdisch_status']['result']) && $_SESSION['koerdisch_status']['result'] === 'finished';
    $totalQuestions = count($_SESSION['koerdisch_questions']);
    $isRepeatPhase = $_SESSION['koerdisch_repeat_phase'] ?? false;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turks Leren</title>
    <link rel="stylesheet" href="css/1vooralles.css">
</head>
<body>
    <main>
        <section>
            <div>
                <h1>Koerdisch cijfers oefenen</h1>
                <?php
                    $status = $_SESSION['koerdisch_status'] ?? null;

                    if ($finished) {
                        echo '<p>Je hebt de vragenlijst afgerond!</p>';
                    } elseif (!$currentQuestion) {
                        echo '<p>Geen woorden beschikbaar.</p>';
                    } else {
                        $kurdish_word = $currentQuestion['kurdish_word'];
                        $correct_dutch = $currentQuestion['dutch_word'];

                        $all_dutch = array_column($_SESSION['koerdisch_questions'], 'dutch_word');
                        shuffle($all_dutch);

                        $wrong_options = [];
                        foreach ($all_dutch as $d) {
                            if ($d !== $correct_dutch && count($wrong_options) < 3) {
                                $wrong_options[] = $d;
                            }
                        }

                        $options = array_merge([$correct_dutch], $wrong_options);
                        shuffle($options);


                        if ($isRepeatPhase) {
                            echo '<p><strong>Herhalingsfase:</strong> Je oefent nu de woorden die je eerder fout had.</p>';
                        }


                        echo '<p class="question-progress">Vraag ' . ($currentIndex + 1) . ' van ' . $totalQuestions . '</p>';
                        echo '<p>Wat is de Nederlandse vertaling van: <strong>' . htmlspecialchars($kurdish_word) . '</strong></p>';
                        echo '<form method="post">';
                        foreach($options as $i => $opt) {
                            echo '<input type="radio" name="answer" value="' . htmlspecialchars($opt) . '" id="opt' . $i . '" required>';
                            echo '<label for="opt' . $i . '">' . htmlspecialchars($opt) . '</label><br>';
                        }
                        echo '<input type="hidden" name="question_index" value="' . $currentIndex . '">';
                        

                        echo '<input type="submit" value="Controleer">';
                        echo '</form>';
                    }

                    if (isset($_SESSION['koerdisch_status']) && is_array($_SESSION['koerdisch_status'])) {
                        if ($_SESSION['koerdisch_status']['result'] === 'correct') {
                            echo '<p>Correct!</p>';
                        } elseif ($_SESSION['koerdisch_status']['result'] === 'wrong') {
                            echo '<p>Fout, het juiste antwoord is: ' . htmlspecialchars($_SESSION['koerdisch_status']['correct']) . '</p>';
                        }
                        unset($_SESSION['koerdisch_status']);
                    }
                ?>
            </div>
        </section>
        
        <div>
            <form method="post">
                <button type="submit" name="restart" value="1">Opnieuw beginnen</button>
            </form>
            
            <form method="post">
                <button type="submit" name="back_to_menu" value="1">Terug naar menu</button>
            </form>
        </div>
    </main>
</body>
</html>
