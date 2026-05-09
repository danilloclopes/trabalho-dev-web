<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Cadastro</title>
    </head>

    <body>

        <h2>Cadastro de Usuário</h2>

        <% String erro = (String) request.getAttribute("erro"); %>
        <% if (erro != null) { %> <p style="color:red;"><%= erro %></p>
        <% } %>

        <form action="<%= request.getContextPath() %>/auth" method="post">

            <input type="hidden" name="acao" value="cadastro" />

            <label>Nome:</label><br>
            <input type="text" name="nome"><br><br>

            <label>Email:</label><br>
            <input type="email" name="email"><br><br>

            <label>Senha:</label><br>
            <input type="password" name="senha"><br><br>

            <label>CPF:</label><br>
            <input type="text" name="cpf"><br><br>

            <label>Tipo de usuário:</label><br>
            <select name="tipo">
                <option value="CLIENTE" selected>Cliente</option>
                <option value="PERSONAGEM">Personagem</option>
            </select><br><br>

            <button type="submit">Cadastrar</button>

        </form>

    </body>
</html>
