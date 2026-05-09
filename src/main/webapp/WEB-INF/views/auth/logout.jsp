<%@ page contentType="text/html; charset=UTF-8" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Logout realizado</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            width: 40%;
            margin: 100px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            transition: background-color 0.2s ease;
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

    </style>

</head>

    <body>

        <main class="container">

            <h1>Logout realizado com sucesso</h1>
            <p> Sua sessão foi encerrada com segurança. </p>

            <div class="actions">

                <a
                    class="btn btn-primary"
                    href="${pageContext.request.contextPath}/">
                    Página Inicial
                </a>

                <a
                    class="btn btn-secondary"
                    href="${pageContext.request.contextPath}/auth?acao=login">
                    Fazer Login Novamente
                </a>

            </div>
        </main>
    </body>
</html>