<?php
    session_start();
    include 'DatabaseConnect.php';
    
    if(!isset($_SESSION['username'])){
        header("Location: login.php");
        exit();
    }
    
    $username = $_SESSION['username'];
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
                    $sql = "SELECT * FROM vocabulary WHERE turkish_word IS NOT NULL AND dutch_word IS NOT NULL AND category = 'Woorden'";
                    $result = $conn->query($sql);

                    $vocab = [];
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            $vocab[] = $row;
                        }
                    }

                    if (empty($vocab)) {
                        echo "<p>Geen woorden beschikbaar.</p>";
                    } else {
                        $question = $vocab[array_rand($vocab)];
                        $turkish_word = $question['turkish_word'];
                        $correct_dutch = $question['dutch_word'];

                        $wrong_options = [];
                        $all_dutch = array_column($vocab, 'dutch_word');
                        shuffle($all_dutch);
                        foreach($all_dutch as $d) {
                            if ($d != $correct_dutch && count($wrong_options) < 3) {
                                $wrong_options[] = $d;
                            }
                        }

                        $options = array_merge([$correct_dutch], $wrong_options);
                        shuffle($options);
                    }
                ?>
                <?php if (!empty($vocab)): ?>
                    <p>Wat is de Nederlandse vertaling van: <strong><?php echo htmlspecialchars($turkish_word); ?></strong></p>
                    <form method="post">
                        <?php foreach($options as $i => $opt): ?>
                            <input type="radio" name="answer" value="<?php echo htmlspecialchars($opt); ?>" id="opt<?php echo $i; ?>" required>
                            <label for="opt<?php echo $i; ?>"><?php echo htmlspecialchars($opt); ?></label><br>
                        <?php endforeach; ?>
                        <input type="hidden" name="correct" value="<?php echo htmlspecialchars($correct_dutch); ?>">
                        <input type="submit" value="Controleer">
                    </form>
                <?php endif; ?>

                <?php
                    if(isset($_GET['correct']) && $_SERVER['REQUEST_METHOD'] != 'POST') {
                        echo "<p style='color: green; font-weight: bold;'>Correct!</p>";
                    }
                    
                    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                        $answer = $_POST['answer'];
                        $correct = $_POST['correct'];
                        if ($answer == $correct) {
                            $sql = $conn->prepare("UPDATE users SET xp_points = xp_points + 1 WHERE username = ?");
                            $sql->bind_param("s", $username);
                            $sql->execute();
                            header("Location: turkswoordenleren.php?correct=1");
                            exit();
                        } else {
                            echo "<p>Fout, het juiste antwoord is: " . htmlspecialchars($correct) . "</p>";
                        }
                    }
                ?>
            </div>
        </section>
    </main>
</body>
</html>