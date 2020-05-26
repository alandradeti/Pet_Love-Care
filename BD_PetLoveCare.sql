/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.19 : Database - bd_petlovecare
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_petlovecare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bd_petlovecare`;

/*Table structure for table `tb_agendamento` */

DROP TABLE IF EXISTS `tb_agendamento`;

CREATE TABLE `tb_agendamento` (
  `Id_Agendamento` int NOT NULL AUTO_INCREMENT,
  `Tipo_Agendamento` varchar(50) NOT NULL,
  `Horario_Agendamento` varchar(5) NOT NULL,
  `Vacina_Id_Vacina` int NOT NULL,
  `Pet_Id_Pet` int NOT NULL,
  `Cliente_Id_Cliente` int NOT NULL,
  `Veterinario_Id_Veterinario` int NOT NULL,
  `Data_Final_Agendamento` varchar(10) DEFAULT NULL,
  `Data_Inicial_Agendamento` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Agendamento`),
  KEY `FK_TB_Agendamento_TB_Cliente` (`Cliente_Id_Cliente`),
  KEY `FK_TB_Agendamento_TB_Veterinario` (`Veterinario_Id_Veterinario`),
  KEY `FK_TB_Agendamento_TB_Pet` (`Pet_Id_Pet`),
  CONSTRAINT `FK_TB_Agendamento_TB_Cliente` FOREIGN KEY (`Cliente_Id_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`),
  CONSTRAINT `FK_TB_Agendamento_TB_Pet` FOREIGN KEY (`Pet_Id_Pet`) REFERENCES `tb_pet` (`Id_Pet`),
  CONSTRAINT `FK_TB_Agendamento_TB_Veterinario` FOREIGN KEY (`Veterinario_Id_Veterinario`) REFERENCES `tb_veterinario` (`Id_Veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_agendamento` */

insert  into `tb_agendamento`(`Id_Agendamento`,`Tipo_Agendamento`,`Horario_Agendamento`,`Vacina_Id_Vacina`,`Pet_Id_Pet`,`Cliente_Id_Cliente`,`Veterinario_Id_Veterinario`,`Data_Final_Agendamento`,`Data_Inicial_Agendamento`) values 
(1,'Vacina','14:00',8,1,2,1,'null','25/05/2020'),
(2,'Hospedagem','10:00',0,2,3,3,'27/05/2020','26/05/2020'),
(3,'Vacina','09:00',9,2,3,2,'','28/05/2020');

/*Table structure for table `tb_carrinho` */

DROP TABLE IF EXISTS `tb_carrinho`;

CREATE TABLE `tb_carrinho` (
  `Id_Carrinho` int NOT NULL AUTO_INCREMENT,
  `Quantidade_Carrinho` int NOT NULL,
  `Preco_Carrinho` float NOT NULL,
  `Status_Carrinho` tinyint(1) NOT NULL,
  `Cliente_Id_Cliente` int NOT NULL,
  `Produto_Id_Produto` int NOT NULL,
  PRIMARY KEY (`Id_Carrinho`),
  KEY `FK_TB_Carrinho_TB_Produto` (`Produto_Id_Produto`),
  KEY `FK_TB_Carrinho_TB_Cliente` (`Cliente_Id_Cliente`),
  CONSTRAINT `FK_TB_Carrinho_TB_Cliente` FOREIGN KEY (`Cliente_Id_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`),
  CONSTRAINT `FK_TB_Carrinho_TB_Produto` FOREIGN KEY (`Produto_Id_Produto`) REFERENCES `tb_produto` (`Id_Produto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_carrinho` */

/*Table structure for table `tb_carteira_vacinacao` */

DROP TABLE IF EXISTS `tb_carteira_vacinacao`;

CREATE TABLE `tb_carteira_vacinacao` (
  `Id_Carteira_Vacinacao` int NOT NULL AUTO_INCREMENT,
  `Pet_Id_Pet` int NOT NULL,
  `Vacina_Id_Vacina` int NOT NULL,
  `Data_Pet_Vacina` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Carteira_Vacinacao`),
  KEY `FK_TB_Carteira_Vacinacao_TB_Pet` (`Pet_Id_Pet`),
  KEY `FK_TB_Carteira_Vacinacao_TB_Vacina` (`Vacina_Id_Vacina`),
  CONSTRAINT `FK_TB_Carteira_Vacinacao_TB_Pet` FOREIGN KEY (`Pet_Id_Pet`) REFERENCES `tb_pet` (`Id_Pet`),
  CONSTRAINT `FK_TB_Carteira_Vacinacao_TB_Vacina` FOREIGN KEY (`Vacina_Id_Vacina`) REFERENCES `tb_vacina` (`Id_Vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_carteira_vacinacao` */

insert  into `tb_carteira_vacinacao`(`Id_Carteira_Vacinacao`,`Pet_Id_Pet`,`Vacina_Id_Vacina`,`Data_Pet_Vacina`) values 
(1,1,8,'25/05/2020');

/*Table structure for table `tb_cliente` */

DROP TABLE IF EXISTS `tb_cliente`;

CREATE TABLE `tb_cliente` (
  `Id_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome_Cliente` varchar(50) NOT NULL,
  `CPF_Cliente` varchar(14) NOT NULL,
  `RG_Cliente` varchar(12) NOT NULL,
  `Sexo_Cliente` char(1) NOT NULL,
  `Endereco_Cliente` varchar(120) NOT NULL,
  `Email_Cliente` varchar(256) NOT NULL,
  `Telefone_Fixo_Cliente` varchar(20) NOT NULL,
  `Telefone_Celular_Cliente` varchar(20) DEFAULT NULL,
  `Data_Nascimento_Cliente` varchar(10) NOT NULL,
  `Senha_Cliente` varchar(20) NOT NULL,
  `Tipo_Cliente` tinyint(1) NOT NULL,
  `Codigo_Funcionario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_cliente` */

insert  into `tb_cliente`(`Id_Cliente`,`Nome_Cliente`,`CPF_Cliente`,`RG_Cliente`,`Sexo_Cliente`,`Endereco_Cliente`,`Email_Cliente`,`Telefone_Fixo_Cliente`,`Telefone_Celular_Cliente`,`Data_Nascimento_Cliente`,`Senha_Cliente`,`Tipo_Cliente`,`Codigo_Funcionario`) values 
(1,'Caio Cesar de Deus','446.230.050-54','27.720.508-6','M','Rua Ascenso Fernandes','caioc.deus@outlook.com','(11) 2581-2682','(11) 94128-3536','01/08/2000','123',1,'R10'),
(2,'Pablo Matheus','676.002.470-20','20.288.051-5','M','Rua Ascenso Fernandes','pablo.matheus@uol.com.br','(11) 2581-2682','(11) 94128-3536','01/08/2000','123',0,''),
(3,'Maria Silva','086.755.060-07','44.819.248-2','F','Rua Ascenso Fernandes','maria.silva@outlook.com','(11) 2581-2682','(11) 94128-3536','23/05/1988','123',0,'');

/*Table structure for table `tb_compra` */

DROP TABLE IF EXISTS `tb_compra`;

CREATE TABLE `tb_compra` (
  `Id_Compra` int NOT NULL AUTO_INCREMENT,
  `Data_Compra` varchar(10) NOT NULL,
  `Valor_Compra` float NOT NULL,
  `Cliente_ID_Cliente` int NOT NULL,
  `Tipo_Pagamento_Compra` varchar(30) NOT NULL,
  `Numero_Cartao` varchar(20) DEFAULT NULL,
  `Numero_Seguranca_Cartao` varchar(3) DEFAULT NULL,
  `Numero_Parcela` int NOT NULL,
  PRIMARY KEY (`Id_Compra`),
  KEY `FK_TB_Compra_TB_Cliente` (`Cliente_ID_Cliente`),
  CONSTRAINT `FK_TB_Compra_TB_Cliente` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_compra` */

insert  into `tb_compra`(`Id_Compra`,`Data_Compra`,`Valor_Compra`,`Cliente_ID_Cliente`,`Tipo_Pagamento_Compra`,`Numero_Cartao`,`Numero_Seguranca_Cartao`,`Numero_Parcela`) values 
(1,'25/05/2020',303,2,'Boleto','','',0),
(3,'25/05/2020',213.73,3,'Boleto','','',0),
(4,'25/05/2020',425.3,2,'Cartão','9999999999999999','341',1);

/*Table structure for table `tb_pet` */

DROP TABLE IF EXISTS `tb_pet`;

CREATE TABLE `tb_pet` (
  `Id_Pet` int NOT NULL AUTO_INCREMENT,
  `Especie_Pet` varchar(50) NOT NULL,
  `Nome_Pet` varchar(50) NOT NULL,
  `Raca_Pet` varchar(50) NOT NULL,
  `Idade_Pet` int NOT NULL,
  `Porte_Pet` varchar(50) NOT NULL,
  `Peso_Pet` float NOT NULL,
  `Altura_Pet` float NOT NULL,
  `Sexo_Pet` char(1) NOT NULL,
  `Castracao_Pet` tinyint(1) NOT NULL,
  `Cor_Pelagem_Pet` varchar(50) NOT NULL,
  `Cliente_Id_Cliente` int NOT NULL,
  PRIMARY KEY (`Id_Pet`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_pet` */

insert  into `tb_pet`(`Id_Pet`,`Especie_Pet`,`Nome_Pet`,`Raca_Pet`,`Idade_Pet`,`Porte_Pet`,`Peso_Pet`,`Altura_Pet`,`Sexo_Pet`,`Castracao_Pet`,`Cor_Pelagem_Pet`,`Cliente_Id_Cliente`) values 
(1,'Cachorro','Yasuo','Viralata',2,'Pequeno',10,30,'M',0,'Preto',2),
(2,'Gato','José','Persia',5,'Médio',12,50,'F',0,'Branco',3);

/*Table structure for table `tb_produto` */

DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `Id_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(50) NOT NULL,
  `Valor_Produto` float NOT NULL,
  `Numero_Imagem_Produto` int NOT NULL,
  `Descricao_Produto` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Produto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_produto` */

insert  into `tb_produto`(`Id_Produto`,`Nome_Produto`,`Valor_Produto`,`Numero_Imagem_Produto`,`Descricao_Produto`) values 
(2,'Hills',40.15,1,'Ração 15 kg'),
(3,'Royal Canin',50.12,2,'Ração 15 kg'),
(4,'Golden',37.05,3,'Ração 15 kg'),
(5,'Bravecto',170.22,4,'Antipulgas e Carrapatos'),
(6,'Super Secão',19.99,5,'Tapete Higiênico'),
(7,'Arranhador',144.59,6,'Para gatos'),
(8,'Areia',22.21,7,'Areia para gatos'),
(9,'Bravecto MSD',171.04,8,'Antipulgas e Carrapatos'),
(10,'Casa Furacão',54.03,9,'Casa Preta Cachorro'),
(11,'Tapete Higiênico',18.97,10,'Chalesco Premium');

/*Table structure for table `tb_vacina` */

DROP TABLE IF EXISTS `tb_vacina`;

CREATE TABLE `tb_vacina` (
  `Id_Vacina` int NOT NULL AUTO_INCREMENT,
  `Nome_Vacina` varchar(50) NOT NULL,
  `Valor_Vacina` float NOT NULL,
  `Descricao_Vacina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_vacina` */

insert  into `tb_vacina`(`Id_Vacina`,`Nome_Vacina`,`Valor_Vacina`,`Descricao_Vacina`) values 
(1,'V8',100,'Contra hepatite canina'),
(7,'Primeira Vacina',120.99,'Primo-vacinação ou primeira vacina'),
(8,'Vacina Polivalente',200,'Vacina Polivalente'),
(9,'Raiva',150,'Vacina contra raiva');

/*Table structure for table `tb_veterinario` */

DROP TABLE IF EXISTS `tb_veterinario`;

CREATE TABLE `tb_veterinario` (
  `Id_Veterinario` int NOT NULL AUTO_INCREMENT,
  `Nome_Veterinario` varchar(50) NOT NULL,
  `Cpf_Veterinario` varchar(14) NOT NULL,
  `Rg_Veterinario` varchar(12) NOT NULL,
  `Sexo_Veterinario` char(1) NOT NULL,
  `Endereco_Veterinario` varchar(120) NOT NULL,
  `Email_Veterinario` varchar(256) NOT NULL,
  `Telefone_Fixo_Veterinario` varchar(20) NOT NULL,
  `Telefone_Celular_Veterinario` varchar(20) DEFAULT NULL,
  `Data_Nascimento_Veterinario` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_veterinario` */

insert  into `tb_veterinario`(`Id_Veterinario`,`Nome_Veterinario`,`Cpf_Veterinario`,`Rg_Veterinario`,`Sexo_Veterinario`,`Endereco_Veterinario`,`Email_Veterinario`,`Telefone_Fixo_Veterinario`,`Telefone_Celular_Veterinario`,`Data_Nascimento_Veterinario`) values 
(1,'Felipe Lopes','330.584.120-61','39.729.175-9','M','Rua Lima','felipe.lopes@outlook.com','(11)2581-2682','(11)94128-3536','05/07/2000'),
(2,'Ailton Lima','439.658.940-99','49.277.278-2','M','Rua Santa Rosa de Lima','ailton.lima@gmail.com','(11) 2581-2682','(11) 94128-3536','25/12/1999'),
(3,'Amanda Souza','441.413.380-79','32.432.477-7','F','Rua Faria Lima','amanda.souza@outlook.com','(11) 2581-2682','(11) 94128-3536','22/11/1989');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
