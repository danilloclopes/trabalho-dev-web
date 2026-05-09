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
    <title>Editar Perfil</title>
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

        .mensagem-erro {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        .info-senha {
            font-size: 13px;
            color: #666;
            margin-top: -15px;
            margin-bottom: 20px;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
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
            background-color: #95a5a6;
        }

        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
    </style>
</head>

    <body>

        <header>
            <h1>Sistema de Agendamento</h1>
        </header>

        <main>

            <div class="container">

                <h2>Editar Perfil</h2>

                <c:if test="${not empty requestScope.erro}">
                    <p class="mensagem-erro">
                        ${requestScope.erro}
                    </p>
                </c:if>

                <!-- Verifica existência do usuário -->
                <c:if test="${not empty sessionScope.usuarioLogado}">

                    <form action="${pageContext.request.contextPath}/usuario" method="post">

                        <label for="nome">
                            Nome
                        </label>

                        <input
                            type="text"
                            id="nome"
                            name="nome"
                            value="${sessionScope.usuarioLogado.nome}"
                            maxlength="100"
                            required>

                        <label for="email">
                            Email
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            value="${sessionScope.usuarioLogado.email}"
                            maxlength="100"
                            required>

                        <label for="senha">
                            Nova Senha
                        </label>

                        <input
                            type="password"
                            id="senha"
                            name="senha"
                            minlength="3"
                            maxlength="100">

                        <p class="info-senha">
                            Deixe o campo em branco para manter sua senha atual.
                        </p>

                        <div class="actions">
                            <button
                                type="submit"
                                class="btn btn-primary">
                                Salvar Alterações
                            </button>

                            <a
                                class="btn btn-secondary"
                                href="${pageContext.request.contextPath}/usuario?acao=perfil">
                                Cancelar
                            </a>
                        </div>

                    </form>

                </c:if>

                <!-- Caso não exista usuário -->
                <c:if test="${empty sessionScope.usuarioLogado}">
                    <p class="mensagem-erro">
                        Usuário não autenticado.
                    </p>
                </c:if>

            </div>

        </main>

    </body>

</html>