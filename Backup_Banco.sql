/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.20 : Database - bd_petlovecare
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
  `Horario_Agendamento` time NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_agendamento` */

insert  into `tb_agendamento`(`Id_Agendamento`,`Tipo_Agendamento`,`Horario_Agendamento`,`Vacina_Id_Vacina`,`Pet_Id_Pet`,`Cliente_Id_Cliente`,`Veterinario_Id_Veterinario`,`Data_Final_Agendamento`,`Data_Inicial_Agendamento`) values 
(5,'Consulta','14:30:00',0,3,10,3,'0000-00-00','0000-00-00');

/*Table structure for table `tb_carteira_vacinacao` */

DROP TABLE IF EXISTS `tb_carteira_vacinacao`;

CREATE TABLE `tb_carteira_vacinacao` (
  `Pet_Id_Pet` int NOT NULL,
  `Vacina_Id_Vacina` int NOT NULL,
  KEY `FK_TB_Carteira_Vacinacao_TB_Pet` (`Pet_Id_Pet`),
  KEY `FK_TB_Carteira_Vacinacao_TB_Vacina` (`Vacina_Id_Vacina`),
  CONSTRAINT `FK_TB_Carteira_Vacinacao_TB_Pet` FOREIGN KEY (`Pet_Id_Pet`) REFERENCES `tb_pet` (`Id_Pet`),
  CONSTRAINT `FK_TB_Carteira_Vacinacao_TB_Vacina` FOREIGN KEY (`Vacina_Id_Vacina`) REFERENCES `tb_vacina` (`Id_Vacina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_carteira_vacinacao` */

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
  `Telefone_Fixo_Cliente` varchar(13) NOT NULL,
  `Telefone_Celular_Cliente` varchar(14) NOT NULL,
  `Data_Nascimento_Cliente` varchar(10) NOT NULL,
  `Senha_Cliente` varchar(20) NOT NULL,
  `Tipo_Cliente` tinyint(1) NOT NULL,
  `Codigo_Funcionario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_cliente` */

insert  into `tb_cliente`(`Id_Cliente`,`Nome_Cliente`,`CPF_Cliente`,`RG_Cliente`,`Sexo_Cliente`,`Endereco_Cliente`,`Email_Cliente`,`Telefone_Fixo_Cliente`,`Telefone_Celular_Cliente`,`Data_Nascimento_Cliente`,`Senha_Cliente`,`Tipo_Cliente`,`Codigo_Funcionario`) values 
(9,'Ailton Lima','999.999.999-99','88.888.888-8','M','Rua de Teste, 999','ailton@teste.com','118888-8888','1198888-8888','1999-12-15','123',1,'R10'),
(10,'Pablo','777.777.777-77','55.555.555-5','M','Rua teste2, 888','pablo@teste.com','115555-5555','1195555-5555','2000-07-12','123',0,''),
(11,'Scarpim','111.111.111-11','11.111.111-1','M','Rua de Teste','scarpim@teste.com','223333-3333','2243333-3333','2000-01-15','123',1,'R11');

/*Table structure for table `tb_compra` */

DROP TABLE IF EXISTS `tb_compra`;

CREATE TABLE `tb_compra` (
  `Id_Compra` int NOT NULL AUTO_INCREMENT,
  `Data_Compra` varchar(10) NOT NULL,
  `Valor_Compra` float NOT NULL,
  `Cliente_ID_Cliente` int NOT NULL,
  PRIMARY KEY (`Id_Compra`),
  KEY `FK_TB_Compra_TB_Cliente` (`Cliente_ID_Cliente`),
  CONSTRAINT `FK_TB_Compra_TB_Cliente` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_compra` */

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_pet` */

insert  into `tb_pet`(`Id_Pet`,`Especie_Pet`,`Nome_Pet`,`Raca_Pet`,`Idade_Pet`,`Porte_Pet`,`Peso_Pet`,`Altura_Pet`,`Sexo_Pet`,`Castracao_Pet`,`Cor_Pelagem_Pet`,`Cliente_Id_Cliente`) values 
(3,'Cachorro','Rogerinho','Rottweiler',2,'Grande',50,50,'M',1,'Preto',10),
(5,'Gato','Robson','Persa',2,'Pequeno',20,30,'M',1,'Branco',10),
(6,'Cachorro','Roberval','Chow-Chow',3,'Médio',40,50,'M',0,'Preto',10),
(7,'Gato','Robson','Ribamar',4,'Grande',50,90,'M',0,'Rosa',10),
(8,'Cachorro','Gameplays','Vira lata',6,'Pequeno',10,50,'M',1,'Preto',10),
(10,'Gato','Felipa','Felipeano',50,'Pequeno',10,20,'F',0,'Rosa',9),
(11,'Cachorro','Juliana','Chow-Chow',10,'Médio',40,100,'F',1,'Marrom',9);

/*Table structure for table `tb_produto` */

DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `Id_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(50) NOT NULL,
  `Valor_Produto` float NOT NULL,
  `Quantidade_Estoque_Produto` int NOT NULL,
  `Numero_Imagem_Produto` int NOT NULL,
  `Descricao_Produto` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Produto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_produto` */

insert  into `tb_produto`(`Id_Produto`,`Nome_Produto`,`Valor_Produto`,`Quantidade_Estoque_Produto`,`Numero_Imagem_Produto`,`Descricao_Produto`) values 
(4,'Amendoim10',50,40,5,'Teste'),
(8,'Teste4',100,50,1,'Roberval4'),
(9,'Sabone',50,40,6,'teste');

/*Table structure for table `tb_vacina` */

DROP TABLE IF EXISTS `tb_vacina`;

CREATE TABLE `tb_vacina` (
  `Id_Vacina` int NOT NULL AUTO_INCREMENT,
  `Nome_Vacina` varchar(50) NOT NULL,
  `Valor_Vacina` float NOT NULL,
  `Descricao_Vacina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_vacina` */

insert  into `tb_vacina`(`Id_Vacina`,`Nome_Vacina`,`Valor_Vacina`,`Descricao_Vacina`) values 
(53,'asdasd10',16,'sdssfdsfsd'),
(56,'asdasd',16,'sdssfdsfsd');

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
  `Telefone_Fixo_Veterinario` varchar(13) DEFAULT NULL,
  `Telefone_Celular_Veterinario` varchar(14) NOT NULL,
  `Data_Nascimento_Veterinario` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_veterinario` */

insert  into `tb_veterinario`(`Id_Veterinario`,`Nome_Veterinario`,`Cpf_Veterinario`,`Rg_Veterinario`,`Sexo_Veterinario`,`Endereco_Veterinario`,`Email_Veterinario`,`Telefone_Fixo_Veterinario`,`Telefone_Celular_Veterinario`,`Data_Nascimento_Veterinario`) values 
(3,'Felipe','222.222.222-22','11.111.111-1','M','Rua de Teste, 222','felipe@teste.com','113333-3333','1143333-3333','2000-03-01'),
(4,'TESTE COMPLETO','TESTE COMPLETO','SDFDSF','M','RUA ','DFDSFSD','11965465','16516515','1999-12-15');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
