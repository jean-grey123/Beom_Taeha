
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Trabajos | Portafolio</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            color: #111827;
        }

        /* =====================================================
           CONTENIDO
           ===================================================== */

        .content {
            margin-left: 270px;
            padding: 35px;
            min-height: 100vh;
        }

        /* =====================================================
           ENCABEZADO
           ===================================================== */

        .header {
            margin-bottom: 25px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            color: #6b7280;
            margin-top: 8px;
        }

        /* =====================================================
           BOTONES SUPERIORES
           ===================================================== */

        .acciones {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            transition: 0.2s ease;
        }

        .btn-nuevo {
            background: #2563eb;
            color: white;
        }

        .btn-nuevo:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .btn-volver {
            background: #6b7280;
            color: white;
        }

        .btn-volver:hover {
            background: #4b5563;
        }

        /* =====================================================
           CONTENEDOR DE TRABAJOS
           ===================================================== */

        .trabajos-container {
            display: grid;
            grid-template-columns: repeat(
                    auto-fill,
                    minmax(300px, 1fr)
            );
            gap: 25px;
        }

        /* =====================================================
           TARJETA
           ===================================================== */

        .trabajo-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            transition: 0.2s ease;
        }

        .trabajo-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }

        /* =====================================================
           IMAGEN
           ===================================================== */

        .imagen-trabajo {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .sin-imagen {
            width: 100%;
            height: 200px;
            background: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6b7280;
            font-size: 16px;
        }

        /* =====================================================
           INFORMACIÓN
           ===================================================== */

        .trabajo-body {
            padding: 20px;
        }

        .trabajo-body h2 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 21px;
        }

        .descripcion {
            color: #6b7280;
            line-height: 1.5;
            white-space: pre-line;
        }

        /* =====================================================
           RECURSOS
           ===================================================== */

        .recursos {
            margin-top: 15px;
        }

        .recursos a {
            display: block;
            margin-bottom: 8px;
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .recursos a:hover {
            text-decoration: underline;
        }

        /* =====================================================
           ACCIONES DE TARJETA
           ===================================================== */

        .acciones-card {
            display: flex;
            gap: 8px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .btn-editar {
            background: #f59e0b;
            color: white;
        }

        .btn-editar:hover {
            background: #d97706;
        }

        .btn-eliminar {
            background: #dc2626;
            color: white;
        }

        .btn-eliminar:hover {
            background: #b91c1c;
        }

        /* =====================================================
           SIN TRABAJOS
           ===================================================== */

        .vacio {
            background: white;
            padding: 45px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .vacio h2 {
            margin-top: 0;
        }

        .vacio p {
            color: #6b7280;
            margin-bottom: 25px;
        }

        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 1000px) {

            .content {
                margin-left: 270px;
                padding: 25px;
            }

            .trabajos-container {
                grid-template-columns: repeat(
                        auto-fill,
                        minmax(260px, 1fr)
                );
            }
        }

        @media (max-width: 700px) {

            .content {
                margin-left: 0;
                padding: 20px;
            }

            .trabajos-container {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 25px;
            }
        }

        @media (max-width: 500px) {

            .content {
                padding: 15px;
            }

            .acciones {
                flex-direction: column;
            }

            .acciones .btn {
                width: 100%;
                text-align: center;
            }

            .acciones-card .btn {
                flex: 1;
                text-align: center;
            }

            .vacio {
                padding: 30px 20px;
            }
        }

    </style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
     ===================================================== -->

<% request.setAttribute("activePage", "trabajos"); %>

<%@ include file="../fragments/sidebar.jsp" %>


<!-- =====================================================
     CONTENIDO
     ===================================================== -->

<main class="content">


    <!-- =====================================================
         ENCABEZADO
         ===================================================== -->

    <div class="header">

        <h1>

            💼 Trabajos - Semana

            <span>${semana.numero}</span>

        </h1>

        <p>${semana.titulo}</p>

    </div>


    <!-- =====================================================
         BOTONES
         ===================================================== -->

    <div class="acciones">

        <a
                class="btn btn-nuevo"
                href="${pageContext.request.contextPath}/admin/trabajos/nuevo/${semana.id}">

            ➕ Nuevo trabajo

        </a>


        <a
                class="btn btn-volver"
                href="${pageContext.request.contextPath}/admin/semanas">

            ← Volver a semanas

        </a>

    </div>


    <!-- =====================================================
         SIN TRABAJOS
         ===================================================== -->

    <c:if test="${empty trabajos}">

        <div class="vacio">

            <h2>
                📂 No hay trabajos todavía
            </h2>

            <p>
                Esta semana todavía no tiene trabajos registrados.
            </p>

            <a
                    class="btn btn-nuevo"
                    href="${pageContext.request.contextPath}/admin/trabajos/nuevo/${semana.id}">

                ➕ Agregar primer trabajo

            </a>

        </div>

    </c:if>


    <!-- =====================================================
         LISTA DE TRABAJOS
         ===================================================== -->

    <c:if test="${not empty trabajos}">

        <div class="trabajos-container">


            <c:forEach items="${trabajos}" var="trabajo">

                <div class="trabajo-card">


                    <!-- =================================================
                         IMAGEN DEL TRABAJO
                         ================================================= -->

                    <c:if test="${not empty trabajo.imagen}">

                        <div>

                            <c:choose>

                                <c:when test="${fn:startsWith(trabajo.imagen, 'http')}">

                                    <img
                                            class="imagen-trabajo"
                                            src="${trabajo.imagen}"
                                            alt="${trabajo.titulo}">

                                </c:when>

                                <c:otherwise>

                                    <img
                                            class="imagen-trabajo"
                                            src="${pageContext.request.contextPath}/trabajos/imagen/${trabajo.imagen}"
                                            alt="${trabajo.titulo}">

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </c:if>


                    <!-- SIN IMAGEN -->

                    <c:if test="${empty trabajo.imagen}">

                        <div class="sin-imagen">

                            🖼️ Sin imagen

                        </div>

                    </c:if>


                    <!-- =================================================
                         INFORMACIÓN
                         ================================================= -->

                    <div class="trabajo-body">


                        <h2>${trabajo.titulo}</h2>


                        <c:if test="${not empty trabajo.descripcion}">

                            <p class="descripcion">
                                    ${trabajo.descripcion}
                            </p>

                        </c:if>


                        <!-- =================================================
                             RECURSOS
                             ================================================= -->

                        <div class="recursos">


                            <c:if test="${not empty trabajo.enlace}">

                                <a
                                        href="${trabajo.enlace}"
                                        target="_blank"
                                        rel="noopener noreferrer">

                                    🔗 Ver enlace

                                </a>

                            </c:if>


                            <c:if test="${not empty trabajo.archivo}">

                                <a
                                        href="${pageContext.request.contextPath}/trabajos/archivo/${trabajo.archivo}"
                                        target="_blank"
                                        rel="noopener noreferrer">

                                    📎 Ver archivo

                                </a>

                            </c:if>


                        </div>


                        <!-- =================================================
                             ACCIONES
                             ================================================= -->

                        <div class="acciones-card">


                            <a
                                    class="btn btn-editar"
                                    href="${pageContext.request.contextPath}/admin/trabajos/editar/${trabajo.id}">

                                ✏️ Editar

                            </a>


                            <a
                                    class="btn btn-eliminar"
                                    href="${pageContext.request.contextPath}/admin/trabajos/eliminar/${trabajo.id}"
                                    onclick="return confirm('¿Seguro que deseas eliminar este trabajo?');">

                                🗑️ Eliminar

                            </a>


                        </div>


                    </div>

                </div>

            </c:forEach>


        </div>

    </c:if>


</main>


</body>

</html>

