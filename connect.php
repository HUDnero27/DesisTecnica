<?php
$conn = mysqli_connect("localhost:3308", "root", "123456789", "sistema_votacion");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Conectado";

?>