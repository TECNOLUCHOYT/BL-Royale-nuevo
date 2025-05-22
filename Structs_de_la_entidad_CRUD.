📦 modules/product/product.go — Structs de la entidad CRUD
go
Copiar
Editar
package product

import (
	"errors"
)

// Product representa un producto digital o cibernético.
type Product struct {
	ID          int     `json:"id"`          // Identificador único
	Name        string  `json:"name"`        // Nombre del producto
	Description string  `json:"description"` // Descripción del producto
	Price       float64 `json:"price"`       // Precio del producto
}

// Simulamos una base de datos en memoria.
var Products = []Product{}
var nextID = 1

// CrearProducto agrega un nuevo producto al sistema.
func CrearProducto(name, desc string, price float64) Product {
	prod := Product{
		ID:          nextID,
		Name:        name,
		Description: desc,
		Price:       price,
	}
	Products = append(Products, prod)
	nextID++
	return prod
}

// ListarProductos devuelve todos los productos almacenados.
func ListarProductos() []Product {
	return Products
}

// BuscarProducto devuelve un producto por su ID.
func BuscarProducto(id int) *Product {
	for _, p := range Products {
		if p.ID == id {
			return &p
		}
	}
	return nil
}

// ActualizarProducto actualiza los campos de un producto específico.
func ActualizarProducto(id int, name, desc string, price float64) error {
	for i, p := range Products {
		if p.ID == id {
			Products[i].Name = name
			Products[i].Description = desc
			Products[i].Price = price
			return nil
		}
	}
	return errors.New("producto no encontrado")
}

// EliminarProducto elimina un producto por su ID.
func EliminarProducto(id int) error {
	for i, p := range Products {
		if p.ID == id {
			Products = append(Products[:i], Products[i+1:]...)
			return nil
		}
	}
	return errors.New("producto no encontrado")
}

✅ ¿Qué incluye este archivo?

- Product struct: modelo de producto con ID, Name, Description, Price
- CRUD completo:
- CrearProducto()
- ListarProductos()
- BuscarProducto(id)
- ActualizarProducto()
- EliminarProducto()
- Almacenamiento en memoria para pruebas rápidas

Carpeta final esperada:
go
Copiar
Editar
modules/
└── product/
    └── product.go   <-- Struct de entidad + CRUD completo
