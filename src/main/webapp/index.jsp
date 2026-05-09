<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            border: none;
            cursor: pointer;
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

        .logout-form {
            display: inline;
        }

    </style>

</head>

<body>

    <header>
        <h1>Sistema de Agendamento de Personagens</h1>
    </header>

    <main>

        <div class="container">

            <!-- Usuário logado -->
            <c:if test="${not empty sessionScope.usuarioLogado}">

                <h2>Bem-vindo, ${sessionScope.usuarioLogado.nome}!</h2>
                <p>Agora você pode contratar um animador.</p>

                <!-- Navegação -->
                <a
                    class="btn"
                    href="${pageContext.request.contextPath}/agendamento">
                    Fazer Agendamento </a>

                <a
                    class="btn"
                    href="${pageContext.request.contextPath}/usuario">
                    Ver Perfil </a>

                <!-- Logout deve usar POST -->
                <form class="logout-form" action="${pageContext.request.contextPath}/auth" method="post">
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

            </c:if>

            <!-- Usuário não logado -->
            <c:if test="${empty sessionScope.usuarioLogado}">

                <h2>Bem-vindo!</h2>

                <p> Aqui você pode contratar personagens para festas ou oferecer seus serviços como personagem.</p>
                <p> Crie uma conta ou faça login para começar a usar o sistema.</p>

                <a
                    class="btn"
                    href="${pageContext.request.contextPath}/auth?acao=login">
                    Fazer Login
                </a>

                <a
                    class="btn btn-secondary"
                    href="${pageContext.request.contextPath}/auth?acao=cadastro">
                    Criar Conta
                </a>

            </c:if>

            <!-- Mensagem de sucesso -->
            <c:if test="${not empty param.sucesso}">
                <p class="msg success">Seu agendamento foi realizado com sucesso!</p>
            </c:if>

            <!-- Mensagem de erro -->
            <c:if test="${not empty requestScope.erro}">
                <p class="msg error">${requestScope.erro}</p>
            </c:if>

        </div>
    </main>
</body>
</html>