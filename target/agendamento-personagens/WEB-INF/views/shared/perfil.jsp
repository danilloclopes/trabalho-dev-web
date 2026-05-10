<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Perfil — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        body { background: #f4f7fa; }

        .profile-header {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            color: #fff;
            padding: 1.5rem 0;
        }
        .profile-header .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        .profile-logo { font-size: 1.4rem; font-weight: 800; color: #fff; text-decoration: none; }

        .profile-main { max-width: 540px; margin: 3rem auto; padding: 0 1.25rem; }

        .profile-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0,0,0,.08);
            padding: 2rem 2.5rem;
        }

        .profile-avatar {
            width: 72px; height: 72px; border-radius: 50%;
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            display: flex; align-items: center; justify-content: center;
            font-size: 2rem; margin: 0 auto 1.5rem;
        }

        .profile-card h2 { font-size: 1.4rem; font-weight: 800; color: #1e1b4b; text-align: center; margin-bottom: 1.75rem; }

        .alert-success {
            background: #dcfce7; color: #166534; border: 1px solid #86efac;
            border-radius: 10px; padding: .8rem 1.2rem; margin-bottom: 1.25rem;
            font-weight: 600; font-size: .9rem;
        }
        .alert-error {
            background: #fee2e2; color: #991b1b; border: 1px solid #fca5a5;
            border-radius: 10px; padding: .8rem 1.2rem; margin-bottom: 1.25rem;
            font-weight: 600; font-size: .9rem;
        }

        .info-row {
            display: flex; align-items: flex-start; gap: .75rem;
            padding: .9rem 0; border-bottom: 1px solid #f3f4f6;
        }
        .info-row:last-of-type { border-bottom: none; }
        .info-label { font-weight: 700; color: #6b7280; font-size: .8rem; text-transform: uppercase; letter-spacing: .05em; min-width: 70px; padding-top: .1rem; }
        .info-value { color: #1e1b4b; font-weight: 600; word-break: break-all; }

        .profile-actions { display: flex; gap: .75rem; margin-top: 2rem; flex-wrap: wrap; }
        .profile-actions .btn,
        .profile-actions button { flex: 1; text-align: center; }
        .profile-actions form { flex: 1; }
        .btn-logout {
            width: 100%; padding: .65rem 1rem; border-radius: 10px; font-size: .9rem;
            font-weight: 700; cursor: pointer; border: 1.5px solid #fca5a5;
            background: #fee2e2; color: #991b1b;
        }
        .btn-logout:hover { background: #fecaca; }
    </style>
</head>
<body>

<header class="profile-header">
    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="profile-logo">🎭 MagicFest</a>
        <a href="${pageContext.request.contextPath}/agendamento?acao=dashboard-cliente"
           style="color:#fff;text-decoration:none;font-weight:600;font-size:.85rem;">
            ← Meus Agendamentos
        </a>
    </div>
</header>

<main class="profile-main">
    <div class="profile-card">

        <div class="profile-avatar">👤</div>
        <h2>Meu Perfil</h2>

        <c:if test="${not empty param.sucesso}">
            <div class="alert-success">✅ Perfil atualizado com sucesso!</div>
        </c:if>

        <c:if test="${not empty requestScope.erro}">
            <div class="alert-error">⚠️ <c:out value="${requestScope.erro}"/></div>
        </c:if>

        <c:if test="${not empty requestScope.usuario}">
            <div class="info-row">
                <span class="info-label">Nome</span>
                <span class="info-value"><c:out value="${requestScope.usuario.nome}"/></span>
            </div>
            <div class="info-row">
                <span class="info-label">E-mail</span>
                <span class="info-value"><c:out value="${requestScope.usuario.email}"/></span>
            </div>
            <div class="info-row">
                <span class="info-label">CPF</span>
                <span class="info-value"><c:out value="${requestScope.usuario.cpf}"/></span>
            </div>

            <div class="profile-actions">
                <a href="${pageContext.request.contextPath}/usuario?acao=editar-perfil" class="btn btn-primary">
                    Editar Perfil
                </a>
                <form action="${pageContext.request.contextPath}/auth" method="post">
                    <input type="hidden" name="acao" value="logout">
                    <button type="submit" class="btn-logout">Sair da conta</button>
                </form>
            </div>
        </c:if>

    </div>
</main>

</body>
</html>
