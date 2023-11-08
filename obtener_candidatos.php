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

$stmt = $pdo->query("SELECT * FROM candidatos");
$candidatos = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($candidatos);
