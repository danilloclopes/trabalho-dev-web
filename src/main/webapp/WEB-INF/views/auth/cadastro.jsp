<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="tipoConta" value="${not empty param.tipoConta ? param.tipoConta : 'cliente'}"/>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cadastro.css">
</head>
<body>

<main class="auth-page">
    <div class="auth-card">

        <div class="auth-logo">
            <span class="logo-icon">🎭</span>
            <span class="logo-text">MagicFest</span>
            <p class="logo-sub">Personagens que encantam festas</p>
        </div>

        <h1 class="auth-title">Crie sua conta</h1>
        <p class="auth-subtitle">É rápido, gratuito e sem complicação!</p>

        <div class="benefits-mini">
            <span class="benefit-item">✅ Gratuito</span>
            <span class="benefit-item">🔒 Seguro</span>
            <span class="benefit-item">⚡ Rápido</span>
        </div>

        <c:if test="${not empty requestScope.erro}">
            <div class="alert alert-error" role="alert">
                <span>⚠️</span> <c:out value="${requestScope.erro}"/>
            </div>
        </c:if>

        <form id="cadastroForm" action="${pageContext.request.contextPath}/auth" method="post" novalidate>
            <input type="hidden" name="acao" value="cadastro">

            <%-- Tipo de conta --%>
            <div class="form-group role-group">
                <span class="role-group-label">Tipo de conta</span>
                <div class="role-cards" id="roleCards">

                    <label class="role-card ${tipoConta == 'cliente' ? 'role-card--selected' : ''}">
                        <input type="radio" name="tipoConta" value="cliente" ${tipoConta == 'cliente' ? 'checked' : ''}>
                        <span class="role-card__icon">👤</span>
                        <span class="role-card__title">Cliente</span>
                        <span class="role-card__desc">Quero contratar personagens para minha festa</span>
                    </label>

                    <label class="role-card ${tipoConta == 'personagem' ? 'role-card--selected' : ''}">
                        <input type="radio" name="tipoConta" value="personagem" ${tipoConta == 'personagem' ? 'checked' : ''}>
                        <span class="role-card__icon">🎭</span>
                        <span class="role-card__title">Personagem</span>
                        <span class="role-card__desc">Quero oferecer meus serviços como personagem</span>
                    </label>

                </div>
            </div>

            <%-- Dados extras visíveis apenas para quem se cadastra como personagem --%>
            <div id="personagemSection" class="personagem-section ${tipoConta == 'personagem' ? 'personagem-section--visible' : ''}">
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
                                <option value="CINDERELA"        ${param.tipoPersonagem == 'CINDERELA'        ? 'selected' : ''}>Cinderela</option>
                                <option value="BRANCA_NEVE"      ${param.tipoPersonagem == 'BRANCA_NEVE'      ? 'selected' : ''}>Branca de Neve</option>
                                <option value="AURORA"           ${param.tipoPersonagem == 'AURORA'           ? 'selected' : ''}>Aurora — Bela Adormecida</option>
                                <option value="ARIEL"            ${param.tipoPersonagem == 'ARIEL'            ? 'selected' : ''}>Ariel — Pequena Sereia</option>
                                <option value="BELA"             ${param.tipoPersonagem == 'BELA'             ? 'selected' : ''}>Bela — A Bela e a Fera</option>
                                <option value="RAPUNZEL"         ${param.tipoPersonagem == 'RAPUNZEL'         ? 'selected' : ''}>Rapunzel</option>
                                <option value="MOANA"            ${param.tipoPersonagem == 'MOANA'            ? 'selected' : ''}>Moana</option>
                                <option value="ELSA"             ${param.tipoPersonagem == 'ELSA'             ? 'selected' : ''}>Elsa — Frozen</option>
                                <option value="ANA"              ${param.tipoPersonagem == 'ANA'              ? 'selected' : ''}>Ana — Frozen</option>
                            </optgroup>
                            <optgroup label="🦸 Super-Heróis">
                                <option value="HOMEM_ARANHA"     ${param.tipoPersonagem == 'HOMEM_ARANHA'     ? 'selected' : ''}>Homem-Aranha</option>
                                <option value="BATMAN"           ${param.tipoPersonagem == 'BATMAN'           ? 'selected' : ''}>Batman</option>
                                <option value="SUPERMAN"         ${param.tipoPersonagem == 'SUPERMAN'         ? 'selected' : ''}>Superman</option>
                                <option value="CAPITAO_AMERICA"  ${param.tipoPersonagem == 'CAPITAO_AMERICA'  ? 'selected' : ''}>Capitão América</option>
                                <option value="MULHER_MARAVILHA" ${param.tipoPersonagem == 'MULHER_MARAVILHA' ? 'selected' : ''}>Mulher-Maravilha</option>
                                <option value="HOMEM_FERRO"      ${param.tipoPersonagem == 'HOMEM_FERRO'      ? 'selected' : ''}>Homem de Ferro</option>
                                <option value="THOR"             ${param.tipoPersonagem == 'THOR'             ? 'selected' : ''}>Thor</option>
                                <option value="HULK"             ${param.tipoPersonagem == 'HULK'             ? 'selected' : ''}>Hulk</option>
                                <option value="PANTERA_NEGRA"    ${param.tipoPersonagem == 'PANTERA_NEGRA'    ? 'selected' : ''}>Pantera Negra</option>
                            </optgroup>
                            <optgroup label="🐭 Personagens Clássicos">
                                <option value="MICKEY"           ${param.tipoPersonagem == 'MICKEY'           ? 'selected' : ''}>Mickey Mouse</option>
                                <option value="MINNIE"           ${param.tipoPersonagem == 'MINNIE'           ? 'selected' : ''}>Minnie Mouse</option>
                                <option value="PATO_DONALD"      ${param.tipoPersonagem == 'PATO_DONALD'      ? 'selected' : ''}>Pato Donald</option>
                                <option value="PATETA"           ${param.tipoPersonagem == 'PATETA'           ? 'selected' : ''}>Pateta</option>
                                <option value="PEPPA_PIG"        ${param.tipoPersonagem == 'PEPPA_PIG'        ? 'selected' : ''}>Peppa Pig</option>
                                <option value="BOB_ESPONJA"      ${param.tipoPersonagem == 'BOB_ESPONJA'      ? 'selected' : ''}>Bob Esponja</option>
                            </optgroup>
                            <optgroup label="🎪 Outros">
                                <option value="PALHACO"          ${param.tipoPersonagem == 'PALHACO'          ? 'selected' : ''}>Palhaço</option>
                                <option value="FADA"             ${param.tipoPersonagem == 'FADA'             ? 'selected' : ''}>Fada</option>
                                <option value="COWBOY"           ${param.tipoPersonagem == 'COWBOY'           ? 'selected' : ''}>Cowboy</option>
                                <option value="PIRATA"           ${param.tipoPersonagem == 'PIRATA'           ? 'selected' : ''}>Pirata</option>
                                <option value="MAGO"             ${param.tipoPersonagem == 'MAGO'             ? 'selected' : ''}>Mago</option>
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
                            value="<c:out value='${param.valorHora}'/>"
                        >
                    </div>
                    <span class="field-error" id="valorHoraError">Informe um valor por hora válido.</span>
                </div>
            </div>

            <%-- Nome completo --%>
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
                        value="<c:out value='${param.nome}'/>"
                    >
                </div>
                <span class="field-error" id="nomeError">Informe seu nome completo.</span>
            </div>

            <%-- E-mail e Telefone --%>
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
                            value="<c:out value='${param.email}'/>"
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
                            value="<c:out value='${param.telefone}'/>"
                        >
                    </div>
                </div>
            </div>

            <%-- CPF --%>
            <div class="form-group">
                <label for="cpf">CPF</label>
                <div class="input-wrapper">
                    <span class="input-icon">🪪</span>
                    <input
                        type="text"
                        id="cpf"
                        name="cpf"
                        class="form-control"
                        placeholder="000.000.000-00"
                        maxlength="14"
                        autocomplete="off"
                        value="<c:out value='${param.cpf}'/>"
                    >
                </div>
                <span class="field-error" id="cpfError">Informe um CPF válido.</span>
            </div>

            <%-- Senha --%>
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
                <div class="password-strength">
                    <div class="strength-bar"><div class="strength-fill" id="strengthFill"></div></div>
                    <span class="strength-text" id="strengthText"></span>
                </div>
                <span class="field-error" id="senhaError">A senha deve ter pelo menos 8 caracteres.</span>
            </div>

            <%-- Confirmar senha --%>
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

            <%-- Termos --%>
            <div class="terms-group">
                <label class="checkbox-label">
                    <input type="checkbox" id="termos" name="termos">
                    Li e concordo com os
                    <a href="${pageContext.request.contextPath}/termos-de-uso.jsp" target="_blank">Termos de Uso</a>
                    e a
                    <a href="${pageContext.request.contextPath}/politica-de-privacidade.jsp" target="_blank">Política de Privacidade</a>.
                </label>
                <span class="field-error" id="termosError">Você precisa aceitar os termos para continuar.</span>
            </div>

            <button type="submit" class="btn-auth" id="btnCadastrar">Criar minha conta</button>
        </form>

        <div class="divider">já tem conta?</div>

        <p class="auth-footer-text">
            <a href="${pageContext.request.contextPath}/login.jsp">Entrar na minha conta</a>
        </p>

        <a href="${pageContext.request.contextPath}/" class="back-link">← Voltar para a página inicial</a>

    </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/cadastro.js"></script>

</body>
</html>
