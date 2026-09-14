<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Mensajes | Panel de Administración</title>

    <style>

        /* =====================================================
           CONTENEDOR PRINCIPAL
           ===================================================== */

        .admin-container {
            min-height: 100vh;
        }


        /* =====================================================
           CONTENIDO PRINCIPAL
           ===================================================== */

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
            padding: 28px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
        }


        /* =====================================================
           CABECERA DE TARJETA
           ===================================================== */

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .card-header h2 {
            margin: 0 0 6px;
            font-size: 21px;
            color: #111827;
        }

        .card-header p {
            margin: 0;
            color: #6b7280;
            font-size: 14px;
        }


        /* =====================================================
           CONTADOR
           ===================================================== */

        .message-count {
            display: flex;
            align-items: center;
            gap: 7px;
            padding: 10px 15px;
            background: #eff6ff;
            color: #2563eb;
            border-radius: 9px;
            font-weight: bold;
            white-space: nowrap;
        }


        /* =====================================================
           TABLA
           ===================================================== */

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #f9fafb;
        }

        th {
            padding: 14px;
            text-align: left;
            font-size: 13px;
            color: #4b5563;
            border-bottom: 2px solid #e5e7eb;
        }

        td {
            padding: 15px 14px;
            border-bottom: 1px solid #e5e7eb;
            color: #374151;
            font-size: 14px;
        }

        tbody tr:hover {
            background: #f9fafb;
        }

        td strong {
            color: #111827;
        }


        /* =====================================================
           ESTADO DEL MENSAJE
           ===================================================== */

        .mensaje-no-leido {
            background: #eff6ff;
        }

        .mensaje-no-leido td {
            font-weight: 500;
        }

        .mensaje-leido {
            background: white;
        }


        /* =====================================================
           ETIQUETA NUEVO
           ===================================================== */

        .badge-nuevo {
            display: inline-block;
            margin-left: 8px;
            padding: 4px 8px;
            background: #2563eb;
            color: white;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
            vertical-align: middle;
        }


        /* =====================================================
           ETIQUETA LEÍDO
           ===================================================== */

        .badge-leido {
            display: inline-block;
            margin-left: 8px;
            padding: 4px 8px;
            background: #e5e7eb;
            color: #6b7280;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 500;
            vertical-align: middle;
        }


        /* =====================================================
           CORREO
           ===================================================== */

        td a {
            color: #2563eb;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }


        /* =====================================================
           TEXTO DEL MENSAJE
           ===================================================== */

        .mensaje-texto {
            max-width: 280px;
        }

        .mensaje-texto span {
            display: block;
            max-width: 280px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #6b7280;
        }


        /* =====================================================
           ACCIONES
           ===================================================== */

        .acciones {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .acciones form {
            margin: 0;
        }

        .btn-action {
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: 0.2s ease;
        }


        /* =====================================================
           BOTÓN VER
           ===================================================== */

        .btn-view {
            background: #eff6ff;
            color: #2563eb;
        }

        .btn-view:hover {
            background: #2563eb;
            color: white;
        }


        /* =====================================================
           BOTÓN ELIMINAR
           ===================================================== */

        .btn-delete {
            background: #fef2f2;
            color: #dc2626;
        }

        .btn-delete:hover {
            background: #dc2626;
            color: white;
        }


        /* =====================================================
           SIN MENSAJES
           ===================================================== */

        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty-state h3 {
            margin: 0 0 8px;
            color: #111827;
            font-size: 21px;
        }

        .empty-state p {
            max-width: 550px;
            margin: auto;
            color: #6b7280;
            line-height: 1.6;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 900px) {

            .main-content {
                margin-left: 250px;
                padding: 25px;
            }

            .table-container {
                overflow-x: auto;
            }

            table {
                min-width: 900px;
            }
        }


        @media (max-width: 700px) {

            .main-content {
                margin-left: 200px;
                padding: 20px;
            }

            .card-header {
                flex-direction: column;
                align-items: flex-start;
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

            <h1>Mensajes</h1>

            <p>
                Administra los mensajes recibidos desde tu
                portafolio.
            </p>

        </header>


        <!-- =================================================
             TARJETA
             ================================================= -->

        <section class="content-card">


            <!-- =================================================
                 CABECERA DE LA TARJETA
                 ================================================= -->

            <div class="card-header">

                <div>

                    <h2>
                        Mensajes recibidos
                    </h2>

                    <p>
                        Aquí puedes revisar los mensajes
                        enviados por los visitantes.
                    </p>

                </div>


                <!-- =================================================
                     CONTADOR TOTAL
                     ================================================= -->

                <div class="message-count">

                    <span>${empty mensajes ? 0 : mensajes.size()}</span>

                    <span>
                        mensajes
                    </span>

                </div>

            </div>


            <!-- =================================================
                 SIN MENSAJES
                 ================================================= -->

            <c:if test="${empty mensajes}"><div class="empty-state">

                <div class="empty-icon">
                    📭
                </div>

                <h3>
                    No tienes mensajes
                </h3>

                <p>
                    Cuando alguien utilice el formulario
                    de contacto de tu portafolio,
                    el mensaje aparecerá aquí.
                </p>

            </div></c:if>


            <!-- =================================================
                 TABLA
                 ================================================= -->

            <c:if test="${not empty mensajes}"><div class="table-container">

                <table>

                    <thead>

                    <tr>

                        <th>Nombre</th>

                        <th>Correo</th>

                        <th>Asunto</th>

                        <th>Mensaje</th>

                        <th>Fecha</th>

                        <th>Acciones</th>

                    </tr>

                    </thead>


                    <tbody>

                    <c:forEach items="${mensajes}" var="mensaje"><tr class="${mensaje.leido ? 'mensaje-leido' : 'mensaje-no-leido'}">


                        <!-- =================================================
                             NOMBRE
                             ================================================= -->

                        <td>

                            <strong>${mensaje.nombre}</strong>


                            <!-- MENSAJE NUEVO -->

                            <c:if test="${not mensaje.leido}"><span class="badge-nuevo">
                                NUEVO
                            </span></c:if>


                            <!-- MENSAJE LEÍDO -->

                            <c:if test="${mensaje.leido}"><span class="badge-leido">
                                LEÍDO
                            </span></c:if>

                        </td>


                        <!-- =================================================
                             CORREO
                             ================================================= -->

                        <td>

                            <a href="mailto:${mensaje.correo}">${mensaje.correo}</a>

                        </td>


                        <!-- =================================================
                             ASUNTO
                             ================================================= -->

                        <td>

                            <span>${mensaje.asunto}</span>

                        </td>


                        <!-- =================================================
                             MENSAJE
                             ================================================= -->

                        <td class="mensaje-texto">

                            <span>${mensaje.mensaje}</span>

                        </td>


                        <!-- =================================================
                             FECHA
                             ================================================= -->

                        <td>

                            <c:if test="${not empty mensaje.fecha}"><span>${mensaje.fecha}</span></c:if>

                            <c:if test="${empty mensaje.fecha}"><span>
                                Sin fecha
                            </span></c:if>

                        </td>


                        <!-- =================================================
                             ACCIONES
                             ================================================= -->

                        <td>

                            <div class="acciones">


                                <!-- VER -->

                                <a
                                        href="${pageContext.request.contextPath}/admin/mensajes/ver/${mensaje.id}"
                                        class="btn-action btn-view"
                                        title="Ver mensaje"
                                        aria-label="Ver mensaje">

                                    👁️

                                </a>


                                <!-- ELIMINAR -->

                                <form
                                        action="${pageContext.request.contextPath}/admin/mensajes/eliminar/${mensaje.id}"
                                        method="post"
                                        onsubmit="return confirmarEliminacion();">

                                    <button
                                            type="submit"
                                            class="btn-action btn-delete"
                                            title="Eliminar mensaje"
                                            aria-label="Eliminar mensaje">

                                        🗑️

                                    </button>

                                </form>

                            </div>

                        </td>

                    </tr></c:forEach>

                    </tbody>

                </table>

            </div></c:if>

        </section>

    </main>

</div>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script>

    function confirmarEliminacion() {

        return confirm(
            "¿Estás seguro de que deseas eliminar este mensaje?"
        );

    }

</script>

</body>

</html>
