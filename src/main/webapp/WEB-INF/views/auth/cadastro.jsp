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
    <title>Cadastro de Usuário</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin-top: 50px;
            text-align: center;
        }

        .container {
            width: 40%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input,
        select {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        button {
            padding: 10px 20px;
            cursor: pointer;
        }

        .erro {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .voltar {
            display: inline-block;
            margin-top: 20px;
        }

    </style>

</head>

    <body>

        <div class="container">

            <h2>Cadastro de Usuário</h2>

            <!-- Mensagem de erro -->
            <c:if test="${not empty requestScope.erro}">
                <p class="erro"> ${requestScope.erro} </p>
            </c:if>

            <!-- Formulário -->
            <form action="${pageContext.request.contextPath}/auth" method="post">

                <input
                    type="hidden"
                    name="acao"
                    value="cadastro">

                <label for="nome">Nome:</label>
                <br>

                <input
                    type="text"
                    id="nome"
                    name="nome"
                    value="${param.nome}"
                    required>
                <br>

                <label for="email">Email:</label>
                <br>

                <input
                    type="email"
                    id="email"
                    name="email"
                    value="${param.email}"
                    required>
                <br>

                <label for="senha">Senha:</label>
                <br>

                <input
                    type="password"
                    id="senha"
                    name="senha"
                    required>
                <br>

                <label for="cpf">CPF:</label>
                <br>

                <input
                    type="text"
                    id="cpf"
                    name="cpf"
                    value="${param.cpf}"
                    maxlength="11"
                    required>
                <br>

                <label for="tipo">Tipo de usuário:</label>
                <br>

                <select id="tipo" name="tipo">
                    <option
                        value="CLIENTE"
                        ${param.tipo == 'CLIENTE' ? 'selected' : ''}>
                        Cliente
                    </option>

                    <option
                        value="PERSONAGEM"
                        ${param.tipo == 'PERSONAGEM' ? 'selected' : ''}>
                        Personagem
                    </option>
                </select> <br>

                <button type="submit"> Cadastrar </button>

            </form>

            <a class="voltar" href="${pageContext.request.contextPath}/auth?acao=login">
                Já possui conta? Fazer login
            </a>

            <br><br>

            <a href="${pageContext.request.contextPath}/">
                Voltar à Página Inicial
            </a>

        </div>
    </body>
</html>