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
-- Table `contagem`.`cache`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`cache` (
  `key` VARCHAR(255) NOT NULL,
  `value` MEDIUMTEXT NOT NULL,
  `expiration` INT(11) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`cache_locks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`cache_locks` (
  `key` VARCHAR(255) NOT NULL,
  `owner` VARCHAR(255) NOT NULL,
  `expiration` INT(11) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


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
  `quant_turma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_turma`),
  INDEX `fk_turmas_categorias1_idx` (`categorias_id_categoria` ASC) VISIBLE,
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
  `nivel_usuario` ENUM('Inspetora', 'Nutricionista', 'Administrador') NOT NULL,
  `ativo_usuario` ENUM('ativo', 'desativado') NOT NULL,
  PRIMARY KEY (`id_usuario`))
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
  INDEX `fk_contagem_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  INDEX `fk_contagem_turmas1_idx` (`turmas_id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_contagem_turmas1`
    FOREIGN KEY (`turmas_id_turma`)
    REFERENCES `contagem`.`turmas` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contagem_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `contagem`.`usuarios` (`id_usuario`)
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
  `data_movimentacao_estoque` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `contagem`.`failed_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`failed_jobs` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`job_batches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`job_batches` (
  `id` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `total_jobs` INT(11) NOT NULL,
  `pending_jobs` INT(11) NOT NULL,
  `failed_jobs` INT(11) NOT NULL,
  `failed_job_ids` LONGTEXT NOT NULL,
  `options` MEDIUMTEXT NULL DEFAULT NULL,
  `cancelled_at` INT(11) NULL DEFAULT NULL,
  `created_at` INT(11) NOT NULL,
  `finished_at` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`jobs` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` VARCHAR(255) NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `attempts` TINYINT(3) UNSIGNED NOT NULL,
  `reserved_at` INT(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` INT(10) UNSIGNED NOT NULL,
  `created_at` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `jobs_queue_index` (`queue` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`password_reset_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`password_reset_tokens` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`sessions` (
  `id` VARCHAR(255) NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `ip_address` VARCHAR(45) NULL DEFAULT NULL,
  `user_agent` TEXT NULL DEFAULT NULL,
  `payload` LONGTEXT NOT NULL,
  `last_activity` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `sessions_user_id_index` (`user_id` ASC) VISIBLE,
  INDEX `sessions_last_activity_index` (`last_activity` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `contagem`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contagem`.`users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
