✅ 📋 Lista de Issues para GitHub
🧩 1. Diseño del Diagrama de Clases UML
Título:
📐 Diseño del Diagrama de Clases UML para el Sistema de Usuarios y Productos

Descripción:
Diseñar el diagrama de clases basado en los casos de uso previamente definidos del sistema. Utilizar PlantUML para representar relaciones entre clases, 
atributos con tipos (int, string, bool) y métodos principales. El diagrama debe estar ubicado en docs/analysis/diagrams/class/.

Checklist:
- Generar diagrama inicial con IA
- Refinar y corregir relaciones
- Exportar a .svg
- Incluir en class.md

Etiquetas: diseño, diagrama, uml, planificación
Asignado a: (tu usuario o compañero)
Commit vinculado: Closes #1

🧑‍💻 2. Implementación del módulo de Usuario
Título:
👤 Implementar módulo user con struct y métodos asociados

Descripción:
Crear el archivo modules/user/user.go e implementar la struct User con sus campos (ID, Nombre, Email, Activo, etc.) y métodos como Login() y UpdateProfile().

Checklist:
- Crear carpeta modules/user/.
- Crear struct User.
- Implementar métodos.
- Probar la compilación.

Etiquetas: código, usuario, struct, modulo
Asignado a: (miembro responsable)
Commit vinculado: Closes #2

🛒 3. Implementación del módulo de Productos
Título:
📦 Implementar módulo product con struct y lógica básica

Descripción:
Implementar el archivo modules/product/product.go con la struct Product y sus atributos básicos como ID, Nombre, Precio, Stock y método ActualizarStock().
Checklist:
- Crear carpeta modules/product/
- Implementar struct Product
- Añadir lógica de actualización

Etiquetas: código, producto, estructura
Asignado a: (miembro responsable)
Commit vinculado: Closes #3

🛍️ 4. Implementación del módulo del Carrito
Título:
🛒 Crear módulo cart y modelar relación entre Usuario y Productos
Descripción:
Desarrollar el módulo cart (modules/cart/cart.go) con una struct Cart que contenga una relación con User y []Product. Agregar métodos AgregarProducto() y Total().

Checklist:
- Crear struct Cart
- Incluir referencias a User y []Product
- Añadir métodos funcionales

Etiquetas: código, carrito, relaciones, struct
Asignado a: (miembro responsable)
Commit vinculado: Closes #4

📄 5. Documentación del proceso
Título:
📝 Redactar class.md con todo el proceso de modelado y reflexión

Descripción:
Documentar el proceso completo del modelado de clases, diagramas, implementación en Go, reflexión sobre el uso de IA y vínculos a los archivos del proyecto.
Checklist:
- Explicar uso de IA y herramientas
- Incluir diagrama .svg en markdown
- Mostrar fragmentos de código Go
- Redactar reflexión crítica

Etiquetas: documento, documentación, readme, evaluación
Asignado a: (miembro responsable)
Commit vinculado: Closes #5

🎯 6. Preparación de entrega y revisión final
Título:
📤 Preparar entrega final y subir .zip al repositorio

Descripción:
- Empaquetar todos los archivos del sistema, incluyendo diagrama .plantuml, .svg, código Go y documentación. 
Subir al repositorio y confirmar integridad del contenido.

Checklist:
- Comprimir estructura del proyecto
- Subir .zip al repositorio (o confirmar subida de todos los archivos)
- Verificar rutas y nombres correctos

Etiquetas: entrega, final, revisión, evaluación
Asignado a: (miembro responsable)
Commit vinculado: Closes #6

🧠 Recomendaciones para Crear los Issues en GitHub:

- Ve a la pestaña "Issues" en tu repositorio.
- Haz clic en "New Issue".
- Copia y pega cada uno de los títulos y contenidos de arriba.
- Asigna etiquetas (puedes crearlas si no existen).
- Asigna el issue a ti o a un compañero.
- Cuando completes la tarea, haz commit con un mensaje que incluya:
Closes #N (reemplaza N con el número del issue).

Aquí tienes el archivo Markdown con todos los GitHub Issues listos para copiar, pegar o imprimir como checklist:

📄 Descargar Issues-SistemaUsuariosProductos.md

- Este archivo contiene:
- Títulos claros para cada issue.
- Descripciones detalladas por módulo.
- Checklists de tareas.
- Etiquetas sugeridas.
- Vinculación de commits con Closes #X.

📋 GitHub Issues - Sistema de Usuarios y Productos

Este documento contiene los Issues necesarios para organizar y gestionar el desarrollo del proyecto Sistema de Usuarios y Productos.

