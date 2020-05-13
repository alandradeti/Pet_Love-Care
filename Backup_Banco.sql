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
  `Data_Agendamento` date NOT NULL,
  `Horario_Agendamento` time NOT NULL,
  `Vacina_Id_Vacina` int DEFAULT NULL,
  `Pet_Id_Pet` int NOT NULL,
  `Cliente_Id_Cliente` int NOT NULL,
  `Veterinario_Id_Veterinario` int NOT NULL,
  PRIMARY KEY (`Id_Agendamento`),
  KEY `FK_TB_Agendamento_TB_Cliente` (`Cliente_Id_Cliente`),
  KEY `FK_TB_Agendamento_TB_Veterinario` (`Veterinario_Id_Veterinario`),
  KEY `FK_TB_Agendamento_TB_Pet` (`Pet_Id_Pet`),
  CONSTRAINT `FK_TB_Agendamento_TB_Cliente` FOREIGN KEY (`Cliente_Id_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`),
  CONSTRAINT `FK_TB_Agendamento_TB_Pet` FOREIGN KEY (`Pet_Id_Pet`) REFERENCES `tb_pet` (`Id_Pet`),
  CONSTRAINT `FK_TB_Agendamento_TB_Veterinario` FOREIGN KEY (`Veterinario_Id_Veterinario`) REFERENCES `tb_veterinario` (`Id_Veterinario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_agendamento` */

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
  `Data_Nascimento_Cliente` date NOT NULL,
  `Senha_Cliente` varchar(20) NOT NULL,
  `Tipo_Cliente` tinyint(1) NOT NULL,
  `Codigo_Funcionario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_cliente` */

insert  into `tb_cliente`(`Id_Cliente`,`Nome_Cliente`,`CPF_Cliente`,`RG_Cliente`,`Sexo_Cliente`,`Endereco_Cliente`,`Email_Cliente`,`Telefone_Fixo_Cliente`,`Telefone_Celular_Cliente`,`Data_Nascimento_Cliente`,`Senha_Cliente`,`Tipo_Cliente`,`Codigo_Funcionario`) values 
(9,'Ailton Lima','999.999.999-99','88.888.888-8','M','Rua de Teste, 999','ailton@teste.com','118888-8888','1198888-8888','1999-12-15','123',1,'R10'),
(10,'Pablo','777.777.777-77','55.555.555-5','M','Rua teste2, 888','pablo@teste.com','115555-5555','1195555-5555','2000-07-12','123',0,''),
(11,'Scarpim','111.111.111-11','11.111.111-1','M','Rua de Teste','scarpim@teste.com','223333-3333','2243333-3333','2000-01-15','123',1,'R11');

/*Table structure for table `tb_compra` */

DROP TABLE IF EXISTS `tb_compra`;

CREATE TABLE `tb_compra` (
  `Id_Compra` int NOT NULL AUTO_INCREMENT,
  `Data_Compra` date NOT NULL,
  `Valor_Compra` float NOT NULL,
  `Cliente_ID_Cliente` int NOT NULL,
  `Produto_ID_Produto` int NOT NULL,
  PRIMARY KEY (`Id_Compra`),
  KEY `FK_TB_Compra_TB_Cliente` (`Cliente_ID_Cliente`),
  KEY `FK_TB_Compra_TB_Produto` (`Produto_ID_Produto`),
  CONSTRAINT `FK_TB_Compra_TB_Cliente` FOREIGN KEY (`Cliente_ID_Cliente`) REFERENCES `tb_cliente` (`Id_Cliente`),
  CONSTRAINT `FK_TB_Compra_TB_Produto` FOREIGN KEY (`Produto_ID_Produto`) REFERENCES `tb_produto` (`Id_Produto`)
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_pet` */

insert  into `tb_pet`(`Id_Pet`,`Especie_Pet`,`Nome_Pet`,`Raca_Pet`,`Idade_Pet`,`Porte_Pet`,`Peso_Pet`,`Altura_Pet`,`Sexo_Pet`,`Castracao_Pet`,`Cor_Pelagem_Pet`,`Cliente_Id_Cliente`) values 
(3,'Cachorro','Rogerinho','Rottweiler',2,'Grande',50,50,'M',1,'Preto',10),
(4,'Cachorro','Magrelim','Salsicha',3,'Pequeno',20,20,'M',0,'Caramelo',10),
(5,'Gato','Robson','Persa',2,'Pequeno',20,30,'M',1,'Branco',10),
(6,'Cachorro','Roberval','Chow-Chow',3,'Médio',40,50,'M',0,'Preto',10),
(7,'Gato','Thompson','Ribamar',4,'Grande',50,90,'M',0,'Rosa',10);

/*Table structure for table `tb_produto` */

DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `Id_Produto` int NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(50) NOT NULL,
  `Valor_Produto` float NOT NULL,
  `Quantidade_Produto` int NOT NULL,
  `Quantidade_Estoque_Produto` int NOT NULL,
  `Descricao_Produto` varchar(255) NOT NULL,
  `Imagem_Produto` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_produto` */

/*Table structure for table `tb_vacina` */

DROP TABLE IF EXISTS `tb_vacina`;

CREATE TABLE `tb_vacina` (
  `Id_Vacina` int NOT NULL AUTO_INCREMENT,
  `Nome_Vacina` varchar(50) NOT NULL,
  `Valor_Vacina` float NOT NULL,
  `Quantidade_Estoque_Vacina` int NOT NULL,
  `Descricao_Vacina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Vacina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_vacina` */

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
  `Data_Nascimento_Veterinario` date NOT NULL,
  PRIMARY KEY (`Id_Veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_veterinario` */

insert  into `tb_veterinario`(`Id_Veterinario`,`Nome_Veterinario`,`Cpf_Veterinario`,`Rg_Veterinario`,`Sexo_Veterinario`,`Endereco_Veterinario`,`Email_Veterinario`,`Telefone_Fixo_Veterinario`,`Telefone_Celular_Veterinario`,`Data_Nascimento_Veterinario`) values 
(1,'dsfdsfsd','dsfdsfds','dsfsdfdsf','M','dsfdsfsds','dsfdsf@sdasdasd','6549832','asdasdsad','1999-12-15'),
(2,'Teste','999.999.999-99','88.888.888-8','M','Rua Teste','testando@teste.com','114444-4444','1165555-5555','2000-11-15'),
(3,'Felipe','222.222.222-22','11.111.111-1','M','Rua de Teste, 222','felipe@teste.com','113333-3333','1143333-3333','2000-03-01');

/*Table structure for table `vw_agendamento` */

DROP TABLE IF EXISTS `vw_agendamento`;

/*!50001 DROP VIEW IF EXISTS `vw_agendamento` */;
/*!50001 DROP TABLE IF EXISTS `vw_agendamento` */;

/*!50001 CREATE TABLE  `vw_agendamento`(
 `Id_Agendamento` int ,
 `Tipo_Agendamento` varchar(50) ,
 `Data_Agendamento` date ,
 `Horario_Agendamento` time ,
 `Vacina_Id_Vacina` int ,
 `Pet_Id_Pet` int ,
 `Cliente_Id_Cliente` int ,
 `Veterinario_Id_Veterinario` int ,
 `Id_Pet` int ,
 `Especie_Pet` varchar(50) ,
 `Nome_Pet` varchar(50) ,
 `Raca_Pet` varchar(50) ,
 `Idade_Pet` int ,
 `Porte_Pet` varchar(50) ,
 `Peso_Pet` float ,
 `Altura_Pet` float ,
 `Sexo_Pet` char(1) ,
 `Castracao_Pet` tinyint(1) ,
 `Cor_Pelagem_Pet` varchar(50) ,
 `Id_Cliente` int ,
 `Nome_Cliente` varchar(50) ,
 `CPF_Cliente` varchar(14) ,
 `RG_Cliente` varchar(12) ,
 `Sexo_Cliente` char(1) ,
 `Endereco_Cliente` varchar(120) ,
 `Email_Cliente` varchar(256) ,
 `Telefone_Fixo_Cliente` varchar(13) ,
 `Telefone_Celular_Cliente` varchar(14) ,
 `Data_Nascimento_Cliente` date ,
 `Senha_Cliente` varchar(20) ,
 `Tipo_Cliente` tinyint(1) ,
 `Codigo_Funcionario` varchar(10) ,
 `Id_Veterinario` int ,
 `Nome_Veterinario` varchar(50) ,
 `Cpf_Veterinario` varchar(14) ,
 `Rg_Veterinario` varchar(12) ,
 `Sexo_Veterinario` char(1) ,
 `Endereco_Veterinario` varchar(120) ,
 `Email_Veterinario` varchar(256) ,
 `Telefone_Fixo_Veterinario` varchar(13) ,
 `Telefone_Celular_Veterinario` varchar(14) ,
 `Data_Nascimento_Veterinario` date 
)*/;

/*Table structure for table `vw_compra` */

DROP TABLE IF EXISTS `vw_compra`;

/*!50001 DROP VIEW IF EXISTS `vw_compra` */;
/*!50001 DROP TABLE IF EXISTS `vw_compra` */;

/*!50001 CREATE TABLE  `vw_compra`(
 `Id_Compra` int ,
 `Data_Compra` date ,
 `Valor_Compra` float ,
 `Cliente_ID_Cliente` int ,
 `Produto_ID_Produto` int ,
 `Id_Cliente` int ,
 `Nome_Cliente` varchar(50) ,
 `CPF_Cliente` varchar(14) ,
 `RG_Cliente` varchar(12) ,
 `Sexo_Cliente` char(1) ,
 `Endereco_Cliente` varchar(120) ,
 `Email_Cliente` varchar(256) ,
 `Telefone_Fixo_Cliente` varchar(13) ,
 `Telefone_Celular_Cliente` varchar(14) ,
 `Data_Nascimento_Cliente` date ,
 `Senha_Cliente` varchar(20) ,
 `Tipo_Cliente` tinyint(1) ,
 `Codigo_Funcionario` varchar(10) ,
 `Id_Produto` int ,
 `Nome_Produto` varchar(50) ,
 `Valor_Produto` float ,
 `Quantidade_Produto` int ,
 `Quantidade_Estoque_Produto` int ,
 `Descricao_Produto` varchar(255) ,
 `Imagem_Produto` varchar(255) 
)*/;

/*Table structure for table `vw_carteira_vacinacao` */

DROP TABLE IF EXISTS `vw_carteira_vacinacao`;

/*!50001 DROP VIEW IF EXISTS `vw_carteira_vacinacao` */;
/*!50001 DROP TABLE IF EXISTS `vw_carteira_vacinacao` */;

/*!50001 CREATE TABLE  `vw_carteira_vacinacao`(
 `Pet_Id_Pet` int ,
 `Vacina_Id_Vacina` int ,
 `Id_Pet` int ,
 `Especie_Pet` varchar(50) ,
 `Nome_Pet` varchar(50) ,
 `Raca_Pet` varchar(50) ,
 `Idade_Pet` int ,
 `Porte_Pet` varchar(50) ,
 `Peso_Pet` float ,
 `Altura_Pet` float ,
 `Sexo_Pet` char(1) ,
 `Castracao_Pet` tinyint(1) ,
 `Cor_Pelagem_Pet` varchar(50) ,
 `Id_Vacina` int ,
 `Nome_Vacina` varchar(50) ,
 `Valor_Vacina` float ,
 `Quantidade_Estoque_Vacina` int ,
 `Descricao_Vacina` varchar(255) 
)*/;

/*View structure for view vw_agendamento */

/*!50001 DROP TABLE IF EXISTS `vw_agendamento` */;
/*!50001 DROP VIEW IF EXISTS `vw_agendamento` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_agendamento` AS select `a`.`Id_Agendamento` AS `Id_Agendamento`,`a`.`Tipo_Agendamento` AS `Tipo_Agendamento`,`a`.`Data_Agendamento` AS `Data_Agendamento`,`a`.`Horario_Agendamento` AS `Horario_Agendamento`,`a`.`Vacina_Id_Vacina` AS `Vacina_Id_Vacina`,`a`.`Pet_Id_Pet` AS `Pet_Id_Pet`,`a`.`Cliente_Id_Cliente` AS `Cliente_Id_Cliente`,`a`.`Veterinario_Id_Veterinario` AS `Veterinario_Id_Veterinario`,`p`.`Id_Pet` AS `Id_Pet`,`p`.`Especie_Pet` AS `Especie_Pet`,`p`.`Nome_Pet` AS `Nome_Pet`,`p`.`Raca_Pet` AS `Raca_Pet`,`p`.`Idade_Pet` AS `Idade_Pet`,`p`.`Porte_Pet` AS `Porte_Pet`,`p`.`Peso_Pet` AS `Peso_Pet`,`p`.`Altura_Pet` AS `Altura_Pet`,`p`.`Sexo_Pet` AS `Sexo_Pet`,`p`.`Castracao_Pet` AS `Castracao_Pet`,`p`.`Cor_Pelagem_Pet` AS `Cor_Pelagem_Pet`,`c`.`Id_Cliente` AS `Id_Cliente`,`c`.`Nome_Cliente` AS `Nome_Cliente`,`c`.`CPF_Cliente` AS `CPF_Cliente`,`c`.`RG_Cliente` AS `RG_Cliente`,`c`.`Sexo_Cliente` AS `Sexo_Cliente`,`c`.`Endereco_Cliente` AS `Endereco_Cliente`,`c`.`Email_Cliente` AS `Email_Cliente`,`c`.`Telefone_Fixo_Cliente` AS `Telefone_Fixo_Cliente`,`c`.`Telefone_Celular_Cliente` AS `Telefone_Celular_Cliente`,`c`.`Data_Nascimento_Cliente` AS `Data_Nascimento_Cliente`,`c`.`Senha_Cliente` AS `Senha_Cliente`,`c`.`Tipo_Cliente` AS `Tipo_Cliente`,`c`.`Codigo_Funcionario` AS `Codigo_Funcionario`,`v`.`Id_Veterinario` AS `Id_Veterinario`,`v`.`Nome_Veterinario` AS `Nome_Veterinario`,`v`.`Cpf_Veterinario` AS `Cpf_Veterinario`,`v`.`Rg_Veterinario` AS `Rg_Veterinario`,`v`.`Sexo_Veterinario` AS `Sexo_Veterinario`,`v`.`Endereco_Veterinario` AS `Endereco_Veterinario`,`v`.`Email_Veterinario` AS `Email_Veterinario`,`v`.`Telefone_Fixo_Veterinario` AS `Telefone_Fixo_Veterinario`,`v`.`Telefone_Celular_Veterinario` AS `Telefone_Celular_Veterinario`,`v`.`Data_Nascimento_Veterinario` AS `Data_Nascimento_Veterinario` from (((`tb_agendamento` `a` join `tb_pet` `p` on((`a`.`Pet_Id_Pet` = `p`.`Id_Pet`))) join `tb_cliente` `c` on((`a`.`Cliente_Id_Cliente` = `c`.`Id_Cliente`))) join `tb_veterinario` `v` on((`a`.`Veterinario_Id_Veterinario` = `v`.`Id_Veterinario`))) */;

/*View structure for view vw_compra */

/*!50001 DROP TABLE IF EXISTS `vw_compra` */;
/*!50001 DROP VIEW IF EXISTS `vw_compra` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_compra` AS select `co`.`Id_Compra` AS `Id_Compra`,`co`.`Data_Compra` AS `Data_Compra`,`co`.`Valor_Compra` AS `Valor_Compra`,`co`.`Cliente_ID_Cliente` AS `Cliente_ID_Cliente`,`co`.`Produto_ID_Produto` AS `Produto_ID_Produto`,`cl`.`Id_Cliente` AS `Id_Cliente`,`cl`.`Nome_Cliente` AS `Nome_Cliente`,`cl`.`CPF_Cliente` AS `CPF_Cliente`,`cl`.`RG_Cliente` AS `RG_Cliente`,`cl`.`Sexo_Cliente` AS `Sexo_Cliente`,`cl`.`Endereco_Cliente` AS `Endereco_Cliente`,`cl`.`Email_Cliente` AS `Email_Cliente`,`cl`.`Telefone_Fixo_Cliente` AS `Telefone_Fixo_Cliente`,`cl`.`Telefone_Celular_Cliente` AS `Telefone_Celular_Cliente`,`cl`.`Data_Nascimento_Cliente` AS `Data_Nascimento_Cliente`,`cl`.`Senha_Cliente` AS `Senha_Cliente`,`cl`.`Tipo_Cliente` AS `Tipo_Cliente`,`cl`.`Codigo_Funcionario` AS `Codigo_Funcionario`,`p`.`Id_Produto` AS `Id_Produto`,`p`.`Nome_Produto` AS `Nome_Produto`,`p`.`Valor_Produto` AS `Valor_Produto`,`p`.`Quantidade_Produto` AS `Quantidade_Produto`,`p`.`Quantidade_Estoque_Produto` AS `Quantidade_Estoque_Produto`,`p`.`Descricao_Produto` AS `Descricao_Produto`,`p`.`Imagem_Produto` AS `Imagem_Produto` from ((`tb_compra` `co` join `tb_cliente` `cl` on((`co`.`Cliente_ID_Cliente` = `cl`.`Id_Cliente`))) join `tb_produto` `p` on((`co`.`Produto_ID_Produto` = `p`.`Id_Produto`))) */;

/*View structure for view vw_carteira_vacinacao */

/*!50001 DROP TABLE IF EXISTS `vw_carteira_vacinacao` */;
/*!50001 DROP VIEW IF EXISTS `vw_carteira_vacinacao` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_carteira_vacinacao` AS select `c`.`Pet_Id_Pet` AS `Pet_Id_Pet`,`c`.`Vacina_Id_Vacina` AS `Vacina_Id_Vacina`,`p`.`Id_Pet` AS `Id_Pet`,`p`.`Especie_Pet` AS `Especie_Pet`,`p`.`Nome_Pet` AS `Nome_Pet`,`p`.`Raca_Pet` AS `Raca_Pet`,`p`.`Idade_Pet` AS `Idade_Pet`,`p`.`Porte_Pet` AS `Porte_Pet`,`p`.`Peso_Pet` AS `Peso_Pet`,`p`.`Altura_Pet` AS `Altura_Pet`,`p`.`Sexo_Pet` AS `Sexo_Pet`,`p`.`Castracao_Pet` AS `Castracao_Pet`,`p`.`Cor_Pelagem_Pet` AS `Cor_Pelagem_Pet`,`v`.`Id_Vacina` AS `Id_Vacina`,`v`.`Nome_Vacina` AS `Nome_Vacina`,`v`.`Valor_Vacina` AS `Valor_Vacina`,`v`.`Quantidade_Estoque_Vacina` AS `Quantidade_Estoque_Vacina`,`v`.`Descricao_Vacina` AS `Descricao_Vacina` from ((`tb_carteira_vacinacao` `c` join `tb_pet` `p` on((`c`.`Pet_Id_Pet` = `p`.`Id_Pet`))) join `tb_vacina` `v` on((`c`.`Vacina_Id_Vacina` = `v`.`Id_Vacina`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
