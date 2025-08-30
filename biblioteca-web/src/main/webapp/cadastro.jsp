<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Livro</title>
</head>
<body>
    <h2>Cadastro de Livro</h2>
    <form action="livros" method="post">
        Título: <input type="text" name="titulo" required><br>
        Autor: <input type="text" name="autor" required><br>
        Ano de Publicação: <input type="number" name="anoPublicacao" required><br>
        <button type="submit">Cadastrar</button>
    </form>
    <br>
    <a href="index.jsp">Voltar</a>
</body>
</html>
