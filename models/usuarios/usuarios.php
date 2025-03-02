<?php
include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
class Usuarios
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }
    // Testado
    public function Criar_Usuarios($nome_usuario, $senha_usuario, $nivel_usuario, $ativo_usuario)
    {
        $sql = 'INSERT INTO usuarios (nome_usuario, senha_usuario, nivel_usuario, ativo_usuario) VALUES (:nome,:senha,:nivel,:ativo);';
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome_usuario);
        $stmt->bindParam(':senha', $senha_usuario);
        $stmt->bindParam(':nivel', $nivel_usuario);
        $stmt->bindParam(':ativo', $ativo_usuario);
        return $stmt->execute();
    }
    //Testado
    public function Listar_Usuarios()
    {
        $sql = 'SELECT * FROM usuarios;';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    //Testado
    public function Atualizar_Usuarios($id_usuario, $nome_usuario, $senha_usuario, $nivel_usuario, $ativo_usuario)
    {
        $sql = 'UPDATE usuarios SET nome_usuario=:nome,senha_usuario=:senha,nivel_usuario=:nivel,ativo_usuario=:ativo WHERE id_usuario = :id;';
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome_usuario);
        $stmt->bindParam(':senha', $senha_usuario);
        $stmt->bindParam(':nivel', $nivel_usuario);
        $stmt->bindParam(':ativo', $ativo_usuario);
        $stmt->bindParam(':id', $id_usuario);
        return $stmt->execute();
    }

    public function Excluir_Usuario($id){
        $sql = 'DELETE FROM `usuarios` WHERE id_usuario = :id;';
        $stmt = $this->pdo->prepare($sql);
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
        <li><a href="./criar_usuarios.php">Criar</a></li>
        <li><a href="./listar_usuarios.php">Listar</a></li>
        <li><a href="./atualizar_usuarios.php">Atualizar</a></li>
        <li><a href="./excluir_usuarios.php">Excluir</a></li>
    </ul>
</body>

</html>