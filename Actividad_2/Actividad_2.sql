-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `idstudent` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teacher` (
  `idteacher` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idteacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cursos` (
  `idcursos` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `teacher_idteacher` INT NOT NULL,
  PRIMARY KEY (`idcursos`),
  INDEX `fk_cursos_teacher1_idx` (`teacher_idteacher` ASC) VISIBLE,
  CONSTRAINT `fk_cursos_teacher1`
    FOREIGN KEY (`teacher_idteacher`)
    REFERENCES `mydb`.`teacher` (`idteacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student_has_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student_has_cursos` (
  `student_idstudent` INT NOT NULL,
  `cursos_idcursos` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `cursos_idcursos`),
  INDEX `fk_student_has_cursos_cursos1_idx` (`cursos_idcursos` ASC) VISIBLE,
  INDEX `fk_student_has_cursos_student_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_cursos_student`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `mydb`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_cursos_cursos1`
    FOREIGN KEY (`cursos_idcursos`)
    REFERENCES `mydb`.`cursos` (`idcursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
