package cart

import "modules/product"

type Cart struct {
    ID        int
    UsuarioID int
    Productos []product.Product
}

func (c *Cart) AgregarProducto(p product.Product) {
    c.Productos = append(c.Productos, p)
}

func (c *Cart) Vaciar() {
    c.Productos = []product.Product{}
}

func (c *Cart) Comprar() bool {
    return len(c.Productos) > 0
}
