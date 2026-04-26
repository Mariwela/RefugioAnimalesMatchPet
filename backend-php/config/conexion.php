<?php
class Database {
    private $host = DB_HOST;
    private $db_name = DB_NAME;
    private $username = DB_USER;
    private $password = DB_PASS;
    private $charset = DB_CHARSET;
    public $conn;

    public function getConnection() {
        $this->conn = null;

        $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->db_name . ";charset=" . $this->charset;
        
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        try {
            $this->conn = new PDO($dsn, $this->username, $this->password, $options);
        } catch (PDOException $e) {
            if (defined('DEBUG_MODE') && DEBUG_MODE) {
                die("❌ Error de conexión: " . $e->getMessage());
            } else {
                die("❌ Error de sistema.");
            }
        }

        return $this->conn;
    }
}