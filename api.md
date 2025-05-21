📄 api.md — Diseño de API del Sistema
markdown
Copiar
Editar
# 🌐 API del Sistema de Usuarios y Productos Cibernéticos: 

Este documento describe la API RESTful que expone el backend del sistema, organizada por recurso.

---

## 🔐 Autenticación

### POST `/api/login`
- **Descripción**: Inicia sesión del usuario.
- **Body JSON**:
```json
{
  "email": "usuario@ejemplo.com",
  "password": "123456"
}
Respuestas:

200 OK: Sesión iniciada

401 Unauthorized: Credenciales inválidas

POST /api/logout
Descripción: Cierra sesión del usuario.

Respuesta: 200 OK
401 Unauthorized: Credenciales inválidas

POST /api/logout
Descripción: Cierra sesión del usuario.

Respuesta: 200 OK

GET /api/session
Descripción: Verifica si hay sesión activa.

Respuesta:

json
Copiar
Editar
{
  "loggedIn": true,
  "user": { "id": 1, "name": "Admin", "role": "admin" }
}
👤 Usuarios
GET /api/users
Devuelve la lista de usuarios registrados.

Solo accesible por administradores.

POST /api/users
Crea un nuevo usuario.

json
Copiar
Editar
{
  "name": "Nuevo Usuario",
  "email": "nuevo@correo.com",
  "password": "clave123",
  "role": "user"
}
GET /api/users/:id
Devuelve un usuario específico.

PUT /api/users/:id
Actualiza datos del usuario.

DELETE /api/users/:id
Elimina al usuario.

🛍️ Productos
GET /api/products
Lista todos los productos disponibles.

POST /api/products
Crea un nuevo producto.

json
Copiar
Editar
{
  "name": "Antivirus Pro",
  "description": "Software de protección digital",
  "price": 49.99
}
GET /api/products/:id
Devuelve un producto por su ID.

PUT /api/products/:id
Actualiza un producto.

DELETE /api/products/:id
Elimina un producto.

yaml
Copiar
Editar

---

### 📄 `routing-components.md` — **Diseño de Ruteo y Componentes Web**

```markdown
# 🔁 Ruteo y Componentes del Cliente Web

Este documento describe la arquitectura del frontend y la distribución de sus rutas y componentes.

---

## 🌐 Rutas del Navegador

| Ruta           | Componente Principal     | Acceso         |
|----------------|--------------------------|----------------|
| `/`            | `HomePage`               | Público        |
| `/login`       | `LoginForm`              | Público        |
| `/dashboard`   | `Dashboard`              | Protegido      |
| `/usuarios`    | `UserManager`            | Solo admin     |
| `/productos`   | `ProductManager`         | Protegido      |

---

## 🧩 Web Components

### `EditableList`
- Componente reutilizable para mostrar listas editables.
- Acepta props como: `endpoint`, `fields`, `editable`, `onSave`.
- Se usa en `/usuarios` y `/productos`.

---

## 🧠 Lógica General

- El ruteo se gestiona con `window.location.hash` o SPA básica.
- `fetch()` se usa para interactuar con la API.
- Se guarda el usuario autenticado en `sessionStorage`.
