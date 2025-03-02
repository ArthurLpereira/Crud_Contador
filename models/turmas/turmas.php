<?php
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';

    class Turmas{
        private $pdo;

        public function __construct($pdo)
        {
            $this->pdo = $pdo;
        }

        public function Criar_Turmas($nome_turma){
            $sql = 'INSERT INTO turmas(nome_turma) VALUES (:nome)';
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome_turma);
            return $stmt->execute();
        }

        public function Listar_Turmas(){
            $sql = 'SELECT * FROM turmas;';
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        public function Atualizar_Turmas($id_turma, $nome_turma){
            $sql = 'UPDATE turmas SET nome_turma=:nome WHERE :id;';
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome_turma);
            $stmt->bindParam(':id', $id_turma);
            return $stmt->execute();
        }

        public function Deletar_Turmas($id_turma){
            $sql = 'DELETE FROM turmas WHERE id_turma = :id;';
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':id', $id_turma);
            return $stmt->execute();
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <ul>
        <li><a href="./testar_turmas.php">testar</a></li>
    </ul>
</body>
</html>