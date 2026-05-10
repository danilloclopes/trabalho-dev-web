<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Política de Privacidade — MagicFest</title>
  <meta name="description" content="Política de Privacidade da MagicFest — saiba como tratamos seus dados pessoais conforme a LGPD." />
  <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎭</text></svg>" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/style.css" />
  <link rel="stylesheet" href="assets/css/legal.css" />
</head>
<body>

  <!-- NAVBAR -->
  <nav class="navbar" id="navbar">
    <div class="container navbar-inner">
      <a href="index.jsp" class="nav-logo">
        <div class="logo-icon">🎭</div>
        MagicFest
      </a>
      <ul class="nav-links">
        <li><a href="index.jsp#como-funciona">Como Funciona</a></li>
        <li><a href="index.jsp#personagens">Personagens</a></li>
        <li><a href="index.jsp#diferenciais">Diferenciais</a></li>
        <li><a href="index.jsp#depoimentos">Depoimentos</a></li>
      </ul>
      <div class="nav-actions">
        <a href="login.jsp" class="nav-btn-outline">Entrar</a>
        <a href="cadastro.jsp" class="nav-btn-filled">Criar conta</a>
      </div>
      <button class="menu-toggle" id="menuToggle" aria-label="Abrir menu">
        <span></span><span></span><span></span>
      </button>
    </div>
  </nav>
  <nav class="mobile-nav" id="mobileNav">
    <a href="index.jsp#como-funciona">Como Funciona</a>
    <a href="index.jsp#personagens">Personagens</a>
    <a href="index.jsp#diferenciais">Diferenciais</a>
    <a href="index.jsp#depoimentos">Depoimentos</a>
    <div class="mobile-nav-actions">
      <a href="login.jsp" class="btn btn-outline">Entrar</a>
      <a href="cadastro.jsp" class="btn btn-primary">Criar conta</a>
    </div>
  </nav>
  <div class="overlay" id="overlay"></div>

  <!-- CONTEÚDO -->
  <main class="legal-page">
    <div class="container">

      <a href="index.jsp" class="legal-back">← Voltar para o início</a>

      <div class="legal-card">

        <div class="legal-header">
          <div class="legal-badge">🔒 Privacidade &amp; LGPD</div>
          <h1 class="legal-title">Política de Privacidade</h1>
          <p class="legal-meta">Última atualização: 27 de abril de 2026 &nbsp;·&nbsp; Versão 1.0</p>
          <div class="lgpd-badge">✔ Em conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/2018)</div>
        </div>

        <nav class="legal-toc">
          <h3>Sumário</h3>
          <ol>
            <li><a href="#p1">Quem somos</a></li>
            <li><a href="#p2">Dados que coletamos</a></li>
            <li><a href="#p3">Finalidades do tratamento</a></li>
            <li><a href="#p4">Base legal</a></li>
            <li><a href="#p5">Compartilhamento de dados</a></li>
            <li><a href="#p6">Retenção e exclusão</a></li>
            <li><a href="#p7">Seus direitos (LGPD)</a></li>
            <li><a href="#p8">Segurança</a></li>
            <li><a href="#p9">Cookies</a></li>
            <li><a href="#p10">Links externos</a></li>
            <li><a href="#p11">Alterações nesta política</a></li>
            <li><a href="#p12">Contato e DPO</a></li>
          </ol>
        </nav>

        <div class="legal-highlight legal-highlight--info">
          A MagicFest respeita sua privacidade. Esta Política explica, de forma transparente, quais dados pessoais coletamos, por que os utilizamos e quais são seus direitos como titular dos dados, em conformidade com a LGPD.
        </div>

        <div class="legal-section" id="p1">
          <h2><span class="section-num">1</span> Quem somos (Controlador)</h2>
          <p>O controlador responsável pelo tratamento dos seus dados pessoais é:</p>
          <ul>
            <li><strong>Razão Social:</strong> MagicFest Entretenimento Ltda.</li>
            <li><strong>CNPJ:</strong> [00.000.000/0001-00]</li>
            <li><strong>Endereço:</strong> [Rua, Número — Cidade/Estado — CEP]</li>
            <li><strong>E-mail do DPO:</strong> privacidade@magicfest.com.br</li>
          </ul>
        </div>

        <div class="legal-section" id="p2">
          <h2><span class="section-num">2</span> Dados que coletamos</h2>
          <p><strong>2.1 Dados fornecidos diretamente por você:</strong></p>
          <ul>
            <li>Nome completo;</li>
            <li>Endereço de e-mail;</li>
            <li>Número de telefone (opcional no cadastro);</li>
            <li>Senha (armazenada de forma criptografada, nunca em texto puro);</li>
            <li>Tipo de conta (cliente ou personagem) e dados profissionais quando aplicável (tipo de personagem, valor por hora);</li>
            <li>Informações de pagamento — processadas diretamente pelo gateway de pagamento; a MagicFest não armazena dados de cartão de crédito.</li>
          </ul>
          <p><strong>2.2 Dados coletados automaticamente:</strong></p>
          <ul>
            <li>Endereço IP e localização aproximada;</li>
            <li>Tipo de dispositivo, sistema operacional e navegador;</li>
            <li>Páginas visitadas, tempo de sessão e cliques (via cookies e tecnologias similares);</li>
            <li>Data e horário de acesso.</li>
          </ul>
          <p><strong>2.3 Dados de terceiros:</strong> Podemos receber dados de provedores de autenticação social (Google, Facebook) se você optar por criar conta por esse meio, limitados ao nome, e-mail e foto de perfil.</p>
        </div>

        <div class="legal-section" id="p3">
          <h2><span class="section-num">3</span> Finalidades do tratamento</h2>
          <p>Utilizamos seus dados para as seguintes finalidades:</p>
          <ul>
            <li><strong>Criação e gestão de conta:</strong> autenticar seu acesso e personalizar sua experiência;</li>
            <li><strong>Processamento de reservas:</strong> gerenciar pedidos, confirmações e comunicações relacionadas;</li>
            <li><strong>Comunicações essenciais:</strong> enviar confirmações, alertas de segurança e notificações do sistema;</li>
            <li><strong>Atendimento ao cliente:</strong> responder a dúvidas, reclamações e solicitações;</li>
            <li><strong>Melhoria da Plataforma:</strong> analisar uso de funcionalidades para aprimorar a experiência;</li>
            <li><strong>Cumprimento legal:</strong> atender obrigações fiscais, contábeis e regulatórias;</li>
            <li><strong>Marketing (com consentimento):</strong> enviar novidades e promoções — você pode cancelar a qualquer momento.</li>
          </ul>
        </div>

        <div class="legal-section" id="p4">
          <h2><span class="section-num">4</span> Base legal para o tratamento</h2>
          <p>Nos termos da LGPD (art. 7º e 11), tratamos seus dados com as seguintes bases legais:</p>
          <ul>
            <li><strong>Execução de contrato</strong> — para processar reservas e gerir sua conta;</li>
            <li><strong>Consentimento</strong> — para envio de comunicações de marketing;</li>
            <li><strong>Legítimo interesse</strong> — para melhorias da Plataforma e prevenção a fraudes;</li>
            <li><strong>Cumprimento de obrigação legal</strong> — para retenção de registros exigida por lei.</li>
          </ul>
        </div>

        <div class="legal-section" id="p5">
          <h2><span class="section-num">5</span> Compartilhamento de dados</h2>
          <p>A MagicFest não vende seus dados pessoais. Podemos compartilhá-los apenas nas seguintes situações:</p>
          <ul>
            <li><strong>Com o personagem contratado:</strong> nome e telefone do cliente são compartilhados após confirmação da reserva, para viabilizar o serviço;</li>
            <li><strong>Gateways de pagamento:</strong> dados necessários para processar transações financeiras com segurança;</li>
            <li><strong>Prestadores de serviço de TI:</strong> serviços de hospedagem, e-mail transacional e análise — vinculados por contratos de confidencialidade e proteção de dados;</li>
            <li><strong>Autoridades públicas:</strong> quando exigido por lei, ordem judicial ou regulamentação aplicável.</li>
          </ul>
          <p>Todos os terceiros com quem compartilhamos dados estão sujeitos a obrigações contratuais de sigilo e segurança compatíveis com a LGPD.</p>
        </div>

        <div class="legal-section" id="p6">
          <h2><span class="section-num">6</span> Retenção e exclusão de dados</h2>
          <p>Mantemos seus dados pelo tempo necessário para cumprir as finalidades descritas nesta Política, observando os seguintes critérios:</p>
          <ul>
            <li><strong>Dados de conta ativa:</strong> enquanto a conta estiver ativa ou pelo prazo mínimo exigido por lei;</li>
            <li><strong>Registros de transações:</strong> 5 anos, conforme exigências fiscais e do Código de Defesa do Consumidor;</li>
            <li><strong>Logs de acesso:</strong> 6 meses, conforme o Marco Civil da Internet (Lei nº 12.965/2014);</li>
            <li><strong>Dados de marketing:</strong> até o cancelamento do consentimento.</li>
          </ul>
          <p>Após o término do prazo de retenção, os dados são eliminados de forma segura ou anonimizados.</p>
        </div>

        <div class="legal-section" id="p7">
          <h2><span class="section-num">7</span> Seus direitos como titular (LGPD)</h2>
          <p>Nos termos do art. 18 da LGPD, você possui os seguintes direitos sobre seus dados pessoais:</p>
          <div class="rights-grid">
            <div class="rights-item">
              <strong>Acesso</strong>
              <span>Saber quais dados temos sobre você e como os utilizamos.</span>
            </div>
            <div class="rights-item">
              <strong>Correção</strong>
              <span>Corrigir dados incompletos, inexatos ou desatualizados.</span>
            </div>
            <div class="rights-item">
              <strong>Anonimização ou Exclusão</strong>
              <span>Solicitar o bloqueio ou eliminação de dados desnecessários ou excessivos.</span>
            </div>
            <div class="rights-item">
              <strong>Portabilidade</strong>
              <span>Receber seus dados em formato estruturado e interoperável.</span>
            </div>
            <div class="rights-item">
              <strong>Revogação do Consentimento</strong>
              <span>Retirar seu consentimento a qualquer momento, sem penalidade.</span>
            </div>
            <div class="rights-item">
              <strong>Oposição</strong>
              <span>Opor-se a tratamentos baseados em legítimo interesse.</span>
            </div>
            <div class="rights-item">
              <strong>Eliminação</strong>
              <span>Solicitar a exclusão de dados tratados com base no consentimento.</span>
            </div>
            <div class="rights-item">
              <strong>Reclamação</strong>
              <span>Peticionar à ANPD (Autoridade Nacional de Proteção de Dados).</span>
            </div>
          </div>
          <p>Para exercer qualquer um desses direitos, entre em contato pelo e-mail <strong>privacidade@magicfest.com.br</strong>. Responderemos em até <strong>15 dias úteis</strong>.</p>
        </div>

        <div class="legal-section" id="p8">
          <h2><span class="section-num">8</span> Segurança dos dados</h2>
          <p>Adotamos medidas técnicas e organizacionais adequadas para proteger seus dados contra acesso não autorizado, alteração, divulgação ou destruição, incluindo:</p>
          <ul>
            <li>Criptografia de senhas com algoritmos de hash seguros (bcrypt);</li>
            <li>Transmissão de dados via protocolo HTTPS (TLS);</li>
            <li>Controle de acesso por perfis com privilégio mínimo;</li>
            <li>Monitoramento de acessos e tentativas de intrusão;</li>
            <li>Backups regulares e procedimentos de recuperação de desastres.</li>
          </ul>
          <p>Em caso de incidente de segurança que possa afetar seus direitos, notificaremos você e a ANPD dentro dos prazos legais aplicáveis.</p>
        </div>

        <div class="legal-section" id="p9">
          <h2><span class="section-num">9</span> Cookies e tecnologias similares</h2>
          <p>Utilizamos cookies para melhorar a experiência de uso da Plataforma. Os tipos de cookies que empregamos são:</p>
          <ul>
            <li><strong>Essenciais:</strong> necessários para o funcionamento básico da Plataforma (sessão de login, preferências de segurança). Não podem ser desativados.</li>
            <li><strong>Analíticos:</strong> coletam informações de uso de forma anônima para nos ajudar a entender como a Plataforma é utilizada.</li>
            <li><strong>Funcionais:</strong> memorizam suas preferências para personalizar a experiência.</li>
          </ul>
          <p>Você pode gerenciar ou desativar cookies nas configurações do seu navegador. A desativação de cookies essenciais pode impactar funcionalidades da Plataforma.</p>
        </div>

        <div class="legal-section" id="p10">
          <h2><span class="section-num">10</span> Links externos</h2>
          <p>A Plataforma pode conter links para sites de terceiros. Esta Política de Privacidade aplica-se exclusivamente à MagicFest. Não somos responsáveis pelas práticas de privacidade de sites externos e recomendamos que você leia as políticas de cada site que visitar.</p>
        </div>

        <div class="legal-section" id="p11">
          <h2><span class="section-num">11</span> Alterações nesta Política</h2>
          <p>Podemos atualizar esta Política periodicamente para refletir mudanças em nossas práticas ou na legislação aplicável. Alterações relevantes serão comunicadas por e-mail e/ou aviso destacado na Plataforma.</p>
          <p>A data da "Última atualização" no topo deste documento indica quando a versão vigente foi publicada. O uso continuado da Plataforma após a publicação das alterações implica na aceitação da nova versão.</p>
        </div>

        <div class="legal-section" id="p12">
          <h2><span class="section-num">12</span> Contato e Encarregado (DPO)</h2>
          <p>Para exercer seus direitos, esclarecer dúvidas ou fazer reclamações sobre o tratamento de dados pessoais, entre em contato com nosso Encarregado de Proteção de Dados (DPO):</p>
          <ul>
            <li><strong>E-mail do DPO:</strong> privacidade@magicfest.com.br</li>
            <li><strong>Atendimento geral:</strong> contato@magicfest.com.br</li>
            <li><strong>Prazo de resposta:</strong> até 15 dias úteis</li>
          </ul>
          <p>Caso não esteja satisfeito com nossa resposta, você pode apresentar reclamação à <strong>Autoridade Nacional de Proteção de Dados (ANPD)</strong> pelo site <strong>www.gov.br/anpd</strong>.</p>
        </div>

        <div class="legal-contact-box">
          <h3>Sua privacidade é nossa prioridade</h3>
          <p>Entre em contato com nosso DPO sempre que necessário.</p>
          <p><a href="mailto:privacidade@magicfest.com.br">privacidade@magicfest.com.br</a></p>
        </div>

      </div>
    </div>
  </main>

  <!-- FOOTER -->
  <footer class="footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand">
          <a href="index.jsp" class="nav-logo" style="margin-bottom:16px;display:inline-flex;">
            <div class="logo-icon">🎭</div>
            MagicFest
          </a>
          <p class="footer-desc">Transformamos festas em memórias eternas. Personagens de qualidade, atendimento humanizado e uma experiência que toda criança merece.</p>
          <div class="footer-social">
            <span class="social-link" title="Instagram">📸</span>
            <span class="social-link" title="Facebook">👍</span>
            <span class="social-link" title="WhatsApp">💬</span>
            <span class="social-link" title="YouTube">▶️</span>
          </div>
        </div>
        <div>
          <div class="footer-col-title">Navegação</div>
          <ul class="footer-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="index.jsp#como-funciona">Como Funciona</a></li>
            <li><a href="index.jsp#depoimentos">Depoimentos</a></li>
          </ul>
        </div>
        <div>
          <div class="footer-col-title">Conta</div>
          <ul class="footer-links">
            <li><a href="cadastro.jsp">Criar conta</a></li>
            <li><a href="login.jsp">Entrar</a></li>
          </ul>
        </div>
        <div>
          <div class="footer-col-title">Contato</div>
          <div class="footer-contact-item"><span class="icon">📧</span><span>contato@magicfest.com.br</span></div>
          <div class="footer-contact-item"><span class="icon">📞</span><span>(00) 0 0000-0000</span></div>
          <div class="footer-contact-item"><span class="icon">⏰</span><span>Seg–Sáb, 8h–20h</span></div>
        </div>
      </div>
      <div class="footer-bottom">
        <p class="footer-copyright">&copy; <fmt:formatDate value="${now}" pattern="yyyy"/> MagicFest. Todos os direitos reservados.</p>
        <div class="footer-bottom-links">
          <a href="politica-de-privacidade.jsp">Política de Privacidade</a>
          <a href="termos-de-uso.jsp">Termos de Uso</a>
        </div>
      </div>
    </div>
  </footer>

  <script src="assets/js/main.js"></script>
</body>
</html>