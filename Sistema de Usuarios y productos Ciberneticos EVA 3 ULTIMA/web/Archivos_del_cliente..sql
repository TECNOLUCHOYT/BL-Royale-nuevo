🌐 Estructura Final del Proyecto Web: 

less
Copiar
Editar
web/
├── main.server.go          🚦 Servidor HTTP, CRUD, Auth, Middleware
├── main.server.exe         ▶️ Binario ejecutable (compilar con `go build`)
└── public/                 🌐 Archivos del Cliente Web
    ├── css/
    │   └── style.css       🎨 Estilos
    ├── js/

✅ web/main.server.go

go
Copiar
Editar
package main

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"

	"modules/product"
	"modules/user"
)

var users = []user.User{
	{ID: 1, Name: "Admin", Email: "admin@example.com", PasswordHash: "admin123", Role: "admin"},
}

// Middleware para autenticación simple con header "X-User-Role"
func authMiddleware(next http.HandlerFunc, role string) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("X-User-Role") != role {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}
		next(w, r)
	}
}

func main() {
	http.Handle("/", http.FileServer(http.Dir("web/public")))

	// Endpoints de Productos
	http.HandleFunc("/api/products", authMiddleware(func(w http.ResponseWriter, r *http.Request) {
		switch r.Method {
		case http.MethodGet:
			json.NewEncoder(w).Encode(product.ListarProductos())
		case http.MethodPost:
			var p product.Product
			json.NewDecoder(r.Body).Decode(&p)
			creado := product.CrearProducto(p.Name, p.Description, p.Price)
			json.NewEncoder(w).Encode(creado)
		default:
			http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		}
	}, "admin"))

	http.HandleFunc("/api/products/", authMiddleware(func(w http.ResponseWriter, r *http.Request) {
		id, _ := strconv.Atoi(r.URL.Path[len("/api/products/"):])
		switch r.Method {
		case http.MethodPut:
			var p product.Product
			json.NewDecoder(r.Body).Decode(&p)
			err := product.ActualizarProducto(id, p.Name, p.Description, p.Price)
			if err != nil {
				http.Error(w, err.Error(), 404)
			}
			w.WriteHeader(http.StatusNoContent)
		case http.MethodDelete:
			err := product.EliminarProducto(id)
			if err != nil {
				http.Error(w, err.Error(), 404)
			}
			w.WriteHeader(http.StatusNoContent)
		default:
			http.Error(w, "Método no permitido", http.StatusMethodNotAllowed)
		}
	}, "admin"))

	log.Println("Servidor iniciado en http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
🧩 web/public/js/components/EditableList.js

js
Copiar
Editar
export class EditableList extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `<div><h2>${this.getAttribute("title")}</h2><ul id="items"></ul></div>`;
    this.fetchItems();
  }

  async fetchItems() {
    const res = await fetch("/api/products", {
      headers: { "X-User-Role": "admin" }
    });
    const items = await res.json();
    const ul = this.querySelector("#items");
    ul.innerHTML = items.map(i => `<li>${i.name} - $${i.price}</li>`).join("");
  }
}

customElements.define("editable-list", EditableList);

✨ web/public/js/app.js
js
Copiar
Editar
import "./components/EditableList.js";

document.addEventListener("DOMContentLoaded", () => {
  const loginBtn = document.getElementById("login");
  loginBtn.onclick = () => {
    localStorage.setItem("role", "admin");
    alert("Sesión iniciada como admin.");
  };
});

🏠 web/public/index.html
html
Copiar
Editar
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="css/style.css" />
  <title>Productos Cibernéticos</title>
</head>
<body>
  <h1>Gestión de Productos Cibernéticos</h1>
  <button id="login">Iniciar Sesión (Admin)</button>
  <editable-list title="Listado de Productos"></editable-list>
  <script type="module" src="js/app.js"></script>
</body>
</html>
