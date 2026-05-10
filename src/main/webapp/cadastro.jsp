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
    String nomeVal           = request.getParameter("nome")           != null ? request.getParameter("nome")           : "";
    String emailVal          = request.getParameter("email")          != null ? request.getParameter("email")          : "";
    String telefoneVal       = request.getParameter("telefone")       != null ? request.getParameter("telefone")       : "";
    String tipoContaVal      = request.getParameter("tipoConta")      != null ? request.getParameter("tipoConta")      : "cliente";
    String tipoPersonagemVal = request.getParameter("tipoPersonagem") != null ? request.getParameter("tipoPersonagem") : "";
    String valorHoraVal      = request.getParameter("valorHora")      != null ? request.getParameter("valorHora")      : "";
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
    <link rel="stylesheet" href="../assets/css/cadastro.css">
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

            <!-- Tipo de conta -->
            <div class="form-group role-group">
                <span class="role-group-label">Tipo de conta</span>
                <div class="role-cards" id="roleCards">
                    <label class="role-card <%= "cliente".equals(tipoContaVal) ? "role-card--selected" : "" %>">
                        <input type="radio" name="tipoConta" value="cliente" <%= "cliente".equals(tipoContaVal) ? "checked" : "" %>>
                        <span class="role-card__icon">👤</span>
                        <span class="role-card__title">Cliente</span>
                        <span class="role-card__desc">Quero contratar personagens para minha festa</span>
                    </label>
                    <label class="role-card <%= "personagem".equals(tipoContaVal) ? "role-card--selected" : "" %>">
                        <input type="radio" name="tipoConta" value="personagem" <%= "personagem".equals(tipoContaVal) ? "checked" : "" %>>
                        <span class="role-card__icon">🎭</span>
                        <span class="role-card__title">Personagem</span>
                        <span class="role-card__desc">Quero oferecer meus serviços como personagem</span>
                    </label>
                </div>
            </div>

            <!-- Dados extras para personagem -->
            <div id="personagemSection" class="personagem-section <%= "personagem".equals(tipoContaVal) ? "personagem-section--visible" : "" %>">
                <div class="personagem-section__header">
                    <span>🎭</span>
                    <span>Dados do personagem</span>
                </div>

                <div class="form-group">
                    <label for="tipoPersonagem">Personagem que você interpreta</label>
                    <div class="input-wrapper">
                        <span class="input-icon">🎭</span>
                        <select id="tipoPersonagem" name="tipoPersonagem" class="form-control">
                            <option value="">Selecione um personagem...</option>
                            <optgroup label="👸 Princesas">
                                <option value="CINDERELA"        <%= "CINDERELA".equals(tipoPersonagemVal)        ? "selected" : "" %>>Cinderela</option>
                                <option value="BRANCA_NEVE"      <%= "BRANCA_NEVE".equals(tipoPersonagemVal)      ? "selected" : "" %>>Branca de Neve</option>
                                <option value="AURORA"           <%= "AURORA".equals(tipoPersonagemVal)           ? "selected" : "" %>>Aurora — Bela Adormecida</option>
                                <option value="ARIEL"            <%= "ARIEL".equals(tipoPersonagemVal)            ? "selected" : "" %>>Ariel — Pequena Sereia</option>
                                <option value="BELA"             <%= "BELA".equals(tipoPersonagemVal)             ? "selected" : "" %>>Bela — A Bela e a Fera</option>
                                <option value="RAPUNZEL"         <%= "RAPUNZEL".equals(tipoPersonagemVal)         ? "selected" : "" %>>Rapunzel</option>
                                <option value="MOANA"            <%= "MOANA".equals(tipoPersonagemVal)            ? "selected" : "" %>>Moana</option>
                                <option value="ELSA"             <%= "ELSA".equals(tipoPersonagemVal)             ? "selected" : "" %>>Elsa — Frozen</option>
                                <option value="ANA"              <%= "ANA".equals(tipoPersonagemVal)              ? "selected" : "" %>>Ana — Frozen</option>
                            </optgroup>
                            <optgroup label="🦸 Super-Heróis">
                                <option value="HOMEM_ARANHA"     <%= "HOMEM_ARANHA".equals(tipoPersonagemVal)     ? "selected" : "" %>>Homem-Aranha</option>
                                <option value="BATMAN"           <%= "BATMAN".equals(tipoPersonagemVal)           ? "selected" : "" %>>Batman</option>
                                <option value="SUPERMAN"         <%= "SUPERMAN".equals(tipoPersonagemVal)         ? "selected" : "" %>>Superman</option>
                                <option value="CAPITAO_AMERICA"  <%= "CAPITAO_AMERICA".equals(tipoPersonagemVal)  ? "selected" : "" %>>Capitão América</option>
                                <option value="MULHER_MARAVILHA" <%= "MULHER_MARAVILHA".equals(tipoPersonagemVal) ? "selected" : "" %>>Mulher-Maravilha</option>
                                <option value="HOMEM_FERRO"      <%= "HOMEM_FERRO".equals(tipoPersonagemVal)      ? "selected" : "" %>>Homem de Ferro</option>
                                <option value="THOR"             <%= "THOR".equals(tipoPersonagemVal)             ? "selected" : "" %>>Thor</option>
                                <option value="HULK"             <%= "HULK".equals(tipoPersonagemVal)             ? "selected" : "" %>>Hulk</option>
                                <option value="PANTERA_NEGRA"    <%= "PANTERA_NEGRA".equals(tipoPersonagemVal)    ? "selected" : "" %>>Pantera Negra</option>
                            </optgroup>
                            <optgroup label="🐭 Personagens Clássicos">
                                <option value="MICKEY"           <%= "MICKEY".equals(tipoPersonagemVal)           ? "selected" : "" %>>Mickey Mouse</option>
                                <option value="MINNIE"           <%= "MINNIE".equals(tipoPersonagemVal)           ? "selected" : "" %>>Minnie Mouse</option>
                                <option value="PATO_DONALD"      <%= "PATO_DONALD".equals(tipoPersonagemVal)      ? "selected" : "" %>>Pato Donald</option>
                                <option value="PATETA"           <%= "PATETA".equals(tipoPersonagemVal)           ? "selected" : "" %>>Pateta</option>
                                <option value="PEPPA_PIG"        <%= "PEPPA_PIG".equals(tipoPersonagemVal)        ? "selected" : "" %>>Peppa Pig</option>
                                <option value="BOB_ESPONJA"      <%= "BOB_ESPONJA".equals(tipoPersonagemVal)      ? "selected" : "" %>>Bob Esponja</option>
                            </optgroup>
                            <optgroup label="🎪 Outros">
                                <option value="PALHACO"          <%= "PALHACO".equals(tipoPersonagemVal)          ? "selected" : "" %>>Palhaço</option>
                                <option value="FADA"             <%= "FADA".equals(tipoPersonagemVal)             ? "selected" : "" %>>Fada</option>
                                <option value="COWBOY"           <%= "COWBOY".equals(tipoPersonagemVal)           ? "selected" : "" %>>Cowboy</option>
                                <option value="PIRATA"           <%= "PIRATA".equals(tipoPersonagemVal)           ? "selected" : "" %>>Pirata</option>
                                <option value="MAGO"             <%= "MAGO".equals(tipoPersonagemVal)             ? "selected" : "" %>>Mago</option>
                            </optgroup>
                        </select>
                    </div>
                    <span class="field-error" id="tipoPersonagemError">Selecione o personagem que você interpreta.</span>
                </div>

                <div class="form-group">
                    <label for="valorHora">Valor por hora</label>
                    <div class="input-wrapper">
                        <span class="input-icon">💰</span>
                        <input
                            type="text"
                            id="valorHora"
                            name="valorHora"
                            class="form-control"
                            placeholder="R$ 0,00"
                            inputmode="numeric"
                            value="<%= valorHoraVal %>"
                        >
                    </div>
                    <span class="field-error" id="valorHoraError">Informe um valor por hora válido.</span>
                </div>
            </div>

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

<script src="../assets/js/cadastro.js"></script>

</body>
</html>