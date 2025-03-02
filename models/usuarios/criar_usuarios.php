<?php
    // Inclui a conexão com o banco de dados
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './usuarios.php';

    // Cria a conexão com o banco
    $pdo = Database::conectar(); // Certifique-se de que o método conectar() está correto
    $usuario = new Usuarios($pdo); // Instancia a classe Usuario

    // Verifica se o formulário foi enviado
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nome = $_POST['nome_usuario'];
        $senha = md5($_POST['senha_usuario']);
        $nivel = $_POST['nivel_usuario'];
        $ativo = isset($_POST['ativo_usuario']) ? 1 : 0; // Checkbox retorna 1 (ativo) ou 0 (inativo)

        if ($usuario->Criar_Usuarios($nome, $senha, $nivel, $ativo)) {
            echo "Usuário criado com sucesso!";
        } else {
            echo "Erro ao criar usuário.";
        }
    }
?>

<!-- Formulário para testar -->
<h2>Criar Novo Usuário</h2>
<form method="POST" action="">
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

    <button type="submit">Criar Usuário</button>
</form>
