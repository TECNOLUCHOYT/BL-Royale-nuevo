📄 api.md — Diseño de API del Sistema
markdown
Copiar
Editar
# 🌐 API del Sistema de Usuarios y Productos Cibernéticos: 

Este documento describe la API RESTful que expone el backend del sistema, organizada por recurso.

---

## 🔐 Autenticación

### POST `/api/login`
- **Descripción**: Inicia sesión del usuario.
- **Body JSON**:
```json
{
  "email": "usuario@ejemplo.com",
  "password": "123456"
}
Respuestas:

200 OK: Sesión iniciada

401 Unauthorized: Credenciales inválidas

POST /api/logout
Descripción: Cierra sesión del usuario.

Respuesta: 200 OK
