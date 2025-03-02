<?php
    class Database{
        private static $instancia = null;
        private $conn;

        private function __construct()
        {
            $host = 'localhost';
            $user = 'root';
            $database = 'contagem';
            $password = '';

            try{
                $this->conn = new PDO ("mysql:host=$host;dbname=$database",$user,$password);
                $this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            }catch(PDOException $e){
                die("Erro na conexão" . $e->getMessage());
            }
        }

        public static function Conectar(){
            if(self::$instancia === null){
                self::$instancia = new Database();
            }
            return self::$instancia->conn;
        }
    }

    try{
        $conn = Database::Conectar();
        echo 'deu bom';
    }catch(Exception $e){
        echo 'deu ruim' . $e->getMessage();
    }
