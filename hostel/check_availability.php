<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');

require_once 'config.php';

$database = new Database();
$db = $database->getConnection();

$checkin = $_GET['checkin'] ?? '';
$checkout = $_GET['checkout'] ?? '';
$room_id = $_GET['room_id'] ?? null;

try {
    if ($room_id) {
        // Check specific room availability
        $query = "SELECT r.*, 
                  (SELECT COUNT(*) FROM bookings b 
                   WHERE b.room_id = r.id 
                   AND ((b.checkin_date <= :checkout AND b.checkout_date >= :checkin)
                        OR (b.checkin_date >= :checkin AND b.checkin_date < :checkout))) as booked_count
                  FROM rooms r 
                  WHERE r.id = :room_id AND r.availability = 1";
        
        $stmt = $db->prepare($query);
        $stmt->execute([
            ':checkin' => $checkin,
            ':checkout' => $checkout,
            ':room_id' => $room_id
        ]);
        
        $room = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($room) {
            $room['features'] = json_decode($room['features'], true);
            $room['available'] = $room['booked_count'] == 0;
        }
        
        echo json_encode([
            'success' => true,
            'data' => $room
        ]);
    } else {
        // Get all available rooms
        $query = "SELECT * FROM rooms WHERE availability = 1";
        $stmt = $db->prepare($query);
        $stmt->execute();
        
        $rooms = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach($rooms as &$room) {
            $room['features'] = json_decode($room['features'], true);
        }
        
        echo json_encode([
            'success' => true,
            'data' => $rooms
        ]);
    }
    
} catch(PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>