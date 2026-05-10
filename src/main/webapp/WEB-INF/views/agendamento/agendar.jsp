<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Novo Agendamento — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        body { background: #f4f7fa; }

        .form-page-header {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            color: #fff;
            padding: 1.5rem 0;
        }
        .form-page-header .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        .form-logo { font-size: 1.4rem; font-weight: 800; color: #fff; text-decoration: none; }

        .form-main { max-width: 540px; margin: 3rem auto; padding: 0 1.25rem; }

        .form-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0,0,0,.08);
            padding: 2rem 2.5rem;
        }
        .form-card h2 { font-size: 1.4rem; font-weight: 800; color: #1e1b4b; margin-bottom: 1.75rem; }

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

        .form-actions { display: flex; gap: .75rem; margin-top: 1.75rem; flex-wrap: wrap; }
        .form-actions .btn { flex: 1; text-align: center; }
    </style>
</head>
<body>

<header class="form-page-header">
    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="form-logo">🎭 MagicFest</a>
        <nav style="display:flex;gap:.75rem;align-items:center;">
            <a href="${pageContext.request.contextPath}/agendamento?acao=dashboard-cliente"
               style="color:#fff;text-decoration:none;font-weight:600;font-size:.85rem;">
                ← Meus Agendamentos
            </a>
        </nav>
    </div>
</header>

<main class="form-main">
    <div class="form-card">
        <h2>📅 Novo Agendamento</h2>

        <c:if test="${not empty requestScope.erro}">
            <div class="alert-error">
                ⚠️ <c:out value="${requestScope.erro}"/>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/agendamento" method="post">

            <div class="field">
                <label for="animadorId">ID do Animador</label>
                <input
                    type="number"
                    id="animadorId"
                    name="animadorId"
                    value="${param.animadorId}"
                    min="1"
                    placeholder="Ex: 1"
                    required
                >
            </div>

            <div class="field">
                <label for="dataHora">Data e Hora</label>
                <input
                    type="datetime-local"
                    id="dataHora"
                    name="dataHora"
                    value="${param.dataHora}"
                    required
                >
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Confirmar Agendamento</button>
                <a href="${pageContext.request.contextPath}/agendamento?acao=dashboard-cliente"
                   class="btn btn-outline">
                    Cancelar
                </a>
            </div>

        </form>
    </div>
</main>

</body>
</html>
