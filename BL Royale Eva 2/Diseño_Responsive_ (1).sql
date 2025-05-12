📱 Diseño Responsive para BL Royale
🎯 Pantalla clave: Dashboard del Jugador (/dashboard)
🖥️ 1. Vista Escritorio (≥1200px)
🧩 Diseño:

- Grid de 12 columnas.
- Sidebar visible si se requiere.
- Tarjetas distribuidas horizontalmente en dos o tres columnas.
- Íconos y texto en paralelo.
- Botones grandes con etiquetas completas (“Buscar Partida”, “Ver Perfil”).

✅ Justificación:

- Aprovecha el espacio horizontal.
- Muestra más estadísticas a la vez.
- Ideal para usuarios con teclado + ratón.

📱 2. Vista Móvil (<768px)
🧩 Diseño:

- Layout en stack (apilado verticalmente).
- Tarjetas ocupan 100% del ancho.
- Íconos grandes arriba, texto centrado abajo.
- Botones convertidos a icon-button o texto más corto (“Jugar”, “Perfil”).
- Menú convertido a hamburguesa (colapsado).

✅ Justificación:

- Mejor lectura vertical, adaptado al dedo como herramienta de navegación.
- Minimiza scroll horizontal (evitado).
- Prioriza acciones rápidas y visibilidad de estado.

📱 3. Vista Tablet (768px–1199px)
🧩 Diseño:

- Tarjetas en dos columnas
- Texto reducido ligeramente (80–90% del tamaño base)
- Menú principal visible como barra superior
- Botones medianos, espaciado intermedio

✅ Justificación:

- Es un punto medio que combina lo mejor de escritorio y móvil.
- Ideal para pantallas táctiles amplias.
- Mantiene jerarquía visual sin sobrecargar.

📐 Adaptaciones Técnicas (CSS / Layout):

- Elemento	Escritorio (≥1200px)	Tablet (768–1199px)	Móvil (<768px).
- Grid	3 columnas	2 columnas	1 columna.
- NavBar	Completa	Simplificada	Hamburguesa.
- Botones	Texto completo	Texto medio	Íconos o abreviados.
- Tarjetas	Horizontales	Semiverticales	Apiladas.
- Tipografía	16–32px	14–28px	14–24px.

🧠 Justificación Global del Diseño Responsive:

🔎 ¿Por qué es importante en BL Royale?
- El juego se usará en múltiples dispositivos: PCs, tablets en streamings, móviles por jugadores casuales.
- Necesitamos una UX clara y funcional, sin importar el dispositivo.
- Favorece la retención del jugador con interfaces cómodas en cualquier entorno.

🔧 Principios aplicados:

- Mobile-first: diseño parte de lo esencial y se escala.
- Content prioritization: lo importante va primero, lo secundario se reordena o reduce.
- Touch-friendly: controles suficientemente grandes para dedos en móviles.
- Performance aware: diseño liviano para que cargue rápido en conexiones móviles.
