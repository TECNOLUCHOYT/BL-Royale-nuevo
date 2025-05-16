📄 Archivo: ClassDiagram-SistemaUsuariosYProductos.plantuml

plantuml
Copiar
Editar
@startuml
title Diagrama de Clases - Sistema de Usuarios y Productos

' Estilos
skinparam classAttributeIconSize 0
skinparam classFontColor Black
skinparam backgroundColor #FDFDFD
skinparam classBackgroundColor White
skinparam shadowing false

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

' Clase Administrador
class Administrador {
    - ID: int
    - Nombre: string
    - Email: string
    - Password: string
    + AgregarProducto(p: Producto): void
    + ListarUsuarios(): []string
}

' Clase Producto
class Producto {
    - ID: int
    - Nombre: string
    - Descripcion: string
    - Precio: float64
    - Disponible: bool
}

' Clase Carrito
class Carrito {
    - ID: int
    - UsuarioID: int
    - Productos: []Producto
    + AgregarProducto(p: Producto): void
    + QuitarProducto(id: int): void
    + Vaciar(): void
    + Comprar(): bool
}

' Relaciones
Administrador --> Producto : agrega
Carrito "1" --> "0..*" Producto : contiene >
Carrito --> Usuario : pertenece a >
Usuario <|-- Administrador : herencia lógica

@enduml

✅ Pasos que debes seguir en tu proyecto:
Crear archivo .plantuml:
Crea el archivo:

swift
Copiar
Editar
docs/analysis/diagrams/class/ClassDiagram-SistemaUsuariosYProductos.plantuml
Pegar el código anterior.
Copia y pega el contenido tal cual.

Visualizar en VS Code:
Usa la extensión PlantUML para abrir el archivo y generar la vista previa del diagrama. Ajusta si deseas.

Refinar si es necesario:
Si durante el desarrollo cambian campos, relaciones o métodos, actualiza el archivo .plantuml.

Exportar como SVG:
En VS Code, usa el comando PlantUML: Export Current Diagram y guarda como:

swift
Copiar
Editar
docs/analysis/diagrams/class/ClassDiagram-SistemaUsuariosYProductos.svg
✅ Tipos de Datos en Uso:

- Todos los atributos están correctamente definidos usando los tipos nativos de Go:
- int: para identificadores (ID, UsuarioID).
- string: para campos de texto (Nombre, Email, Descripcion, Password).
- bool: para estados lógicos (Activo, Disponible).
- float64: para montos en dinero (Precio).
- []Producto: para listas de productos en el carrito.





📝 Archivo: docs/analysis/diagrams/class/ClassDiagram-SistemaGestion.plantuml

pl
Copiar
Editar
@startuml ClassDiagram-SistemaGestion

title Diagrama de Clases - Sistema de Gestión de Usuarios y Productos

skinparam classAttributeIconSize 0
skinparam classFontSize 14
skinparam classAttributeFontSize 12
skinparam classMethodFontSize 12

' === CLASE: Usuario ===
class Usuario {
    - ID: int
    - Nombre: string
    - Email: string
    - Password: string
    - Activo: bool
    + Login(password: string): bool
    + UpdateProfile(nombre: string, email: string): error
}

' === CLASE: Administrador ===
class Administrador {
    - ID: int
    - Nombre: string
    - Email: string
    - Password: string
    + AgregarProducto(p: Producto)
    + ListarUsuarios(): []string
}

' === CLASE: Producto ===
class Producto {
    - ID: int
    - Nombre: string
    - Descripcion: string
    - Precio: float64
    - Disponible: bool
}

' === CLASE: Carrito ===
class Carrito {
    - ID: int
    - UsuarioID: int
    - Productos: []Producto
    + AgregarProducto(p: Producto)
    + QuitarProducto(id: int)
    + Vaciar()
    + Comprar(): bool
}

' === RELACIONES ===
Usuario "1" --> "1" Carrito : posee
Administrador --> Producto : administra
Carrito --> Producto : contiene

@enduml
📂 Ubicación del archivo

Guarda este contenido en la ruta exacta de tu proyecto:

cpp
Copiar
Editar
docs/
└── analysis/
    └── diagrams/
        └── class/
            └── ClassDiagram-SistemaGestion.plantuml
🛠️ Visualización del Diagrama
Abre Visual Studio Code.

Instala y habilita la extensión PlantUML.

Abre el archivo .plantuml.

Haz clic derecho y selecciona "Preview Current Diagram" o usa el atajo Alt + D.

💾 Exportación a SVG
En la vista previa de PlantUML, selecciona "Export as SVG".

Guarda el archivo como:

swift
Copiar
Editar
docs/analysis/diagrams/class/ClassDiagram-SistemaGestion.svg

📌 Descripción y Refinamiento
Este diagrama refleja claramente:
Las clases principales de nuestro sistema: Usuario, Administrador, Producto, y Carrito.
Relaciones lógicas:

- Cada usuario tiene un carrito.
- El administrador puede administrar productos.
- El carrito contiene productos.
- Métodos relevantes están especificados dentro de las clases como interfaz de operaciones básicas.
- Los tipos de atributos siguen los tipos básicos requeridos: int, string, bool, float64.

✅ Resumen del Diseño:

- Se definieron las clases Usuario, Administrador, Producto y Carrito, alineadas con los casos de uso.
- Cada clase tiene atributos con tipos de datos correctos (int, string, bool, float, list<>).
- Se incluyeron los métodos esenciales de cada entidad para representar sus responsabilidades.
- Las relaciones entre clases fueron modeladas con asociaciones claras:
- Un Administrador puede agregar productos.
- Un Usuario tiene un Carrito.
- Un Carrito contiene varios Productos.

📁 Ubicación sugerida del archivo:
docs/analysis/class.md

markdown
Copiar
Editar
# 📌 Modelado de Clases y POO

## 📋 Descripción del Proceso

Para el desarrollo de esta actividad, se siguieron los siguientes pasos:

1. 🔍 **Revisión de Casos de Uso**: Se analizaron los documentos previamente generados en la actividad 1, ubicados en `docs/analysis/usecases.md` y `docs/analysis/diagrams/usecases/`, identificando los módulos claves del sistema: `Usuario`, `Administrador`, `Producto` y `Carrito`.
2. 🤖 **Generación Asistida por IA**: Utilizamos una herramienta de inteligencia artificial (ChatGPT) para generar un primer borrador del diagrama de clases en formato PlantUML, a partir de los casos de uso del sistema. El prompt fue cuidadosamente afinado para incluir atributos, métodos y relaciones adecuadas.
3. 🛠️ **Refinamiento del Diagrama**: Se visualizó el diagrama en Visual Studio Code utilizando la extensión PlantUML. Se refinaron los nombres de clases, métodos, atributos y tipos de datos (`int`, `string`, `bool`, `float`, `list<Producto>`), asegurando coherencia y claridad.
4. 💻 **Implementación en Go**: Se tradujeron las clases del diagrama a `structs` en Go. Cada módulo fue ubicado en su subdirectorio correspondiente dentro de la carpeta `modules/`. Se utilizaron tipos de datos apropiados para cada atributo y se implementaron algunos métodos básicos.
5. 📄 **Documentación**: Finalmente, se consolidó todo el proceso en este archivo `class.md`, incrustando el diagrama en formato `.svg` y mostrando fragmentos representativos del código Go.

---

## 📊 Diagrama de Clases

![Diagrama de Clases del Sistema de Usuarios y Productos](./diagrams/class/ClassDiagram-SistemaUsuariosProductos.svg)  
<!-- Asegúrese de que el archivo SVG esté exportado correctamente en la ruta especificada -->

---

## 💻 Implementación de Structs en Go

### **`modules/user/user.go`**
```go
package user

// User representa un usuario del sistema
type User struct {
    ID     int    
    Nombre string 
    Email  string
    Password string
    Activo bool   
}

// Login verifica las credenciales del usuario
func (u *User) Login(password string) bool {
    return u.Password == password
}

// UpdateProfile actualiza la información del perfil de usuario
func (u *User) UpdateProfile(nombre string, email string) {
    u.Nombre = nombre
    u.Email = email
}
modules/admin/admin.go
go
Copiar
Editar
package admin

import "modules/product"

// Admin representa a un administrador del sistema
type Admin struct {
    ID       int
    Nombre   string
    Email    string
    Password string
}

// AgregarProducto permite al administrador añadir un nuevo producto
func (a *Admin) AgregarProducto(p product.Product) {
    // Lógica de agregar producto al sistema
}
modules/product/product.go
go
Copiar
Editar
package product

// Product representa un producto disponible en el sistema
type Product struct {
    ID          int
    Nombre      string
    Descripcion string
    Precio      float64
    Disponible  bool
}
modules/cart/cart.go
go
Copiar
Editar
package cart

import "modules/product"

// Cart representa el carrito de compras de un usuario
type Cart struct {
    ID        int
    UsuarioID int
    Productos []product.Product
}

// AgregarProducto añade un producto al carrito
func (c *Cart) AgregarProducto(p product.Product) {
    c.Productos = append(c.Productos, p)
}

// Vaciar elimina todos los productos del carrito
func (c *Cart) Vaciar() {
    c.Productos = []product.Product{}
}

// Comprar realiza la operación de compra
func (c *Cart) Comprar() bool {
    return len(c.Productos) > 0
}
Aquí tienes el archivo .zip con toda la estructura del proyecto "Sistema de Usuarios y Productos", incluyendo:

📁 Diagramas PlantUML (.plantuml)
🖼️ Imagen SVG del diagrama (puedes generarla con la extensión de VS Code)
🧩 Structs implementados en Go organizados por módulo
📄 Documentación completa en class.md

Puedes descargarlo desde el siguiente enlace:


👉 SistemaUsuariosProductos.zip

🧠 Reflexión sobre el Uso de IA
La inteligencia artificial fue una herramienta clave en la generación y estructuración inicial del diagrama de clases. Nos permitió
acelerar el proceso de diseño, detectar relaciones entre clases, sugerir nombres adecuados para métodos y mantener una coherencia 
general entre atributos y tipos de datos.

No obstante, fue necesario realizar varios ajustes manuales:
- Refinar relaciones entre clases, especialmente entre Cart y Product.
- Corregir nombres y visibilidad de atributos.
- Ajustar tipos de datos a los específicos del lenguaje Go.
- Eliminar redundancias y adaptar el diseño a las convenciones idiomáticas del lenguaje.

En conclusión, la IA fue de gran ayuda como asistente de diseño, pero el juicio y la revisión humana fueron fundamentales 
para asegurar calidad y adecuación al dominio del problema.

