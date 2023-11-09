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

// Obtener los datos del formulario
$nombre = $_POST['nombre'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$email = $_POST['email'];
$region = $_POST['region'];
$comuna = $_POST['comuna'];
$candidato = $_POST['candidato'];
$entero = $_POST['entero'];

// Verificar duplicación de votos por RUT
if (existeVotoPorRUT($rut)) {
    die('Ya has votado anteriormente.');
}

// Guardar el voto en la base de datos
guardarVoto($nombre, $alias, $rut, $email, $region, $comuna, $candidato, $entero);

echo '¡Gracias por tu voto!';

function existeVotoPorRUT($rut) {
    global $pdo;

    $stmt = $pdo->prepare("SELECT COUNT(*) FROM votos WHERE rut = :rut");
    $stmt->bindParam(':rut', $rut);
    $stmt->execute();

    return $stmt->fetchColumn() > 0;
}

function guardarVoto($nombre, $alias, $rut, $email, $region, $comuna, $candidato, $entero) {
    global $pdo;
    echo json_encode($nombre, $alias, $rut, $email, $region, $comuna, $candidato,array($entero));
    $regionID = obtenerRegionID($region);
    $comunaID = obtenerComunaID($comuna, $regionID);
    $candidatoID = obtenerCandidatoID($candidato);

    $stmt = $pdo->prepare("INSERT INTO votos (nombre_apellido, alias, rut, email, region_id, comuna_id, candidato_id) VALUES (:nombre, :alias, :rut, :email, :region_id, :comuna_id, :candidato_id)");
    $stmt->bindParam(':nombre', $nombre);
    $stmt->bindParam(':alias', $alias);
    $stmt->bindParam(':rut', $rut);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':region_id', $regionID);
    $stmt->bindParam(':comuna_id', $comunaID);
    $stmt->bindParam(':candidato_id', $candidatoID);
    $stmt->execute();

    guardarComoSeEntero($rut, $entero);
}

function obtenerRegionID($region) {
    global $pdo;

    $stmt = $pdo->prepare("SELECT id FROM regiones WHERE nombre = :nombre");
    $stmt->bindParam(':nombre', $region);
    $stmt->execute();

    return $stmt->fetchColumn();
}

function obtenerComunaID($comuna, $regionID) {
    global $pdo;

    $stmt = $pdo->prepare("SELECT id FROM comunas WHERE nombre = :nombre AND region_id = :region_id");
    $stmt->bindParam(':nombre', $comuna);
    $stmt->bindParam(':region_id', $regionID);
    $stmt->execute();

    return $stmt->fetchColumn();
}

function obtenerCandidatoID($candidato) {
    global $pdo;

    $stmt = $pdo->prepare("SELECT id FROM candidatos WHERE nombre = :nombre");
    $stmt->bindParam(':nombre', $candidato);
    $stmt->execute();

    return $stmt->fetchColumn();
}

function guardarComoSeEntero($rut, $opciones) {
    global $pdo;

    foreach ($opciones as $opcion) {
        $stmt = $pdo->prepare("INSERT INTO como_se_entero (rut, opcion) VALUES (:rut, :opcion)");
        $stmt->bindParam(':rut', $rut);
        $stmt->bindParam(':opcion', $opcion);
        $stmt->execute();
    }
}
