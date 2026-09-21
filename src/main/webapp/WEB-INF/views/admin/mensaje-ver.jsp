<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Ver mensaje | Panel de Administración</title>


    <style>

        /* =====================================================
           CONTENIDO PRINCIPAL
           ===================================================== */

        .admin-container {
            min-height: 100vh;
        }


        .main-content {

            margin-left: 250px;

            min-height: 100vh;

            padding: 35px;

            background: #f5f7fb;

        }


        /* =====================================================
           CABECERA
           ===================================================== */

        .admin-header {

            margin-bottom: 25px;

        }


        .admin-header h1 {

            margin: 0 0 8px;

            font-size: 30px;

            color: #111827;

        }


        .admin-header p {

            margin: 0;

            color: #6b7280;

            font-size: 15px;

        }


        /* =====================================================
           TARJETA
           ===================================================== */

        .content-card {

            background: white;

            border-radius: 15px;

            padding: 30px;

            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);

        }


        /* =====================================================
           DETALLE DEL MENSAJE
           ===================================================== */

        .message-detail {

            max-width: 900px;

        }


        .detail-item {

            display: flex;

            flex-direction: column;

            gap: 7px;

            padding: 18px 0;

            border-bottom: 1px solid #e5e7eb;

        }


        .detail-label {

            font-size: 12px;

            font-weight: bold;

            color: #6b7280;

            text-transform: uppercase;

            letter-spacing: 0.5px;

        }


        .detail-item strong {

            font-size: 17px;

            color: #111827;

        }


        .detail-item span:not(.detail-label) {

            color: #374151;

            font-size: 15px;

        }


        /* =====================================================
           CORREO
           ===================================================== */

        .detail-item a {

            color: #2563eb;

            text-decoration: none;

            font-size: 15px;

        }


        .detail-item a:hover {

            text-decoration: underline;

        }


        /* =====================================================
           MENSAJE
           ===================================================== */

        .detail-message {

            padding: 22px 0;

        }


        .message-content {

            margin-top: 12px;

            padding: 20px;

            background: #f9fafb;

            border: 1px solid #e5e7eb;

            border-radius: 10px;

            color: #374151;

            line-height: 1.7;

            white-space: pre-wrap;

            min-height: 130px;

        }


        /* =====================================================
           BOTONES
           ===================================================== */

        .detail-actions {

            display: flex;

            gap: 12px;

            margin-top: 20px;

            flex-wrap: wrap;

        }


        .detail-actions .btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            padding: 11px 18px;

            border-radius: 8px;

            text-decoration: none;

            font-weight: 600;

            transition: 0.2s ease;

        }


        /* VOLVER */

        .btn-secondary {

            background: #e5e7eb;

            color: #374151;

        }


        .btn-secondary:hover {

            background: #d1d5db;

        }


        /* RESPONDER */

        .btn-primary {

            background: #2563eb;

            color: white;

        }


        .btn-primary:hover {

            background: #1d4ed8;

        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 700px) {

            .main-content {

                margin-left: 200px;

                padding: 20px;

            }

            .content-card {

                padding: 20px;

            }

            .admin-header h1 {

                font-size: 25px;

            }

        }

    </style>

</head>

<body>

<div class="admin-container">

    <!-- =====================================================
         SIDEBAR ORIGINAL
         ===================================================== -->

    <% request.setAttribute("activePage", "mensajes"); %>
    <%@ include file="../fragments/sidebar.jsp" %>


    <!-- =====================================================
         CONTENIDO PRINCIPAL
         ===================================================== -->

    <main class="main-content">


        <!-- =================================================
             CABECERA
             ================================================= -->

        <header class="admin-header">

            <h1>
                Ver mensaje
            </h1>

            <p>
                Detalles del mensaje recibido
            </p>

        </header>


        <!-- =================================================
             TARJETA
             ================================================= -->

        <section class="content-card">

            <div class="message-detail">


                <!-- =================================================
                     REMITENTE
                     ================================================= -->

                <div class="detail-item">

                <span class="detail-label">
                    Nombre
                </span>

                    <strong>${mensaje.nombre}</strong>

                </div>


                <!-- =================================================
                     CORREO
                     ================================================= -->

                <div class="detail-item">

                <span class="detail-label">
                    Correo electrónico
                </span>

                    <a href="mailto:${mensaje.correo}">${mensaje.correo}</a>

                </div>


                <!-- =================================================
                     ASUNTO
                     ================================================= -->

                <div class="detail-item">

                <span class="detail-label">
                    Asunto
                </span>

                    <strong>${mensaje.asunto}</strong>

                </div>


                <!-- =================================================
                     FECHA
                     ================================================= -->

                <div class="detail-item">

                <span class="detail-label">
                    Fecha
                </span>

                    <c:if test="${not empty mensaje.fecha}"><span>${mensaje.fecha}</span></c:if>

                    <c:if test="${empty mensaje.fecha}"><span>

                    Sin fecha

                </span></c:if>

                </div>


                <!-- =================================================
                     MENSAJE
                     ================================================= -->

                <div class="detail-message">

                <span class="detail-label">
                    Mensaje
                </span>

                    <div class="message-content">${mensaje.mensaje}</div>

                </div>


                <!-- =================================================
                     BOTONES
                     ================================================= -->

                <div class="detail-actions">


                    <!-- VOLVER -->

                    <a href="${pageContext.request.contextPath}/admin/mensajes"
                            class="btn btn-secondary">

                        ← Volver a mensajes

                    </a>


                    <!-- RESPONDER -->

                    <a href="https://mail.google.com/mail/?view=cm&fs=1&to=${mensaje.correo}"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="btn btn-primary">

                        ✉️ Responder por correo

                    </a>

                </div>


            </div>

        </section>


    </main>
</div>

</body>

</html>
