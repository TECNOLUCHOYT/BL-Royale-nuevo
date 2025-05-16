package admin

import "modules/product"

type Admin struct {
    ID       int
    Nombre   string
    Email    string
    Password string
}

func (a *Admin) AgregarProducto(p product.Product) {
    // Lógica de agregar producto
}
