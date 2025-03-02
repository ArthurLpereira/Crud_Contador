<?php
    // echo __DIR__;
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    class Categoria{
        private $pdo;

        public function __construct($pdo)
        {
            $this->pdo = $pdo;
        }
        // Testado
        public function Criar_Categoria($nome_categoria){
            $sql = 'INSERT INTO categorias (nome_categoria,ativa_categoria) VALUES (:nome, 1 );';
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome_categoria);
            return $stmt->execute();
        }
        // Testado
        public function Listar_Categorias(){
            $sql = 'SELECT * FROM categorias;';
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        // Testado
        public function Atualizar_Categoria($id ,$nome_categoria, $ativo ){
            $sql = 'UPDATE categorias SET nome_categoria=:nome,ativa_categoria =:ativo WHERE id_categoria = :id;';
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindParam(':nome', $nome_categoria);
            $stmt->bindParam(':ativo', $ativo);
            $stmt->bindParam(':id', $id);
            return $stmt->execute();
        }
    }

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>categorias</title>
</head>
<body>
    <h1>Ver se funciona</h1> 
    <ul>
        <li><a href="./criar_categorias.php">Criar</a></li>
        <li><a href="./listar_categorias.php">Listar</a></li>
        <li><a href="./update_categoria.php">Atualizar</a></li>
    </ul>
</body>
</html>