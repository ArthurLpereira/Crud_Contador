<?php
    // Inclui a conexão com o banco de dados e a classe Usuario
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './usuarios.php';

    // Cria a conexão com o banco
    $pdo = Database::conectar(); // Certifique-se que o metodo conectar() retorna um PDO
    $usuario = new Usuarios($pdo); // Instancia a classe Usuario

    // Lista os usuários
    $usuarios = $usuario->Listar_Usuarios();
?>

<h2>Lista de Usuários</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Senha</th>
            <th>Nível</th>
            <th>Ativo</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($usuarios as $user): ?>
            <tr>
                <td><?php echo htmlspecialchars($user['id_usuario']); ?></td>
                <td><?php echo htmlspecialchars($user['nome_usuario']); ?></td>
                <td><?php echo htmlspecialchars($user['senha_usuario']); ?></td>
                <td><?php echo htmlspecialchars($user['nivel_usuario']); ?></td>
                <td><?php echo $user['ativo_usuario'] ? 'Sim' : 'Não'; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
