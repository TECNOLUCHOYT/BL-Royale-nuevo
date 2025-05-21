Resumen del Proyecto: API REST con Go
1. API REST
Se desarrolló una API RESTful en Golang para gestionar usuarios y productos cibernéticos. Los principales endpoints son:

Usuarios:

- POST /usuarios: Crear usuario.
- GET /usuarios/{id}: Obtener usuario por ID.
- PUT /usuarios/{id}: Actualizar usuario.
- DELETE /usuarios/{id}: Eliminar usuario.
- Productos Cibernéticos:
- POST /productos: Crear producto.
- GET /productos: Listar todos los productos.
- GET /productos/{id}: Obtener producto específico.
- PUT /productos/{id}: Actualizar producto.
- DELETE /productos/{id}: Eliminar producto.

2. CRUD Completo: 

La API permite realizar operaciones CRUD completas tanto para usuarios como para productos.
Incluye validaciones como:

- Para usuarios: correo, nombre, contraseña segura.
- Para productos: nombre, descripción, precio, etc.

3. Autenticación con JWT
Se implementó autenticación con JSON Web Tokens (JWT).
Flujo de autenticación:

- El usuario inicia sesión con POST /auth/login.
- Si es exitoso, recibe un token JWT.
- El token se envía en las cabeceras de futuras solicitudes como Bearer Token.
- El servidor valida el token para autorizar el acceso.

4. Cliente Web con Web Components
El frontend utiliza Web Components, permitiendo modularidad y reutilización.

Funcionalidades del cliente:
- Registro e inicio de sesión.
- Gestión de usuarios (ver, editar, eliminar).
- Gestión de productos (agregar, modificar, eliminar).

Componentes:

<login-form>: Autenticación.

<user-form>: Gestión de usuarios.

<product-form>: Gestión de productos.

<product-list>: Lista de productos.

5. Tecnologías Utilizadas
Backend:

- Lenguaje: Go (Golang).
- Frameworks: Gin o Gorilla.
- Autenticación: JWT.
- Base de datos: PostgreSQL.
- Frontend:
- Tecnologías: HTML5, CSS3, Web Components.
- Comunicación: Fetch API para interactuar con la API.

🧱 Estructura General del Proyecto
1. Análisis y Diseño

- Documentación (ubicada en docs/):
- class.md: Contiene el diagrama de clases UML, detallando la relación entre entidades como User, Product, Cart, y Login.
- usecases.md: Define los casos de uso, identificando las interacciones clave entre los actores (usuarios) y el sistema.
- Modelado Orientado a Objetos (POO):
- Se utilizaron principios de encapsulamiento, modularidad y reutilización.
- El sistema se diseñó con base en clases traducidas a structs en Go.

2. Implementación en Go

- Carpeta principal de módulos: modules/
- user.go: Define la estructura de un usuario, junto con sus métodos para gestión y validación.
- login.go: Maneja la autenticación y validación de credenciales.
- product.go: Describe los productos cibernéticos disponibles en el sistema.
- cart.go: Implementa la lógica para agregar productos al carrito, eliminarlos y calcular el total.
- Cada módulo representa una entidad del sistema y permite una fácil extensión y mantenimiento.

3. Funcionamiento del Sistema

- Los usuarios pueden:
- Registrarse y autenticarse.
- Ver productos digitales disponibles.
- Agregar productos a su carrito.
- Ver y modificar el contenido del carrito.
- Se contemplan aspectos como validación de datos, encapsulamiento de lógica de negocio y persistencia simulada (en versiones futuras
se puede agregar una base de datos).

🛠️ Tecnologías Utilizadas

- Lenguaje de Programación: Go (Golang)
- Paradigma: Programación Orientada a Objetos (usando structs y métodos)
- Documentación: Markdown (.md), diagramas UML y descripciones funcionales

🔚 En Conclusión:
El sistema "Productos de Usuarios y Productos Cibernéticos" ofrece una base sólida y modular para la gestión de 
usuarios y productos digitales.
Es escalable, mantenible ypuede ser fácilmente extendido para integrar funcionalidades avanzadas como pagos en línea, historial 
de compras y gestión de licencias.

