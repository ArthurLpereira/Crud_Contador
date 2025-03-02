<?php
    // Inclui a conexão com o banco de dados
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './usuarios.php';

    $pdo = Database::Conectar();
    $usuario = new Usuarios($pdo);

    // Verifica se o formulário foi enviado
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id = $_POST['id_usuario'];
        $nome = $_POST['nome_usuario'];
        $senha = $_POST['senha_usuario'];
        $nivel = $_POST['nivel_usuario'];
        $ativo = isset($_POST['ativo_usuario']) ? 1 : 0;
        
        if ($usuario->Atualizar_Usuarios($id, $nome, $senha, $nivel, $ativo)) {
            echo "Usuário atualizado com sucesso!";
        } else {
            echo "Erro ao atualizar usuário.";
        }
    }
?>

<!-- Formulário para atualizar usuário -->
<h2>Atualizar Usuário</h2>
<form method="POST" action="">
    <label for="id_usuario">ID do Usuário:</label>
    <input type="text" id="id_usuario" name="id_usuario" required>

    <label for="nome_usuario">Nome do Usuário:</label>
    <input type="text" id="nome_usuario" name="nome_usuario" required>

    <label for="senha_usuario">Senha:</label>
    <input type="password" id="senha_usuario" name="senha_usuario" required>

    <label for="nivel_usuario">Nível de Acesso:</label>
    <select id="nivel_usuario" name="nivel_usuario" required>
        <option value="1">1 - Básico</option>
        <option value="2">2 - Intermediário</option>
        <option value="3">3 - Avançado</option>
    </select>

    <label for="ativo_usuario">Ativo:</label>
    <input type="checkbox" id="ativo_usuario" name="ativo_usuario" value="1">

    <button type="submit">Atualizar Usuário</button>
</form>
