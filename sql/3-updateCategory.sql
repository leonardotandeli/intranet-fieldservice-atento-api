ALTER TABLE BDC_CATEGORIAS
ADD COLUMN ID_CLIENTE INT AFTER NOME;

ALTER TABLE BDC_POSTS
ADD COLUMN ID_SUBCATEGORIA INT AFTER ID_CATEGORIA;

CREATE TABLE BDC_SUBCATEGORIAS (
  IDSUBCATEGORIA INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(50) NOT NULL,
  ID_CATEGORIA INT
);

ALTER TABLE BDC_CATEGORIAS
ADD CONSTRAINT FK_CATEGORIAS_CLIENTES
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTES(IDCLIENTE);

ALTER TABLE BDC_POSTS
ADD CONSTRAINT FK_POSTS_SUBCATEGORIAS
FOREIGN KEY(ID_SUBCATEGORIA)
REFERENCES BDC_SUBCATEGORIAS(IDSUBCATEGORIA);


ALTER TABLE BDC_SUBCATEGORIAS
ADD CONSTRAINT FK_CATEGORIAS_SUBCATEGORIAS
FOREIGN KEY(ID_CATEGORIA)
REFERENCES BDC_CATEGORIAS(IDCATEGORIA);


ALTER TABLE BDC_CATEGORIAS
ADD COLUMN  STATUS ENUM('ATIVO', 'INATIVO') NOT NULL AFTER NOME;

ALTER TABLE BDC_SUBCATEGORIAS
ADD COLUMN  STATUS ENUM('ATIVO', 'INATIVO') NOT NULL AFTER NOME;

ALTER TABLE BDC_POSTS
DROP FOREIGN KEY FK_BDC_CATEGORIAS;
