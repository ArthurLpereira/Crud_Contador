<?php
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './usuarios.php';

    $pdo = Database::conectar();
    $usuarios = new Usuarios($pdo);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id'];
        if ($usuarios->Excluir_Funcionario($id)) {
            echo "Funcionário excluído com sucesso!";
        } else {
            echo "Erro ao excluir funcionário.";
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir Funcionário</title>
</head>
<body>
    <h1>Excluir Funcionário</h1>
    <form method="POST" action="">
        <label for="id">ID do Funcionário:</label>
        <input type="number" id="id" name="id" required>
        <button type="submit">Excluir</button>
    </form>
</body>
</html>
