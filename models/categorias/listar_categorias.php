<?php
    // Inclui a classe de conexão e categoria
    include_once 'C:\xampp\htdocs\vscodexampp\contagem_teste\config\database.php';
    include_once './categorias.php';
    // Conexão com o banco
    $pdo = Database::conectar();

    // Instancia a classe Categoria
    $categoria = new Categoria($pdo);

    // Testa o método
    $categorias = $categoria->Listar_Categorias();

    // Exibe o resultado
    echo '<h2> Listar categoria </h2>';
    echo '<pre>';
    print_r($categorias); // Mostra as categorias formatadas
    echo '</pre>';
?>
