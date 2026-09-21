<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Trabajos | Panel administrativo</title>

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

        .content {
            margin-left: 250px;
            padding: 35px;
            min-height: 100vh;
        }

        .header {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
            color: #111827;
        }

        .header p {
            margin: 8px 0 0;
            color: #6b7280;
            font-size: 15px;
        }

        .weeks-grid {
            display: grid;
            grid-template-columns:
                repeat(auto-fill, minmax(240px, 1fr));

            gap: 20px;
        }

        .week-card {
            display: block;

            background: white;

            padding: 25px;

            border-radius: 12px;

            text-decoration: none;

            border: 1px solid #e5e7eb;

            box-shadow:
                    0 3px 10px rgba(0, 0, 0, 0.06);

            transition:
                    transform 0.2s ease,
                    box-shadow 0.2s ease,
                    border-color 0.2s ease;
        }

        .week-card:hover {
            transform: translateY(-5px);

            border-color: #2563eb;

            box-shadow:
                    0 8px 20px rgba(0, 0, 0, 0.12);
        }

        .week-number {
            display: inline-block;

            background: #2563eb;

            color: white;

            padding: 7px 12px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: bold;

            margin-bottom: 15px;
        }

        .week-card h2 {
            margin: 0 0 10px;

            font-size: 20px;

            color: #111827;
        }

        .week-card p {
            margin: 0;

            color: #6b7280;

            font-size: 14px;

            line-height: 1.5;

            min-height: 42px;
        }

        .view-button {
            display: inline-block;

            margin-top: 18px;

            color: #2563eb;

            font-size: 14px;

            font-weight: bold;
        }

        .empty {
            background: white;

            padding: 40px;

            text-align: center;

            border-radius: 12px;

            color: #6b7280;
        }

        @media (max-width: 700px) {

            .content {
                margin-left: 200px;

                padding: 25px;
            }

            .weeks-grid {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 500px) {

            .content {
                margin-left: 200px;

                padding: 15px;
            }

            .header h1 {
                font-size: 24px;
            }

        }

    </style>

</head>

<body>


<% request.setAttribute("activePage", "trabajos"); %>

<%@ include file="../fragments/sidebar.jsp" %>


<main class="content">


    <section class="header">

        <h1>
            📁 Trabajos
        </h1>

        <p>
            Selecciona una semana para administrar
            los trabajos de tu portafolio.
        </p>

    </section>


    <c:if test="${not empty semanas}">

        <section class="weeks-grid">


            <c:forEach items="${semanas}" var="semana">

                <a
                        href="${pageContext.request.contextPath}/admin/trabajos/semana/${semana.id}"
                        class="week-card">


                    <span class="week-number">
                        Semana ${semana.numero}
                    </span>


                    <h2>
                            ${semana.titulo}
                    </h2>


                    <p>
                            ${semana.descripcion}
                    </p>


                    <span class="view-button">

                        Ver trabajos →

                    </span>


                </a>

            </c:forEach>


        </section>

    </c:if>


    <c:if test="${empty semanas}">

        <section class="empty">

            <h2>
                No hay semanas registradas
            </h2>

            <p>
                Primero debes crear las semanas
                desde el apartado Semanas.
            </p>

        </section>

    </c:if>


</main>

</body>

</html>