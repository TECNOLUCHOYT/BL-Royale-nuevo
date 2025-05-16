🧩 Structs en Go — Sistema de Gestión de Usuarios y Productos:

📁 modules/user/user.go
go
Copiar
Editar
package user

// Usuario representa a un usuario del sistema
type Usuario struct {
    ID       int    // Identificador único
    Nombre   string // Nombre completo del usuario
    Email    string // Correo electrónico
    Password string // Contraseña del usuario
    Activo   bool   // Estado de la cuenta
}

// Login permite verificar la contraseña ingresada
func (u *Usuario) Login(password string) bool {
    return u.Password == password
}

// UpdateProfile actualiza el nombre y correo del usuario
func (u *Usuario) UpdateProfile(nombre string, email string) error {
    u.Nombre = nombre
    u.Email = email
    return nil
}

📁 modules/admin/admin.go
go
Copiar
Editar
package admin

import "sistema/modules/product"

// Administrador representa a un administrador del sistema
type Administrador struct {
    ID       int    // Identificador único
    Nombre   string // Nombre completo
    Email    string // Correo electrónico
    Password string // Contraseña
}

// AgregarProducto permite añadir un nuevo producto al sistema
func (a *Administrador) AgregarProducto(p product.Producto) {
    // lógica para guardar el producto en la base de datos (simulada)
}

// ListarUsuarios devuelve una lista ficticia de usuarios registrados
func (a *Administrador) ListarUsuarios() []string {
    return []string{"Usuario1", "Usuario2"}
}
📁 modules/product/product.go
go
Copiar
Editar
package product

// Producto representa un producto disponible para la venta
type Producto struct {
    ID          int     // Identificador del producto
    Nombre      string  // Nombre del producto
    Descripcion string  // Descripción general
    Precio      float64 // Precio en moneda local
    Disponible  bool    // Indica si está en stock
}

📁 modules/cart/cart.go
go
Copiar
Editar
package cart

import "sistema/modules/product"

// Carrito representa el carrito de compras de un usuario
type Carrito struct {
    ID        int                 // Identificador único del carrito
    UsuarioID int                 // Referencia al ID del usuario
    Productos []product.Producto  // Lista de productos agregados
}

// AgregarProducto añade un producto al carrito
func (c *Carrito) AgregarProducto(p product.Producto) {
    c.Productos = append(c.Productos, p)
}

// QuitarProducto elimina un producto por ID del carrito
func (c *Carrito) QuitarProducto(id int) {
    for i, p := range c.Productos {
        if p.ID == id {
            c.Productos = append(c.Productos[:i], c.Productos[i+1:]...)
            break
        }
    }
}

// Vaciar limpia todos los productos del carrito
func (c *Carrito) Vaciar() {
    c.Productos = []product.Producto{}
}

// Comprar simula el proceso de compra
func (c *Carrito) Comprar() bool {
    if len(c.Productos) == 0 {
        return false
    }
    // Lógica de compra simulada
    c.Vaciar()
    return true
}

📁 Estructura de Carpetas:

go
Copiar
Editar
modules/
│
├── user/
│   └── user.go
│
├── admin/
│   └── admin.go
│
├── product/
│   └── product.go
│
└── cart/
    └── cart.go
