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
    <style>
        /* ── Auth Layout ── */
        .auth-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 50%, var(--accent) 100%);
            padding: 2rem 1rem;
            position: relative;
            overflow: hidden;
        }

        /* Shapes decorativos (espelha o hero da landing) */
        .auth-page::before,
        .auth-page::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            opacity: .15;
        }
        .auth-page::before {
            width: 420px; height: 420px;
            background: var(--secondary);
            top: -120px; right: -100px;
        }
        .auth-page::after {
            width: 280px; height: 280px;
            background: var(--accent-light);
            bottom: -80px; left: -80px;
        }

        /* ── Card ── */
        .auth-card {
            background: var(--white);
            border-radius: 20px;
            padding: 2.5rem 2rem;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 25px 60px rgba(0,0,0,.25);
            position: relative;
            z-index: 1;
            animation: fadeInUp .5s ease both;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(24px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* ── Logo/Topo ── */
        .auth-logo {
            text-align: center;
            margin-bottom: 1.75rem;
        }
        .auth-logo .logo-icon {
            font-size: 2.8rem;
            display: block;
            margin-bottom: .4rem;
        }
        .auth-logo .logo-text {
            font-family: 'Nunito', sans-serif;
            font-size: 1.6rem;
            font-weight: 900;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .auth-logo .logo-sub {
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            color: var(--text-medium);
            margin-top: .2rem;
        }

        /* ── Título do card ── */
        .auth-title {
            font-family: 'Nunito', sans-serif;
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--text-dark);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        /* ── Alertas ── */
        .alert {
            padding: .75rem 1rem;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: .5rem;
        }
        .alert-error {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #b91c1c;
        }
        .alert-success {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #15803d;
        }

        /* ── Formulário ── */
        .form-group {
            margin-bottom: 1.1rem;
        }
        .form-group label {
            display: block;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: .4rem;
        }
        .input-wrapper {
            position: relative;
        }
        .input-wrapper .input-icon {
            position: absolute;
            left: .9rem;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1rem;
            pointer-events: none;
        }
        .form-control {
            width: 100%;
            padding: .7rem .9rem .7rem 2.4rem;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: .9rem;
            color: var(--text-dark);
            background: #faf9ff;
            transition: border-color .2s, box-shadow .2s;
            box-sizing: border-box;
        }
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(124,58,237,.12);
            background: var(--white);
        }
        .form-control.invalid {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239,68,68,.1);
        }
        .field-error {
            font-family: 'Poppins', sans-serif;
            font-size: .75rem;
            color: #dc2626;
            margin-top: .3rem;
            display: none;
        }
        .field-error.visible { display: block; }

        /* Toggle senha */
        .toggle-password {
            position: absolute;
            right: .9rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            padding: 0;
            color: var(--text-light);
            transition: color .2s;
        }
        .toggle-password:hover { color: var(--primary); }

        /* ── Lembrar / Esqueceu ── */
        .form-row-between {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.4rem;
            flex-wrap: wrap;
            gap: .5rem;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            gap: .45rem;
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--text-medium);
            cursor: pointer;
        }
        .checkbox-label input[type="checkbox"] {
            accent-color: var(--primary);
            width: 15px; height: 15px;
            cursor: pointer;
        }
        .link-subtle {
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }
        .link-subtle:hover { text-decoration: underline; }

        /* ── Botão principal ── */
        .btn-auth {
            width: 100%;
            padding: .85rem;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: var(--white);
            border: none;
            border-radius: 12px;
            font-family: 'Nunito', sans-serif;
            font-size: 1rem;
            font-weight: 800;
            cursor: pointer;
            transition: opacity .2s, transform .15s;
            letter-spacing: .3px;
        }
        .btn-auth:hover { opacity: .9; transform: translateY(-1px); }
        .btn-auth:active { transform: translateY(0); }
        .btn-auth:disabled { opacity: .6; cursor: not-allowed; transform: none; }

        /* ── Divisor ── */
        .divider {
            display: flex;
            align-items: center;
            gap: .75rem;
            margin: 1.4rem 0;
            color: var(--text-light);
            font-family: 'Poppins', sans-serif;
            font-size: .8rem;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        /* ── Link para cadastro ── */
        .auth-footer-text {
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: .88rem;
            color: var(--text-medium);
        }
        .auth-footer-text a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
        }
        .auth-footer-text a:hover { text-decoration: underline; }

        /* ── Link voltar ── */
        .back-link {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: .4rem;
            margin-top: 1rem;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            color: var(--text-medium);
            text-decoration: none;
            transition: color .2s;
        }
        .back-link:hover { color: var(--primary); }

        /* ── Responsivo ── */
        @media (max-width: 480px) {
            .auth-card { padding: 2rem 1.25rem; }
        }
    </style>
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

<script>
(function () {
    'use strict';

    /* ── Validação do formulário de login ── */
    const form     = document.getElementById('loginForm');
    const emailEl  = document.getElementById('email');
    const senhaEl  = document.getElementById('senha');

    function setInvalid(input, errorId, show) {
        const err = document.getElementById(errorId);
        if (show) {
            input.classList.add('invalid');
            err.classList.add('visible');
        } else {
            input.classList.remove('invalid');
            err.classList.remove('visible');
        }
        return !show;
    }

    function validateEmail(value) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value.trim());
    }

    emailEl.addEventListener('input', function () {
        setInvalid(emailEl, 'emailError', !validateEmail(this.value));
    });

    senhaEl.addEventListener('input', function () {
        setInvalid(senhaEl, 'senhaError', this.value.trim() === '');
    });

    form.addEventListener('submit', function (e) {
        const emailOk = setInvalid(emailEl, 'emailError', !validateEmail(emailEl.value));
        const senhaOk = setInvalid(senhaEl, 'senhaError', senhaEl.value.trim() === '');

        if (!emailOk || !senhaOk) {
            e.preventDefault();
            // Foca no primeiro campo inválido
            if (!emailOk) emailEl.focus();
            else senhaEl.focus();
        }
    });

    /* ── Toggle visibilidade da senha ── */
    document.querySelectorAll('.toggle-password').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var targetId = this.getAttribute('data-target');
            var input    = document.getElementById(targetId);
            if (input.type === 'password') {
                input.type = 'text';
                this.textContent = '🙈';
            } else {
                input.type = 'password';
                this.textContent = '👁️';
            }
        });
    });

})();
</script>

</body>
</html>
