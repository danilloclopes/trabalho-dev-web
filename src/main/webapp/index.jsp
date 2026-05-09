<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="br.com.agendamento.model.entity.Usuario" %>

<%
Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Agendamento de Personagens</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        text-align: center;
        margin: 0;
    }

    header {
        background-color: #2c3e50;
        color: white;
        padding: 20px;
    }

    main {
        margin-top: 50px;
    }

    .container {
        width: 60%;
        margin: auto;
    }

    .btn {
        display: inline-block;
        margin: 15px;
        padding: 12px 25px;
        font-size: 16px;
        text-decoration: none;
        color: white;
        background-color: #3498db;
        border-radius: 5px;
    }

    .btn:hover {
        background-color: #2980b9;
    }

    .btn-secondary {
        background-color: #2ecc71;
    }

    .btn-secondary:hover {
        background-color: #27ae60;
    }

    .btn-danger {
        background-color: #e74c3c;
    }

    .btn-danger:hover {
        background-color: #c0392b;
    }

    .msg {
        margin-top: 20px;
        font-weight: bold;
    }

    .success {
        color: green;
    }

    .error {
        color: red;
    }
</style>

</head>

<body>

    <header>
        <h1>Sistema de Agendamento de Personagens</h1>
    </header>

    <main>
        <div class="container">

            <% if (usuario != null) { %>

                <h2>Bem-vindo, <%= usuario.getNome() %>!</h2>
                <p>Agora você pode contratar um animador.</p>

                <a
                    class="btn"
                    href="<%= request.getContextPath() %>/views/agendamento/agendar.jsp">
                    Fazer Agendamento
                </a>

                <a
                    class="btn"
                    href="<%= request.getContextPath() %>/usuario">
                    Ver Perfil
                </a>

                <form action="<%= request.getContextPath() %>/auth" method="post">
                    <input type="hidden" name="acao" value="logout">
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>

            <% } else { %>

                <h2>Bem-vindo!</h2>

                <p>Aqui você pode contratar personagens para festas ou oferecer seus serviços como personagem.</p>
                <p>Crie uma conta ou faça login para começar a usar o sistema.</p>

                <a
                    class="btn"
                    href="<%= request.getContextPath() %>/views/auth/login.jsp">
                    Fazer Login
                </a>

                <a
                    class="btn btn-secondary"
                    href="<%= request.getContextPath() %>/views/auth/cadastro.jsp">
                    Criar Conta
                </a>

            <% } %>

            <!-- Mensagem de sucesso do agendamento -->
            <% if (request.getParameter("sucesso") != null) { %>
                <p class="msg success">Seu agendamento foi realizado com sucesso!</p>
            <% } %>

            <!-- Mensagem de erro -->
            <% if (request.getAttribute("erro") != null) { %>
                <p class="msg error"><%= request.getAttribute("erro") %></p>
            <% } %>

        </div>
    </main>

</body>
</html>
