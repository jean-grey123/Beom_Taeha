<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard | Portafolio Sebastian</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f1f5f9;
            color: #0f172a;
        }

        /* =========================================
           CONTENEDOR
        ========================================= */

        .dashboard {
            min-height: 100vh;
        }

        /* =========================================
           CONTENIDO PRINCIPAL
        ========================================= */

        .main {
            margin-left: 250px;
            min-height: 100vh;
        }

        /* =========================================
           TOPBAR
        ========================================= */

        .topbar {
            height: 72px;
            background: #ffffff;
            border-bottom: 1px solid #e2e8f0;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 32px;

            position: sticky;
            top: 0;
            z-index: 100;
        }

        .topbar-left h1 {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
        }

        .topbar-left span {
            display: block;
            margin-top: 4px;
            font-size: 13px;
            color: #64748b;
        }

        .admin {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .admin-info {
            text-align: right;
        }

        .admin-name {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #0f172a;
        }

        .admin-role {
            display: block;
            margin-top: 3px;
            font-size: 12px;
            color: #64748b;
        }

        .avatar {
            width: 42px;
            height: 42px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #2563eb;
            color: white;

            border-radius: 50%;

            font-size: 16px;
            font-weight: bold;

            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.25);
        }

        /* =========================================
           CONTENIDO
        ========================================= */

        .content {
            padding: 32px;
        }

        /* =========================================
           BIENVENIDA
        ========================================= */

        .welcome {
            margin-bottom: 28px;
        }

        .welcome h2 {
            font-size: 27px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .welcome p {
            font-size: 14px;
            color: #64748b;
        }

        /* =========================================
           ESTADÍSTICAS
        ========================================= */

        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;

            margin-bottom: 28px;
        }

        .stat-card {
            background: #ffffff;

            border: 1px solid #e2e8f0;
            border-radius: 14px;

            padding: 22px;

            position: relative;

            transition: transform 0.2s ease,
            box-shadow 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.08);
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 18px;
        }

        .stat-icon {
            width: 45px;
            height: 45px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            font-size: 22px;
        }

        .icon-blue {
            background: #dbeafe;
        }

        .icon-purple {
            background: #ede9fe;
        }

        .icon-green {
            background: #dcfce7;
        }

        .icon-orange {
            background: #ffedd5;
        }

        .stat-label {
            font-size: 13px;
            color: #64748b;
            margin-bottom: 6px;
        }

        .stat-number {
            font-size: 30px;
            font-weight: 700;
            color: #0f172a;
        }

        /* =========================================
           CONTENEDOR INFERIOR
        ========================================= */

        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 22px;
        }

        /* =========================================
           PANEL GENERAL
        ========================================= */

        .panel {
            background: #ffffff;

            border: 1px solid #e2e8f0;
            border-radius: 14px;

            padding: 25px;
        }

        .panel-header {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 22px;
        }

        .panel-header h3 {
            font-size: 17px;
            color: #0f172a;
        }

        .panel-header span {
            font-size: 12px;
            color: #64748b;
        }

        /* =========================================
           RESUMEN
        ========================================= */

        .summary-text {
            color: #64748b;
            font-size: 14px;
            line-height: 1.8;
        }

        /* =========================================
           ACCESOS RÁPIDOS
        ========================================= */

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .quick-action {
            display: flex;
            align-items: center;
            gap: 13px;

            padding: 14px;

            border: 1px solid #e2e8f0;
            border-radius: 10px;

            text-decoration: none;

            color: #334155;

            transition: all 0.2s ease;
        }

        .quick-action:hover {
            background: #f8fafc;
            border-color: #2563eb;
            color: #2563eb;
        }

        .quick-icon {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #f1f5f9;

            border-radius: 8px;

            font-size: 18px;
        }

        .quick-action strong {
            display: block;
            font-size: 13px;
            margin-bottom: 3px;
        }

        .quick-action small {
            color: #94a3b8;
            font-size: 11px;
        }

        /* =========================================
           ESTADO DE MENSAJES
        ========================================= */

        .message-status {
            margin-top: 20px;

            padding: 15px;

            background: #eff6ff;
            border: 1px solid #dbeafe;

            border-radius: 10px;
        }

        .message-status strong {
            display: block;
            color: #1d4ed8;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .message-status p {
            color: #64748b;
            font-size: 12px;
        }

        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {

            .main {
                margin-left: 200px;
            }

            .content {
                padding: 20px;
            }

            .topbar {
                padding: 0 20px;
            }

            .admin-info {
                display: none;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .welcome h2 {
                font-size: 23px;
            }
        }

    </style>

</head>

<body>

<div class="dashboard">

    <!-- =========================================
         SIDEBAR
    ========================================== -->

    <% request.setAttribute("activePage", "dashboard"); %>
    <%@ include file="../fragments/sidebar.jsp" %>


    <!-- =========================================
         CONTENIDO PRINCIPAL
    ========================================== -->

    <main class="main">

        <!-- =====================================
             BARRA SUPERIOR
        ====================================== -->

        <header class="topbar">

            <div class="topbar-left">

                <h1>Dashboard</h1>

                <span>
                    Panel de administración de tu portafolio
                </span>

            </div>


            <div class="admin">

                <div class="admin-info">

                    <span class="admin-name">
                        Sebastian
                    </span>

                    <span class="admin-role">
                        Administrador
                    </span>

                </div>


                <div class="avatar">
                    S
                </div>

            </div>

        </header>


        <!-- =====================================
             CONTENIDO
        ====================================== -->

        <section class="content">


            <!-- BIENVENIDA -->

            <div class="welcome">

                <h2>
                    ¡Hola, Sebastian! 👋
                </h2>

                <p>
                    Aquí puedes administrar y controlar
                    todo el contenido de tu portafolio académico.
                </p>

            </div>


            <!-- =================================
                 ESTADÍSTICAS
            ================================== -->

            <div class="stats">


                <!-- SEMANAS -->

                <div class="stat-card">

                    <div class="stat-top">

                        <div class="stat-icon icon-blue">
                            📚
                        </div>

                    </div>

                    <div class="stat-label">
                        Semanas académicas
                    </div>

                    <div class="stat-number">${totalSemanas}</div>

                </div>


                <!-- TRABAJOS -->

                <div class="stat-card">

                    <div class="stat-top">

                        <div class="stat-icon icon-purple">
                            📁
                        </div>

                    </div>

                    <div class="stat-label">
                        Trabajos registrados
                    </div>

                    <div class="stat-number">${totalTrabajos}</div>

                </div>


                <!-- ADMINISTRADOR -->

                <div class="stat-card">

                    <div class="stat-top">

                        <div class="stat-icon icon-green">
                            👤
                        </div>

                    </div>

                    <div class="stat-label">
                        Administradores
                    </div>

                    <div class="stat-number">
                        1
                    </div>

                </div>


                <!-- MENSAJES -->

                <div class="stat-card">

                    <div class="stat-top">

                        <div class="stat-icon icon-orange">
                            📩
                        </div>

                    </div>

                    <div class="stat-label">
                        Mensajes recibidos
                    </div>

                    <div class="stat-number">${totalMensajes}</div>

                </div>


            </div>


            <!-- =================================
                 PANELES INFERIORES
            ================================== -->

            <div class="dashboard-grid">


                <!-- RESUMEN -->

                <div class="panel">

                    <div class="panel-header">

                        <h3>
                            Resumen del portafolio
                        </h3>

                        <span>
                            Panel principal
                        </span>

                    </div>


                    <p class="summary-text">

                        Desde este panel podrás administrar
                        las 16 semanas de tu formación académica,
                        registrar tus trabajos, actualizar tu
                        información personal y revisar los
                        mensajes recibidos desde tu portafolio.

                    </p>


                    <!-- ESTADO MENSAJES -->

                    <div class="message-status">

                        <strong>

                            📩 Estado de mensajes

                        </strong>

                        <p>

                            Tienes
                            <strong>${mensajesNoLeidos}</strong>
                            mensajes pendientes de revisar.

                        </p>

                    </div>

                </div>


                <!-- ACCIONES RÁPIDAS -->

                <div class="panel">

                    <div class="panel-header">

                        <h3>
                            Accesos rápidos
                        </h3>

                    </div>


                    <div class="quick-actions">


                        <!-- PERFIL -->

                        <a href="/admin/perfil"
                           class="quick-action">

                            <div class="quick-icon">
                                👤
                            </div>

                            <div>

                                <strong>
                                    Mi perfil
                                </strong>

                                <small>
                                    Editar información
                                </small>

                            </div>

                        </a>


                        <!-- SEMANAS -->

                        <a href="/admin/semanas"
                           class="quick-action">

                            <div class="quick-icon">
                                📚
                            </div>

                            <div>

                                <strong>
                                    Semanas
                                </strong>

                                <small>
                                    Gestionar semanas
                                </small>

                            </div>

                        </a>


                        <!-- TRABAJOS -->

                        <a href="/admin/trabajos"
                           class="quick-action">

                            <div class="quick-icon">
                                📁
                            </div>

                            <div>

                                <strong>
                                    Trabajos
                                </strong>

                                <small>
                                    Administrar trabajos
                                </small>

                            </div>

                        </a>


                        <!-- MENSAJES -->

                        <a href="/admin/mensajes"
                           class="quick-action">

                            <div class="quick-icon">
                                📩
                            </div>

                            <div>

                                <strong>
                                    Mensajes
                                </strong>

                                <small>
                                    Revisar mensajes
                                </small>

                            </div>

                        </a>


                    </div>

                </div>


            </div>


        </section>


    </main>

</div>

</body>

</html>
