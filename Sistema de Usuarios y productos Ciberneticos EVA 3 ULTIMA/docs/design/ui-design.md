📄 ui-design.md — Diseño de Interfaz de Usuario
markdown
Copiar
Editar
# 🎨 Diseño de Interfaz de Usuario (UI)

Este documento define los principios visuales, la estructura y los componentes de la interfaz del cliente web del Sistema de Usuarios y Productos Cibernéticos.

---

## 🧱 Estructura General de la Interfaz

El sistema utiliza una interfaz web sencilla y responsiva, centrada en la usabilidad y eficiencia para la gestión de usuarios y productos.

### Páginas Clave

| Página         | Descripción |
|----------------|-------------|
| **Inicio** (`/`)         | Página de bienvenida. Presenta el sistema e invita a iniciar sesión. |
| **Login** (`/login`)     | Formulario de autenticación de usuarios. |
| **Dashboard** (`/dashboard`) | Panel de control con acceso a secciones privadas. |
| **Usuarios** (`/usuarios`)   | Gestión completa de usuarios (sólo para administradores). |
| **Productos** (`/productos`) | Gestión de productos cibernéticos disponibles. |

---

## 📐 Layout

- **Header fijo** con nombre del sistema, usuario autenticado y botón “Cerrar sesión”.
- **Main content** dinámico según la ruta activa.
- **Cards y tablas** para organizar la información.
- **Botones grandes y claros** para las operaciones CRUD.
- **Mensajes de alerta** para errores y confirmaciones.

---

## 🎨 Estilos Visuales

### Paleta de Colores
- Fondo: `#f4f6f8`
- Principal: `#1976D2` (azul cibernético)
- Texto: `#333`
- Botones: `#1976D2`, con `hover` en `#1565C0`

### Tipografía
- Fuente principal: `"Inter", sans-serif`
- Tamaños:
  - Título: `1.8rem`
  - Subtítulo: `1.2rem`
  - Texto base: `1rem`

### Componentes UI
- `.card`: caja con borde suave y sombra ligera.
- `.btn`: botones primarios con estilo consistente.
- `.form`: formularios alineados en columna.
- `.table`: tablas con diseño limpio y celdas resaltadas.

---

## 📱 Responsividad

- Mobile-first design.
- Uso de `@media` para adaptar el layout:
  - En móviles: columnas apiladas.
  - En escritorio: diseño multicolumna y más espacio.
- Botones y campos adaptativos.

---

## 🧩 Componentes Reutilizables

### 🔧 EditableList (Web Component)
- Listado editable de usuarios y productos.
- Tabla dinámica con acciones (editar, eliminar, agregar).
- Iconos de acción claros y accesibles.

---

## 🧠 Accesibilidad y UX

- Contraste de colores verificado.
- Tamaño de texto legible en todos los dispositivos.
- Controles accesibles por teclado.
- Mensajes claros ante errores y validaciones.

---

## 📁 Estructura de Archivos CSS

```plaintext
web/public/css/
└── style.css        // Contiene todos los estilos de UI, responsividad y componentes
Incluye clases como:

.container, .card, .btn, .form-control, .table, .alert, .header

📌 Vista previa (esquema visual)
html
Copiar
Editar
<!-- Ejemplo simplificado del layout principal -->
<div class="header">
  <h1>Sistema de Productos Cibernéticos</h1>
  <button class="btn logout">Cerrar sesión</button>
</div>

<div class="container">
  <div class="card">
    <h2>Productos Disponibles</h2>
    <editable-list endpoint="/api/products"></editable-list>
  </div>
</div>
✅ Conclusión
El diseño de UI es simple, funcional y centrado en facilitar tareas administrativas.
El sistema está pensado para escalarse visual y funcionalmente a medida que se agregan más entidades o funcionalidades.

