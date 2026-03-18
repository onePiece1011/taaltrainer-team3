<?php
    include 'DatabaseConnect.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <main>
        <section>
            <div>
                <h1>Turks oefenen</h1>
                <?php
                    $sql = "SELECT * FROM woorden WHERE taal = 'Turks'";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<p>" . $row["woord"] . " - " . $row["vertaling"] . "</p>";
                        }
                    } else {
                        echo "0 results";
                    }
                ?>
            </div>
        </section>
    </main>
</body>
</html>