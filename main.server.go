Perfecto. A continuación te presento todo el sitio web completo del proyecto Sistema de Usuarios y Productos Cibernéticos, incluyendo:

🔧 Backend (main.server.go) con Servidor HTTP, CRUD, Auth y Middleware
📄 web/main.server.go

go
Copiar
Editar
package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"strings"

	"modules/product"
	"modules/user"
)

func main() {
	http.HandleFunc("/api/login", handleLogin)
	http.HandleFunc("/api/users", withAuth(handleUsers))
	http.HandleFunc("/api/products", withAuth(handleProducts))

	// Archivos estáticos del cliente
	fs := http.FileServer(http.Dir("web/public"))
	http.Handle("/", fs)

	fmt.Println("🚦 Servidor corriendo en http://localhost:8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

// Middleware de autenticación básica por token simulado
func withAuth(handler http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("Authorization")
		if !strings.HasPrefix(token, "Bearer ") {
			http.Error(w, "Token requerido", http.StatusUnauthorized)
			return
		}
		token = strings.TrimPrefix(token, "Bearer ")
		if token != "12345" {
			http.Error(w, "Token inválido", http.StatusForbidden)
			return
		}
		handler(w, r)
	}
}

// Login simulado
func handleLogin(w http.ResponseWriter, r *http.Request) {
	var creds struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}
	json.NewDecoder(r.Body).Decode(&creds)

	u, err := user.Autenticar(creds.Email, creds.Password)
	if err != nil {
		http.Error(w, "Credenciales inválidas", http.StatusUnauthorized)
		return
	}
	resp := map[string]interface{}{
		"token": "12345",
		"user":  u,
	}
	json.NewEncoder(w).Encode(resp)
}

// CRUD Usuarios (solo GET y POST simplificado)
func handleUsers(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case "GET":
		json.NewEncoder(w).Encode(user.Users)
	case "POST":
		var u struct {
			Name     string `json:"name"`
			Email    string `json:"email"`
			Password string `json:"password"`
			Role     string `json:"role"`
		}
		json.NewDecoder(r.Body).Decode(&u)
		newUser, err := user.CrearUsuario(u.Name, u.Email, u.Password, u.Role)
		if err != nil {
			http.Error(w, err.Error(), 400)
			return
		}
		json.NewEncoder(w).Encode(newUser)
	}
}

// CRUD Productos completo
func handleProducts(w http.ResponseWriter, r *http.Request) {
	switch r.Method {
	case "GET":
		json.NewEncoder(w).Encode(product.ListarProductos())
	case "POST":
		var p product.Product
		json.NewDecoder(r.Body).Decode(&p)
		created := product.CrearProducto(p.Name, p.Description, p.Price)
		json.NewEncoder(w).Encode(created)
	case "PUT":
		id, _ := strconv.Atoi(r.URL.Query().Get("id"))
		var p product.Product
		json.NewDecoder(r.Body).Decode(&p)
		err := product.ActualizarProducto(id, p.Name, p.Description, p.Price)
		if err != nil {
			http.Error(w, err.Error(), 404)
			return
		}
		w.WriteHeader(http.StatusOK)
	case "DELETE":
		id, _ := strconv.Atoi(r.URL.Query().Get("id"))
		err := product.EliminarProducto(id)
		if err != nil {
			http.Error(w, err.Error(), 404)
			return
		}
		w.WriteHeader(http.StatusOK)
	}
}
