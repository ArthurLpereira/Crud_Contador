              
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema contagem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema contagem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contagem` DEFAULT CHARACTER SET utf8mb4 ;
USE `contagem` ;

-- -----------------------------------------------------
-- Table `contagem`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`categorias` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(150) NOT NULL,
  `ativa_categoria` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `contagem`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`turmas` (
  `id_turma` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_turma` VARCHAR(150) NOT NULL,
  `categorias_id_categoria` INT(11) NOT NULL,
  PRIMARY KEY (`id_turma`),
  INDEX `fk_turmas_categorias1_idx` (`categorias_id_categoria` ASC) ,
  CONSTRAINT `fk_turmas_categorias1`
    FOREIGN KEY (`categorias_id_categoria`)
    REFERENCES `contagem`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `contagem`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(150) NOT NULL,
  `senha_usuario` VARCHAR(150) NOT NULL,
  `nivel_usuario` ENUM('1', '2', '3') NOT NULL,
  `ativo_usuario` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `contagem`.`contagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`contagem` (
  `id_contagem` INT NOT NULL AUTO_INCREMENT,
  `quant_contagem` INT NOT NULL,
  `criacao_contagem` TIMESTAMP NOT NULL,
  `update_contagem` TIMESTAMP NULL,
  `usuarios_id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_contagem`),
  INDEX `fk_contagem_usuarios_idx` (`usuarios_id_usuario` ASC) ,
  CONSTRAINT `fk_contagem_usuarios`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `contagem`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contagem`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `nome_item_estoque` VARCHAR(150) NOT NULL,
  `tipo_movimentacao_estoque` ENUM('entrada', 'saida') NOT NULL,
  `quantidade_estoque` INT NOT NULL,
  `unidade_estoque` ENUM('kg', 'gramas', 'litro', 'ml', 'unidade') NOT NULL,
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
