<?php

$host = 'localhost';
$dbName = 'sistema_votacion';
$username = 'root';
$password = '123456789';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Error al conectar con la base de datos: ' . $e->getMessage());
}

// Obtener el ID de la comuna seleccionada
if (isset($_GET["comunaID"])) {
    $comunaID = $_GET["comunaID"];
} else {
    $comunaID = null;
}

// Realizar la consulta SQL
$sql = "SELECT * FROM candidatos
WHERE comuna_id = ?
";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(1, $comunaID);
$stmt->execute();

// Obtener los datos de los candidatos
$candidatos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Devolver los datos de los candidatos
echo json_encode($candidatos);
