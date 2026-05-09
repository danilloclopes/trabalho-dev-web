<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f6f8;
            margin-top: 100px;
        }

        .box {
            background: white;
            padding: 30px;
            margin: auto;
            width: 40%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #3498db;
            padding: 10px 20px;
            border-radius: 5px;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>

    <div class="box">
        <h2>Você saiu da sua conta</h2>

        <p>Sua sessão foi encerrada com sucesso.</p>

        <a href="<%= request.getContextPath() %>/index.jsp">
            Voltar para a página inicial
        </a>

        <br>

        <a href="<%= request.getContextPath() %>/views/auth/login.jsp">
            Fazer login novamente
        </a>
    </div>

</body>
</html>