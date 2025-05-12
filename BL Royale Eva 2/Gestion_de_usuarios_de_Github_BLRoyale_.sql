🏗️ Arquitectura Web para BL Royale
Tipo de Arquitectura:
SPA (Single Page Application):
- Usaremos una SPA para mantener una experiencia fluida, sin recarga de página.
- Ideal para juegos o plataformas interactivas como BL Royale.
- Carga inicial: rápida y modular.

Preparación para futura integración:
PWA-ready (se podrá convertir fácilmente en una Progressive Web App).
Escalable para SSR en el futuro si se desea optimizar SEO o performance inicial.

🧭 Ruteo del lado del cliente (Client-Side Routing)
Vistas identificadas en Actividad 1:

1. / → Pantalla de Inicio
2. /login → Ingreso de Usuario
3. /register → Registro de Usuario
4. /dashboard → Panel principal del jugador
5. /matchmaking → Buscador de partidas
6. /game → Pantalla de juego
7. /profile → Perfil del jugador

Sistema de Ruteo con JavaScript:
Usaremos window.history.pushState y window.onpopstate para gestionar las rutas sin recarga.

🧩 Estructura de Carpetas
pgsql
Copiar
Editar
/bl-royale/
├── index.html
├── /components/
│   ├── app-root.js
│   ├── nav-bar.js
│   ├── home-view.js
│   ├── login-view.js
│   ├── register-view.js
│   ├── dashboard-view.js
│   ├── matchmaking-view.js
│   ├── game-view.js
│   └── profile-view.js
├── /assets/
├── /styles/
│   └── styles.css
└── router.js
🌐 Código Base del Proyecto

1. index.html
html
Copiar
Editar
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>BL Royale</title>
  <script type="module" src="./components/app-root.js"></script>
  <link rel="stylesheet" href="./styles/styles.css" />
</head>
<body>
  <app-root></app-root>
</body>
</html>

2. components/app-root.js
js
Copiar
Editar
import '../router.js';
import './nav-bar.js';
import './home-view.js';
import './login-view.js';
import './register-view.js';
import './dashboard-view.js';
import './matchmaking-view.js';
import './game-view.js';
import './profile-view.js';

class AppRoot extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
    window.addEventListener('popstate', () => this.render());
  }

  render() {
    const route = window.location.pathname;
    let viewTag = 'home-view';

    switch(route) {
      case '/login': viewTag = 'login-view'; break;
      case '/register': viewTag = 'register-view'; break;
      case '/dashboard': viewTag = 'dashboard-view'; break;
      case '/matchmaking': viewTag = 'matchmaking-view'; break;
      case '/game': viewTag = 'game-view'; break;
      case '/profile': viewTag = 'profile-view'; break;
    }

    this.shadowRoot.innerHTML = `
      <nav-bar></nav-bar>
      <${viewTag}></${viewTag}>
    `;
  }
}

customElements.define('app-root', AppRoot);

3. router.js
js
Copiar
Editar
export function navigateTo(path) {
  window.history.pushState({}, path, window.location.origin + path);
  document.querySelector('app-root').render();
}

4. Ejemplo de Web Component: components/home-view.js
js
Copiar
Editar
class HomeView extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `
      <section>
        <h1>Bienvenido a BL Royale</h1>
        <button onclick="navigateTo('/login')">Iniciar sesión</button>
        <button onclick="navigateTo('/register')">Registrarse</button>
      </section>
    `;
  }
}
customElements.define('home-view', HomeView);

5. Ejemplo: components/nav-bar.js
js
Copiar
Editar
class NavBar extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `
      <nav>
        <a href="/" onclick="event.preventDefault(); navigateTo('/')">Inicio</a>
        <a href="/dashboard" onclick="event.preventDefault(); navigateTo('/dashboard')">Dashboard</a>
        <a href="/profile" onclick="event.preventDefault(); navigateTo('/profile')">Perfil</a>
      </nav>
    `;
  }
}
customElements.define('nav-bar', NavBar);
📦 Web Components que faltan (puedes replicar estructura de home-view.js)
login-view.js

register-view.js

dashboard-view.js

matchmaking-view.js

game-view.js

profile-view.js

Cada uno de estos componentes debe contener un <section> con contenido específico de esa vista. Luego podrás añadir formularios,
tableros y lógica dinámica.

✅ Conclusión y Siguientes Pasos
Ya tienes:
- Una SPA con navegación entre rutas sin recarga.
- Componentes nativos Web Components para cada vista.
- Estructura modular y mantenible.

Recomendaciones siguientes:
- Agrega lógica de autenticación con localStorage o backend.
- Diseña los componentes con Shadow DOM y estilos encapsulados.
- Prepara el manifest.json y service worker si decides convertir a PWA.
