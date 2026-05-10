<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Termos de Uso — MagicFest</title>
  <meta name="description" content="Termos de Uso da plataforma MagicFest — Aluguel de personagens para festas." />
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
          <div class="legal-badge">📄 Documento Legal</div>
          <h1 class="legal-title">Termos de Uso</h1>
          <p class="legal-meta">Última atualização: 27 de abril de 2026 &nbsp;·&nbsp; Versão 1.0</p>
        </div>

        <nav class="legal-toc">
          <h3>Sumário</h3>
          <ol>
            <li><a href="#s1">Aceitação dos Termos</a></li>
            <li><a href="#s2">Descrição do Serviço</a></li>
            <li><a href="#s3">Cadastro e Conta</a></li>
            <li><a href="#s4">Uso da Plataforma</a></li>
            <li><a href="#s5">Reservas e Contratação</a></li>
            <li><a href="#s6">Cancelamento e Reembolso</a></li>
            <li><a href="#s7">Responsabilidades</a></li>
            <li><a href="#s8">Propriedade Intelectual</a></li>
            <li><a href="#s9">Conduta Proibida</a></li>
            <li><a href="#s10">Alterações nos Termos</a></li>
            <li><a href="#s11">Lei Aplicável</a></li>
            <li><a href="#s12">Contato</a></li>
          </ol>
        </nav>

        <div class="legal-highlight legal-highlight--warning">
          Leia este documento com atenção antes de utilizar a plataforma MagicFest. Ao criar uma conta ou realizar uma reserva, você concorda com todos os termos aqui descritos.
        </div>

        <div class="legal-section" id="s1">
          <h2><span class="section-num">1</span> Aceitação dos Termos</h2>
          <p>Estes Termos de Uso ("Termos") regulam o acesso e o uso da plataforma MagicFest ("Plataforma"), operada por MagicFest Entretenimento Ltda., com sede em [Cidade, Estado], CNPJ nº [00.000.000/0001-00].</p>
          <p>Ao acessar ou usar a Plataforma de qualquer forma — seja criando uma conta, realizando uma reserva ou simplesmente navegando — você ("Usuário") declara ter lido, compreendido e concordado integralmente com estes Termos e com nossa <a href="politica-de-privacidade.jsp" style="color:var(--primary);font-weight:700;">Política de Privacidade</a>.</p>
          <p>Se você não concordar com qualquer disposição aqui contida, não utilize a Plataforma.</p>
        </div>

        <div class="legal-section" id="s2">
          <h2><span class="section-num">2</span> Descrição do Serviço</h2>
          <p>A MagicFest é uma plataforma de intermediação que conecta <strong>clientes</strong> (contratantes de personagens para festas) a <strong>personagens</strong> (artistas e animadores que oferecem seus serviços). A Plataforma permite:</p>
          <ul>
            <li>Pesquisar e visualizar perfis de personagens disponíveis;</li>
            <li>Verificar disponibilidade e valores por hora;</li>
            <li>Realizar reservas com data, horário e duração definidos;</li>
            <li>Gerenciar pedidos e histórico de contratações;</li>
            <li>Avaliar e receber avaliações após a prestação do serviço.</li>
          </ul>
          <p>A MagicFest atua como intermediária e não é parte do contrato de prestação de serviços firmado entre cliente e personagem. As obrigações relativas à execução do serviço são exclusivas das partes contratantes.</p>
        </div>

        <div class="legal-section" id="s3">
          <h2><span class="section-num">3</span> Cadastro e Conta</h2>
          <p><strong>3.1 Elegibilidade.</strong> Para criar uma conta, o Usuário deve ter no mínimo 18 anos de idade ou ser representado por seu responsável legal. Menores de 18 anos somente podem utilizar a Plataforma com supervisão e autorização dos pais ou responsáveis.</p>
          <p><strong>3.2 Veracidade das Informações.</strong> O Usuário compromete-se a fornecer informações verídicas, completas e atualizadas no momento do cadastro e a mantê-las atualizadas ao longo do tempo. O fornecimento de informações falsas pode resultar no cancelamento imediato da conta.</p>
          <p><strong>3.3 Segurança da Senha.</strong> O Usuário é o único responsável pela guarda e sigilo de suas credenciais de acesso. Qualquer uso não autorizado da conta deve ser comunicado imediatamente à MagicFest pelo e-mail <strong>contato@magicfest.com.br</strong>.</p>
          <p><strong>3.4 Unicidade da Conta.</strong> É permitido apenas um cadastro por CPF/CNPJ. O compartilhamento de contas entre diferentes usuários é proibido.</p>
        </div>

        <div class="legal-section" id="s4">
          <h2><span class="section-num">4</span> Uso da Plataforma</h2>
          <p>O Usuário compromete-se a utilizar a Plataforma de forma lícita, respeitando a legislação brasileira vigente, estes Termos e os direitos de terceiros. É vedado:</p>
          <ul>
            <li>Usar a Plataforma para finalidades ilegais ou fraudulentas;</li>
            <li>Tentar contornar, desabilitar ou interferir em funcionalidades de segurança;</li>
            <li>Publicar conteúdo ofensivo, discriminatório, difamatório ou de cunho sexual;</li>
            <li>Realizar reservas sem intenção de contratação (reservas fictícias);</li>
            <li>Coletar dados de outros usuários sem autorização;</li>
            <li>Utilizar meios automatizados (bots, scrapers) para acessar a Plataforma.</li>
          </ul>
        </div>

        <div class="legal-section" id="s5">
          <h2><span class="section-num">5</span> Reservas e Contratação</h2>
          <p><strong>5.1 Confirmação.</strong> Uma reserva é considerada confirmada somente após o processamento do pagamento e o envio da confirmação por e-mail ao cliente.</p>
          <p><strong>5.2 Prazo Mínimo.</strong> As reservas devem ser realizadas com antecedência mínima de <strong>48 horas</strong> antes do horário de início do evento, salvo quando disponibilidade imediata for indicada pelo personagem.</p>
          <p><strong>5.3 Informações do Evento.</strong> O cliente é responsável por fornecer informações precisas sobre o endereço, data, horário e perfil do público. Alterações realizadas após a confirmação estão sujeitas à aceitação do personagem e podem gerar custos adicionais.</p>
          <p><strong>5.4 Pagamento.</strong> Os pagamentos são processados de forma segura por meio dos gateways de pagamento integrados à Plataforma. A MagicFest repassa ao personagem o valor acordado, deduzida a taxa de serviço da Plataforma, após a conclusão confirmada do evento.</p>
        </div>

        <div class="legal-section" id="s6">
          <h2><span class="section-num">6</span> Cancelamento e Reembolso</h2>
          <p><strong>6.1 Cancelamento pelo Cliente:</strong></p>
          <ul>
            <li><strong>Mais de 72 horas antes do evento:</strong> reembolso integral.</li>
            <li><strong>Entre 24 e 72 horas antes do evento:</strong> reembolso de 50% do valor pago.</li>
            <li><strong>Menos de 24 horas antes do evento:</strong> sem reembolso.</li>
          </ul>
          <p><strong>6.2 Cancelamento pelo Personagem.</strong> Caso o personagem cancele a reserva confirmada, o cliente receberá reembolso integral e será auxiliado na busca de um substituto disponível na Plataforma, sem qualquer custo adicional.</p>
          <p><strong>6.3 Força Maior.</strong> Situações de força maior devidamente comprovadas (desastres naturais, emergências médicas) poderão ser analisadas caso a caso pela equipe MagicFest para definição de reembolso proporcional.</p>
          <p><strong>6.4 Prazo de Reembolso.</strong> Os reembolsos são processados em até <strong>10 dias úteis</strong>, via o mesmo meio de pagamento utilizado na contratação.</p>
        </div>

        <div class="legal-section" id="s7">
          <h2><span class="section-num">7</span> Responsabilidades</h2>
          <p><strong>7.1 Limitação da MagicFest.</strong> A MagicFest não se responsabiliza por danos causados durante a execução dos serviços, conflitos entre cliente e personagem, atrasos decorrentes de força maior, nem por conteúdo publicado por usuários na Plataforma.</p>
          <p><strong>7.2 Responsabilidade do Personagem.</strong> O personagem é inteiramente responsável pela qualidade, pontualidade e segurança do serviço prestado, bem como por manter-se apto física e legalmente para exercer a atividade.</p>
          <p><strong>7.3 Responsabilidade do Cliente.</strong> O cliente é responsável por garantir um ambiente seguro para a realização do evento e por informar eventuais restrições ou necessidades especiais com antecedência.</p>
          <p><strong>7.4 Disponibilidade.</strong> A MagicFest envida seus melhores esforços para manter a Plataforma disponível 24 horas por dia, 7 dias por semana, mas não garante disponibilidade ininterrupta e se reserva o direito de realizar manutenções programadas.</p>
        </div>

        <div class="legal-section" id="s8">
          <h2><span class="section-num">8</span> Propriedade Intelectual</h2>
          <p>Todos os elementos da Plataforma MagicFest — incluindo logotipo, nome, layout, código-fonte, textos, imagens e funcionalidades — são de propriedade exclusiva da MagicFest Entretenimento Ltda. e protegidos pela legislação brasileira de propriedade intelectual (Lei nº 9.610/1998).</p>
          <p>É vedada a reprodução, distribuição, modificação ou uso comercial de qualquer elemento da Plataforma sem autorização prévia e por escrito da MagicFest.</p>
          <p>Os personagens referenciados na Plataforma são marcas registradas de seus respectivos detentores. A MagicFest não possui vínculo com as empresas detentoras dessas marcas.</p>
        </div>

        <div class="legal-section" id="s9">
          <h2><span class="section-num">9</span> Conduta Proibida e Suspensão</h2>
          <p>A MagicFest reserva-se o direito de suspender ou encerrar, temporária ou permanentemente, contas de usuários que:</p>
          <ul>
            <li>Violem estes Termos de Uso;</li>
            <li>Pratiquem assédio, discriminação ou atos de violência contra outros usuários;</li>
            <li>Realizem fraudes ou tentativas de fraude;</li>
            <li>Publiquem informações falsas sobre serviços ou avaliações;</li>
            <li>Tentem burlar o sistema de pagamento da Plataforma.</li>
          </ul>
          <p>Em casos de suspeita de ilicitude, a MagicFest poderá cooperar com autoridades competentes e fornecer informações nos limites legalmente permitidos.</p>
        </div>

        <div class="legal-section" id="s10">
          <h2><span class="section-num">10</span> Alterações nos Termos</h2>
          <p>A MagicFest poderá atualizar estes Termos a qualquer momento. Alterações relevantes serão comunicadas por e-mail e/ou por aviso em destaque na Plataforma com antecedência mínima de <strong>15 dias corridos</strong>.</p>
          <p>O uso continuado da Plataforma após a entrada em vigor das alterações implica na aceitação dos novos Termos. Caso o Usuário não concorde com as modificações, deverá encerrar sua conta antes da data de vigência.</p>
        </div>

        <div class="legal-section" id="s11">
          <h2><span class="section-num">11</span> Lei Aplicável e Foro</h2>
          <p>Estes Termos são regidos e interpretados de acordo com as leis da República Federativa do Brasil, em especial o Código Civil (Lei nº 10.406/2002), o Código de Defesa do Consumidor (Lei nº 8.078/1990) e o Marco Civil da Internet (Lei nº 12.965/2014).</p>
          <p>Fica eleito o foro da Comarca de [Cidade], Estado de [Estado], para dirimir quaisquer controvérsias decorrentes destes Termos, com renúncia de qualquer outro, por mais privilegiado que seja.</p>
        </div>

        <div class="legal-section" id="s12">
          <h2><span class="section-num">12</span> Contato</h2>
          <p>Para dúvidas, solicitações ou reclamações relacionadas a estes Termos, entre em contato com nossa equipe:</p>
          <ul>
            <li><strong>E-mail:</strong> juridico@magicfest.com.br</li>
            <li><strong>Atendimento:</strong> contato@magicfest.com.br</li>
            <li><strong>Horário:</strong> Segunda a Sábado, das 8h às 20h</li>
          </ul>
        </div>

        <div class="legal-contact-box">
          <h3>Ficou com alguma dúvida?</h3>
          <p>Nossa equipe está pronta para ajudar.</p>
          <p><a href="mailto:contato@magicfest.com.br">contato@magicfest.com.br</a></p>
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
        <p class="footer-copyright">&copy; <%= new java.util.Date().getYear() + 1900 %> MagicFest. Todos os direitos reservados.</p>
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