<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Redireciona se já estiver logado
    if (session.getAttribute("usuarioLogado") != null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    String erro = (String) request.getAttribute("erroLogin");
    String msgSucesso = (String) request.getAttribute("mensagemSucesso");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar — MagicFest</title>
    <meta name="description" content="Acesse sua conta MagicFest e gerencie seus aluguéis de personagens.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>

<main class="auth-page">
    <div class="auth-card">

        <!-- Logo -->
        <div class="auth-logo">
            <span class="logo-icon">🎭</span>
            <span class="logo-text">MagicFest</span>
            <p class="logo-sub">Personagens que encantam festas</p>
        </div>

        <h1 class="auth-title">Bem-vindo de volta!</h1>

        <!-- Mensagem de erro vinda do Servlet -->
        <% if (erro != null && !erro.isEmpty()) { %>
        <div class="alert alert-error" role="alert">
            <span>⚠️</span> <%= erro %>
        </div>
        <% } %>

        <!-- Mensagem de sucesso (ex: cadastro realizado) -->
        <% if (msgSucesso != null && !msgSucesso.isEmpty()) { %>
        <div class="alert alert-success" role="alert">
            <span>✅</span> <%= msgSucesso %>
        </div>
        <% } %>

        <!-- Formulário de login — action aponta para o LoginServlet (MVC) -->
        <form id="loginForm" action="<%= request.getContextPath() %>/LoginServlet" method="post" novalidate>

            <!-- E-mail -->
            <div class="form-group">
                <label for="email">E-mail</label>
                <div class="input-wrapper">
                    <span class="input-icon">📧</span>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        placeholder="seu@email.com"
                        autocomplete="email"
                        value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                    >
                </div>
                <span class="field-error" id="emailError">Informe um e-mail válido.</span>
            </div>

            <!-- Senha -->
            <div class="form-group">
                <label for="senha">Senha</label>
                <div class="input-wrapper">
                    <span class="input-icon">🔒</span>
                    <input
                        type="password"
                        id="senha"
                        name="senha"
                        class="form-control"
                        placeholder="Sua senha"
                        autocomplete="current-password"
                    >
                    <button type="button" class="toggle-password" aria-label="Mostrar ou ocultar senha" data-target="senha">👁️</button>
                </div>
                <span class="field-error" id="senhaError">A senha não pode estar vazia.</span>
            </div>

            <!-- Lembrar / Esqueceu -->
            <div class="form-row-between">
                <label class="checkbox-label">
                    <input type="checkbox" name="lembrar" id="lembrar">
                    Lembrar de mim
                </label>
                <a href="recuperar-senha.jsp" class="link-subtle">Esqueceu a senha?</a>
            </div>

            <button type="submit" class="btn-auth" id="btnEntrar">Entrar na minha conta</button>
        </form>

        <div class="divider">ou</div>

        <p class="auth-footer-text">
            Ainda não tem conta?
            <a href="cadastro.jsp">Criar conta grátis</a>
        </p>

        <a href="../index.jsp" class="back-link">← Voltar para a página inicial</a>

    </div>
</main>

<script src="../assets/js/login.js"></script>

</body>
</html>
