<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>${perfil.nombre} ${perfil.apellidos} | Portafolio</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/publico.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@400;500;600;700&display=swap"
          rel="stylesheet">

</head>


<body>


<!-- =====================================================
     FONDO
     ===================================================== -->

<div class="background-grid"></div>

<div class="gradient-orb orb-left"></div>
<div class="gradient-orb orb-right"></div>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<header class="navbar">

    <a href="#inicio" class="logo">

        <span>
            ${perfil.nombre}
        </span>

        <span class="logo-dot">.</span>

    </a>


    <nav>

        <ul class="nav-links">

            <li>
                <a href="#inicio">
                    Inicio
                </a>
            </li>

            <li>
                <a href="#sobre-mi">
                    Sobre mí
                </a>
            </li>

            <li>
                <a href="#habilidades">
                    Habilidades
                </a>
            </li>

            <li>
                <a href="#semanas">
                    Aprendizaje
                </a>
            </li>

            <li>
                <a href="#proyectos">
                    Proyectos
                </a>
            </li>

            <li>
                <a href="#contacto">
                    Contacto
                </a>
            </li>

        </ul>

    </nav>

</header>


<!-- =====================================================
     HERO
     ===================================================== -->

<section class="hero"
         id="inicio">

    <div class="hero-container">


        <!-- TEXTO -->

        <div class="hero-text">

            <div class="hero-label">

                <span class="status-dot"></span>

                PORTAFOLIO ACADÉMICO

            </div>


            <h1>

                Hola, soy

                <span class="name-line">
                    ${perfil.nombre}
                </span>

                <span class="surname-line">
                    ${perfil.apellidos}
                </span>

            </h1>


            <div class="hero-role">

                ${perfil.carrera}

            </div>


            <p class="hero-description">

                ${perfil.descripcion}

            </p>


            <div class="hero-buttons">

                <a href="#semanas"
                   class="btn-main">

                    Ver mi aprendizaje

                    <span>→</span>

                </a>


                <a href="#contacto"
                   class="btn-secondary">

                    Contactarme

                </a>

            </div>


            <!-- MINI DATOS -->

            <div class="hero-stats">

                <div class="stat">

                    <strong>
                        16
                    </strong>

                    <span>
                        Semanas
                    </span>

                </div>


                <div class="stat">

                    <strong>
                        06
                    </strong>

                    <span>
                        Tecnologías
                    </span>

                </div>


                <div class="stat">

                    <strong>
                        ∞
                    </strong>

                    <span>
                        Aprendizaje
                    </span>

                </div>

            </div>

        </div>


        <!-- FOTO -->

        <div class="hero-visual">

            <div class="visual-number">
                01
            </div>


            <div class="photo-frame">

                <div class="frame-decoration"></div>

                <div class="photo-wrapper">


                    <c:choose>

                        <c:when test="${not empty perfil.foto}">

                            <img
                                    class="profile-photo"

                                    src="${pageContext.request.contextPath}/publico/imagen/${perfil.foto}"

                                    alt="${perfil.nombre} ${perfil.apellidos}">

                        </c:when>

                        <c:otherwise>

                            <img
                                    class="profile-photo"

                                    src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=800&q=85"

                                    alt="Foto de perfil">

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>


            <div class="floating-card">

                <span class="floating-icon">
                    ✦
                </span>

                <div>

                    <strong>
                        Web Developer
                    </strong>

                    <small>
                        Diseño + Código
                    </small>

                </div>

            </div>


            <div class="circle-decoration"></div>

        </div>


    </div>

</section>


<!-- =====================================================
     SOBRE MÍ
     ===================================================== -->

<section class="about-section"
         id="sobre-mi">

    <div class="section-container">


        <div class="section-heading">

            <div class="section-index">
                01 / 05
            </div>

            <div>

                <span class="section-label">
                    SOBRE MÍ
                </span>

                <h2>
                    Conóceme un poco
                    <br>
                    <em>mejor.</em>
                </h2>

            </div>

        </div>


        <div class="about-layout">


            <!-- TEXTO PRINCIPAL -->

            <div class="about-main">

                <span class="big-letter">
                    “
                </span>

                <p class="about-description">

                    ${perfil.sobreMi}

                </p>

                <div class="about-line"></div>

                <p class="about-small">

                    Me interesa combinar creatividad,
                    diseño y programación para crear
                    experiencias digitales modernas,
                    funcionales y fáciles de utilizar.

                </p>

            </div>


            <!-- CARACTERÍSTICAS -->

            <div class="about-features">


                <article class="feature-item">

                    <span class="feature-number">
                        01
                    </span>

                    <div>

                        <h3>
                            Diseño
                        </h3>

                        <p>
                            Creo interfaces modernas,
                            atractivas y enfocadas en
                            la experiencia del usuario.
                        </p>

                    </div>

                </article>


                <article class="feature-item">

                    <span class="feature-number">
                        02
                    </span>

                    <div>

                        <h3>
                            Desarrollo
                        </h3>

                        <p>
                            Transformo ideas en
                            aplicaciones web utilizando
                            diferentes tecnologías.
                        </p>

                    </div>

                </article>


                <article class="feature-item">

                    <span class="feature-number">
                        03
                    </span>

                    <div>

                        <h3>
                            Aprendizaje
                        </h3>

                        <p>
                            Cada proyecto representa
                            una nueva oportunidad para
                            mejorar mis habilidades.
                        </p>

                    </div>

                </article>


            </div>

        </div>

    </div>

</section>


<!-- =====================================================
     HABILIDADES
     ===================================================== -->

<section class="skills-section"
         id="habilidades">

    <div class="section-container">


        <div class="skills-header">

            <div>

                <div class="section-index">
                    02 / 05
                </div>

                <span class="section-label">
                    TECNOLOGÍAS
                </span>

                <h2>
                    Herramientas
                    <br>
                    que utilizo.
                </h2>

            </div>


            <p>

                Tecnologías y herramientas
                que forman parte de mi
                proceso de aprendizaje.

            </p>

        </div>


        <div class="skills-grid">


            <article class="skill-card skill-featured">

                <span class="skill-number">
                    01
                </span>

                <div class="skill-icon">
                    HTML
                </div>

                <h3>
                    HTML
                </h3>

                <p>
                    Estructuración y creación
                    de páginas web.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


            <article class="skill-card">

                <span class="skill-number">
                    02
                </span>

                <div class="skill-icon">
                    CSS
                </div>

                <h3>
                    CSS
                </h3>

                <p>
                    Diseño, estilos,
                    interfaces y animaciones.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


            <article class="skill-card">

                <span class="skill-number">
                    03
                </span>

                <div class="skill-icon">
                    JS
                </div>

                <h3>
                    JavaScript
                </h3>

                <p>
                    Interactividad y
                    comportamiento dinámico.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


            <article class="skill-card">

                <span class="skill-number">
                    04
                </span>

                <div class="skill-icon">
                    JV
                </div>

                <h3>
                    Java
                </h3>

                <p>
                    Desarrollo de aplicaciones
                    y programación orientada a objetos.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


            <article class="skill-card">

                <span class="skill-number">
                    05
                </span>

                <div class="skill-icon">
                    SB
                </div>

                <h3>
                    Spring Boot
                </h3>

                <p>
                    Desarrollo de aplicaciones
                    web utilizando Java y Spring.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


            <article class="skill-card">

                <span class="skill-number">
                    06
                </span>

                <div class="skill-icon">
                    SQL
                </div>

                <h3>
                    MySQL
                </h3>

                <p>
                    Creación y administración
                    de bases de datos.
                </p>

                <div class="skill-arrow">
                    ↗
                </div>

            </article>


        </div>

    </div>

</section>


<!-- =====================================================
     SEMANAS / APRENDIZAJE
     ===================================================== -->

<section class="learning-section"
         id="semanas">

    <div class="section-container">


        <div class="learning-top">

            <div>

                <div class="section-index">
                    03 / 05
                </div>

                <span class="section-label">
                    MI PROCESO
                </span>

                <h2>
                    16 semanas de
                    <br>
                    <em>aprendizaje.</em>
                </h2>

            </div>


            <p>
                Explora el contenido desarrollado
                durante mi formación académica.
            </p>

        </div>


        <!-- TIMELINE -->

        <div class="timeline">


            <c:forEach var="semana" items="${semanas}">


                <div class="timeline-item">


                    <div class="timeline-marker">

                        <span>
                                ${semana.numero}
                        </span>

                    </div>


                    <a href="${pageContext.request.contextPath}/semana/${semana.id}"
                       class="timeline-content">


                        <div class="timeline-meta">

                            <span>
                                SEMANA
                            </span>

                            <span>
                                →
                            </span>

                        </div>


                        <h3>

                                ${semana.titulo}

                        </h3>


                        <p>

                                ${semana.descripcion}

                        </p>


                        <div class="timeline-link">
                            Ver contenido
                            <span>↗</span>
                        </div>


                    </a>


                </div>


            </c:forEach>


        </div>

    </div>

</section>


<!-- =====================================================
     PROYECTOS
     ===================================================== -->

<section class="projects-section"
         id="proyectos">

    <div class="section-container">


        <div class="projects-header">

            <div>

                <div class="section-index">
                    04 / 05
                </div>

                <span class="section-label">
                    PORTAFOLIO
                </span>

                <h2>
                    Lo que estoy
                    <br>
                    <em>construyendo.</em>
                </h2>

            </div>


            <p>
                Algunos de los proyectos y
                trabajos desarrollados durante
                mi formación.
            </p>

        </div>


        <div class="projects-grid">


            <!-- PROYECTO 1 -->

            <article class="project-card project-large">

                <div class="project-top">

                    <span>
                        01
                    </span>

                    <span>
                        WEB
                    </span>

                </div>


                <div class="project-icon">
                    ◈
                </div>


                <h3>
                    Proyecto Web
                </h3>


                <p>
                    Espacio destinado para mostrar
                    uno de los proyectos web
                    desarrollados durante el curso.
                </p>


                <div class="project-bottom">

                    <span>
                        HTML · CSS · JS
                    </span>

                    <span class="project-arrow">
                        ↗
                    </span>

                </div>

            </article>


            <!-- PROYECTO 2 -->

            <article class="project-card">

                <div class="project-top">

                    <span>
                        02
                    </span>

                    <span>
                        APP
                    </span>

                </div>


                <div class="project-icon">
                    ◎
                </div>


                <h3>
                    Aplicación
                </h3>


                <p>
                    Espacio destinado para mostrar
                    aplicaciones y proyectos
                    realizados.
                </p>


                <div class="project-bottom">

                    <span>
                        JAVA · SPRING
                    </span>

                    <span class="project-arrow">
                        ↗
                    </span>

                </div>

            </article>


            <!-- PROYECTO 3 -->

            <article class="project-card">

                <div class="project-top">

                    <span>
                        03
                    </span>

                    <span>
                        SYSTEM
                    </span>

                </div>


                <div class="project-icon">
                    ✦
                </div>


                <h3>
                    Mi Portafolio
                </h3>


                <p>
                    Este mismo sistema representa
                    uno de los proyectos principales
                    de mi formación.
                </p>


                <div class="project-bottom">

                    <span>
                        THYMELEAF · JAVA
                    </span>

                    <span class="project-arrow">
                        ↗
                    </span>

                </div>

            </article>


        </div>

    </div>

</section>


<!-- =====================================================
     CONTACTO
     ===================================================== -->

<section class="contact-section"
         id="contacto">

    <div class="section-container">


        <div class="contact-wrapper">


            <div class="contact-info">

                <div class="section-index">
                    05 / 05
                </div>

                <span class="section-label">
                    CONTACTO
                </span>


                <h2>
                    ¿Tienes una
                    <br>
                    <em>idea?</em>
                </h2>


                <p>

                    Si deseas conocer más sobre mis
                    proyectos, trabajos o aprendizaje,
                    puedes comunicarte conmigo.

                </p>


                <div class="contact-details">


                    <c:if test="${not empty perfil.correo}">

                        <div class="contact-detail">

                            <span class="detail-label">
                                EMAIL
                            </span>

                            <a href="mailto:${perfil.correo}">

                                    ${perfil.correo}

                            </a>

                        </div>

                    </c:if>


                    <c:if test="${not empty perfil.telefono}">

                        <div class="contact-detail">

                            <span class="detail-label">
                                TELÉFONO
                            </span>

                            <span>

                                    ${perfil.telefono}

                            </span>

                        </div>

                    </c:if>


                </div>


                <button
                        type="button"
                        id="btnAbrirMensaje"
                        class="contact-button">

                    Enviar un mensaje

                    <span>
                        ↗
                    </span>

                </button>


            </div>


            <div class="contact-visual">

                <div class="contact-symbol">
                    @
                </div>

                <div class="contact-circle circle-one"></div>

                <div class="contact-circle circle-two"></div>

                <span class="contact-word">
                    LET'S TALK
                </span>

            </div>


        </div>

    </div>

</section>


<!-- =====================================================
     MODAL CONTACTO
     ===================================================== -->

<div id="modalMensaje"
     class="modal-overlay">


    <div class="modal-contacto">


        <button
                type="button"
                id="btnCerrarMensaje"
                class="modal-close"
                aria-label="Cerrar">

            ×

        </button>


        <div class="modal-header">

            <span class="modal-label">
                CONTACTO
            </span>

            <h2>
                Envíame un
                <em>mensaje.</em>
            </h2>

            <p>
                Completa el formulario y me pondré
                en contacto contigo.
            </p>

        </div>


        <form id="formularioContacto"
              action="${pageContext.request.contextPath}/mensaje/enviar"
              method="post">


            <div class="form-row">


                <div class="form-group">

                    <label for="nombre">
                        Nombre
                    </label>

                    <input
                            type="text"
                            id="nombre"
                            name="nombre"
                            placeholder="Tu nombre"
                            required>

                </div>


                <div class="form-group">

                    <label for="correo">
                        Correo electrónico
                    </label>

                    <input
                            type="email"
                            id="correo"
                            name="correo"
                            placeholder="tu@correo.com"
                            required>

                </div>


            </div>


            <div class="form-group">

                <label for="asunto">
                    Asunto
                </label>

                <input
                        type="text"
                        id="asunto"
                        name="asunto"
                        placeholder="¿Sobre qué quieres escribirme?"
                        required>

            </div>


            <div class="form-group">

                <label for="mensaje">
                    Mensaje
                </label>

                <textarea
                        id="mensaje"
                        name="mensaje"
                        placeholder="Escribe tu mensaje aquí..."
                        required></textarea>

            </div>


            <div class="modal-buttons">

                <button
                        type="button"
                        id="btnCancelarMensaje"
                        class="btn-cancel">

                    Cancelar

                </button>


                <button
                        type="submit"
                        class="btn-send">

                    Enviar mensaje

                    <span>
                        ↗
                    </span>

                </button>

            </div>


        </form>


    </div>

</div>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer>

    <div class="footer-container">


        <div class="footer-logo">

            <span>
                ${perfil.nombre}
            </span>

            <span>
                .
            </span>

        </div>


        <p>

            Diseñado y desarrollado por

            <strong>
                ${perfil.nombre} ${perfil.apellidos}
            </strong>

        </p>


        <span class="footer-year">
            © 2026
        </span>


    </div>

</footer>


<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script src="${pageContext.request.contextPath}/js/publico.js"></script>


</body>

</html>