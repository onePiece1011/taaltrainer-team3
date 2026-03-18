<?php
    include 'DatabaseConnect.php';
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
                    // Haal alle woorden op uit de database
                    $sql = "SELECT * FROM vocabulary WHERE turkish_word IS NOT NULL AND dutch_word IS NOT NULL";
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
                        // Kies een willekeurig woord voor de vraag
                        $question = $vocab[array_rand($vocab)];
                        $turkish_word = $question['turkish_word'];
                        $correct_dutch = $question['dutch_word'];

                        // Haal 3 verkeerde opties op
                        $wrong_options = [];
                        $all_dutch = array_column($vocab, 'dutch_word');
                        shuffle($all_dutch);
                        foreach($all_dutch as $d) {
                            if ($d != $correct_dutch && count($wrong_options) < 3) {
                                $wrong_options[] = $d;
                            }
                        }

                        // Combineer correct en verkeerd, en schud door elkaar
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
                    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                        $answer = $_POST['answer'];
                        $correct = $_POST['correct'];
                        if ($answer == $correct) {
                            echo "<p style='color: green;'>Correct!</p>";
                        } else {
                            echo "<p style='color: red;'>Fout, het juiste antwoord is: " . htmlspecialchars($correct) . "</p>";
                        }
                    }
                ?>
            </div>
        </section>
    </main>
</body>
</html>