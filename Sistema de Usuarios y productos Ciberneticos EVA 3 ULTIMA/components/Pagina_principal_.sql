🏠 web/public/index.html

html
Copiar
Editar
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Sistema de Usuarios y Productos Cibernéticos</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <div class="container">
    <h1>🛡️ Sistema de Usuarios y Productos Cibernéticos</h1>

    <div style="margin-bottom: 1rem;">
      <span id="roleDisplay">No autenticado</span>
      <br />
      <button id="login">Iniciar sesión como Admin</button>
      <button id="logout" style="display: none;">Cerrar sesión</button>
    </div>

    <!-- Web Component que lista productos -->
    <editable-list title="🧾 Lista de Productos"></editable-list>
  </div>

  <!-- Lógica de cliente y Web Component -->
  <script type="module" src="js/app.js"></script>
</body>
</html>

✅ ¿Qué incluye esta página?

- ✅ Diseño limpio y responsive (se apoya en style.css).
- ✅ Interfaz de login/logout simulada (localStorage).
- ✅ Título claro y con íconos para darle identidad.
- ✅ El Web Component que lista productos y se comunica con el backend.
- ✅ Scripts app.js y EditableList.js funcionales.

