# 📚 Importa as bibliotecas necessárias
import json       # Manipulação de dados em formato JSON
import sqlite3    # Conexão e operações com banco de dados SQLite
import os         # Verificação e remoção de arquivos

# 🧱 Define a classe Produto com atributos e métodos
class Produto:
    # Método inicializa o objeto Produto com seus atributos
    def __init__(self, id, nome, categoria, quantidade, preco, fornecedor):
        self.id = id
        self.nome = nome
        self.categoria = categoria
        self.quantidade = quantidade
        self.preco = preco
        self.fornecedor = fornecedor

    # Método converte o objeto Produto em dicionário (usado para exportação em JSON)
    def to_dict(self):
        return {
            "id": self.id,
            "nome": self.nome,
            "categoria": self.categoria,
            "quantidade": self.quantidade,
            "preco": self.preco,
            "fornecedor": self.fornecedor
        }

    # Método define a representação em string do objeto (usado ao imprimir)
    def __str__(self):
        return (f"{self.id} - {self.nome} ({self.categoria}) | "
                f"Qtd: {self.quantidade} | R${self.preco:.2f} | "
                f"Fornecedor: {self.fornecedor}")

# 🛒 Cria uma lista inicial de produtos
produtos = [
    Produto(1, "Caneta", "Papelaria", 100, 2.50, "OfficeMax"),
    Produto(2, "Caderno", "Papelaria", 50, 15.90, "Faber"),
    Produto(3, "Borracha", "Papelaria", 200, 1.20, "Mercur")
]

# ➕ Adiciona novos produtos à lista existente
produtos.append(Produto(4, "Marcador", "Papelaria", 80, 4.75, "Pilot"))
produtos.append(Produto(5, "Grampeador", "Escritório", 30, 22.90, "Tramontina"))


# 🧬 Serializa os produtos para JSON e exibe no terminal
json_produtos = json.dumps([p.to_dict() for p in produtos], indent=4)
print("📦 Produtos em JSON:")
print(json_produtos)

# 🗑️ Remove o banco de dados anterior, se existir
if os.path.exists("produtos.db"):
    os.remove("produtos.db")

# 🔌 Conecta ao banco de dados SQLite (cria o arquivo automaticamente)
conn = sqlite3.connect("produtos.db")
cursor = conn.cursor()

# 🧱 Cria a tabela 'produtos' com os campos correspondentes à classe Produto
cursor.execute("""
CREATE TABLE IF NOT EXISTS produtos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    categoria TEXT,
    quantidade INTEGER,
    preco REAL,
    fornecedor TEXT
)
""")

# 📥 Insere os produtos na tabela (substitui se o ID já existir)
for p in produtos:
    cursor.execute("""
        INSERT OR REPLACE INTO produtos 
        (id, nome, categoria, quantidade, preco, fornecedor)
        VALUES (?, ?, ?, ?, ?, ?)
    """, (p.id, p.nome, p.categoria, p.quantidade, p.preco, p.fornecedor))

# 💾 Salva as alterações no banco
conn.commit()

# 🔍 Consulta todos os produtos e exibe no terminal
print("\n📊 Produtos no banco de dados:")
cursor.execute("SELECT * FROM produtos")

# 🔄 Reconstrói os objetos Produto a partir dos dados do banco
for row in cursor.fetchall():
    produto = Produto(*row)  # Desempacota os dados diretamente nos atributos
    print(produto)

# 🔒 Encerra a conexão com o banco
conn.close()
