✨ web/public/js/app.js


js
Copiar
Editar
import "./components/EditableList.js";

const loginBtn = document.getElementById("login");
const logoutBtn = document.getElementById("logout");
const roleDisplay = document.getElementById("roleDisplay");

// Función para actualizar UI según estado login
function updateUI() {
  const role = localStorage.getItem("role");
  if (role === "admin") {
    loginBtn.style.display = "none";
    if (logoutBtn) logoutBtn.style.display = "inline-block";
    if (roleDisplay) roleDisplay.textContent = `Rol: ${role}`;
  } else {
    loginBtn.style.display = "inline-block";
    if (logoutBtn) logoutBtn.style.display = "none";
    if (roleDisplay) roleDisplay.textContent = "No autenticado";
  }
}

// Login simulado
loginBtn.addEventListener("click", () => {
  localStorage.setItem("role", "admin");
  alert("Sesión iniciada como administrador");
  updateUI();
  // Refrescar lista de productos en el Web Component
  document.querySelector("editable-list")?.fetchItems();
});

// Logout (si querés agregar botón)
if (logoutBtn) {
  logoutBtn.addEventListener("click", () => {
    localStorage.removeItem("role");
    alert("Sesión cerrada");
    updateUI();
    document.querySelector("editable-list")?.fetchItems();
  });
}

// Hook para que Web Component haga fetch con header auth
// (sobrescribe fetch para añadir header X-User-Role)
const originalFetch = window.fetch;
window.fetch = function(input, init = {}) {
  init.headers = {
    ...init.headers,
    "X-User-Role": localStorage.getItem("role") || "",
  };
  return originalFetch(input, init);
};

// Inicializar UI al cargar la página
document.addEventListener("DOMContentLoaded", () => {
  updateUI();
});

¿Cómo funciona?

- Login/logout: Guarda el rol en localStorage. Cambia el texto y botones según el estado.
- fetch: Cada llamada añade el header "X-User-Role" con el rol actual para autenticar en el servidor.
- Interacción con WC: Al hacer login o logout, se refresca la lista de productos del componente editable-list.
- Puedes añadir un botón logout si lo deseas (no está en el ejemplo HTML, pero te puedo ayudar con eso).

