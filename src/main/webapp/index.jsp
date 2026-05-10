<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta name="description" content="MagicFest — Aluguel de personagens para festas infantis, temáticas e eventos. Princesas, super-heróis, animados e muito mais!" />
  <title>MagicFest | Aluguel de Personagens para Festas</title>

  <!-- Favicon emoji fallback -->
  <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎭</text></svg>" />

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <!-- Stylesheet -->
  <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>

  <!-- ============================================================
       NAVBAR
       ============================================================ -->
  <nav class="navbar" id="navbar">
    <div class="container navbar-inner">

      <!-- Logo -->
      <a href="index.jsp" class="nav-logo">
        <div class="logo-icon">🎭</div>
        MagicFest
      </a>

      <!-- Desktop links -->
      <ul class="nav-links">
        <li><a href="#como-funciona">Como Funciona</a></li>
        <li><a href="#personagens">Personagens</a></li>
        <li><a href="#diferenciais">Diferenciais</a></li>
        <li><a href="#depoimentos">Depoimentos</a></li>
      </ul>

      <!-- Desktop actions -->
      <div class="nav-actions">
        <a href="login.jsp" class="nav-btn-outline">Entrar</a>
        <a href="cadastro.jsp" class="nav-btn-filled">Criar conta</a>
      </div>

      <!-- Mobile toggle -->
      <button class="menu-toggle" id="menuToggle" aria-label="Abrir menu">
        <span></span>
        <span></span>
        <span></span>
      </button>

    </div>
  </nav>

  <!-- Mobile nav drawer -->
  <nav class="mobile-nav" id="mobileNav">
    <a href="#como-funciona">Como Funciona</a>
    <a href="#personagens">Personagens</a>
    <a href="#diferenciais">Diferenciais</a>
    <a href="#depoimentos">Depoimentos</a>
    <div class="mobile-nav-actions">
      <a href="login.jsp" class="btn btn-outline">Entrar</a>
      <a href="cadastro.jsp" class="btn btn-primary">Criar conta</a>
    </div>
  </nav>
  <div class="overlay" id="overlay"></div>


  <!-- ============================================================
       HERO
       ============================================================ -->
  <section class="hero">
    <div class="hero-bg-shapes">
      <div class="hero-shape hero-shape-1"></div>
      <div class="hero-shape hero-shape-2"></div>
      <div class="hero-shape hero-shape-3"></div>
    </div>

    <div class="container">
      <div class="hero-inner">

        <!-- Content -->
        <div class="hero-content">
          <div class="hero-badge">
            <span class="dot"></span>
            Mais de 500 festas realizadas
          </div>

          <h1 class="hero-title">
            Transforme a festa
            <span class="highlight">em um sonho</span>
            inesquecível!
          </h1>

          <p class="hero-description">
            Alugue personagens incríveis para a festa do seu filho. Princesas, super-heróis,
            animados e muito mais — entregamos magia, alegria e memórias eternas.
          </p>

          <div class="hero-actions">
            <button class="btn btn-secondary btn-lg" data-action="reservar">
              ✨ Ver Personagens
            </button>
            <a href="#como-funciona" class="btn btn-outline btn-lg" style="border-color:rgba(255,255,255,.6);color:#fff;">
              Como funciona
            </a>
          </div>

          <div class="hero-stats">
            <div class="hero-stat">
              <span class="hero-stat-number">500+</span>
              <span class="hero-stat-label">Festas realizadas</span>
            </div>
            <div class="hero-stat">
              <span class="hero-stat-number">50+</span>
              <span class="hero-stat-label">Personagens</span>
            </div>
            <div class="hero-stat">
              <span class="hero-stat-number">4.9★</span>
              <span class="hero-stat-label">Avaliação média</span>
            </div>
          </div>
        </div>

        <!-- Visual cards -->
        <div class="hero-visual">
          <div class="hero-cards-grid">
            <div class="hero-char-card">
              <span class="hero-char-emoji">👸</span>
              <div class="hero-char-name">Princesa</div>
              <span class="hero-char-tag">Infantil</span>
            </div>
            <div class="hero-char-card">
              <span class="hero-char-emoji">🦸</span>
              <div class="hero-char-name">Super-herói</div>
              <span class="hero-char-tag">Ação</span>
            </div>
            <div class="hero-char-card">
              <span class="hero-char-emoji">🐭</span>
              <div class="hero-char-name">Animados</div>
              <span class="hero-char-tag">Kids</span>
            </div>
            <div class="hero-char-card">
              <span class="hero-char-emoji">🧙</span>
              <div class="hero-char-name">Fantasia</div>
              <span class="hero-char-tag">Temático</span>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>


  <!-- ============================================================
       HOW IT WORKS
       ============================================================ -->
  <section class="how-it-works" id="como-funciona">
    <div class="container">
      <div class="text-center fade-in">
        <span class="section-tag">Como funciona</span>
        <h2 class="section-title">Simples, rápido e <span>mágico</span></h2>
        <p class="section-subtitle">
          Em apenas 3 passos você garante o personagem favorito do seu filho na festa mais especial da vida dele.
        </p>
      </div>

      <div class="steps-grid">

        <div class="step-card fade-in">
          <div class="step-number">1</div>
          <div class="step-icon">🔍</div>
          <h3 class="step-title">Escolha o personagem</h3>
          <p class="step-desc">
            Navegue pelo nosso catálogo com dezenas de personagens e encontre o favorito da criança — princesas, heróis, animados e mais.
          </p>
        </div>

        <div class="step-card fade-in" style="transition-delay:.12s;">
          <div class="step-number">2</div>
          <div class="step-icon">📅</div>
          <h3 class="step-title">Faça a reserva</h3>
          <p class="step-desc">
            Selecione a data, horário e duração. Confirme sua reserva com segurança pelo nosso sistema e receba a confirmação por e-mail.
          </p>
        </div>

        <div class="step-card fade-in" style="transition-delay:.24s;">
          <div class="step-number">3</div>
          <div class="step-icon">🎉</div>
          <h3 class="step-title">Curta a magia!</h3>
          <p class="step-desc">
            Nosso personagem chega na hora certa, fantasiado e pronto para encantar todas as crianças com brincadeiras e sorrisos!
          </p>
        </div>

      </div>
    </div>
  </section>


  <!-- ============================================================
       CHARACTERS
       ============================================================ -->
  <section class="characters" id="personagens">
    <div class="container">
      <div class="text-center fade-in">
        <span class="section-tag">Catálogo</span>
        <h2 class="section-title">Personagens em <span>destaque</span></h2>
        <p class="section-subtitle">
          Mais de 50 personagens disponíveis para tornar qualquer festa inesquecível.
        </p>
      </div>

      <!-- Filter buttons -->
      <div class="chars-filter fade-in">
        <button class="filter-btn active" data-filter="all">Todos</button>
        <button class="filter-btn" data-filter="princesa">Princesas</button>
        <button class="filter-btn" data-filter="heroi">Super-heróis</button>
        <button class="filter-btn" data-filter="animado">Animados</button>
        <button class="filter-btn" data-filter="fantasia">Fantasia</button>
      </div>

      <!-- Cards grid -->
      <div class="chars-grid">

        <div class="char-card fade-in" data-category="princesa">
          <div class="char-card-img">
            👸
            <span class="char-badge">Popular</span>
          </div>
          <div class="char-card-body">
            <div class="char-category">Princesas</div>
            <h3 class="char-name">Cinderela</h3>
            <p class="char-desc">A clássica princesa que conquistou o coração de todas as crianças com seu vestido azul e sapatinho de cristal.</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 250</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

        <div class="char-card fade-in" data-category="heroi" style="transition-delay:.08s;">
          <div class="char-card-img">
            🕷️
            <span class="char-badge">Top</span>
          </div>
          <div class="char-card-body">
            <div class="char-category">Super-heróis</div>
            <h3 class="char-name">Homem-Aranha</h3>
            <p class="char-desc">O herói amigável da vizinhança vai animar a festa com acrobacias e interações cheias de energia!</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 280</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

        <div class="char-card fade-in" data-category="animado" style="transition-delay:.16s;">
          <div class="char-card-img">
            🐭
          </div>
          <div class="char-card-body">
            <div class="char-category">Animados</div>
            <h3 class="char-name">Mickey Mouse</h3>
            <p class="char-desc">O rato mais famoso do mundo! Clássico garantido para deixar qualquer criança com um sorriso enorme.</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 260</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

        <div class="char-card fade-in" data-category="princesa" style="transition-delay:.08s;">
          <div class="char-card-img">
            ❄️
          </div>
          <div class="char-card-body">
            <div class="char-category">Princesas</div>
            <h3 class="char-name">Elsa — Frozen</h3>
            <p class="char-desc">A rainha do gelo vai encantar a festa com sua magia e uma apresentação incrível cheia de brilho.</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 290</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

        <div class="char-card fade-in" data-category="heroi" style="transition-delay:.16s;">
          <div class="char-card-img">
            🦇
          </div>
          <div class="char-card-body">
            <div class="char-category">Super-heróis</div>
            <h3 class="char-name">Batman</h3>
            <p class="char-desc">O cavaleiro das trevas em versão kids! Fantasia elaborada e muita interação com os pequenos convidados.</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 270</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

        <div class="char-card fade-in" data-category="fantasia" style="transition-delay:.24s;">
          <div class="char-card-img">
            🧙
            <span class="char-badge">Novo</span>
          </div>
          <div class="char-card-body">
            <div class="char-category">Fantasia</div>
            <h3 class="char-name">Mago Encantador</h3>
            <p class="char-desc">Mágicas, truques e muita fantasia! Perfeito para festas temáticas e eventos corporativos infantis.</p>
            <div class="char-card-footer">
              <div class="char-price">
                <span class="char-price-label">A partir de</span>
                <span class="char-price-value">R$ 320</span>
              </div>
              <button class="char-btn">Reservar</button>
            </div>
          </div>
        </div>

      </div>

      <div class="chars-cta fade-in">
        <a href="personagem/lista.jsp" class="btn btn-primary btn-lg">
          Ver todos os personagens &rarr;
        </a>
      </div>
    </div>
  </section>


  <!-- ============================================================
       BENEFITS
       ============================================================ -->
  <section class="benefits" id="diferenciais">
    <div class="container">
      <div class="text-center fade-in">
        <span class="section-tag">Nossos diferenciais</span>
        <h2 class="section-title">Por que escolher a <span>MagicFest?</span></h2>
        <p class="section-subtitle">
          Cada detalhe é pensado para que a festa seja perfeita — do início ao fim.
        </p>
      </div>

      <div class="benefits-grid">

        <div class="benefit-card fade-in">
          <span class="benefit-icon">🎭</span>
          <h3 class="benefit-title">Fantasias de Alta Qualidade</h3>
          <p class="benefit-desc">Figurinos profissionais, detalhados e idênticos aos personagens originais, lavados e higienizados antes de cada uso.</p>
        </div>

        <div class="benefit-card fade-in" style="transition-delay:.08s;">
          <span class="benefit-icon">⏰</span>
          <h3 class="benefit-title">Pontualidade Garantida</h3>
          <p class="benefit-desc">Nossos personagens chegam no horário combinado. Planejamento rigoroso para que tudo ocorra conforme esperado.</p>
        </div>

        <div class="benefit-card fade-in" style="transition-delay:.16s;">
          <span class="benefit-icon">🛡️</span>
          <h3 class="benefit-title">Profissionais Qualificados</h3>
          <p class="benefit-desc">Atores treinados em interação infantil, com verificação de antecedentes e capacitação em primeiros socorros.</p>
        </div>

        <div class="benefit-card fade-in" style="transition-delay:.24s;">
          <span class="benefit-icon">💰</span>
          <h3 class="benefit-title">Melhor Custo-Benefício</h3>
          <p class="benefit-desc">Pacotes para todos os orçamentos, sem taxas escondidas. Transparência total do valor no momento da reserva.</p>
        </div>

      </div>
    </div>
  </section>


  <!-- ============================================================
       TESTIMONIALS
       ============================================================ -->
  <section class="testimonials" id="depoimentos">
    <div class="container">
      <div class="text-center fade-in">
        <span class="section-tag">Depoimentos</span>
        <h2 class="section-title">O que as famílias <span>dizem</span></h2>
        <p class="section-subtitle">
          Centenas de famílias já confiaram na MagicFest para tornar momentos especiais ainda mais mágicos.
        </p>
      </div>

      <div class="testimonials-slider fade-in">
        <div class="testimonials-track" id="testimonialsTrack">

          <div class="testimonial-card">
            <div class="stars">★★★★★</div>
            <p class="testimonial-text">
              "A Cinderela foi simplesmente perfeita! Minha filha ficou com os olhos brilhando o tempo todo. O atendimento desde a reserva até o dia da festa foi impecável. Com certeza vou usar novamente!"
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">AM</div>
              <div>
                <div class="author-name">Ana Martins</div>
                <div class="author-role">Mãe da Maria Eduarda, 5 anos</div>
              </div>
            </div>
          </div>

          <div class="testimonial-card">
            <div class="stars">★★★★★</div>
            <p class="testimonial-text">
              "O Homem-Aranha chegou 15 minutos antes, super animado! As crianças enlouqueceram. Valeu cada centavo. A plataforma de reserva é muito fácil de usar, fiz tudo pelo celular em minutos."
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">RC</div>
              <div>
                <div class="author-name">Ricardo Carvalho</div>
                <div class="author-role">Pai do Bernardo, 7 anos</div>
              </div>
            </div>
          </div>

          <div class="testimonial-card">
            <div class="stars">★★★★★</div>
            <p class="testimonial-text">
              "Contratei a Elsa para a festa temática de Frozen da minha neta. Superou todas as expectativas! A fantasia era lindíssima e a atriz ficou duas horas interagindo com todas as crianças."
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">LF</div>
              <div>
                <div class="author-name">Lúcia Ferreira</div>
                <div class="author-role">Vovó da Sofia, 6 anos</div>
              </div>
            </div>
          </div>

          <div class="testimonial-card">
            <div class="stars">★★★★★</div>
            <p class="testimonial-text">
              "Organizo eventos infantis há 8 anos e a MagicFest é sem dúvida a melhor parceira que tive. Profissionalismo, qualidade e preço justo. Indico a todos os meus clientes!"
            </p>
            <div class="testimonial-author">
              <div class="author-avatar">JS</div>
              <div>
                <div class="author-name">Juliana Santos</div>
                <div class="author-role">Cerimonialista de eventos infantis</div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <!-- Slider dots -->
      <div class="slider-controls">
        <button class="slider-dot active"></button>
        <button class="slider-dot"></button>
        <button class="slider-dot"></button>
        <button class="slider-dot"></button>
      </div>

    </div>
  </section>


  <!-- ============================================================
       CTA
       ============================================================ -->
  <section class="cta-section">
    <div class="container">
      <div class="cta-box fade-in">
        <h2 class="cta-title">A festa dos sonhos começa aqui 🎉</h2>
        <p class="cta-desc">
          Não deixe para última hora! Reserve agora o personagem favorito do seu filho e garanta um dia inesquecível para toda a família.
        </p>
        <div class="cta-actions">
          <button class="btn-white" data-action="reservar">✨ Fazer minha reserva</button>
          <a href="tel:+5500000000000" class="btn-ghost">📞 Falar pelo WhatsApp</a>
        </div>
      </div>
    </div>
  </section>


  <!-- ============================================================
       FOOTER
       ============================================================ -->
  <footer class="footer">
    <div class="container">
      <div class="footer-grid">

        <!-- Brand -->
        <div class="footer-brand">
          <a href="index.jsp" class="nav-logo" style="margin-bottom:16px;display:inline-flex;">
            <div class="logo-icon">🎭</div>
            MagicFest
          </a>
          <p class="footer-desc">
            Transformamos festas em memórias eternas. Personagens de qualidade, atendimento humanizado e uma experiência que toda criança merece.
          </p>
          <div class="footer-social">
            <span class="social-link" title="Instagram">📸</span>
            <span class="social-link" title="Facebook">👍</span>
            <span class="social-link" title="WhatsApp">💬</span>
            <span class="social-link" title="YouTube">▶️</span>
          </div>
        </div>

        <!-- Links -->
        <div>
          <div class="footer-col-title">Navegação</div>
          <ul class="footer-links">
            <li><a href="index.jsp">Início</a></li>
            <li><a href="personagem/lista.jsp">Personagens</a></li>
            <li><a href="#como-funciona">Como Funciona</a></li>
            <li><a href="#depoimentos">Depoimentos</a></li>
          </ul>
        </div>

        <!-- Account -->
        <div>
          <div class="footer-col-title">Conta</div>
          <ul class="footer-links">
            <li><a href="cadastro.jsp">Criar conta</a></li>
            <li><a href="login.jsp">Entrar</a></li>
            <li><a href="aluguel/novo.jsp">Fazer reserva</a></li>
            <li><a href="cliente/perfil.jsp">Meu perfil</a></li>
          </ul>
        </div>

        <!-- Contact -->
        <div>
          <div class="footer-col-title">Contato</div>
          <div class="footer-contact-item">
            <span class="icon">📍</span>
            <span>Sua Cidade, Estado</span>
          </div>
          <div class="footer-contact-item">
            <span class="icon">📧</span>
            <span>contato@magicfest.com.br</span>
          </div>
          <div class="footer-contact-item">
            <span class="icon">📞</span>
            <span>(00) 0 0000-0000</span>
          </div>
          <div class="footer-contact-item">
            <span class="icon">⏰</span>
            <span>Seg–Sáb, 8h–20h</span>
          </div>
        </div>

      </div>

      <div class="footer-bottom">
        <p class="footer-copyright">
          &copy; <%= new java.util.Date().getYear() + 1900 %> MagicFest. Todos os direitos reservados.
        </p>
        <div class="footer-bottom-links">
          <a href="politica-de-privacidade.jsp">Política de Privacidade</a>
          <a href="termos-de-uso.jsp">Termos de Uso</a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scroll-to-top -->
  <button class="scroll-top" id="scrollTopBtn" aria-label="Voltar ao topo">&#8679;</button>

  <!-- Main JS -->
  <script src="assets/js/main.js"></script>

</body>
</html>