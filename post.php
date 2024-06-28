<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, DELETE, PUT, POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    
    try {
        $stmt = $conn->prepare("INSERT INTO books (titulo, autor, fecha_lanzamiento) VALUES (:titulo, :autor, :fecha_lanzamiento)");
        $stmt->bindParam(':titulo', $input['titulo']);
        $stmt->bindParam(':autor', $input['autor']);
        $stmt->bindParam(':fecha_lanzamiento', $input['fecha_lanzamiento']);

        
        if ($stmt->execute()) {
            http_response_code(201);
            echo json_encode(["message" => "New record created successfully"]);
        } else {
            http_response_code(500);
            echo json_encode(["error" => "Failed to create record"]);
        }
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
} else {
    http_response_code(405);
    echo json_encode(["message" => "Method not allowed"]);
}
?>
