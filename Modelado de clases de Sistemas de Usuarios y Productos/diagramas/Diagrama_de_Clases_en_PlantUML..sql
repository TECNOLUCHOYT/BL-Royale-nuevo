Guarda este contenido en el archivo: 
📄 docs/analysis/diagrams/class/ClassDiagram-SistemaGestion.plantuml

@startuml
' Título del Diagrama
title Diagrama de Clases - Sistema de Gestión de Usuarios y Productos

' Clase Usuario
class Usuario {
    - ID: int
    - Nombre: string
    - Email: string
    - Password: string
    - Activo: bool
    + Login(password: string): bool
    + UpdateProfile(nombre: string, email: string): error
}

' Clase Administrador (hereda de Usuario)
class Administrador {
    + AgregarProducto(p: Producto): void
    + ListarUsuarios(): []Usuario
}
Administrador --|> Usuario

' Clase Producto
class Producto {
    - ID: int
    - Nombre: string
    - Descripcion: string
    - Precio: float
    - Disponible: bool
}

' Clase Carrito
class Carrito {
    - ID: int
    - UsuarioID: int
    - Productos: []Producto
    + AgregarProducto(p: Producto): void
    + QuitarProducto(p: Producto): void
    + Vaciar(): void
    + Comprar(): bool
}

' Relaciones
Usuario "1" -- "1" Carrito : posee >
Carrito "1" *-- "*" Producto : contiene >

@enduml

📌 Resumen del Diseño:

- Usuario: clase base con métodos de login y edición de perfil.
- Administrador: hereda de Usuario y agrega métodos para gestionar productos y usuarios.
- Producto: representa un producto en venta.
- Carrito: agrupa productos para una compra. Tiene métodos para agregar, quitar, vaciar y comprar.

Relaciones:

- Un Usuario tiene un Carrito.
- Un Carrito contiene múltiples Productos.

📤 Siguiente paso: 

- Copia este código en ClassDiagram-SistemaGestion.plantuml
- Abre VS Code y usa la extensión PlantUML para visualizarlo.
- Exporta como SVG con el mismo nombre: ClassDiagram-SistemaGestion.svg.
