<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar — MagicFest</title>
    <meta name="description" content="Acesse sua conta MagicFest e gerencie seus agendamentos de personagens.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>
<body>

<main class="auth-page">
    <div class="auth-card">

        <div class="auth-logo">
            <span class="logo-icon">🎭</span>
            <span class="logo-text">MagicFest</span>
            <p class="logo-sub">Personagens que encantam festas</p>
        </div>

        <h1 class="auth-title">Bem-vindo de volta!</h1>

        <c:if test="${not empty requestScope.erro}">
            <div class="alert alert-error" role="alert">
                <span>⚠️</span> <c:out value="${requestScope.erro}"/>
            </div>
        </c:if>

        <c:if test="${not empty param.sucesso}">
            <div class="alert alert-success" role="alert">
                <span>✅</span> Conta criada com sucesso! Faça o login para continuar.
            </div>
        </c:if>

        <form id="loginForm" action="${pageContext.request.contextPath}/auth" method="post" novalidate>
            <input type="hidden" name="acao" value="login">

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
                        value="<c:out value='${param.email}'/>"
                    >
                </div>
                <span class="field-error" id="emailError">Informe um e-mail válido.</span>
            </div>

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

            <div class="form-row-between">
                <label class="checkbox-label">
                    <input type="checkbox" name="lembrar" id="lembrar">
                    Lembrar de mim
                </label>
                <span class="link-subtle" style="color:#aaa;cursor:default;">Esqueceu a senha?</span>
            </div>

            <button type="submit" class="btn-auth" id="btnEntrar">Entrar na minha conta</button>
        </form>

        <div class="divider">ou</div>

        <p class="auth-footer-text">
            Ainda não tem conta?
            <a href="${pageContext.request.contextPath}/cadastro.jsp">Criar conta grátis</a>
        </p>

        <a href="${pageContext.request.contextPath}/" class="back-link">← Voltar para a página inicial</a>

    </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>

</body>
</html>
