<%@ page import="java.util.List" %>
<%@ page import="com.exemplo.biblioteca.Livro" %>
<%
    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
</head>
<body>
    <h2>Livros Cadastrados</h2>
    <form action="livros" method="get">
        Buscar: <input type="text" name="busca">
        <button type="submit">Pesquisar</button>
    </form>
    <br>
    <table border="1">
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Ano</th>
        </tr>
        <%
            if (livros != null) {
                for (Livro livro : livros) {
        %>
        <tr>
            <td><%= livro.getTitulo() %></td>
            <td><%= livro.getAutor() %></td>
            <td><%= livro.getAnoPublicacao() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <br>
    <a href="index.jsp">Voltar</a>
</body>
</html>
