📁 modules/user/user.go
📌 Contiene la definición del struct User, funciones de autenticación y lógica de usuario.

go
Copiar
Editar
package user

import (
	"errors"
	"golang.org/x/crypto/bcrypt"
)

// User representa un usuario del sistema.
type User struct {
	ID           int    `json:"id"`
	Name         string `json:"name"`
	Email        string `json:"email"`
	PasswordHash string `json:"-"`       // No se expone
	Role         string `json:"role"`    // admin | user
}

// Users simula una base de datos en memoria.
var Users = []User{}
var nextID = 1

// CrearUsuario crea un nuevo usuario con contraseña hasheada.
func CrearUsuario(name, email, password, role string) (User, error) {
	if BuscarPorEmail(email) != nil {
		return User{}, errors.New("email ya registrado")
	}
	hash, _ := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	usr := User{
		ID:           nextID,
		Name:         name,
		Email:        email,
		PasswordHash: string(hash),
		Role:         role,
	}
	Users = append(Users, usr)
	nextID++
	return usr, nil
}

// Autenticar verifica email y contraseña.
func Autenticar(email, password string) (*User, error) {
	for _, u := range Users {
		if u.Email == email && bcrypt.CompareHashAndPassword([]byte(u.PasswordHash), []byte(password)) == nil {
			return &u, nil
		}
	}
	return nil, errors.New("credenciales inválidas")
}

// BuscarPorID busca un usuario por ID.
func BuscarPorID(id int) *User {
	for _, u := range Users {
		if u.ID == id {
			return &u
		}
	}
	return nil
}

// BuscarPorEmail busca un usuario por correo.
func BuscarPorEmail(email string) *User {
	for _, u := range Users {
		if u.Email == email {
			return &u
		}
	}
	return nil
}

// ActualizarUsuario modifica los campos básicos de un usuario.
func ActualizarUsuario(id int, name, email, role string) error {
	for i, u := range Users {
		if u.ID == id {
			Users[i].Name = name
			Users[i].Email = email
			Users[i].Role = role
			return nil
		}
	}
	return errors.New("usuario no encontrado")
}

// EliminarUsuario elimina un usuario por ID.
func EliminarUsuario(id int) error {
	for i, u := range Users {
		if u.ID == id {
			Users = append(Users[:i], Users[i+1:]...)
			return nil
		}
	}
	return errors.New("usuario no encontrado")
}
