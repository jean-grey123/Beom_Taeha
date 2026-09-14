<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        Trabajo
    </title>

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

        .form-container {
            max-width: 900px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .seccion {
            margin-bottom: 30px;
        }

        .seccion h2 {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e5e7eb;
            color: #2563eb;
        }

        .campo {
            margin-bottom: 20px;
        }

        .campo label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #374151;
        }

        .campo input,
        .campo textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            font-size: 15px;
            outline: none;
        }

        .campo input:focus,
        .campo textarea:focus {
            border-color: #2563eb;
        }

        .campo textarea {
            min-height: 150px;
            resize: vertical;
        }

        .campo small {
            display: block;
            margin-top: 7px;
            color: #6b7280;
        }

        .semana-info {
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            padding: 18px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .semana-info strong {
            color: #1d4ed8;
        }

        .archivo-box {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            padding: 20px;
            border-radius: 10px;
        }

        .imagen-actual {
            margin-top: 20px;
        }

        .imagen-actual img {
            width: 250px;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            display: block;
        }

        .archivo-actual {
            margin-top: 15px;
            padding: 12px;
            background: #e5e7eb;
            border-radius: 8px;
        }

        .archivo-actual a {
            color: #2563eb;
            font-weight: bold;
            text-decoration: none;
        }

        .botones {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .btn {
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
            text-decoration: none;
        }

        .btn-guardar {
            background: #2563eb;
            color: white;
        }

        .btn-guardar:hover {
            background: #1d4ed8;
        }

        .btn-cancelar {
            background: #6b7280;
            color: white;
        }

        .btn-cancelar:hover {
            background: #4b5563;
        }

        @media (max-width: 800px) {

            .content {
                margin-left: 200px;
                padding: 20px;
            }

        }

        @media (max-width: 600px) {

            .content {
                margin-left: 0;
                padding: 15px;
            }

            .form-container {
                padding: 20px;
            }

            .botones {
                flex-direction: column;
            }

            .btn {
                text-align: center;
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


    <!-- =================================================
         ENCABEZADO
         ================================================= -->

    <div class="header">

        <h1>
            Nuevo trabajo
        </h1>

        <p>
            Agrega el trabajo realizado durante esta semana.
        </p>

    </div>



    <!-- =================================================
         INFORMACIÓN DE LA SEMANA
         ================================================= -->

    <div class="semana-info">

        <strong>
            📚 Semana
            <span>${semana.numero}</span>
        </strong>

        <br>

        <span>${semana.titulo}</span>

    </div>



    <!-- =================================================
         FORMULARIO
         ================================================= -->

    <div class="form-container">

        <form
                action="${pageContext.request.contextPath}/admin/trabajos/guardar"
                method="post"
                enctype="multipart/form-data">


            <!-- =================================================
                 ID
                 ================================================= -->

            <input
                    type="hidden"
                    name="id"
                    value="${trabajo.id}">


            <!-- =================================================
                 SEMANA
                 ================================================= -->

            <input
                    type="hidden"
                    name="semana.id"
                    value="${semana.id}">



            <!-- =================================================
                 INFORMACIÓN DEL TRABAJO
                 ================================================= -->

            <div class="seccion">

                <h2>📋 Información del trabajo</h2>


                <!-- TÍTULO -->

                <div class="campo">

                    <label for="titulo">
                        Título del trabajo
                    </label>

                    <input
                            type="text"
                            id="titulo"
                            name="titulo"
                            value="${trabajo.titulo}"
                            placeholder="Ejemplo: Página web responsive"
                            required>

                </div>



                <!-- DESCRIPCIÓN -->

                <div class="campo">

                    <label for="descripcion">
                        Descripción
                    </label>

                    <textarea
                            id="descripcion"
                            name="descripcion"
                            placeholder="Describe el trabajo realizado..."></textarea>

                    <small>
                        Explica brevemente qué realizaste,
                        qué herramientas utilizaste y cuál fue
                        el resultado.
                    </small>

                </div>



                <!-- ENLACE -->

                <div class="campo">

                    <label for="enlace">
                        🔗 Enlace del trabajo
                    </label>

                    <input
                            type="url"
                            id="enlace"
                            name="enlace"
                            value="${trabajo.enlace}"
                            placeholder="https://github.com/usuario/proyecto">

                    <small>
                        Puedes colocar GitHub, GitHub Pages,
                        Netlify, Vercel u otra página.
                    </small>

                </div>

            </div>



            <!-- =================================================
                 IMAGEN
                 ================================================= -->

            <div class="seccion">

                <h2>🖼️ Imagen del trabajo</h2>


                <div class="archivo-box">

                    <div class="campo">

                        <label for="imagenArchivo">
                            Seleccionar imagen
                        </label>

                        <input
                                type="file"
                                id="imagenArchivo"
                                name="imagenArchivo"
                                accept="image/jpeg,image/png,image/gif,image/webp">

                        <small>
                            Formatos permitidos:
                            JPG, PNG, GIF y WEBP.
                        </small>

                    </div>



                    <!-- IMAGEN ACTUAL -->

                    <c:if test="${not empty trabajo.imagen}"><div class="imagen-actual">

                        <p>
                            <strong>
                                Imagen actual:
                            </strong>
                        </p>

                        <img
                                src="${pageContext.request.contextPath}/admin/trabajos/imagen/${trabajo.imagen}"
                                alt="Imagen actual del trabajo">

                    </div></c:if>

                </div>

            </div>



            <!-- =================================================
                 ARCHIVO
                 ================================================= -->

            <div class="seccion">

                <h2>📎 Archivo del trabajo</h2>


                <div class="archivo-box">

                    <div class="campo">

                        <label for="archivoTrabajo">
                            Seleccionar archivo
                        </label>

                        <input
                                type="file"
                                id="archivoTrabajo"
                                name="archivoTrabajo">

                        <small>
                            Puedes subir documentos,
                            archivos ZIP, PDF u otros archivos
                            relacionados con tu trabajo.
                        </small>

                    </div>



                    <!-- ARCHIVO ACTUAL -->

                    <c:if test="${not empty trabajo.archivo}"><div class="archivo-actual">

                        📎 <strong>Archivo actual:</strong>

                        <a
                                href="${pageContext.request.contextPath}/admin/trabajos/archivo/${trabajo.archivo}"
                                target="_blank">

                            Ver archivo

                        </a>

                    </div></c:if>

                </div>

            </div>



            <!-- =================================================
                 BOTONES
                 ================================================= -->

            <div class="botones">


                <!-- GUARDAR -->

                <button
                        type="submit"
                        class="btn btn-guardar">

                    💾
                    <span>${nuevo ? 'Guardar trabajo' : 'Actualizar trabajo'}</span>

                </button>



                <!-- CANCELAR -->

                <a
                        class="btn btn-cancelar"
                        href="${pageContext.request.contextPath}/admin/trabajos/semana/${semana.id}">

                    ← Cancelar

                </a>

            </div>


        </form>

    </div>

</main>


</body>

</html>
