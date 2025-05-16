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
