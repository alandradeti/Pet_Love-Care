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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `tb_produto` */

DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `Id_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(50) NOT NULL,
  `Valor_Produto` float NOT NULL,
  `Numero_Imagem_Produto` int NOT NULL,
  `Descricao_Produto` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `tb_vacina` */

DROP TABLE IF EXISTS `tb_vacina`;

CREATE TABLE `tb_vacina` (
  `Id_Vacina` int NOT NULL AUTO_INCREMENT,
  `Nome_Vacina` varchar(50) NOT NULL,
  `Valor_Vacina` float NOT NULL,
  `Descricao_Vacina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Vacina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
