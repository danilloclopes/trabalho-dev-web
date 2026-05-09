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

    <title>Login</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            text-align: center;
            margin-top: 50px;
        }

        .container {
            width: 35%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input {
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
        }

        .sucesso {
            color: green;
            font-weight: bold;
        }

        .debug {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

    </style>

</head>
    <body>
        <div class="container">

            <h2>Login</h2>

            <!-- Mensagem de sucesso -->
            <c:if test="${not empty param.sucesso}">
                <p class="sucesso">Cadastro realizado com sucesso!</p>
            </c:if>

            <!-- Mensagem de erro -->
            <c:if test="${not empty requestScope.erro}">
                <p class="erro">${requestScope.erro}</p>
            </c:if>

            <!-- Formulário -->
            <form action="${pageContext.request.contextPath}/auth" method="post">

                <input
                    type="hidden"
                    name="acao"
                    value="login">

                <label>Email:</label> <br>

                <input
                    type="email"
                    name="email"
                    required> <br>

                <label>Senha:</label> <br>

                <input
                    type="password"
                    name="senha"
                    required> <br>

                <button type="submit"> Entrar </button>

            </form>
            <br>

            <!-- Navegação -->
            <a href="${pageContext.request.contextPath}/auth?acao=cadastro">Criar Conta</a>
            <br><br>
            <a href="${pageContext.request.contextPath}/">Voltar à Página Inicial</a>

            <div class="debug">

                <h3>Status da Sessão</h3>
                <p>ID da sessão: ${pageContext.session.id}</p>

                <!-- Usuário logado -->
                <c:if test="${not empty sessionScope.usuarioLogado}">
                    <p style="color: green;">
                        Usuário logado: <strong> ${sessionScope.usuarioLogado.nome} </strong>
                    </p>
                </c:if>

                <!-- Usuário não logado -->
                <c:if test="${empty sessionScope.usuarioLogado}">
                    <p style="color: red;"> Não há sessão ativa </p>
                </c:if>

            </div>
        </div>
    </body>
</html>