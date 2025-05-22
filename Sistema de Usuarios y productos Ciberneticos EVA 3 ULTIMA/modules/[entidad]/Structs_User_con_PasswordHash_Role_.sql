👤 User Struct
Ubicación: modules/user/user.go

go
Copiar
Editar
package user

// User representa a un usuario dentro del sistema.
type User struct {
	ID           int    `json:"id"`            // Identificador único del usuario
	Name         string `json:"name"`          // Nombre completo
	Email        string `json:"email"`         // Correo electrónico único
	PasswordHash string `json:"-"`             // Contraseña cifrada (no se expone en JSON)
	Role         string `json:"role"`          // Rol del usuario: "admin" o "user"
}

- Este struct es fundamental para:

- Registro y autenticación segura

- Control de acceso basado en roles (admin, user)

- Gestión desde el panel de usuarios en el cliente web


📦 Product Struct
Ubicación: modules/product/product.go

go
Copiar
Editar
package product

// Product representa un producto digital/cibernético gestionado por el sistema.
type Product struct {
	ID          int     `json:"id"`            // Identificador único
	Name        string  `json:"name"`          // Nombre del producto
	Description string  `json:"description"`   // Descripción del producto
	Price       float64 `json:"price"`         // Precio del producto
}
Este struct permite:

- Manejo CRUD de productos

- Integración con tablas dinámicas en el frontend (EditableList)

- Exposición segura y sencilla vía JSON para peticiones HTTP

Estructura Sugerida del Proyecto
plaintext
Copiar
Editar
modules/
├── user/
│   └── user.go          👤 Incluye struct User + funciones CRUD + autenticación
└── product/
    └── product.go       📦 Incluye struct Product + funciones CRUD completas
¿Querés agregar más entidades?
Te dejo un ejemplo opcional para agregar una entidad adicional, como Orden (Order) en un futuro:

go
Copiar
Editar
type Order struct {
	ID        int     `json:"id"`
	UserID    int     `json:"user_id"`
	ProductID int     `json:"product_id"`
	Quantity  int     `json:"quantity"`
	Total     float64 `json:"total"`
}
