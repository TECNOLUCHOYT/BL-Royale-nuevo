📘 docs/analysis/class.md
Modelado de Clases y POO
📋 Revisión de Casos de Uso
Sistema: Gestión de Usuarios y Productos
Actores: Usuario, Administrador

Casos de Uso Principales:

- Registrar Usuario: Alta de nuevos usuarios con email y contraseña.
- Iniciar Sesión: Autenticación mediante credenciales.
- Actualizar Perfil: Modificación de datos del usuario.
- Agregar Producto (Admin): Alta de productos.
- Listar Productos: Visualización general para usuarios.
- Agregar/Quitar Producto del Carrito: Gestión de productos seleccionados para compra.
- Comprar Productos: Confirmación de compra.
- Listar Usuarios (Admin): Gestión administrativa de usuarios.

🧠 Descripción del Proceso
Se inició revisando los casos de uso definidos previamente en docs/analysis/usecases.md. Con base en ellos, 
se utilizó ChatGPT para generar un diagrama inicial de clases en formato PlantUML. A través de iteraciones se depuraron relaciones, métodos y atributos. 
El código generado se pegó en docs/analysis/diagrams/class/ClassDiagram-SistemaGestion.plantuml y se visualizó con la extensión PlantUML en VS Code.

Una vez refinado el modelo, se exportó el diagrama como imagen SVG.

📊 Diagrama de Clases

💻 Implementación de Structs en Go
modules/user/user.go
go
Copiar
Editar
package user

type Usuario struct {
    ID       int
    Nombre   string
    Email    string
    Password string
    Activo   bool
}

func (u *Usuario) Login(password string) bool {
    // Simulación de validación
    return u.Password == password
}

func (u *Usuario) UpdateProfile(nombre string, email string) error {
    u.Nombre = nombre
    u.Email = email
    return nil
}
modules/admin/admin.go
go
Copiar
Editar
package admin

import "sistema/modules/product"

type Administrador struct {
    ID       int
    Nombre   string
    Email    string
    Password string
}

func (a *Administrador) AgregarProducto(p product.Producto) {
    // lógica para agregar producto
}

func (a *Administrador) ListarUsuarios() []string {
    // Simulación
    return []string{"Usuario1", "Usuario2"}
}
modules/product/product.go
go
Copiar
Editar
package product

type Producto struct {
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

import "sistema/modules/product"

type Carrito struct {
    ID        int
    UsuarioID int
    Productos []product.Producto
}

func (c *Carrito) AgregarProducto(p product.Producto) {
    c.Productos = append(c.Productos, p)
}

func (c *Carrito) QuitarProducto(id int) {
    for i, p := range c.Productos {
        if p.ID == id {
            c.Productos = append(c.Productos[:i], c.Productos[i+1:]...)
            break
        }
    }
}

func (c *Carrito) Vaciar() {
    c.Productos = []product.Producto{}
}

func (c *Carrito) Comprar() bool {
    if len(c.Productos) == 0 {
        return false
    }
    c.Vaciar()
    return true
}
