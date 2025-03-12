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
-- Table `contagem`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(150) NOT NULL,
  `senha_usuario` VARCHAR(150) NOT NULL,
  `nivel_usuario` ENUM('Inspetora', 'Nutricionista', 'Administrador') NOT NULL,
  `ativo_usuario` ENUM('ativo', 'desativado') NOT NULL,
  PRIMARY KEY (`id_usuario`))
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
  `quant_turma` VARCHAR(45) NOT NULL,
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
-- Table `contagem`.`contagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`contagem` (
  `id_contagem` INT(11) NOT NULL AUTO_INCREMENT,
  `quant_contagem` INT(11) NOT NULL,
  `criacao_contagem` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `update_contagem` TIMESTAMP NULL DEFAULT NULL,
  `usuarios_id_usuario` INT(11) NOT NULL,
  `turmas_id_turma` INT(11) NOT NULL,
  PRIMARY KEY (`id_contagem`),
  INDEX `fk_contagem_usuarios1_idx` (`usuarios_id_usuario` ASC) ,
  INDEX `fk_contagem_turmas1_idx` (`turmas_id_turma` ASC) ,
  CONSTRAINT `fk_contagem_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `contagem`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contagem_turmas1`
    FOREIGN KEY (`turmas_id_turma`)
    REFERENCES `contagem`.`turmas` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `contagem`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`estoque` (
  `id_estoque` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_item_estoque` VARCHAR(150) NOT NULL,
  `quantidade_estoque` INT(11) NOT NULL,
  `unidade_estoque` ENUM('kg', 'gramas', 'litro', 'ml', 'unidade') NOT NULL,
  `data_movimentacao_estoque` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
