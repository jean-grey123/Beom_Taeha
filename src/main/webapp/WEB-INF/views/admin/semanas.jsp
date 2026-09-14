<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">

<head>

  <meta charset="UTF-8">

  <title>Semanas | Portafolio</title>

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
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }

    .header h1 {
      margin: 0;
      font-size: 30px;
    }

    .header p {
      margin-top: 8px;
      color: #6b7280;
    }

    .btn-nuevo {
      background: #2563eb;
      color: white;
      padding: 12px 20px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
    }

    .btn-nuevo:hover {
      background: #1d4ed8;
    }

    .tabla-container {
      background: white;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      min-width: 800px;
    }

    th {
      background: #111827;
      color: white;
      padding: 14px;
      text-align: left;
    }

    td {
      padding: 14px;
      border-bottom: 1px solid #e5e7eb;
      vertical-align: middle;
    }

    tr:hover {
      background: #f9fafb;
    }

    .numero {
      font-weight: bold;
      color: #2563eb;
    }

    .acciones {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
    }

    .btn {
      color: white;
      padding: 8px 12px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
      display: inline-block;
    }

    .btn-trabajos {
      background: #7c3aed;
    }

    .btn-trabajos:hover {
      background: #6d28d9;
    }

    .btn-editar {
      background: #f59e0b;
    }

    .btn-editar:hover {
      background: #d97706;
    }

    .btn-eliminar {
      background: #dc2626;
    }

    .btn-eliminar:hover {
      background: #b91c1c;
    }

    .vacio {
      text-align: center;
      padding: 40px;
      color: #6b7280;
    }

    @media (max-width: 800px) {

      .content {
        margin-left: 200px;
        padding: 20px;
      }

      .header {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
      }

      .tabla-container {
        overflow-x: auto;
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


<!-- ===================================================== -->
<!-- SIDEBAR -->
<!-- ===================================================== -->

<% request.setAttribute("activePage", "semanas"); %>
<%@ include file="../fragments/sidebar.jsp" %>


<!-- ===================================================== -->
<!-- CONTENIDO PRINCIPAL -->
<!-- ===================================================== -->

<main class="content">


  <!-- ENCABEZADO -->

  <div class="header">

    <div>

      <h1>📚 Semanas</h1>

      <p>
        Administra las 16 semanas de tu portafolio académico.
      </p>

    </div>


    <!-- BOTÓN NUEVA SEMANA -->

    <a
            href="${pageContext.request.contextPath}/admin/semanas/nuevo"
            class="btn-nuevo">

      ➕ Nueva semana

    </a>

  </div>


  <!-- ================================================= -->
  <!-- TABLA DE SEMANAS -->
  <!-- ================================================= -->

  <div class="tabla-container">

    <table>

      <thead>

      <tr>

        <th>#</th>

        <th>Título</th>

        <th>Descripción</th>

        <th>Acciones</th>

      </tr>

      </thead>


      <tbody>


      <!-- ========================================= -->
      <!-- RECORRER SEMANAS -->
      <!-- ========================================= -->

      <c:forEach items="${semanas}" var="semana">
      <tr>


        <!-- NÚMERO -->

        <td class="numero">${semana.numero}</td>


        <!-- TÍTULO -->

        <td>${semana.titulo}</td>


        <!-- DESCRIPCIÓN -->

        <td>${semana.descripcion}</td>


        <!-- ===================================== -->
        <!-- ACCIONES -->
        <!-- ===================================== -->

        <td>

          <div class="acciones">


            <!-- TRABAJOS -->

            <a
                    class="btn btn-trabajos"
                    href="${pageContext.request.contextPath}/admin/trabajos/semana/${semana.id}">

              📚 Trabajos

            </a>


            <!-- EDITAR -->

            <a
                    class="btn btn-editar"
                    href="${pageContext.request.contextPath}/admin/semanas/editar/${semana.id}">

              ✏️ Editar

            </a>


            <!-- ELIMINAR -->

            <a
                    class="btn btn-eliminar"
                    href="${pageContext.request.contextPath}/admin/semanas/eliminar/${semana.id}"
                    onclick="return confirm('¿Seguro que deseas eliminar esta semana?');">

              🗑️ Eliminar

            </a>


          </div>

        </td>

      </tr>
      </c:forEach>


      <!-- ========================================= -->
      <!-- CUANDO NO EXISTEN SEMANAS -->
      <!-- ========================================= -->

      <c:if test="${empty semanas}">
      <tr>

        <td
                colspan="4"
                class="vacio">

          No existen semanas registradas.

        </td>

      </tr>
      </c:if>


      </tbody>

    </table>

  </div>


</main>

</body>

</html>
