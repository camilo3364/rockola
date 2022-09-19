-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Rockola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Rockola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Rockola` DEFAULT CHARACTER SET utf8 ;
USE `Rockola` ;

-- -----------------------------------------------------
-- Table `Rockola`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rockola`.`cancion` (
  `id_cancion` INT NOT NULL AUTO_INCREMENT,
  `titulo_cancion` VARCHAR(100) NOT NULL,
  `id_autor` INT NOT NULL,
  `anio` DATE NOT NULL,
  `formato` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id_cancion`),
  INDEX `autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `Rockola`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rockola`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rockola`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nombre_genero` VARCHAR(100) NULL,
  `id_cancion` INT NOT NULL,
  PRIMARY KEY (`id_genero`),
  INDEX `cancion_idx` (`id_cancion` ASC) VISIBLE,
  CONSTRAINT `cancion`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `Rockola`.`cancion` (`id_cancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rockola`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rockola`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_autor`),
  INDEX `genero_idx` (`id_genero` ASC) VISIBLE,
  CONSTRAINT `genero`
    FOREIGN KEY (`id_genero`)
    REFERENCES `Rockola`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rockola`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rockola`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rockola`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rockola`.`administrador` (
  `id_administrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `id_cancion` INT NOT NULL,
  `id_autor` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_genero` INT NOT NULL,
  PRIMARY KEY (`id_administrador`),
  INDEX `autor_idx` (`id_autor` ASC) VISIBLE,
  INDEX `cancion_idx` (`id_cancion` ASC) VISIBLE,
  INDEX `usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `genero_idx` (`id_genero` ASC) VISIBLE,
  CONSTRAINT `autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `Rockola`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cancion`
    FOREIGN KEY (`id_cancion`)
    REFERENCES `Rockola`.`cancion` (`id_cancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Rockola`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genero`
    FOREIGN KEY (`id_genero`)
    REFERENCES `Rockola`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
