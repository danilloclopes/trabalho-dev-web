<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.agendamento.model.entity.Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Perfil</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            text-align: center;
            margin-top: 50px;
        }

        .container {
            background: white;
            padding: 30px;
            margin: auto;
            width: 40%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input {
            width: 90%;
            padding: 8px;
            margin: 8px 0;
        }

        button {
            padding: 10px 20px;
        }
    </style>
</head>

<body>

    <%
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
    %>
        <p>Usuário não está logado.</p>
    <%
            return;
        }
    %>

    <div class="container">

        <h2>Editar Perfil</h2>

        <form action="<%= request.getContextPath() %>/usuario" method="post">

            <label>Nome:</label><br>
            <input type="text" name="nome" value="<%= usuario.getNome() %>" required><br>

            <label>Email:</label><br>
            <input type="email" name="email" value="<%= usuario.getEmail() %>" required><br>

            <label>Nova Senha:</label><br>
            <input type="password" name="senha"><br>

            <button type="submit">Salvar Alterações</button>

        </form>

        <br>

        <a href="<%= request.getContextPath() %>/usuario">Cancelar</a>

    </div>

</body>
</html>