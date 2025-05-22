🧩 web/public/js/components/EditableList.js

js
Copiar
Editar
export class EditableList extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
  }

  connectedCallback() {
    this.title = this.getAttribute("title") || "Lista";
    this.render();
    this.fetchItems();
  }

  render() {
    this.shadowRoot.innerHTML = `
      <style>
        ul {
          list-style: none;
          padding: 0;
        }
        li {
          background: #eef3fa;
          margin-bottom: 0.5rem;
          padding: 0.5rem 1rem;
          border-radius: 6px;
          display: flex;
          justify-content: space-between;
          align-items: center;
        }
        button {
          background-color: #0b3d91;
          color: white;
          border: none;
          padding: 4px 10px;
          border-radius: 4px;
          cursor: pointer;
          font-size: 0.9rem;
        }
        button:hover {
          background-color: #092b6d;
        }
      </style>
      <h2>${this.title}</h2>
      <ul id="items"></ul>
      <button id="refreshBtn">Actualizar Lista</button>
    `;

    this.shadowRoot
      .getElementById("refreshBtn")
      .addEventListener("click", () => this.fetchItems());
  }

  async fetchItems() {
    try {
      const res = await fetch("/api/products", {
        headers: {
          "X-User-Role": localStorage.getItem("role") || "",
        },
      });
      if (!res.ok) throw new Error("Error al obtener productos");
      const products = await res.json();

      const ul = this.shadowRoot.getElementById("items");
      ul.innerHTML = "";

      products.forEach((product) => {
        const li = document.createElement("li");
        li.textContent = `${product.name} - $${product.price.toFixed(2)}`;

        // Botón eliminar (solo si rol admin)
        if (localStorage.getItem("role") === "admin") {
          const delBtn = document.createElement("button");
          delBtn.textContent = "Eliminar";
          delBtn.onclick = async () => {
            if (confirm(`Eliminar producto "${product.name}"?`)) {
              await fetch(`/api/products/${product.id}`, {
                method: "DELETE",
                headers: {
                  "X-User-Role": "admin",
                },
              });
              this.fetchItems();
            }
          };
          li.appendChild(delBtn);
        }
        ul.appendChild(li);
      });
    } catch (error) {
      console.error(error);
      alert("No se pudo cargar la lista de productos.");
    }
  }
}

customElements.define("editable-list", EditableList);
