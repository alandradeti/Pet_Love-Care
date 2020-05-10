-- Criar e excluir o Banco.
Create Schema BD_PetLoveCare;
-- DROP Schema PetLoveCare;

-- Usar este Banco.
USE BD_PetLoveCare;

-- DDL(Data Definition Language)
-- Para melhor controle de Tabelas.
/*
Drop Table TB_Agendamento;
Drop Table TB_Compra;
Drop Table TB_Carteira_Vacinacao;
Drop Table TB_Pet;
Drop Table TB_Vacina;
Drop Table TB_Agendamento;
Drop Table TB_Veterinario;
Drop Table TB_Cliente;
*/

-- ==================================================== CRIAÇÃO DAS TABELAS =========================================================== --

CREATE TABLE TB_Produto (
    ID_Produto						INT(5) 				NOT NULL 		AUTO_INCREMENT, 
    Nome_Produto 					Varchar(50) 		NOT NULL,
    Valor_Produto 					FLOAT(5) 		 	NOT NULL,
    Quantidade_Produto				INT(4)				NOT NULL,
    Quantidade_Estoque_Produto  	INT(4) 				NOT NULL,
    
    PRIMARY KEY (ID_Produto)
);

CREATE TABLE TB_Compra (
	ID_Compra 					INT(10) 			NOT NULL 		AUTO_INCREMENT,
    Data_Compra					DATE 				NOT NULL,
    Valor_Compra				FLOAT(6)			NOT NULL,
    Cliente_ID_Cliente 			INT(5) 				NOT NULL,
    Produto_ID_Produto			INT(5)				NOT NULL,
    
    PRIMARY KEY (ID_Compra)
);

CREATE TABLE TB_Vacina (
    ID_Vacina 						INT(5) 				NOT NULL 		AUTO_INCREMENT,
	Nome_Vacina 					VARCHAR(50) 		NOT NULL,
    Valor_Vacina 					FLOAT(6) 			NOT NULL,
    Quantidade_Estoque_Vacina 		INT(4) 				NOT NULL,
    Descricao_Vacina 				VARCHAR(255) 		NULL,
    
	PRIMARY KEY (ID_Vacina)
);

CREATE TABLE TB_Agendamento (
    ID_Agendamento 						INT(5) 				NOT NULL 		AUTO_INCREMENT,
    Tipo_Agendamento 					VARCHAR(50) 		NOT NULL,
    Data_Agendamento 					DATE 				NOT NULL,
    Horario_Agendamento 				TIME 				NOT NULL,
    Vacina_ID_Vacina					INT(5)				NULL,
    Pet_ID_Pet 							INT(5)				NOT NULL,
    Cliente_ID_Cliente 					INT(5) 				NOT NULL,
    Veterinario_ID_Veterinario 			INT(5)				NOT NULL,
    
    PRIMARY KEY (ID_Agendamento)
);


CREATE TABLE TB_Veterinario (
    ID_Veterinario 						INT(5) 				NOT NULL 		AUTO_INCREMENT,
    Nome_Veterinario 					VARCHAR(50) 		NOT NULL,
    Cpf_Veterinario						VARCHAR(14) 		NOT NULL,
    Rg_Veterinario						VARCHAR(12) 		NOT NULL,
    Sexo_Veterinario 					CHAR(1) 			NOT NULL,
    Endereco_Veterinario 				VARCHAR(120) 		NOT NULL,
    Email_Veterinario 					VARCHAR(256) 		NOT NULL,
    Telefone_Fixo_Veterinario			VARCHAR(13)			NOT NULL,
    Telefone_Celular_Veterinario 		VARCHAR(14)			NULL,
    Senha_Veterinario					VARCHAR(20)			NOT NULL,
    
    PRIMARY KEY (ID_Veterinario)
);

CREATE TABLE TB_Cliente (
    ID_Cliente 						INT(5) 				NOT NULL 		AUTO_INCREMENT,
    Nome_Cliente 					VARCHAR(50) 		NOT NULL,
    CPF_Cliente 					VARCHAR(14) 		NOT NULL,
    RG_Cliente 						VARCHAR(12) 		NOT NULL,
    Sexo_Cliente 					CHAR(1) 			NOT NULL,
    Endereco_Cliente 				VARCHAR(120) 		NOT NULL,
    Email_Cliente 					VARCHAR(256) 		NOT NULL,
    Telefone_Fixo_Cliente 			VARCHAR(13) 		NOT NULL,
    Telefone_Celular_Cliente 		VARCHAR(14) 		NOT NULL,
    Senha_Cliente					VARCHAR(20)			NOT NULL,
    
    PRIMARY KEY (ID_Cliente)
);

CREATE TABLE TB_Pet (
    ID_Pet 				INT(5) 				NOT NULL   AUTO_INCREMENT,
    Especie_Pet 		VARCHAR(50) 		NOT NULL,
    Nome_Pet 			VARCHAR(50) 		NOT NULL,
    Raca_Pet			VARCHAR(50) 		NOT NULL,
    Idade_Pet 			INT(3) 				NOT NULL,
    Porte_Pet			VARCHAR(50) 		NOT NULL,
    Peso_Pet			FLOAT(5) 			NOT NULL,
    Altura_Pet 			FLOAT(5) 			NOT NULL,
    Sexo_Pet 			CHAR(1) 			NOT NULL,
    Castracao_Pet		BOOLEAN 			NOT NULL,
    Cor_Pelagem_Pet 	VARCHAR(50) 		NOT NULL,
    
    PRIMARY KEY (ID_Pet)
);

CREATE TABLE TB_Carteira_Vacinacao (
    Pet_ID_Pet 				INT(5) 		NOT NULL,
    Vacina_ID_Vacina		INT(5)		NOT NULL
);

-- ==================================================== CRIAÇÃO DAS CONSTRAINTS =========================================================== --

ALTER TABLE TB_Compra
Add Constraint FK_TB_Compra_TB_Cliente 				FOREIGN KEY (Cliente_ID_Cliente) 			REFERENCES TB_Cliente (ID_Cliente),
Add Constraint FK_TB_Compra_TB_Produto 				FOREIGN KEY (Produto_ID_Produto) 			REFERENCES TB_Produto (ID_Produto);

ALTER TABLE TB_Agendamento
ADD CONSTRAINT FK_TB_Agendamento_TB_Cliente 		FOREIGN KEY (Cliente_ID_Cliente) 			REFERENCES TB_Cliente (ID_Cliente),
ADD CONSTRAINT FK_TB_Agendamento_TB_Veterinario 	FOREIGN KEY (Veterinario_ID_Veterinario) 	REFERENCES TB_Veterinario (ID_Veterinario),
ADD CONSTRAINT FK_TB_Agendamento_TB_Pet 			FOREIGN KEY (Pet_ID_Pet) 					REFERENCES TB_Pet (ID_Pet);

ALTER TABLE TB_Carteira_Vacinacao
ADD CONSTRAINT FK_TB_Carteira_Vacinacao_TB_Pet				FOREIGN KEY (Pet_ID_Pet) 					REFERENCES TB_Pet(ID_Pet),
ADD CONSTRAINT FK_TB_Carteira_Vacinacao_TB_Vacina 			FOREIGN KEY (Vacina_ID_Vacina) 				REFERENCES TB_Vacina(ID_Vacina);


-- ==================================================== CRIAÇÃO DAS VIEWS =========================================================== --

CREATE VIEW VW_Agendamento
AS   
SELECT *  
FROM 	TB_Agendamento A  
		INNER JOIN
        TB_Pet P ON A.Pet_ID_Pet = P.ID_Pet
		INNER JOIN
        TB_Cliente C ON A.Cliente_ID_Cliente = C.ID_Cliente
        INNER JOIN
        TB_Veterinario V ON A.Veterinario_ID_Veterinario = V.ID_Veterinario;
        
CREATE VIEW VW_Compra
AS   
SELECT *  
FROM 	TB_Compra Co 
		INNER JOIN
        TB_Cliente Cl ON Co.Cliente_ID_Cliente = Cl.ID_Cliente
		INNER JOIN
        TB_Produto P ON Co.Produto_ID_Produto = P.ID_Produto;
        
CREATE VIEW VW_Carteira_Vacinacao
AS   
SELECT *  
FROM 	TB_Carteira_Vacinacao C 
		INNER JOIN
        TB_Pet P ON C.Pet_ID_Pet = P.ID_Pet
		INNER JOIN
        TB_Vacina V ON C.Vacina_ID_Vacina = V.ID_Vacina;
