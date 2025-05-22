🎨 web/public/css/style.css

css
Copiar
Editar
/* Estilos generales */
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f0f4f8;
  margin: 0;
  padding: 20px;
  color: #333;
}

/* Encabezado principal */
h1, h2 {
  color: #005fa3;
  margin-bottom: 10px;
}

/* Botones generales */
button {
  background-color: #005fa3;
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.2s ease;
}

button:hover {
  background-color: #00457a;
}

/* Contenedor principal */
.container {
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 95, 163, 0.1);
  max-width: 800px;
  margin: auto;
}

/* Estilos del componente editable-list */
editable-list {
  display: block;
  margin-top: 20px;
}

/* Lista de productos */
#items {
  list-style: none;
  padding: 0;
}

#items li {
  background-color: #ffffff;
  border: 1px solid #ccc;
  padding: 12px 15px;
  margin-bottom: 8px;
  border-radius: 8px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* Inputs para formularios */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
textarea {
  width: 100%;
  padding: 10px;
  margin: 6px 0 16px 0;
  border: 1px solid #ccc;
  border-radius: 6px;
  box-sizing: border-box;
}

/* Formularios generales */
form {
  margin-top: 20px;
}

/* Mensajes */
.success {
  color: green;
  font-weight: bold;
}

.error {
  color: red;
  font-weight: bold;
}

/* Footer */
footer {
  text-align: center;
  margin-top: 40px;
  color: #777;
  font-size: 0.9em;
}

✅ ¿Qué cubre este archivo style.css?

- Diseño moderno y claro.
- Estilos para listas de productos (editable-list).
- Botones atractivos y responsivos.
- Formularios consistentes para inputs.
- Mensajes de éxito/error.
- Contenedor principal centrado.

