<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.agendamento.model.entity.Usuario" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>

<html>
<head>
    <title>Login</title>
</head>
<body>

    <h2>Login</h2>

    <!-- Exibir erro, se existir -->
    <%
        String erro = (String) request.getAttribute("erro");
        if (erro != null) {
    %>
        <p style="color:red;"><%= erro %></p>
    <%
        }
    %>

    <form action="<%= request.getContextPath() %>/auth" method="post">
        <input type="hidden" name="acao" value="login">

        <label>Email:</label><br>
        <input type="text" name="email" required><br><br>

        <label>Senha:</label><br>
        <input type="password" name="senha" required><br><br>

        <button type="submit">Entrar</button>
    </form>

    <hr>

    <!-- O código abaixo serve apenas para debugar a questão da sessão do usuário -->
    <h3>Status da Sessão:</h3>
    
    <p>ID da sessão: <%= request.getRequestedSessionId() %></p>

    <%
        HttpSession sessao = request.getSession(false);
        Usuario usuario = null;

        if (sessao != null) {
            usuario = (Usuario) sessao.getAttribute("usuarioLogado");
        }

        if (usuario != null) {
    %>
        <p style="color:green;">
            Usuário logado: <strong><%= usuario.getNome() %></strong>
        </p>
    <%
        } else {
    %>
        <p style="color:red;">
            Não há sessão ativa
        </p>
    <%
        }
    %>

</body>
</html>