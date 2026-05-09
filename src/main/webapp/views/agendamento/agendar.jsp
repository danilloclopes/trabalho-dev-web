<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Agendar Serviço</title>
    </head>

    <body>
        <form action="<%= request.getContextPath() %>/auth" method="post">
            <input type="hidden" name="acao" value="logout">
            <button type="submit">Logout</button>
        </form>
        
        <form action="<%= request.getContextPath() %>/agendamento" method="post">

            <label>ID do Animador:</label><br>
            <input type="number" name="animadorId" required><br><br>

            <label>Data e Hora:</label><br>
            <input type="datetime-local" name="dataHora" required><br><br>

            <button type="submit">Agendar</button>

        </form>

        <a href="../../index.jsp">Voltar</a>

    </body>
</html>
