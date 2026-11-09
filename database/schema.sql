CREATE DATABASE IF NOT EXISTS confeitaria_doce_encanto;
USE confeitaria_doce_encanto;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    pontos_fidelidade INT DEFAULT 0,
    criado_em DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_nome VARCHAR(50) NOT NULL,
    criado_em DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE mercadorias (
    mercadoria_id INT AUTO_INCREMENT PRIMARY KEY,
    mercadoria_nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    categoria int NOT NULL,
    criado_em DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (categoria) REFERENCES categorias(categoria_id)
);

CREATE TABLE cupons (
    cupom_id INT AUTO_INCREMENT PRIMARY KEY,
    cupom_nome VARCHAR(50) NOT NULL,
    data_exp DATE NOT NULL,
    criado_em DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    cupom_id INT,
    ddata_retirada DATE NOT NULL,
    data_pedido DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (cupom_id) REFERENCES cupons(cupom_id)
);