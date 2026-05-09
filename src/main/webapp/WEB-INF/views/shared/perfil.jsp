<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.agendamento.model.entity.Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <title>Meu Perfil</title>

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

        p {
            font-size: 16px;
            margin: 10px 0;
        }

        button, a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
        }
    </style>
</head>

<body>

    <%
        Usuario usuario = (Usuario) request.getAttribute("usuario");

        if (usuario == null) {
    %>
        <p>Erro ao carregar usuário.</p>
    <%
            return;
        }
    %>

    <div class="container">

        <h2>Meu Perfil</h2>

        <p><strong>Nome:</strong> <%= usuario.getNome() %></p>
        <p><strong>Email:</strong> <%= usuario.getEmail() %></p>
        <p><strong>CPF:</strong> <%= usuario.getCpf() %></p>

        <a href="<%= request.getContextPath() %>/views/shared/mudarPerfil.jsp">
            Editar Perfil
        </a>

        <form action="<%= request.getContextPath() %>/auth" method="post">
            <input type="hidden" name="acao" value="logout">
            <button type="submit">Logout</button>
        </form>

        <br>

        <a href="<%= request.getContextPath() %>/index.jsp">Voltar à Homepage</a>

    </div>

</body>
</html>