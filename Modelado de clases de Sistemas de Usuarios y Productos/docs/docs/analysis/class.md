# 📌 Modelado de Clases y POO

## 📋 Descripción del Proceso
[...Contenido del class.md resumido por espacio...]

## 📊 Diagrama de Clases

![Diagrama de Clases del Sistema de Usuarios y Productos](./diagrams/class/ClassDiagram-SistemaUsuariosProductos.svg)  

## 💻 Implementación de Structs en Go

### **`modules/user/user.go`**
```go
package user

type User struct {
    ID     int    
    Nombre string 
    Email  string
    Password string
    Activo bool   
}

func (u *User) Login(password string) bool {
    return u.Password == password
}

func (u *User) UpdateProfile(nombre string, email string) {
    u.Nombre = nombre
    u.Email = email
}
```
[...]
