🔄 Reutilización y Ampliación de Structs en Go
Proyecto: Sistema de Usuarios y Productos Cibernéticos
💡 Introducción
Go no tiene herencia como en otros lenguajes orientados a objetos, pero permite la composición de structs para lograr reutilización y extensión 
de funcionalidades, aplicando principios similares a la herencia y al polimorfismo. En este sistema, usamos estas técnicas para estructurar nuestros 
módulos de forma limpia, reutilizable y escalable.

📦 Structs Reutilizables.

  1. User:
go
Copiar
Editar
type User struct {
    ID       int
    Name     string
    Email    string
    Password string
}
Reutilizado para crear autenticaciones, asignar propietarios de carritos, y como base para roles futuros como administradores o vendedores.

2. Product:

go
Copiar
Editar
type Product struct {
    ID          int
    Name        string
    Description string
    Price       float64
}
Reutilizado en:
- CartItem: Composición para representar productos agregados al carrito.
- Posible base para ampliar a DigitalProduct, ServiceProduct, etc.

🧬 Ampliación Mediante Composición.
  
1. CartItem – Extiende a Product:

go
Copiar
Editar
type CartItem struct {
    Product  // Composición del struct Product
    Quantity int
}
Aquí se reutilizan todos los campos de Product, y se le agrega Quantity para representar su cantidad en el carrito.

Permite acceder directamente a CartItem.Name o CartItem.Price.

2. Cart – Relacionado con User y CartItem:

go
Copiar
Editar
type Cart struct {
    UserID    int
    Items     []CartItem
    TotalCost float64
}
El UserID vincula al propietario del carrito.

Items contiene structs CartItem, que a su vez contienen productos.

3. AdminUser – Extiende comportamiento de User:

go
Copiar
Editar
type AdminUser struct {
    User          // Composición de User
    Permissions []string
}
Ejemplo de extensión para funcionalidades administrativas.

Reutiliza todos los datos de User, y agrega permisos.

🔁 Ejemplo de Reutilización y Acceso
go
Copiar
Editar
admin := AdminUser{
    User: User{
        ID: 1,
        Name: "Alice",
        Email: "alice@admin.com",
        Password: "securepass",
    },
    Permissions: []string{"manage_users", "edit_products"},
}

fmt.Println(admin.Name) // Acceso directo al campo embebido
🧩 Ventajas del Enfoque Usado
✅ Simplicidad y claridad en la estructura del código.
✅ Modularidad: cada struct se puede probar, ampliar o reemplazar fácilmente.
✅ Reutilización sin herencia compleja, gracias a la composición.
✅ Preparado para escalabilidad (agregar tipos de usuario, productos o carritos con lógica extendida).

