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

    String erro = (String) request.getAttribute("erroCadastro");

    // Repopula campos em caso de erro
    String nomeVal     = request.getParameter("nome")     != null ? request.getParameter("nome")     : "";
    String emailVal    = request.getParameter("email")    != null ? request.getParameter("email")    : "";
    String telefoneVal = request.getParameter("telefone") != null ? request.getParameter("telefone") : "";
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta — MagicFest</title>
    <meta name="description" content="Crie sua conta MagicFest e comece a reservar personagens para sua festa.">
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
            max-width: 480px;
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

        /* ── Título ── */
        .auth-title {
            font-family: 'Nunito', sans-serif;
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--text-dark);
            text-align: center;
            margin-bottom: .4rem;
        }
        .auth-subtitle {
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            color: var(--text-medium);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        /* ── Alerta ── */
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

        /* ── Formulário ── */
        .form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: .9rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group label {
            display: block;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: .4rem;
        }
        .label-optional {
            font-size: .75rem;
            color: var(--text-light);
            font-weight: 400;
            margin-left: .3rem;
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
        .form-control.valid {
            border-color: #22c55e;
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

        /* ── Força da senha ── */
        .password-strength {
            margin-top: .5rem;
        }
        .strength-bar {
            height: 4px;
            border-radius: 4px;
            background: var(--border);
            overflow: hidden;
            margin-bottom: .3rem;
        }
        .strength-fill {
            height: 100%;
            border-radius: 4px;
            width: 0;
            transition: width .3s, background .3s;
        }
        .strength-text {
            font-family: 'Poppins', sans-serif;
            font-size: .72rem;
            color: var(--text-light);
        }

        /* ── Termos ── */
        .terms-group {
            margin-bottom: 1.4rem;
        }
        .checkbox-label {
            display: flex;
            align-items: flex-start;
            gap: .5rem;
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--text-medium);
            cursor: pointer;
            line-height: 1.4;
        }
        .checkbox-label input[type="checkbox"] {
            accent-color: var(--primary);
            width: 15px; height: 15px;
            cursor: pointer;
            margin-top: .15rem;
            flex-shrink: 0;
        }
        .checkbox-label a {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
        }
        .checkbox-label a:hover { text-decoration: underline; }

        /* ── Botão ── */
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

        /* ── Benefícios ── */
        .benefits-mini {
            display: flex;
            justify-content: center;
            gap: 1.2rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }
        .benefit-item {
            display: flex;
            align-items: center;
            gap: .35rem;
            font-family: 'Poppins', sans-serif;
            font-size: .78rem;
            color: var(--text-medium);
        }

        /* ── Footer ── */
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
        @media (max-width: 520px) {
            .form-row-2 { grid-template-columns: 1fr; gap: 0; }
            .auth-card  { padding: 2rem 1.25rem; }
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

        <h1 class="auth-title">Crie sua conta</h1>
        <p class="auth-subtitle">É rápido, gratuito e sem complicação!</p>

        <!-- Mini benefícios -->
        <div class="benefits-mini">
            <span class="benefit-item">✅ Gratuito</span>
            <span class="benefit-item">🔒 Seguro</span>
            <span class="benefit-item">⚡ Rápido</span>
        </div>

        <!-- Erro vindo do Servlet -->
        <% if (erro != null && !erro.isEmpty()) { %>
        <div class="alert alert-error" role="alert">
            <span>⚠️</span> <%= erro %>
        </div>
        <% } %>

        <!-- Formulário — action aponta para o CadastroServlet (MVC) -->
        <form id="cadastroForm" action="<%= request.getContextPath() %>/CadastroServlet" method="post" novalidate>

            <!-- Nome completo -->
            <div class="form-group">
                <label for="nome">Nome completo</label>
                <div class="input-wrapper">
                    <span class="input-icon">👤</span>
                    <input
                        type="text"
                        id="nome"
                        name="nome"
                        class="form-control"
                        placeholder="Seu nome completo"
                        autocomplete="name"
                        value="<%= nomeVal %>"
                    >
                </div>
                <span class="field-error" id="nomeError">Informe seu nome completo.</span>
            </div>

            <!-- E-mail e Telefone lado a lado -->
            <div class="form-row-2">
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
                            value="<%= emailVal %>"
                        >
                    </div>
                    <span class="field-error" id="emailError">E-mail inválido.</span>
                </div>

                <div class="form-group">
                    <label for="telefone">
                        Telefone
                        <span class="label-optional">(opcional)</span>
                    </label>
                    <div class="input-wrapper">
                        <span class="input-icon">📱</span>
                        <input
                            type="tel"
                            id="telefone"
                            name="telefone"
                            class="form-control"
                            placeholder="(00) 00000-0000"
                            autocomplete="tel"
                            maxlength="15"
                            value="<%= telefoneVal %>"
                        >
                    </div>
                </div>
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
                        placeholder="Mínimo 8 caracteres"
                        autocomplete="new-password"
                    >
                    <button type="button" class="toggle-password" aria-label="Mostrar ou ocultar senha" data-target="senha">👁️</button>
                </div>
                <!-- Barra de força -->
                <div class="password-strength">
                    <div class="strength-bar"><div class="strength-fill" id="strengthFill"></div></div>
                    <span class="strength-text" id="strengthText"></span>
                </div>
                <span class="field-error" id="senhaError">A senha deve ter pelo menos 8 caracteres.</span>
            </div>

            <!-- Confirmar senha -->
            <div class="form-group">
                <label for="confirmarSenha">Confirmar senha</label>
                <div class="input-wrapper">
                    <span class="input-icon">🔑</span>
                    <input
                        type="password"
                        id="confirmarSenha"
                        name="confirmarSenha"
                        class="form-control"
                        placeholder="Repita a senha"
                        autocomplete="new-password"
                    >
                    <button type="button" class="toggle-password" aria-label="Mostrar ou ocultar confirmação de senha" data-target="confirmarSenha">👁️</button>
                </div>
                <span class="field-error" id="confirmarSenhaError">As senhas não coincidem.</span>
            </div>

            <!-- Termos -->
            <div class="terms-group">
                <label class="checkbox-label">
                    <input type="checkbox" id="termos" name="termos">
                    Li e concordo com os
                    <a href="../termos-de-uso.jsp" target="_blank">Termos de Uso</a>
                    e a
                    <a href="../politica-de-privacidade.jsp" target="_blank">Política de Privacidade</a>.
                </label>
                <span class="field-error" id="termosError">Você precisa aceitar os termos para continuar.</span>
            </div>

            <button type="submit" class="btn-auth" id="btnCadastrar">Criar minha conta</button>
        </form>

        <div class="divider">já tem conta?</div>

        <p class="auth-footer-text">
            <a href="login.jsp">Entrar na minha conta</a>
        </p>

        <a href="../index.jsp" class="back-link">← Voltar para a página inicial</a>

    </div>
</main>

<script>
(function () {
    'use strict';

    /* ── Máscara de telefone ── */
    var telefoneEl = document.getElementById('telefone');
    telefoneEl.addEventListener('input', function () {
        var v = this.value.replace(/\D/g, '').substring(0, 11);
        if (v.length <= 10) {
            v = v.replace(/^(\d{2})(\d{4})(\d{0,4})/, '($1) $2-$3');
        } else {
            v = v.replace(/^(\d{2})(\d{5})(\d{0,4})/, '($1) $2-$3');
        }
        this.value = v;
    });

    /* ── Força da senha ── */
    var senhaEl     = document.getElementById('senha');
    var fillEl      = document.getElementById('strengthFill');
    var textEl      = document.getElementById('strengthText');

    function avaliarSenha(senha) {
        var score = 0;
        if (senha.length >= 8)  score++;
        if (senha.length >= 12) score++;
        if (/[A-Z]/.test(senha)) score++;
        if (/[0-9]/.test(senha)) score++;
        if (/[^A-Za-z0-9]/.test(senha)) score++;
        return score;
    }

    senhaEl.addEventListener('input', function () {
        var val   = this.value;
        var score = avaliarSenha(val);
        var pct   = val.length === 0 ? 0 : Math.min(100, score * 20);
        var color, label;

        if (val.length === 0) {
            color = 'transparent'; label = '';
        } else if (score <= 1) {
            color = '#ef4444'; label = 'Muito fraca';
        } else if (score === 2) {
            color = '#f97316'; label = 'Fraca';
        } else if (score === 3) {
            color = '#eab308'; label = 'Média';
        } else if (score === 4) {
            color = '#22c55e'; label = 'Forte';
        } else {
            color = '#16a34a'; label = 'Muito forte';
        }

        fillEl.style.width      = pct + '%';
        fillEl.style.background = color;
        textEl.textContent      = label;
        textEl.style.color      = color;
    });

    /* ── Helpers de validação ── */
    function setInvalid(input, errorId, show) {
        var err = document.getElementById(errorId);
        if (show) {
            input.classList.add('invalid');
            input.classList.remove('valid');
            err.classList.add('visible');
        } else {
            input.classList.remove('invalid');
            if (input.value.trim() !== '') input.classList.add('valid');
            err.classList.remove('visible');
        }
        return !show;
    }

    function validateEmail(v) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim());
    }

    /* ── Validação em tempo real ── */
    var nomeEl           = document.getElementById('nome');
    var emailEl          = document.getElementById('email');
    var confirmarSenhaEl = document.getElementById('confirmarSenha');
    var termosEl         = document.getElementById('termos');

    nomeEl.addEventListener('input', function () {
        setInvalid(nomeEl, 'nomeError', this.value.trim().split(/\s+/).filter(Boolean).length < 2);
    });

    emailEl.addEventListener('input', function () {
        setInvalid(emailEl, 'emailError', !validateEmail(this.value));
    });

    senhaEl.addEventListener('input', function () {
        setInvalid(senhaEl, 'senhaError', this.value.length < 8);
        if (confirmarSenhaEl.value !== '') {
            setInvalid(confirmarSenhaEl, 'confirmarSenhaError', confirmarSenhaEl.value !== this.value);
        }
    });

    confirmarSenhaEl.addEventListener('input', function () {
        setInvalid(confirmarSenhaEl, 'confirmarSenhaError', this.value !== senhaEl.value);
    });

    /* ── Submit ── */
    document.getElementById('cadastroForm').addEventListener('submit', function (e) {
        var nomeOk    = setInvalid(nomeEl, 'nomeError',
                            nomeEl.value.trim().split(/\s+/).filter(Boolean).length < 2);
        var emailOk   = setInvalid(emailEl, 'emailError', !validateEmail(emailEl.value));
        var senhaOk   = setInvalid(senhaEl, 'senhaError', senhaEl.value.length < 8);
        var confOk    = setInvalid(confirmarSenhaEl, 'confirmarSenhaError',
                            confirmarSenhaEl.value !== senhaEl.value);
        var termosOk  = setInvalid(termosEl, 'termosError', !termosEl.checked);

        if (!nomeOk || !emailOk || !senhaOk || !confOk || !termosOk) {
            e.preventDefault();
            var firstInvalid = document.querySelector('.form-control.invalid');
            if (firstInvalid) firstInvalid.focus();
        }
    });

    /* ── Toggle visibilidade de senhas ── */
    document.querySelectorAll('.toggle-password').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var input = document.getElementById(this.getAttribute('data-target'));
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