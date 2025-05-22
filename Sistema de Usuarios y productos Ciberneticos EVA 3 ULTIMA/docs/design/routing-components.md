📄 routing-components.md — Diseño de Ruteo y Componentes Web
- markdown
- Copiar
- Editar
- 
# 🔁 Diseño de Ruteo y Componentes del Cliente Web:
Este documento describe la estructura de rutas y los componentes utilizados en el cliente web del Sistema de Usuarios y Productos Cibernéticos.

---

## 🌐 Rutas de Navegación

El sistema está pensado como una Single Page Application (SPA) simple, utilizando rutas hash (`#`) y control manual del DOM.

| Ruta           | Componente Principal     | Acceso         | Descripción                                     |
|----------------|--------------------------|----------------|-------------------------------------------------|
| `/`            | `HomePage`               | Público        | Página de inicio con información básica         |
| `/login`       | `LoginForm`              | Público        | Formulario de autenticación                     |
| `/dashboard`   | `Dashboard`              | Autenticado    | Vista principal tras iniciar sesión             |
| `/usuarios`    | `UserManager`            | Solo Admin     | Administración CRUD de usuarios                 |
| `/productos`   | `ProductManager`         | Autenticado    | Administración CRUD de productos cibernéticos   |
| `/logout`      | -                        | Autenticado    | Redirige y elimina sesión activa                |

---

## 🧩 Web Components Usados

### 🔧 `EditableList`

Un componente web reutilizable para renderizar y manipular listas editables de entidades (usuarios, productos, etc.).

#### Propiedades esperadas:
- `endpoint`: URL de la API a consumir (`/api/products`, `/api/users`, etc.)
- `fields`: Lista de campos visibles/editables
- `editable`: Booleano para permitir edición
- `onSave`: Función de guardado

#### Funciones:
- Mostrar datos en tabla editable
- CRUD básico (crear, editar, borrar)
- Fetch dinámico desde backend

---

## 📁 Organización de Archivos JS

```plaintext
web/public/js/
├── app.js              // Controlador principal de rutas y lógica de fetch
└── components/
    └── EditableList.js // Componente web personalizado
⚙️ Manejo de Rutas y Navegación
La lógica de rutas se basa en window.location.hash y el renderizado condicional:

javascript
Copiar
Editar
window.addEventListener('hashchange', renderApp);
function renderApp() {
  const route = window.location.hash.slice(1);
  switch (route) {
    case 'login': renderLogin(); break;
    case 'dashboard': renderDashboard(); break;
    case 'usuarios': renderUsers(); break;
    case 'productos': renderProducts(); break;
    default: renderHome(); break;
  }
}
🧠 Interacción con la API: 

- Se usa fetch() para consumir los endpoints REST desde el cliente.
- Las sesiones se gestionan con sessionStorage.
- Si no hay sesión activa, el usuario es redirigido a /login.

🔐 Control de Acceso:

- javascript.
- Copiar.
- Editar.
function requireAuth(route) {
  const user = JSON.parse(sessionStorage.getItem('user'));
  if (!user) {
    window.location.hash = 'login';
    return false;
  }
  if (route === 'usuarios' && user.role !== 'admin') {
    alert('Acceso restringido');
    window.location.hash = 'dashboard';
    return false;
  }
  return true;
}

✅ Ventajas del diseño:

- Reutilización de componentes (EditableList).
- Navegación SPA sin frameworks pesados.
- Compatible con cualquier backend RESTful.
- Seguridad básica basada en roles.

yaml
Copiar
Editar
