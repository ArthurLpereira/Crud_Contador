<?php
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './turmas.php';

    $pdo = Database::Conectar();
    $turmas = new Turmas($pdo);

    // Criar Turma
    if (isset($_POST['criar'])) {
        $nome_turma = $_POST['nome_turma'];
        if ($turmas->Criar_Turmas($nome_turma)) {
            echo 'Turma criada com sucesso!';
        } else {
            echo 'Erro ao criar turma.';
        }
    }

    // Listar Turmas
    if (isset($_POST['listar'])) {
        $todas_turmas = $turmas->Listar_Turmas();
        foreach ($todas_turmas as $turma) {
            echo 'ID: ' . $turma['id_turma'] . ' - Nome: ' . $turma['nome_turma'] . '<br>';
        }
    }

    // Atualizar Turma
    if (isset($_POST['atualizar'])) {
        $id_turma = $_POST['id_turma'];
        $nome_turma = $_POST['nome_turma'];
        if ($turmas->Atualizar_Turmas($id_turma, $nome_turma)) {
            echo 'Turma atualizada com sucesso!';
        } else {
            echo 'Erro ao atualizar turma.';
        }
    }

    // Deletar Turma
    if (isset($_POST['deletar'])) {
        $id_turma = $_POST['id_turma'];
        if ($turmas->Deletar_Turmas($id_turma)) {
            echo 'Turma deletada com sucesso!';
        } else {
            echo 'Erro ao deletar turma.';
        }
    }
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Turmas</title>
</head>
<body>
    <h1>Gerenciar Turmas</h1>

    <h2>Criar Turma</h2>
    <form method="POST">
        <label for="nome_turma">Nome da Turma:</label>
        <input type="text" name="nome_turma" required>
        <button type="submit" name="criar">Criar</button>
    </form>

    <h2>Listar Turmas</h2>
    <form method="POST">
        <button type="submit" name="listar">Listar Turmas</button>
    </form>

    <h2>Atualizar Turma</h2>
    <form method="POST">
        <label for="id_turma">ID da Turma:</label>
        <input type="text" name="id_turma" required>
        <label for="nome_turma">Novo Nome da Turma:</label>
        <input type="text" name="nome_turma" required>
        <button type="submit" name="atualizar">Atualizar</button>
    </form>

    <h2>Deletar Turma</h2>
    <form method="POST">
        <label for="id_turma">ID da Turma:</label>
        <input type="text" name="id_turma" required>
        <button type="submit" name="deletar">Deletar</button>
    </form>
</body>
</html>
