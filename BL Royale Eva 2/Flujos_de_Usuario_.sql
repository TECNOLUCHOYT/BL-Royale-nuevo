🖥️ Descripción del Servicio (MPA - Multi-Page Application)
En una MPA, cada vez que el usuario navega a una nueva página, el cliente (navegador)
realiza una solicitud al servidor, y el servidor devuelve un HTML completo correspondiente a esa ruta.

¿Cómo funciona este enfoque?
- El usuario solicita una URL específica (/dashboard, /login, etc.).
- El servidor interpreta la ruta y genera una página HTML con contenido dinámico (puede incluir templates y datos).
- El navegador reemplaza por completo la vista actual con el nuevo HTML recibido.
- Se recargan los recursos necesarios (CSS, JS, imágenes) si no están cacheados.

✅ Ventajas del Enfoque MPA
- SEO-friendly: Perfecto para indexación por motores de búsqueda (contenido ya está renderizado en HTML).
- Simplicidad: Menor complejidad en el frontend; lógica y renderizado concentrados en el backend.
- Seguridad: Mejor control desde el servidor sobre lo que se entrega.
- Compatibilidad universal: Funciona bien en navegadores antiguos o sin JavaScript.

❌ Desventajas del Enfoque MPA:
- Experiencia de usuario menos fluida: Recarga completa de la página al cambiar de ruta.
- Mayor carga en el servidor: Cada interacción requiere procesamiento y entrega de una nueva página.
- Desempeño más bajo en apps interactivas: Cada clic implica una nueva conexión con el servidor.
- Difícil mantener estado entre páginas sin soluciones adicionales como sesiones persistentes.

🧭 Flujos de Usuario en BL Royale (MPA)
A continuación se describe una serie de flujos con lógica clara para el usuario en el juego BL Royale, siguiendo una estructura MPA (cada vista es una página):

🔐 Flujo 1: Autenticación
Objetivo: Acceder al juego User Flow:

- Usuario accede a / (Pantalla de inicio)
- Hace clic en Iniciar sesión → /login
- Introduce datos → clic en "Entrar"
- Si éxito → /dashboard
- Si error → /login?error=1

🧑‍🎮 Flujo 2: Prepararse para jugar
Objetivo: Buscar partida y comenzar el juego
User Flow:
- Desde /dashboard, clic en "Buscar partida"
- Redirige a /matchmaking
- El sistema empareja jugadores y redirige a /game cuando se forma el grupo

🎮 Flujo 3: Juego activo
Objetivo: Jugar una partida
User Flow:
- Página /game muestra interfaz de combate o estrategia
- El usuario interactúa (acciones, turnos, etc.)
- Al finalizar la partida:
- Gana → redirige a /dashboard?status=win.
- Pierde → redirige a /dashboard?status=lose.

👤 Flujo 4: Gestión de perfil
Objetivo: Consultar o modificar información del jugador
User Flow:
- Desde cualquier página, clic en "Perfil"
- Redirige a /profile
- El usuario edita información, consulta estadísticas, etc.
INICIO (/) 
 ├─▶ LOGIN (/login) ──▶ DASHBOARD (/dashboard)
 │                     ├─▶ MATCHMAKING (/matchmaking) ──▶ GAME (/game)
 │                     └─▶ PERFIL (/profile)
 └─▶ REGISTER (/register)
Cobertura completa de los flujos de usuario y casos de uso de BL Royale, vamos a basarnos en los requerimientos típicos de un juego
competitivo online con gestión de usuarios, emparejamiento y partidas.

Esta cobertura abarca:
- Tareas principales del jugador
- Casos de uso esenciales
- Cómo están representadas en los flujos (vistos en la arquitectura MPA)

🛡️ Cobertura Funcional Completa - BL Royale (MPA)
1. Registro e Ingreso
Caso de uso: El jugador se registra o inicia sesión para acceder al sistema.
Flujos involucrados:
- /register: Registro de nuevo usuario.
- /login: Autenticación de usuario existente.
- Redirección a /dashboard al finalizar.

2. Dashboard del Jugador
Caso de uso: Visualizar resumen de cuenta, estadísticas, acceso rápido a funciones.
Flujos involucrados:
- /dashboard: Pantalla principal post-login.

Incluye botones para:
- Ver perfil
- Buscar partida
- Revisar historial o resultados anteriores

3. Emparejamiento / Matchmaking
Caso de uso: El jugador inicia el proceso para encontrar una partida.
Flujos involucrados:
- Desde /dashboard, el jugador accede a /matchmaking.
- El sistema hace el emparejamiento y redirige a /game.

4. Juego en Curso
Caso de uso: El jugador participa activamente en una partida.
Flujos involucrados:
- /game: Pantalla con la lógica del juego.
- Permite: acciones de combate, recolección, movimientos, etc.
- Al finalizar: redirige a /dashboard con resultado (?status=win/lose/draw).

5. Gestión de Perfil: 
Caso de uso: El jugador consulta o edita su información personal.
Flujos involucrados:
- Desde cualquier vista, clic en perfil redirige a /profile.
- Puede editar nombre, avatar, consultar estadísticas, historial, etc.

6. Desconexión / Cierre de Sesión
Caso de uso: El jugador finaliza su sesión por decisión propia.
Flujos involucrados:
- Opción de cerrar sesión desde nav-bar o /profile.
- Redirige a / y limpia sesión (localStorage, cookies o token en el backend).

📋 Cobertura en Casos de Uso
Módulo	Página	Casos de Uso Cubiertos
Inicio	/	Acceso general, navegación, presentación del juego
Registro	/register	Alta de nuevos usuarios
Login	/login	Autenticación y validación de sesión
Dashboard	/dashboard	Visualización de estado, navegación principal
Matchmaking	/matchmaking	Búsqueda de partidas, conexión con jugadores
Juego	/game	Juego activo: ejecución de combate o dinámicas del juego
Perfil	/profile	Consulta y edición de datos del jugador
Cierre sesión	Cualquier vista	Salida del sistema, limpieza de sesión

🔁 Diagrama de Cobertura General (Textual)
css
Copiar
Editar
[Inicio] 
  ├─▶ [Registro] ─┐
  └─▶ [Login] ───▶ [Dashboard]
                         ├─▶ [Matchmaking] ──▶ [Juego]
                         ├─▶ [Perfil]
                         └─▶ [Cerrar Sesión] ──▶ [Inicio]
✅ ¿Qué tareas quedan cubiertas?
✔ Registro e ingreso seguro. 
✔ Visualización centralizada de funciones (dashboard). 
✔ Búsqueda y emparejamiento para partidas. 
✔ Juego en tiempo real o por turnos. 
✔ Gestión y personalización de perfil. 
✔ Cierre de sesión y retorno a inicio. 
