-- MySQL Workbench Forward Engineering
create database contagem;
use contagem;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema contagem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema contagem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contagem` DEFAULT CHARACTER SET utf8 ;
USE `contagem` ;

-- -----------------------------------------------------
-- Table `contagem`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`turmas` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `nome_turma` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_turma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contagem`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(150) NOT NULL,
  `ativa_categoria` TINYINT NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contagem`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(150) NOT NULL,
  `senha_usuario` VARCHAR(150) NOT NULL,
  `nivel_usuario` ENUM('1', '2', '3') NOT NULL,
  `ativo_usuario` TINYINT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contagem`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`Estoque` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contagem`.`contagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`contagem` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from categorias;
INSERT INTO categorias (nome_categoria,ativa_categoria) VALUES ('categoria 03', 2);
