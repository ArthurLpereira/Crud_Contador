<?php
    // Inclui a conexão com o banco de dados
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './categorias.php';

    // Verifica se o formulário foi enviado
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $nome_categoria = trim($_POST['nome_categoria']);

        if (!empty($nome_categoria)) {
            $pdo = Database::conectar();
            $categoria = new Categoria($pdo);
            $resultado = $categoria->Criar_categoria($nome_categoria);

            if ($resultado) {
                echo "Categoria '$nome_categoria' adicionada com sucesso!";
            } else {
                echo "Erro ao adicionar a categoria.";
            }
        } else {
            echo "Por favor, preencha o nome da categoria.";
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testar Inserção de Categoria</title>
</head>
<body>
    <h2>Adicionar Categoria</h2>
    <form method="POST">
        <label for="nome_categoria">Nome da Categoria:</label>
        <input type="text" id="nome_categoria" name="nome_categoria" required>
        <button type="submit">Adicionar</button>
    </form>
</body>
</html>
