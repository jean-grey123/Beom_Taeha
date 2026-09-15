
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="Acceso seguro al panel administrativo">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Acceso | Panel Administrativo</title>


    <style>

        /* =========================================================
           VARIABLES
        ========================================================= */

        :root {

            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --primary-light: #60a5fa;

            --secondary: #38bdf8;

            --background: #f1f7ff;
            --background-light: #ffffff;

            --card: #ffffff;

            --text: #172033;
            --text-dark: #0f172a;
            --text-secondary: #64748b;
            --text-light: #94a3b8;

            --border: #e2e8f0;
            --border-light: #edf2f7;

            --input-background: #f8fafc;

            --danger: #dc2626;
            --danger-background: #fef2f2;

            --success: #16a34a;
            --success-background: #f0fdf4;

        }


        /* =========================================================
           RESET
        ========================================================= */

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

        }


        /* =========================================================
           BODY
        ========================================================= */

        body {

            min-height: 100vh;

            padding: 25px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-family:
                    "Segoe UI",
                    Arial,
                    Helvetica,
                    sans-serif;

            color: var(--text);

            background:

                    radial-gradient(
                            circle at 5% 10%,
                            rgba(96,165,250,0.20),
                            transparent 25%
                    ),

                    radial-gradient(
                            circle at 95% 90%,
                            rgba(56,189,248,0.18),
                            transparent 28%
                    ),

                    linear-gradient(
                            135deg,
                            #eef6ff,
                            #f8fbff
                    );

            overflow-x: hidden;

        }


        /* =========================================================
           FONDO DECORATIVO
        ========================================================= */

        .background-grid {

            position: fixed;

            inset: 0;

            pointer-events: none;

            opacity: 0.45;

            background-image:

                    linear-gradient(
                            rgba(37,99,235,0.035) 1px,
                            transparent 1px
                    ),

                    linear-gradient(
                            90deg,
                            rgba(37,99,235,0.035) 1px,
                            transparent 1px
                    );

            background-size: 40px 40px;

        }


        .background-circle {

            position: fixed;

            border-radius: 50%;

            pointer-events: none;

        }


        .circle-one {

            width: 420px;

            height: 420px;

            top: -250px;

            left: -200px;

            border:
                    1px solid
                    rgba(37,99,235,0.10);

            background:
                    rgba(96,165,250,0.04);

        }


        .circle-two {

            width: 380px;

            height: 380px;

            right: -200px;

            bottom: -210px;

            border:
                    1px solid
                    rgba(56,189,248,0.12);

            background:
                    rgba(56,189,248,0.05);

        }


        /* =========================================================
           CONTENEDOR PRINCIPAL
        ========================================================= */

        .login-container {

            position: relative;

            width: 100%;

            max-width: 980px;

            min-height: 590px;

            display: grid;

            grid-template-columns: 0.9fr 1.1fr;

            overflow: hidden;

            background:
                    rgba(255,255,255,0.94);

            border:
                    1px solid
                    rgba(148,163,184,0.20);

            border-radius: 28px;

            box-shadow:

                    0 30px 80px
                    rgba(30,64,175,0.12),

                    0 8px 25px
                    rgba(15,23,42,0.05);

            animation:
                    containerAppear 0.6s ease;

        }


        @keyframes containerAppear {

            from {

                opacity: 0;

                transform:
                        translateY(25px)
                        scale(0.98);

            }

            to {

                opacity: 1;

                transform:
                        translateY(0)
                        scale(1);

            }

        }


        /* =========================================================
           PANEL IZQUIERDO
        ========================================================= */

        .brand-panel {

            position: relative;

            padding: 50px;

            display: flex;

            flex-direction: column;

            justify-content: space-between;

            overflow: hidden;

            background:

                    linear-gradient(
                            145deg,
                            #eff8ff,
                            #e0f2fe
                    );

            border-right:
                    1px solid
                    #dbeafe;

        }


        .brand-panel::before {

            content: "";

            position: absolute;

            width: 320px;

            height: 320px;

            right: -170px;

            top: -130px;

            border-radius: 50%;

            background:
                    rgba(96,165,250,0.10);

            border:
                    1px solid
                    rgba(37,99,235,0.08);

        }


        .brand-panel::after {

            content: "";

            position: absolute;

            width: 220px;

            height: 220px;

            left: -130px;

            bottom: -130px;

            border-radius: 50%;

            background:
                    rgba(56,189,248,0.08);

            border:
                    1px solid
                    rgba(56,189,248,0.10);

        }


        .brand-content {

            position: relative;

            z-index: 2;

        }


        /* =========================================================
           LOGO
        ========================================================= */

        .brand-logo {

            width: 62px;

            height: 62px;

            margin-bottom: 30px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 18px;

            background:

                    linear-gradient(
                            135deg,
                            #2563eb,
                            #38bdf8
                    );

            color: white;

            font-size: 24px;

            font-weight: 900;

            box-shadow:

                    0 14px 30px
                    rgba(37,99,235,0.20);

        }


        /* =========================================================
           TITULO IZQUIERDO
        ========================================================= */

        .brand-title {

            max-width: 330px;

            color:
                    var(--text-dark);

            font-size: 39px;

            line-height: 1.08;

            letter-spacing: -1.5px;

            font-weight: 800;

        }


        .brand-title span {

            color:
                    var(--primary);

        }


        .brand-description {

            max-width: 340px;

            margin-top: 20px;

            color:
                    var(--text-secondary);

            font-size: 14px;

            line-height: 1.8;

        }


        /* =========================================================
           CARACTERÍSTICAS
        ========================================================= */

        .security-list {

            position: relative;

            z-index: 2;

            display: flex;

            flex-direction: column;

            gap: 13px;

        }


        .security-item {

            display: flex;

            align-items: center;

            gap: 11px;

            color:
                    #475569;

            font-size: 12px;

            font-weight: 500;

        }


        .security-icon {

            width: 27px;

            height: 27px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 8px;

            color:
                    var(--primary);

            background:
                    rgba(37,99,235,0.08);

            border:
                    1px solid
                    rgba(37,99,235,0.10);

            font-weight: bold;

        }


        /* =========================================================
           PANEL LOGIN
        ========================================================= */

        .login-panel {

            padding: 55px;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                    #ffffff;

        }


        .login-content {

            width: 100%;

            max-width: 390px;

        }


        /* =========================================================
           CABECERA LOGIN
        ========================================================= */

        .login-heading {

            margin-bottom: 30px;

        }


        .login-heading small {

            display: inline-block;

            margin-bottom: 10px;

            color:
                    var(--primary);

            font-size: 11px;

            font-weight: 800;

            letter-spacing: 1.5px;

            text-transform: uppercase;

        }


        .login-heading h1 {

            color:
                    var(--text-dark);

            font-size: 30px;

            font-weight: 800;

            letter-spacing: -0.8px;

        }


        .login-heading p {

            margin-top: 8px;

            color:
                    var(--text-secondary);

            font-size: 13px;

            line-height: 1.6;

        }


        /* =========================================================
           NOTIFICACIONES
        ========================================================= */

        .notification {

            display: flex;

            align-items: center;

            gap: 11px;

            margin-bottom: 20px;

            padding: 13px 14px;

            border-radius: 12px;

            font-size: 12px;

            animation:
                    notificationIn 0.3s ease;

        }


        @keyframes notificationIn {

            from {

                opacity: 0;

                transform:
                        translateY(-7px);

            }

            to {

                opacity: 1;

                transform:
                        translateY(0);

            }

        }


        .notification.hide {

            animation:
                    notificationOut
                    0.3s ease
                    forwards;

        }


        @keyframes notificationOut {

            from {

                opacity: 1;

                transform:
                        translateY(0);

            }

            to {

                opacity: 0;

                transform:
                        translateY(-7px);

            }

        }


        .notification-icon {

            width: 28px;

            height: 28px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 8px;

            font-weight: 800;

        }


        .notification.error {

            color:
                    #991b1b;

            background:
                    var(--danger-background);

            border:
                    1px solid
                    #fecaca;

        }


        .notification.error
        .notification-icon {

            color:
                    var(--danger);

            background:
                    #fee2e2;

        }


        .notification.success {

            color:
                    #166534;

            background:
                    var(--success-background);

            border:
                    1px solid
                    #bbf7d0;

        }


        .notification.success
        .notification-icon {

            color:
                    var(--success);

            background:
                    #dcfce7;

        }


        /* =========================================================
           FORMULARIO
        ========================================================= */

        .form-group {

            margin-bottom: 19px;

        }


        .form-label {

            display: block;

            margin-bottom: 8px;

            color:
                    #334155;

            font-size: 12px;

            font-weight: 700;

        }


        /* =========================================================
           INPUT
        ========================================================= */

        .input-wrapper {

            position: relative;

        }


        .input-icon {

            position: absolute;

            left: 15px;

            top: 50%;

            transform:
                    translateY(-50%);

            color:
                    #94a3b8;

            font-size: 15px;

            pointer-events: none;

            transition:
                    color 0.2s ease;

        }


        input {

            width: 100%;

            height: 52px;

            padding:
                    0 48px 0 43px;

            border:
                    1px solid
                    #dbe3ec;

            border-radius: 12px;

            outline: none;

            background:
                    var(--input-background);

            color:
                    var(--text-dark);

            font-size: 13px;

            transition:

                    border-color 0.2s ease,

                    box-shadow 0.2s ease,

                    background 0.2s ease;

        }


        input:hover {

            border-color:
                    #bfdbfe;

            background:
                    #ffffff;

        }


        input:focus {

            border-color:
                    var(--primary);

            background:
                    #ffffff;

            box-shadow:
                    0 0 0 3px
                    rgba(37,99,235,0.10);

        }


        .input-wrapper:focus-within
        .input-icon {

            color:
                    var(--primary);

        }


        input::placeholder {

            color:
                    #94a3b8;

        }


        /* =========================================================
           BOTÓN MOSTRAR CONTRASEÑA
        ========================================================= */

        .toggle-password {

            position: absolute;

            right: 7px;

            top: 50%;

            transform:
                    translateY(-50%);

            width: 38px;

            height: 38px;

            display: flex;

            align-items: center;

            justify-content: center;

            border: none;

            border-radius: 9px;

            background:
                    transparent;

            color:
                    #94a3b8;

            cursor: pointer;

            font-size: 15px;

            transition:

                    color 0.2s ease,

                    background 0.2s ease;

        }


        .toggle-password:hover {

            color:
                    var(--primary);

            background:
                    #eff6ff;

        }


        /* =========================================================
           BOTÓN LOGIN
        ========================================================= */

        .login-button {

            width: 100%;

            height: 53px;

            margin-top: 7px;

            border: none;

            border-radius: 12px;

            background:

                    linear-gradient(
                            135deg,
                            #2563eb,
                            #0ea5e9
                    );

            color:
                    #ffffff;

            font-size: 13px;

            font-weight: 800;

            letter-spacing: 0.2px;

            cursor: pointer;

            box-shadow:

                    0 12px 25px
                    rgba(37,99,235,0.20);

            transition:

                    transform 0.2s ease,

                    box-shadow 0.2s ease,

                    filter 0.2s ease;

        }


        .login-button:hover {

            transform:
                    translateY(-2px);

            filter:
                    brightness(1.04);

            box-shadow:

                    0 17px 32px
                    rgba(37,99,235,0.25);

        }


        .login-button:active {

            transform:
                    translateY(0);

        }


        .login-button:disabled {

            cursor:
                    not-allowed;

            opacity:
                    0.65;

            transform:
                    none;

        }


        .button-content {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 9px;

        }


        .button-arrow {

            font-size: 17px;

            transition:
                    transform 0.2s ease;

        }


        .login-button:hover
        .button-arrow {

            transform:
                    translateX(4px);

        }


        /* =========================================================
           LOADING
        ========================================================= */

        .loading {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

        }


        .spinner {

            width: 14px;

            height: 14px;

            border:
                    2px solid
                    rgba(255,255,255,0.35);

            border-top-color:
                    white;

            border-radius: 50%;

            animation:
                    spin 0.7s linear infinite;

        }


        @keyframes spin {

            to {

                transform:
                        rotate(360deg);

            }

        }


        /* =========================================================
           FOOTER
        ========================================================= */

        .login-footer {

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 10px;

            margin-top: 25px;

            padding-top: 20px;

            border-top:
                    1px solid
                    var(--border-light);

        }


        .copyright {

            color:
                    #94a3b8;

            font-size: 10px;

        }


        .protected {

            display: flex;

            align-items: center;

            gap: 6px;

            color:
                    #94a3b8;

            font-size: 10px;

        }


        .security-dot {

            width: 6px;

            height: 6px;

            border-radius: 50%;

            background:
                    var(--success);

            box-shadow:

                    0 0 0 3px
                    rgba(22,163,74,0.08);

        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 800px) {

            body {

                padding: 15px;

            }


            .login-container {

                max-width: 500px;

                min-height: auto;

                grid-template-columns: 1fr;

            }


            .brand-panel {

                padding: 35px;

                min-height: 280px;

                border-right: none;

                border-bottom:
                        1px solid
                        #dbeafe;

            }


            .brand-title {

                font-size: 31px;

            }


            .security-list {

                margin-top: 25px;

            }


            .login-panel {

                padding: 35px;

            }

        }


        @media (max-width: 480px) {

            body {

                padding: 10px;

            }


            .login-container {

                border-radius: 22px;

            }


            .brand-panel {

                padding: 28px;

            }


            .login-panel {

                padding: 28px 22px;

            }


            .brand-title {

                font-size: 28px;

            }


            .login-heading h1 {

                font-size: 26px;

            }


            .login-footer {

                flex-direction: column;

                align-items: flex-start;

            }

        }

    </style>

</head>


<body>


<!-- =========================================================
     FONDO
========================================================= -->

<div class="background-grid"></div>

<div class="background-circle circle-one"></div>

<div class="background-circle circle-two"></div>


<!-- =========================================================
     CONTENEDOR PRINCIPAL
========================================================= -->

<main class="login-container">


    <!-- =====================================================
         PANEL IZQUIERDO
    ====================================================== -->

    <section class="brand-panel">


        <div class="brand-content">


            <div class="brand-logo">
                P
            </div>


            <h2 class="brand-title">

                Tu espacio
                <span>administrativo.</span>

            </h2>


            <p class="brand-description">

                Gestiona el contenido de tu portafolio
                desde un panel centralizado, moderno
                y protegido.

            </p>

        </div>


        <!-- =================================================
             SEGURIDAD
        ================================================== -->

        <div class="security-list">


            <div class="security-item">

                <span class="security-icon">
                    ✓
                </span>

                Acceso autenticado

            </div>


            <div class="security-item">

                <span class="security-icon">
                    ✓
                </span>

                Sesión protegida

            </div>


            <div class="security-item">

                <span class="security-icon">
                    ✓
                </span>

                Panel exclusivo para administradores

            </div>


        </div>

    </section>


    <!-- =====================================================
         LOGIN
    ====================================================== -->

    <section class="login-panel">


        <div class="login-content">


            <!-- =================================================
                 CABECERA
            ================================================== -->

            <div class="login-heading">

                <small>
                    PANEL ADMIN
                </small>

                <h1>
                    Iniciar sesión
                </h1>

                <p>
                    Ingresa tus credenciales para continuar.
                </p>

            </div>


            <!-- =================================================
                 ERROR
            ================================================== -->

            <c:if test="${not empty param.error}">

                <div
                        class="notification error"
                        id="errorNotification">

                    <div class="notification-icon">
                        !
                    </div>

                    <span>
                        Usuario o contraseña incorrectos.
                    </span>

                </div>

            </c:if>


            <!-- =================================================
                 LOGOUT
            ================================================== -->

            <c:if test="${not empty param.logout}">

                <div
                        class="notification success"
                        id="logoutNotification">

                    <div class="notification-icon">
                        ✓
                    </div>

                    <span>
                        Has cerrado sesión correctamente.
                    </span>

                </div>

            </c:if>


            <!-- =================================================
                 FORMULARIO
            ================================================== -->

            <form
                    method="post"
                    action="${pageContext.request.contextPath}/login"
                    id="loginForm"
                    autocomplete="on">


                <!-- USUARIO -->

                <div class="form-group">

                    <label
                            class="form-label"
                            for="username">

                        Usuario

                    </label>


                    <div class="input-wrapper">


                        <span
                                class="input-icon"
                                aria-hidden="true">

                            ◉

                        </span>


                        <input
                                type="text"
                                id="username"
                                name="username"
                                placeholder="Ingresa tu usuario"
                                autocomplete="username"
                                maxlength="50"
                                required
                                spellcheck="false"
                                autocapitalize="none"
                        >

                    </div>

                </div>


                <!-- CONTRASEÑA -->

                <div class="form-group">

                    <label
                            class="form-label"
                            for="password">

                        Contraseña

                    </label>


                    <div class="input-wrapper">


                        <span
                                class="input-icon"
                                aria-hidden="true">

                            ◆

                        </span>


                        <input
                                class="password-input"
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Ingresa tu contraseña"
                                autocomplete="current-password"
                                maxlength="128"
                                required
                        >


                        <!-- MOSTRAR CONTRASEÑA -->

                        <button
                                type="button"
                                class="toggle-password"
                                id="togglePassword"
                                aria-label="Mostrar contraseña"
                                aria-pressed="false">

                            👁

                        </button>

                    </div>

                </div>


                <!-- =================================================
                     BOTÓN
                ================================================== -->

                <button
                        type="submit"
                        class="login-button"
                        id="loginButton">

                    <span
                            class="button-content"
                            id="buttonContent">

                        <span>
                            Acceder al panel
                        </span>

                        <span class="button-arrow">
                            →
                        </span>

                    </span>

                </button>


            </form>


            <!-- =================================================
                 FOOTER
            ================================================== -->

            <div class="login-footer">


                <span class="copyright">
                    PORTAFOLIO ADMIN
                </span>


                <span class="protected">

                    <span class="security-dot"></span>

                    Acceso protegido

                </span>


            </div>


        </div>

    </section>

</main>


<!-- =========================================================
     JAVASCRIPT
========================================================= -->

<script>


    /* =========================================================
       ELEMENTOS
    ========================================================= */

    const passwordInput =
        document.getElementById("password");

    const togglePassword =
        document.getElementById("togglePassword");

    const loginForm =
        document.getElementById("loginForm");

    const loginButton =
        document.getElementById("loginButton");

    const buttonContent =
        document.getElementById("buttonContent");


    /* =========================================================
       MOSTRAR / OCULTAR CONTRASEÑA
    ========================================================= */

    if (togglePassword && passwordInput) {

        togglePassword.addEventListener(
            "click",
            function () {


                const isPassword =
                    passwordInput.type === "password";


                if (isPassword) {

                    passwordInput.type = "text";

                    togglePassword.textContent = "🙈";

                    togglePassword.setAttribute(
                        "aria-label",
                        "Ocultar contraseña"
                    );

                    togglePassword.setAttribute(
                        "aria-pressed",
                        "true"
                    );

                }

                else {

                    passwordInput.type = "password";

                    togglePassword.textContent = "👁";

                    togglePassword.setAttribute(
                        "aria-label",
                        "Mostrar contraseña"
                    );

                    togglePassword.setAttribute(
                        "aria-pressed",
                        "false"
                    );

                }

            }
        );

    }


    /* =========================================================
       PREVENIR DOBLE ENVÍO
    ========================================================= */

    if (loginForm) {

        loginForm.addEventListener(
            "submit",
            function () {


                if (
                    loginButton &&
                    loginButton.disabled
                ) {

                    return;

                }


                if (loginButton) {

                    loginButton.disabled = true;

                }


                if (buttonContent) {

                    buttonContent.innerHTML =

                        '<span class="loading">' +

                        '<span class="spinner"></span>' +

                        '<span>Verificando...</span>' +

                        '</span>';

                }

            }
        );

    }


    /* =========================================================
       NOTIFICACIONES
       DESAPARECEN DESPUÉS DE 3.5 SEGUNDOS
    ========================================================= */

    const notifications =
        document.querySelectorAll(".notification");


    notifications.forEach(
        function(notification) {


            setTimeout(
                function() {

                    notification.classList.add("hide");

                },
                3500
            );


            setTimeout(
                function() {

                    if (notification) {

                        notification.remove();

                    }

                },
                3900
            );

        }
    );


</script>


</body>

</html>

