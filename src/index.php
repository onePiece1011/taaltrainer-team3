<?php
    require 'auth.php';
    include 'DatabaseConnect.php';

    $username = $_SESSION['username'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/1vooralles.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <main>
        <section class="indexTop">
            <div>
                <img src="Foto's/Logo.png" class="logo" width="100px" alt="Logo">
            </div>

            <div class= "knop">
                <a href="logout.php"><button class="button">uitloggen</button></a>
                <button class="button">
                    <?php
                        $sql = "SELECT xp_points FROM users WHERE username = '$username'";
                        $result = $conn->query($sql);
                            if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                echo "points: " . $row["xp_points"];
                            }
                        } else {
                            echo "0 results";
                        }
                    ?>
                </button>
                <button class="button">
                    <?= $username ?>
                </button>
            </div>
        </section>
        <section>
            <div>
                <a href="turksmenu.php"><button>Turks</button></a>
                
            </div>
            <div>
                <a href="koerdischmenu.php"><button>Koerdisch</button></a>
            </div>
        </section>
        <section>
                <div>
                    <a href="lijst.php"><button>Woordenlijst</button></a>
                    
                </div>
        </section>
    </main>
</body>
</html>