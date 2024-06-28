<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, DELETE, PUT, POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'config.php';

$input = json_decode(file_get_contents('php://input'), true);

if ($_SERVER['REQUEST_METHOD'] === 'PUT' || $_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($input['id'])) {
        $id = intval($input['id']);
        try {
            $stmt = $conn->prepare("UPDATE books SET titulo = :titulo, autor = :autor, fecha_lanzamiento = :fecha_lanzamiento WHERE id = :id");
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->bindParam(':titulo', $input['titulo']);
            $stmt->bindParam(':autor', $input['autor']);
            $stmt->bindParam(':fecha_lanzamiento', $input['fecha_lanzamiento']);
            
            if ($stmt->execute()) {
                echo json_encode(["message" => "Record updated successfully"]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Failed to update record"]);
            }
        } catch (PDOException $e) {
            http_response_code(500);
            echo json_encode(["error" => "Database error: " . $e->getMessage()]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["error" => "ID not provided"]);
    }
} else {
    http_response_code(405);
    echo json_encode(["message" => "Method not allowed"]);
}
?>
