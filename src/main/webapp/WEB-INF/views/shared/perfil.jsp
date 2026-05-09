<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Meu Perfil</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
        }

        main {
            margin-top: 40px;
        }

        .container {
            width: 40%;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .info {
            margin-bottom: 20px;
        }

        .info strong {
            display: inline-block;
            width: 80px;
        }

        .mensagem-erro {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #3498db;
        }

        .btn-primary:hover {
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

    </style>

</head>

    <body>

        <header>
            <h1>Sistema de Agendamento</h1>
        </header>

        <main>
            <div class="container">

                <h2>Meu Perfil</h2>

                <c:if test="${not empty requestScope.erro}">
                    <p class="mensagem-erro">
                        ${requestScope.erro}
                    </p>
                </c:if>

                <c:if test="${not empty requestScope.usuario}">

                    <div class="info">
                        <p>
                            <strong>Nome:</strong>
                            ${requestScope.usuario.nome}
                        </p>

                        <p>
                            <strong>Email:</strong>
                            ${requestScope.usuario.email}
                        </p>

                        <p>
                            <strong>CPF:</strong>
                            ${requestScope.usuario.cpf}
                        </p>
                    </div>

                    <div class="actions">

                        <a
                            class="btn btn-primary"
                            href="${pageContext.request.contextPath}/usuario?acao=editar-perfil">
                            Editar Perfil
                        </a>

                        <a
                            class="btn btn-secondary"
                            href="${pageContext.request.contextPath}/meus-agendamentos">
                            Meus Agendamentos
                        </a>

                        <form action="${pageContext.request.contextPath}/auth" method="post">
                            <input
                                type="hidden"
                                name="acao"
                                value="logout">

                            <button
                                type="submit"
                                class="btn btn-danger">
                                Logout
                            </button>
                        </form>

                    </div>
                </c:if>

                <div class="actions">
                    <a
                        class="btn btn-secondary"
                        href="${pageContext.request.contextPath}/">
                        Voltar à Página Inicial
                    </a>
                </div>

            </div>
        </main>
    </body>
</html>