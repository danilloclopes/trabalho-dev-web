<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        body { background: #f4f7fa; }

        .edit-header {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            color: #fff;
            padding: 1.5rem 0;
        }
        .edit-header .container {
            display: flex; align-items: center;
            justify-content: space-between; flex-wrap: wrap; gap: 1rem;
        }
        .edit-logo { font-size: 1.4rem; font-weight: 800; color: #fff; text-decoration: none; }

        .edit-main { max-width: 540px; margin: 3rem auto; padding: 0 1.25rem; }

        .edit-card {
            background: #fff; border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0,0,0,.08);
            padding: 2rem 2.5rem;
        }
        .edit-card h2 { font-size: 1.4rem; font-weight: 800; color: #1e1b4b; margin-bottom: 1.75rem; }

        .alert-error {
            background: #fee2e2; color: #991b1b; border: 1px solid #fca5a5;
            border-radius: 10px; padding: .8rem 1.2rem; margin-bottom: 1.25rem;
            font-weight: 600; font-size: .9rem;
        }

        .field { margin-bottom: 1.25rem; }
        .field label { display: block; font-weight: 700; color: #374151; margin-bottom: .4rem; font-size: .9rem; }
        .field input {
            width: 100%; padding: .65rem 1rem; border: 1.5px solid #d1d5db;
            border-radius: 10px; font-size: .95rem; box-sizing: border-box;
            font-family: inherit; transition: border-color .2s;
        }
        .field input:focus { outline: none; border-color: #7c3aed; }
        .field .hint { font-size: .8rem; color: #9ca3af; margin-top: .35rem; }

        .form-actions { display: flex; gap: .75rem; margin-top: 1.75rem; flex-wrap: wrap; }
        .form-actions .btn { flex: 1; text-align: center; }
    </style>
</head>
<body>

<header class="edit-header">
    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="edit-logo">🎭 MagicFest</a>
        <a href="${pageContext.request.contextPath}/usuario?acao=perfil"
           style="color:#fff;text-decoration:none;font-weight:600;font-size:.85rem;">
            ← Meu Perfil
        </a>
    </div>
</header>

<main class="edit-main">
    <div class="edit-card">
        <h2>✏️ Editar Perfil</h2>

        <c:if test="${not empty requestScope.erro}">
            <div class="alert-error">⚠️ <c:out value="${requestScope.erro}"/></div>
        </c:if>

        <c:choose>
            <c:when test="${not empty sessionScope.usuarioLogado}">
                <form action="${pageContext.request.contextPath}/usuario" method="post">

                    <div class="field">
                        <label for="nome">Nome completo</label>
                        <input
                            type="text"
                            id="nome"
                            name="nome"
                            value="<c:out value='${sessionScope.usuarioLogado.nome}'/>"
                            maxlength="100"
                            required
                        >
                    </div>

                    <div class="field">
                        <label for="email">E-mail</label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            value="<c:out value='${sessionScope.usuarioLogado.email}'/>"
                            maxlength="100"
                            required
                        >
                    </div>

                    <div class="field">
                        <label for="senha">Nova senha</label>
                        <input
                            type="password"
                            id="senha"
                            name="senha"
                            minlength="8"
                            maxlength="100"
                            placeholder="Deixe em branco para manter a atual"
                        >
                        <p class="hint">Mínimo de 8 caracteres. Deixe em branco para não alterar.</p>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Salvar alterações</button>
                        <a href="${pageContext.request.contextPath}/usuario?acao=perfil" class="btn btn-outline">
                            Cancelar
                        </a>
                    </div>

                </form>
            </c:when>
            <c:otherwise>
                <p style="color:#991b1b;font-weight:600;">Sessão expirada. Faça login novamente.</p>
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary" style="display:inline-block;margin-top:1rem;">
                    Fazer login
                </a>
            </c:otherwise>
        </c:choose>

    </div>
</main>

</body>
</html>
