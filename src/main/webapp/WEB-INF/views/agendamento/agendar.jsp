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
        <title>Agendar Serviço</title>

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
                padding: 20px;
                text-align: center;
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

            label {
                font-weight: bold;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 20px;
                box-sizing: border-box;
            }

            .actions {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 20px;
                flex-wrap: wrap;
            }

            .btn {
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

            .btn-danger {
                background-color: #e74c3c;
            }

            .btn-danger:hover {
                background-color: #c0392b;
            }

            .btn-secondary {
                background-color: #2ecc71;
            }

            .btn-secondary:hover {
                background-color: #27ae60;
            }

            .mensagem-erro {
                color: red;
                font-weight: bold;
                margin-bottom: 20px;
                text-align: center;
            }
        </style>
    </head>

    <body>

        <header>
            <h1>Sistema de Agendamento</h1>
        </header>

        <main>
            <div class="container">
                
                <h2>Novo Agendamento</h2>

                <!-- Mensagem de erro -->
                <c:if test="${not empty requestScope.erro}">
                    <p class="mensagem-erro">${requestScope.erro}</p>
                </c:if>

                <form action="${pageContext.request.contextPath}/agendamento" method="post">

                    <label
                        for="animadorId">
                        ID do Animador</label>
                    <input
                        type="number"
                        id="animadorId"
                        name="animadorId"
                        value="${param.animadorId}"
                        min="1"
                        required>

                    <label
                        for="dataHora">
                        Data e Hora
                    </label>
                    <input
                        type="datetime-local"
                        id="dataHora"
                        name="dataHora"
                        value="${param.dataHora}"
                        required>

                    <div class="actions">
                        <button
                            type="submit"
                            class="btn btn-primary">
                            Confirmar Agendamento
                        </button>
                    </div>

                </form>

                <div class="actions">

                    <a
                        class="btn btn-secondary"
                        href="${pageContext.request.contextPath}/">
                        Voltar à Página Inicial
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
            </div>
        </main>
    </body>
</html>