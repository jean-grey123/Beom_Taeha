<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Perfil | Portafolio</title>

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

        .fila {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
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
            min-height: 130px;
            resize: vertical;
        }

        .campo small {
            display: block;
            margin-top: 6px;
            color: #6b7280;
        }

        .foto-box {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            padding: 20px;
            border-radius: 10px;
        }

        .foto-actual {
            margin-top: 20px;
        }

        .foto-actual p {
            margin-bottom: 12px;
        }

        .profile-preview {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid #2563eb;
            display: block;
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
            text-decoration: none;
        }

        .btn-cancelar:hover {
            background: #4b5563;
        }

        @media (max-width: 800px) {

            .content {
                margin-left: 200px;
                padding: 20px;
            }

            .fila {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .content {
                margin-left: 0;
                padding: 15px;
            }
        }

    </style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
     ===================================================== -->

<% request.setAttribute("activePage", "perfil"); %>
<%@ include file="../fragments/sidebar.jsp" %>



<!-- =====================================================
     CONTENIDO
     ===================================================== -->

<main class="content">


    <!-- =================================================
         ENCABEZADO
         ================================================= -->

    <div class="header">

        <h1>👤 Mi perfil</h1>

        <p>
            Administra la información personal que aparecerá
            en tu portafolio.
        </p>

    </div>



    <!-- =================================================
         FORMULARIO
         ================================================= -->

    <div class="form-container">


        <form
                action="${pageContext.request.contextPath}/admin/perfil/guardar"
                method="post"
                enctype="multipart/form-data">


            <!-- =================================================
                 ID DEL PERFIL
                 ================================================= -->

            <input
                    type="hidden"
                    name="id"
                    value="${perfil.id}">



            <!-- =================================================
                 INFORMACIÓN PERSONAL
                 ================================================= -->

            <div class="seccion">

                <h2>📋 Información personal</h2>


                <div class="fila">


                    <!-- NOMBRES -->

                    <div class="campo">

                        <label for="nombre">
                            Nombres
                        </label>

                        <input
                                type="text"
                                id="nombre"
                                name="nombre"
                                value="${perfil.nombre}"
                                placeholder="Ejemplo: Sebastian"
                                required>

                    </div>



                    <!-- APELLIDOS -->

                    <div class="campo">

                        <label for="apellidos">
                            Apellidos
                        </label>

                        <input
                                type="text"
                                id="apellidos"
                                name="apellidos"
                                value="${perfil.apellidos}"
                                placeholder="Ejemplo: Rivas Pizarro"
                                required>

                    </div>

                </div>



                <div class="fila">


                    <!-- CARRERA -->

                    <div class="campo">

                        <label for="carrera">
                            Carrera
                        </label>

                        <input
                                type="text"
                                id="carrera"
                                name="carrera"
                                value="${perfil.carrera}"
                                placeholder="Diseño y Programación Web"
                                required>

                    </div>



                    <!-- INSTITUTO -->

                    <div class="campo">

                        <label for="instituto">
                            Instituto
                        </label>

                        <input
                                type="text"
                                id="instituto"
                                name="instituto"
                                value="${perfil.instituto}"
                                placeholder="Instituto Andrés Avelino Cáceres Dorregaray"
                                required>

                    </div>

                </div>

            </div>



            <!-- =================================================
                 PRESENTACIÓN
                 ================================================= -->

            <div class="seccion">

                <h2>✍️ Presentación</h2>


                <!-- DESCRIPCIÓN -->

                <div class="campo">

                    <label for="descripcion">
                        Descripción corta
                    </label>

                    <textarea
                            id="descripcion"
                            name="descripcion"
                            placeholder="Escribe una breve presentación sobre ti..."
                            required></textarea>

                </div>



                <!-- SOBRE MÍ -->

                <div class="campo">

                    <label for="sobreMi">
                        Sobre mí
                    </label>

                    <textarea
                            id="sobreMi"
                            name="sobreMi"
                            placeholder="Cuéntanos más sobre ti, tus intereses, objetivos y experiencia..."></textarea>

                </div>

            </div>



            <!-- =================================================
                 CONTACTO
                 ================================================= -->

            <div class="seccion">

                <h2>📞 Información de contacto</h2>


                <div class="fila">


                    <!-- CORREO -->

                    <div class="campo">

                        <label for="correo">
                            Correo electrónico
                        </label>

                        <input
                                type="email"
                                id="correo"
                                name="correo"
                                value="${perfil.correo}"
                                placeholder="correo@ejemplo.com">

                    </div>



                    <!-- TELÉFONO -->

                    <div class="campo">

                        <label for="telefono">
                            Teléfono
                        </label>

                        <input
                                type="text"
                                id="telefono"
                                name="telefono"
                                value="${perfil.telefono}"
                                placeholder="+51 999 999 999">

                    </div>

                </div>

            </div>



            <!-- =================================================
                 REDES PROFESIONALES
                 ================================================= -->

            <div class="seccion">

                <h2>🌐 Redes profesionales</h2>


                <div class="fila">


                    <!-- GITHUB -->

                    <div class="campo">

                        <label for="github">
                            GitHub
                        </label>

                        <input
                                type="url"
                                id="github"
                                name="github"
                                value="${perfil.github}"
                                placeholder="https://github.com/usuario">

                    </div>



                    <!-- LINKEDIN -->

                    <div class="campo">

                        <label for="linkedin">
                            LinkedIn
                        </label>

                        <input
                                type="url"
                                id="linkedin"
                                name="linkedin"
                                value="${perfil.linkedin}"
                                placeholder="https://linkedin.com/in/usuario">

                    </div>

                </div>

            </div>



            <!-- =================================================
                 FOTO DE PERFIL
                 ================================================= -->

            <div class="seccion">

                <h2>🖼️ Foto de perfil</h2>


                <div class="foto-box">


                    <!-- SELECCIONAR FOTO -->

                    <div class="campo">

                        <label for="archivoFoto">
                            Seleccionar foto
                        </label>

                        <input
                                type="file"
                                id="archivoFoto"
                                name="archivoFoto"
                                accept="image/jpeg,image/png,image/gif,image/webp">

                        <small>
                            Selecciona una imagen desde tu computadora.
                            Formatos permitidos: JPG, PNG, GIF o WEBP.
                        </small>

                    </div>



                    <!-- =================================================
                         FOTO ACTUAL
                         ================================================= -->

                    <c:if test="${not empty perfil.foto}">
                    <div class="foto-actual">

                        <p>
                            <strong>Foto actual:</strong>
                        </p>


                        <img
                                class="profile-preview"

                                src="${pageContext.request.contextPath}/publico/imagen/${perfil.foto}"

                                alt="${perfil.nombre} ${perfil.apellidos}">

                    </div>
                    </c:if>


                </div>

            </div>F



            <!-- =================================================
                 BOTONES
                 ================================================= -->

            <div class="botones">


                <!-- GUARDAR -->

                <button
                        type="submit"
                        class="btn btn-guardar">

                    💾 Guardar cambios

                </button>



                <!-- CANCELAR -->

                <a
                        href="/admin"
                        class="btn btn-cancelar">

                    ← Cancelar

                </a>


            </div>


        </form>

    </div>

</main>



</body>

</html>
