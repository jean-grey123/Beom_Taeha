<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Semana ${semana.numero} | Sebastian Rivas</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/publico.css">

    <style>

        .week-detail {
            min-height: 100vh;
            padding: 140px 7% 80px;

            background:
                    radial-gradient(
                            circle at 10% 20%,
                            rgba(56, 189, 248, .15),
                            transparent 30%
                    ),
                    radial-gradient(
                            circle at 90% 80%,
                            rgba(124, 58, 237, .12),
                            transparent 30%
                    ),
                    #f8fafc;
        }

        .week-detail-container {
            max-width: 1200px;
            margin: auto;
        }

        /* =====================================================
           BOTÓN VOLVER
           ===================================================== */

        .back-button {
            display: inline-block;

            margin-bottom: 35px;

            padding: 12px 20px;

            border-radius: 30px;

            background: white;

            border: 1px solid #e2e8f0;

            color: #2563eb;

            text-decoration: none;

            font-weight: bold;

            transition: .3s;
        }

        .back-button:hover {
            transform: translateX(-5px);

            border-color: #2563eb;
        }

        /* =====================================================
           CABECERA DE SEMANA
           ===================================================== */

        .week-header {
            background: white;

            border-radius: 30px;

            padding: 50px;

            margin-bottom: 50px;

            border: 1px solid #e2e8f0;

            box-shadow:
                    0 20px 50px rgba(15, 23, 42, .07);

            position: relative;

            overflow: hidden;
        }

        .week-header::before {
            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 6px;

            background:
                    linear-gradient(
                            90deg,
                            #2563eb,
                            #7c3aed,
                            #ec4899
                    );
        }

        .week-big-number {
            font-size: 80px;

            font-weight: 900;

            color: #dbeafe;

            line-height: 1;

            margin-bottom: 15px;
        }

        .week-header h1 {
            font-size: 45px;

            color: #172033;

            margin-bottom: 20px;
        }

        .week-header p {
            color: #64748b;

            line-height: 1.8;

            font-size: 17px;

            max-width: 800px;
        }

        /* =====================================================
           TÍTULO DE TRABAJOS
           ===================================================== */

        .works-title {
            margin-bottom: 30px;
        }

        .works-title span {
            color: #2563eb;

            font-weight: bold;

            letter-spacing: 3px;

            font-size: 14px;
        }

        .works-title h2 {
            font-size: 35px;

            color: #172033;

            margin-top: 8px;
        }

        /* =====================================================
           GRID
           ===================================================== */

        .works-grid {
            display: grid;

            grid-template-columns:
                    repeat(
                            auto-fit,
                            minmax(280px, 1fr)
                    );

            gap: 25px;
        }

        /* =====================================================
           TARJETA
           ===================================================== */

        .work-card {
            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                    0 10px 30px rgba(15, 23, 42, .06);

            transition: .4s;
        }

        .work-card:hover {
            transform: translateY(-10px);

            box-shadow:
                    0 20px 45px rgba(37, 99, 235, .12);
        }

        /* =====================================================
           IMAGEN
           ===================================================== */

        .work-image {
            width: 100%;

            height: 200px;

            object-fit: cover;

            display: block;
        }

        .no-image {
            width: 100%;

            height: 200px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #f1f5f9;

            color: #94a3b8;

            font-size: 16px;
        }

        /* =====================================================
           CONTENIDO
           ===================================================== */

        .work-content {
            padding: 25px;
        }

        .work-content h3 {
            color: #172033;

            margin-top: 0;

            margin-bottom: 12px;
        }

        .work-content p {
            color: #64748b;

            line-height: 1.6;

            margin-bottom: 20px;

            white-space: pre-line;
        }

        /* =====================================================
           RECURSOS
           ===================================================== */

        .work-resources {
            display: flex;

            flex-wrap: wrap;

            gap: 10px;
        }

        .work-link {
            display: inline-block;

            padding: 10px 18px;

            border-radius: 30px;

            background: #eff6ff;

            color: #2563eb;

            text-decoration: none;

            font-weight: bold;

            transition: .3s;
        }

        .work-link:hover {
            background: #2563eb;

            color: white;
        }

        /* =====================================================
           SIN TRABAJOS
           ===================================================== */

        .no-works {
            background: white;

            padding: 50px;

            border-radius: 25px;

            text-align: center;

            border: 1px solid #e2e8f0;
        }

        .no-works h3 {
            margin-bottom: 10px;
        }

        .no-works p {
            color: #64748b;
        }

        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 700px) {

            .week-detail {
                padding: 110px 20px 60px;
            }

            .week-header {
                padding: 35px 25px;
            }

            .week-header h1 {
                font-size: 32px;
            }

            .week-big-number {
                font-size: 60px;
            }

            .works-title h2 {
                font-size: 28px;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<header class="navbar">

    <div class="logo">

        SEBASTIAN<span>.</span>

    </div>


    <nav>

        <ul class="nav-links">

            <li>
                <a href="${pageContext.request.contextPath}/#inicio">
                    Inicio
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#sobre-mi">
                    Sobre mí
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#habilidades">
                    Habilidades
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#semanas">
                    Semanas
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/#contacto">
                    Contacto
                </a>
            </li>

        </ul>

    </nav>

</header>


<!-- =====================================================
     CONTENIDO
     ===================================================== -->

<section class="week-detail">

    <div class="week-detail-container">


        <!-- =================================================
             VOLVER
             ================================================= -->

        <a href="${pageContext.request.contextPath}/#semanas"
           class="back-button">

            ← Volver a las semanas

        </a>


        <!-- =================================================
             INFORMACIÓN DE LA SEMANA
             ================================================= -->

        <div class="week-header">


            <div class="week-big-number"><c:if test="${semana.numero < 10}">0</c:if>${semana.numero}</div>


            <h1>${semana.titulo}

                Semana 01

            </h1>


            <p>${semana.descripcion}

                Descripción de la semana.

            </p>


        </div>


        <!-- =================================================
             TÍTULO TRABAJOS
             ================================================= -->

        <div class="works-title">

            <span>
                TRABAJOS REALIZADOS
            </span>

            <h2>
                Mi trabajo de esta semana
            </h2>

        </div>


        <!-- =================================================
             TRABAJOS
             ================================================= -->

        <c:if test="${not empty trabajos}">
        <div class="works-grid">


            <!-- =================================================
                 TARJETA
                 ================================================= -->

            <c:forEach items="${trabajos}" var="trabajo">
            <article class="work-card">


                <!-- =================================================
                     IMAGEN
                     ================================================= -->

                <c:if test="${not empty trabajo.imagen}">
                <div>

                    <img
                            class="work-image"

                            src="${pageContext.request.contextPath}/trabajos/imagen/${trabajo.imagen}"

                            alt="${trabajo.titulo}">

                </div>
                </c:if>


                <!-- SIN IMAGEN -->

                <c:if test="${empty trabajo.imagen}">
                <div class="no-image">

                    🖼️ Sin imagen

                </div>
                </c:if>


                <!-- =================================================
                     CONTENIDO
                     ================================================= -->

                <div class="work-content">


                    <!-- TÍTULO -->

                    <h3>${trabajo.titulo}

                        Trabajo

                    </h3>


                    <!-- DESCRIPCIÓN -->

                    <c:if test="${not empty trabajo.descripcion}">
                    <p>${trabajo.descripcion}

                        Descripción del trabajo.

                    </p>
                    </c:if>


                    <!-- =================================================
                         RECURSOS
                         ================================================= -->

                    <div class="work-resources">


                        <!-- ENLACE -->

                        <c:if test="${not empty trabajo.enlace}">
                        <a href="${trabajo.enlace}"

                                target="_blank"

                                rel="noopener noreferrer"

                                class="work-link">

                            🔗 Ver proyecto

                        </a>
                        </c:if>


                        <!-- =================================================
                             ARCHIVO
                             ================================================= -->

                        <c:if test="${not empty trabajo.archivo}">
                        <a href="${pageContext.request.contextPath}/trabajos/archivo/${trabajo.archivo}"

                                target="_blank"

                                rel="noopener noreferrer"

                                class="work-link">

                            📄 Ver archivo

                        </a>
                        </c:if>


                    </div>


                </div>


            </article>
            </c:forEach>


        </div>
        </c:if>


        <!-- =================================================
             SIN TRABAJOS
             ================================================= -->

        <c:if test="${empty trabajos}">
        <div class="no-works">

            <h3>
                📚 Todavía no hay trabajos
            </h3>

            <p>

                Los trabajos de esta semana aparecerán
                aquí cuando sean agregados desde el
                panel administrativo.

            </p>

        </div>
        </c:if>


    </div>

</section>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer>

    <p>

        © 2026

        <span>
            Sebastian Rivas Pizarro
        </span>

        · Diseño y Programación Web

    </p>

</footer>


<!-- JAVASCRIPT -->

<script src="${pageContext.request.contextPath}/js/publico.js"></script>

</body>

</html>
