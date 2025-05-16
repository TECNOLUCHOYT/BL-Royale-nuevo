✅ Revisión de Casos de Uso:
Proyecto: Sistema de Gestión de Usuarios y Productos

🎯 Objetivo del Sistema:
Desarrollar una plataforma que permita a usuarios registrarse, iniciar sesión, gestionar su información, explorar
productos y realizar compras. Los administradores podrán gestionar el catálogo de productos y consultar información de usuarios registrados.

👥 Actores del Sistema:
- Usuario: Persona que se registra, accede al sistema y realiza compras.
- Administrador: Usuario con privilegios especiales para gestionar el sistema.

📚 Resumen de Casos de Uso:
1. Registrar Usuario

- Actor Principal: Usuario
- Descripción: Permite a un nuevo usuario crear una cuenta proporcionando su nombre, correo electrónico y contraseña.

Flujo Principal:

- El usuario ingresa su información.
- El sistema valida y guarda los datos.
- Se activa la cuenta del usuario.

2. Iniciar Sesión (Login)

- Actor Principal: Usuario
- Descripción: El usuario ingresa su correo y contraseña para autenticarse.

Flujo Principal:

- Usuario proporciona credenciales.
- El sistema verifica y permite el acceso.

3. Actualizar Perfil

- Actor Principal: Usuario
- Descripción: El usuario modifica su nombre o correo electrónico.

Flujo Principal:

- El usuario edita su información.
- El sistema actualiza los datos.

4. Agregar Producto (Solo Administrador)

- Actor Principal: Administrador
- Descripción: Permite agregar nuevos productos al sistema.

Flujo Principal:

- Admin ingresa nombre, descripción y precio.
- El sistema guarda el producto como disponible.

5. Listar Productos

- Actor Principal: Usuario
- Descripción: Permite visualizar todos los productos disponibles.

Flujo Principal:

- El usuario accede al catálogo.
- El sistema muestra la lista de productos disponibles.

6. Agregar Producto al Carrito

- Actor Principal: Usuario
- Descripción: El usuario añade productos seleccionados a su carrito.

Flujo Principal:

- El usuario selecciona un producto.
- El producto es agregado al carrito.

7. Quitar Producto del Carrito

- Actor Principal: Usuario
- Descripción: Permite eliminar un producto del carrito.

Flujo Principal:

- El usuario selecciona un producto del carrito.
- El producto es eliminado del mismo.

8. Comprar Productos

- Actor Principal: Usuario
- Descripción: Finaliza la compra de los productos en el carrito.

Flujo Principal:

- El usuario confirma la compra.
- El sistema registra la transacción.

9. Listar Usuarios (Solo Administrador)

- Actor Principal: Administrador
- Descripción: Permite al administrador visualizar todos los usuarios registrados.

Flujo Principal:

- El administrador accede al panel de usuarios.
- El sistema muestra la lista completa.

📌 Observaciones Generales: 

- Todos los casos de uso están relacionados directamente con las clases modeladas en el diagrama de clases (Usuario, Administrador, Producto, Carrito).
- Se mantiene una clara separación de roles entre Usuario y Administrador.
- Las funcionalidades están centradas en la experiencia del usuario y la gestión de productos.
c:\Users\56983\Desktop\Modelado de Clases y POO con Go\Revisión_de_Casos_de_Uso_.sql


