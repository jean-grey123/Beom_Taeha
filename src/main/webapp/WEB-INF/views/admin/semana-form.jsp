<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <title>${empty semana.id ? 'Nueva semana' : 'Editar semana'}</title>

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
            margin-bottom: 30px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            color: #6b7280;
        }

        .form-container {
            background: white;
            max-width: 800px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 22px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            font-family: Arial, sans-serif;
        }

        input:focus,
        textarea:focus {
            outline: none;
            border-color: #2563eb;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        .botones {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .btn-guardar {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
        }

        .btn-guardar:hover {
            background: #1d4ed8;
        }

        .btn-cancelar {
            background: #6b7280;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
        }

        .btn-cancelar:hover {
            background: #4b5563;
        }

    </style>

</head>

<body>

<!-- SIDEBAR -->

<% request.setAttribute("activePage", "semanas"); %>
<%@ include file="../fragments/sidebar.jsp" %>


<!-- CONTENIDO -->

<main class="content">

    <div class="header">

        <h1>${empty semana.id ? 'Nueva semana' : 'Editar semana'}</h1>

        <p>
            Completa la información de la semana académica.
        </p>

    </div>


    <div class="form-container">

        <form
                action="${pageContext.request.contextPath}/admin/semanas/guardar"
                method="post">


            <!-- NÚMERO -->

            <div class="form-group">

                <label for="numero">
                    Número de semana
                </label>

                <input
                        type="number"
                        id="numero"
                        name="numero"
                        value="${semana.numero}"
                        min="1"
                        max="16"
                        required>

            </div>


            <!-- TÍTULO -->

            <div class="form-group">

                <label for="titulo">
                    Título
                </label>

                <input
                        type="text"
                        id="titulo"
                        name="titulo"
                        value="${semana.titulo}"
                        placeholder="Ejemplo: Introducción al desarrollo web"
                        required>

            </div>


            <!-- DESCRIPCIÓN -->

            <div class="form-group">

                <label for="descripcion">
                    Descripción
                </label>

                <textarea
                        id="descripcion"
                        name="descripcion"
                        placeholder="Escribe una descripción de lo trabajado durante esta semana..."
                        required>
                </textarea>

            </div>


            <!-- BOTONES -->

            <div class="botones">

                <button
                        type="submit"
                        class="btn-guardar">

                    💾 Guardar semana

                </button>

                <a
                        href="${pageContext.request.contextPath}/admin/semanas"
                        class="btn-cancelar">

                    ↩ Cancelar

                </a>

            </div>

        </form>

    </div>

</main>

</body>

</html>
