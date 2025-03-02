<?php
    // Inclui a classe de conexão
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './categorias.php';


    // Conexão com o banco
    $pdo = Database::conectar();
    $categoria = new Categoria($pdo);

    // Verifica se o formulário foi enviado
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id'];
        $nome = $_POST['nome'];
        $ativo = isset($_POST['ativo']) ? 1 : 0;

        if ($categoria->Atualizar_Categoria($id, $nome, $ativo)) {
            echo "Categoria atualizada com sucesso!";
        } else {
            echo "Erro ao atualizar a categoria.";
        }
    }
?>

<!-- Formulário para testar -->
 <h2>Atualizar categoria</h2>
<form method="POST" action="">
    <label for="id">ID da Categoria:</label>
    <input type="number" id="id" name="id" required>

    <label for="nome">Nome da Categoria:</label>
    <input type="text" id="nome" name="nome" required>

    <label for="ativo">Ativo:</label>
    <input type="checkbox" id="ativo" name="ativo" value="1">

    <button type="submit">Atualizar</button>
</form>
