CREATE SCHEMA styloh;
USE styloh;

CREATE TABLE usuarios (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    preco varchar (50) NOT NULL,
    sub_total  varchar (50) NOT NULL,
    imagem_url VARCHAR(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_user)
);




select * from usuarios;
select * from produtos;	
/*drop Schema styloh;*/