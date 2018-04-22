-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema smSchool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema smSchool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smSchool` DEFAULT CHARACTER SET utf8 ;
USE `smSchool` ;

-- -----------------------------------------------------
-- Table `smSchool`.`auteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`auteur` (
  `id_auteur` INT(10) UNSIGNED NOT NULL,
  `nom_auteur` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `prenom_auteur` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_auteur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`images` (
  `id_img` INT(10) UNSIGNED NOT NULL,
  `img_nom` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `img_taille` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `img_type` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `img_desc` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `img_blob` BLOB NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_img`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`tuteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`tuteur` (
  `id_tuteur` INT(10) UNSIGNED NOT NULL,
  `code_tuteur` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `nationalite` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_img` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuteur`),
  INDEX `fk_tuteur_1_idx` (`id_img` ASC),
  CONSTRAINT `fk_tuteur_1`
    FOREIGN KEY (`id_img`)
    REFERENCES `smSchool`.`images` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`eleve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`eleve` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_badge` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_tuteur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `code_eleve` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `nationalite` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_img` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`),
  INDEX `fk_eleve_1_idx` (`id_img` ASC),
  INDEX `fk_eleve_2_idx` (`id_tuteur` ASC),
  CONSTRAINT `fk_eleve_1`
    FOREIGN KEY (`id_img`)
    REFERENCES `smSchool`.`images` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_eleve_2`
    FOREIGN KEY (`id_tuteur`)
    REFERENCES `smSchool`.`tuteur` (`id_tuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formateur` (
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `id_badge` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `code_formateur` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `nationalite` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_img` INT(10) UNSIGNED NULL DEFAULT NULL,
  `specialite` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `annee_experience` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_recrutement` DATETIME NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_formateur`),
  INDEX `fk_formateur_1_idx` (`id_img` ASC),
  CONSTRAINT `fk_formateur_1`
    FOREIGN KEY (`id_img`)
    REFERENCES `smSchool`.`images` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`bulletin_commentaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`bulletin_commentaires` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_ensemble_controle` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_controle` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_compo_controle` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_formateur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  INDEX `fk_bulletin_commentaires_1_idx` (`id_eleve` ASC),
  INDEX `fk_bulletin_commentaires_2_idx` (`id_formateur` ASC),
  CONSTRAINT `fk_bulletin_commentaires_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bulletin_commentaires_2`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formations` (
  `id_formation` INT(10) UNSIGNED NOT NULL,
  `code_formation` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom_formation` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `niveau` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `classe` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type_formation` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `filiere` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `frais_inscription` DECIMAL(15,2) NULL DEFAULT NULL,
  `mensualite` DECIMAL(15,2) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_formation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formation_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formation_group` (
  `id_formation_group` INT(10) UNSIGNED NOT NULL,
  `id_formation` INT(10) UNSIGNED NOT NULL,
  `group_number` INT(2) NOT NULL,
  `group_name` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `annee_scolaire` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_formation_group`),
  INDEX `fk_formation_group_1_idx` (`id_formation` ASC),
  CONSTRAINT `fk_formation_group_1`
    FOREIGN KEY (`id_formation`)
    REFERENCES `smSchool`.`formations` (`id_formation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`periode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`periode` (
  `id_periode` INT(10) UNSIGNED NOT NULL,
  `periode_name` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_periode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`ensemble_controle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`ensemble_controle` (
  `id_ensemble_controle` INT(10) UNSIGNED NOT NULL,
  `id_formation_group` INT(10) UNSIGNED NOT NULL,
  `code` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_periode` INT(10) UNSIGNED NOT NULL,
  `is_compact` TINYINT(1) NULL DEFAULT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `coefficient` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_ensemble_controle`),
  INDEX `fk_ensemble_controle_1_idx` (`id_formation_group` ASC),
  INDEX `fk_ensemble_controle_2_idx` (`id_periode` ASC),
  CONSTRAINT `fk_ensemble_controle_1`
    FOREIGN KEY (`id_formation_group`)
    REFERENCES `smSchool`.`formation_group` (`id_formation_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ensemble_controle_2`
    FOREIGN KEY (`id_periode`)
    REFERENCES `smSchool`.`periode` (`id_periode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`controle_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`controle_type` (
  `id_controle_type` INT(10) UNSIGNED NOT NULL,
  `code_controle_type` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `frequence` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `during_cours` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_controle_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`controles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`controles` (
  `id_controle` INT(10) UNSIGNED NOT NULL,
  `id_ensemble_controle` INT(10) UNSIGNED NOT NULL,
  `code` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_controle_type` INT(10) UNSIGNED NOT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `commentaires` TINYTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `coefficient` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_controle`),
  INDEX `fk_controles_1_idx` (`id_ensemble_controle` ASC),
  INDEX `fk_controles_2_idx` (`id_controle_type` ASC),
  CONSTRAINT `fk_controles_1`
    FOREIGN KEY (`id_ensemble_controle`)
    REFERENCES `smSchool`.`ensemble_controle` (`id_ensemble_controle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_controles_2`
    FOREIGN KEY (`id_controle_type`)
    REFERENCES `smSchool`.`controle_type` (`id_controle_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`matieres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`matieres` (
  `id_matiere` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `description` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `langue` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_matiere`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`compo_formation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`compo_formation` (
  `id_compo_formation` INT(10) UNSIGNED NOT NULL,
  `id_formation_group` INT(10) UNSIGNED NOT NULL,
  `id_matiere` INT(10) UNSIGNED NOT NULL,
  `coefficient` INT(2) NULL DEFAULT NULL,
  `id_periode` INT(10) UNSIGNED NOT NULL,
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `prix_horaire` DECIMAL(10,2) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_compo_formation`),
  INDEX `fk_compo_formation_1_idx` (`id_formation_group` ASC),
  INDEX `fk_compo_formation_2_idx` (`id_matiere` ASC),
  INDEX `fk_compo_formation_3_idx` (`id_periode` ASC),
  INDEX `fk_compo_formation_4_idx` (`id_formateur` ASC),
  CONSTRAINT `fk_compo_formation_1`
    FOREIGN KEY (`id_formation_group`)
    REFERENCES `smSchool`.`formation_group` (`id_formation_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_formation_2`
    FOREIGN KEY (`id_matiere`)
    REFERENCES `smSchool`.`matieres` (`id_matiere`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_formation_3`
    FOREIGN KEY (`id_periode`)
    REFERENCES `smSchool`.`periode` (`id_periode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_formation_4`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`salles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`salles` (
  `id_salle` INT(10) UNSIGNED NOT NULL,
  `code_salle` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom_salle` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `superficie` FLOAT NULL DEFAULT NULL,
  `capacite` SMALLINT(5) UNSIGNED NOT NULL,
  `emplacement` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_salle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`personnel_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`personnel_type` (
  `id_personnel_type` INT(10) UNSIGNED NOT NULL,
  `fonction_name` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `grade` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_personnel_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`personnel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`personnel` (
  `id_personnel` INT(10) UNSIGNED NOT NULL,
  `id_badge` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `code_personnel` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_personnel_type` INT(10) UNSIGNED NULL DEFAULT NULL,
  `prenom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `nationalite` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_img` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_personnel`),
  INDEX `fk_personnel_1_idx` (`id_personnel_type` ASC),
  INDEX `fk_personnel_2_idx` (`id_img` ASC),
  CONSTRAINT `fk_personnel_1`
    FOREIGN KEY (`id_personnel_type`)
    REFERENCES `smSchool`.`personnel_type` (`id_personnel_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personnel_2`
    FOREIGN KEY (`id_img`)
    REFERENCES `smSchool`.`images` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`compo_controle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`compo_controle` (
  `id_compo_controle` INT(10) UNSIGNED NOT NULL,
  `id_controle` INT(10) UNSIGNED NOT NULL,
  `id_compo_formation` INT(10) UNSIGNED NOT NULL,
  `date_compo_controle` DATE NOT NULL,
  `heure_debut` TIME NOT NULL,
  `heure_fin` TIME NOT NULL,
  `id_salle` INT(10) UNSIGNED NOT NULL,
  `id_formateur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_personnel` INT(10) UNSIGNED NULL DEFAULT NULL,
  `description_contenu` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `is_done` TINYINT(1) NULL DEFAULT NULL,
  `is_annule` TINYINT(1) NULL DEFAULT NULL,
  `raison_annulation` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_controle_remplacement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `check_presence_done` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_compo_controle`),
  INDEX `fk_compo_controle_1_idx` (`id_controle` ASC),
  INDEX `fk_compo_controle_2_idx` (`id_compo_formation` ASC),
  INDEX `fk_compo_controle_3_idx` (`id_salle` ASC),
  INDEX `fk_compo_controle_4_idx` (`id_formateur` ASC),
  INDEX `fk_compo_controle_5_idx` (`id_personnel` ASC),
  INDEX `fk_compo_controle_6_idx` (`id_controle_remplacement` ASC),
  CONSTRAINT `fk_compo_controle_1`
    FOREIGN KEY (`id_controle`)
    REFERENCES `smSchool`.`controles` (`id_controle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_controle_2`
    FOREIGN KEY (`id_compo_formation`)
    REFERENCES `smSchool`.`compo_formation` (`id_compo_formation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_controle_3`
    FOREIGN KEY (`id_salle`)
    REFERENCES `smSchool`.`salles` (`id_salle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_controle_4`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_controle_5`
    FOREIGN KEY (`id_personnel`)
    REFERENCES `smSchool`.`personnel` (`id_personnel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compo_controle_6`
    FOREIGN KEY (`id_controle_remplacement`)
    REFERENCES `smSchool`.`compo_controle` (`id_compo_controle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`cours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`cours` (
  `id_cours` INT(10) UNSIGNED NOT NULL,
  `id_compo_formation` INT(10) UNSIGNED NOT NULL,
  `date_cours` DATE NOT NULL,
  `heure_debut` TIME NOT NULL,
  `heure_fin` TIME NOT NULL,
  `id_salle` INT(10) UNSIGNED NOT NULL,
  `is_other_formateur` TINYINT(1) NULL DEFAULT NULL,
  `id_formateur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `description_contenu` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `is_done` TINYINT(1) NULL DEFAULT NULL,
  `is_annule` TINYINT(1) NULL DEFAULT NULL,
  `raison_annulation` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_cours_remplacement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `check_presence_done` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  INDEX `fk_cours_1_idx` (`id_compo_formation` ASC),
  INDEX `fk_cours_2_idx` (`id_salle` ASC),
  INDEX `fk_cours_3_idx` (`id_formateur` ASC),
  INDEX `fk_cours_4_idx` (`id_cours_remplacement` ASC),
  CONSTRAINT `fk_cours_1`
    FOREIGN KEY (`id_compo_formation`)
    REFERENCES `smSchool`.`compo_formation` (`id_compo_formation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cours_2`
    FOREIGN KEY (`id_salle`)
    REFERENCES `smSchool`.`salles` (`id_salle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cours_3`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cours_4`
    FOREIGN KEY (`id_cours_remplacement`)
    REFERENCES `smSchool`.`cours` (`id_cours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_depense_mensuel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_depense_mensuel` (
  `id_type_depense` INT(10) UNSIGNED NOT NULL,
  `code_depense` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `intitule` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_depense`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`moyen_payement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`moyen_payement` (
  `id_moyen_payement` INT(10) UNSIGNED NOT NULL,
  `intitule_mp` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_moyen_payement`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`depense_mensuel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`depense_mensuel` (
  `id_depense_m` INT(10) UNSIGNED NOT NULL,
  `id_type_depense` INT(10) UNSIGNED NOT NULL,
  `beneficiaire` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mois` DATE NULL DEFAULT NULL,
  `debut_period` DATE NULL DEFAULT NULL,
  `fin_period` DATE NULL DEFAULT NULL,
  `montant` DECIMAL(10,2) NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `done` TINYINT(1) NULL DEFAULT NULL,
  `facture_numero` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_depense_m`),
  INDEX `fk_depense_mensuel_1_idx` (`id_type_depense` ASC),
  INDEX `fk_depense_mensuel_2_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_depense_mensuel_1`
    FOREIGN KEY (`id_type_depense`)
    REFERENCES `smSchool`.`type_depense_mensuel` (`id_type_depense`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_depense_mensuel_2`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`depense_special`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`depense_special` (
  `id_depense_s` INT(10) UNSIGNED NOT NULL,
  `code_depense_s` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `beneficiaire` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `intitule` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_depense` DATE NULL DEFAULT NULL,
  `montant` DECIMAL(10,2) NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `facture_numero` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_depense_s`),
  INDEX `fk_depense_special_1_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_depense_special_1`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`ecole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`ecole` (
  `id_ecole` INT(10) UNSIGNED NOT NULL,
  `id_img` INT(10) UNSIGNED NULL DEFAULT NULL,
  `nom` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `forme_juridique` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_fondation` DATE NULL DEFAULT NULL,
  `director_name` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `tel1` VARCHAR(20) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `tel3` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `autorisation_number` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_ecole`),
  INDEX `fk_ecole_1_idx` (`id_img` ASC),
  CONSTRAINT `fk_ecole_1`
    FOREIGN KEY (`id_img`)
    REFERENCES `smSchool`.`images` (`id_img`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`editeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`editeur` (
  `id_editeur` INT(10) UNSIGNED NOT NULL,
  `editeur` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `adresse` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_editeur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_document` (
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom_document` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `is_mandatory` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_document`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`eleve_documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`eleve_documents` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `taille` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `emplacement` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`, `id_type_document`),
  INDEX `fk_eleve_documents_2_idx` (`id_type_document` ASC),
  CONSTRAINT `fk_eleve_documents_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_eleve_documents_2`
    FOREIGN KEY (`id_type_document`)
    REFERENCES `smSchool`.`type_document` (`id_type_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_oeuvre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_oeuvre` (
  `id_type_oeuvre` INT(10) UNSIGNED NOT NULL,
  `type` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_oeuvre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`oeuvre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`oeuvre` (
  `id_oeuvre` INT(10) UNSIGNED NOT NULL,
  `titre` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `id_type_oeuvre` INT(10) UNSIGNED NULL DEFAULT NULL,
  `resume` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_oeuvre`),
  INDEX `fk_oeuvre_1_idx` (`id_type_oeuvre` ASC),
  CONSTRAINT `fk_oeuvre_1`
    FOREIGN KEY (`id_type_oeuvre`)
    REFERENCES `smSchool`.`type_oeuvre` (`id_type_oeuvre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`livres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`livres` (
  `id_livre` INT(10) UNSIGNED NOT NULL,
  `id_badge` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `id_oeuvre` INT(10) UNSIGNED NOT NULL,
  `id_editeur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `ISBN` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_achat` DATE NULL DEFAULT NULL,
  `prix` DECIMAL(10,2) NULL DEFAULT NULL,
  `annee` DATE NULL DEFAULT NULL,
  `format` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `pages` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `commentaires` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_livre`),
  INDEX `fk_livres_1_idx` (`id_oeuvre` ASC),
  INDEX `fk_livres_2_idx` (`id_editeur` ASC),
  CONSTRAINT `fk_livres_1`
    FOREIGN KEY (`id_oeuvre`)
    REFERENCES `smSchool`.`oeuvre` (`id_oeuvre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livres_2`
    FOREIGN KEY (`id_editeur`)
    REFERENCES `smSchool`.`editeur` (`id_editeur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`emprunts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`emprunts` (
  `id_emprunt` INT(10) UNSIGNED NOT NULL,
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_livre` INT(10) UNSIGNED NOT NULL,
  `date_emprunt` DATE NULL DEFAULT NULL,
  `date_retour` DATE NULL DEFAULT NULL,
  `is_emprunte` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_emprunt`),
  INDEX `fk_emprunts_1_idx` (`id_eleve` ASC),
  INDEX `fk_emprunts_2_idx` (`id_livre` ASC),
  CONSTRAINT `fk_emprunts_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprunts_2`
    FOREIGN KEY (`id_livre`)
    REFERENCES `smSchool`.`livres` (`id_livre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formateur_documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formateur_documents` (
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `taille` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `emplacement` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_formateur`, `id_type_document`),
  INDEX `fk_formateur_documents_2_idx` (`id_type_document` ASC),
  CONSTRAINT `fk_formateur_documents_1`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_formateur_documents_2`
    FOREIGN KEY (`id_type_document`)
    REFERENCES `smSchool`.`type_document` (`id_type_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`inscription` (
  `id_inscription` INT(10) UNSIGNED NOT NULL,
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_formation_group` INT(10) UNSIGNED NOT NULL,
  `date_inscription` DATETIME NOT NULL,
  `date_fin_inscription` DATETIME NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_inscription`),
  INDEX `fk_inscription_1_idx` (`id_eleve` ASC),
  INDEX `fk_inscription_2_idx` (`id_formation_group` ASC),
  CONSTRAINT `fk_inscription_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscription_2`
    FOREIGN KEY (`id_formation_group`)
    REFERENCES `smSchool`.`formation_group` (`id_formation_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_frais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_frais` (
  `id_type_frais` INT(10) UNSIGNED NOT NULL,
  `id_formation` INT(10) UNSIGNED NOT NULL,
  `intitule_frais` VARCHAR(1000) CHARACTER SET 'utf8' NOT NULL,
  `montant` DECIMAL(10,2) NOT NULL,
  `id_period` INT(10) UNSIGNED NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_frais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`frais_eleves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`frais_eleves` (
  `id_frais` INT(10) UNSIGNED NOT NULL,
  `id_inscription` INT(10) UNSIGNED NOT NULL,
  `id_type_frais` INT(10) UNSIGNED NOT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `date_limite` DATE NULL DEFAULT NULL,
  `is_paid` TINYINT(1) NULL DEFAULT NULL,
  `montant_paye` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_frais`),
  INDEX `fk_frais_eleves_1_idx` (`id_inscription` ASC),
  INDEX `fk_frais_eleves_2_idx` (`id_type_frais` ASC),
  INDEX `fk_frais_eleves_3_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_frais_eleves_1`
    FOREIGN KEY (`id_inscription`)
    REFERENCES `smSchool`.`inscription` (`id_inscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frais_eleves_2`
    FOREIGN KEY (`id_type_frais`)
    REFERENCES `smSchool`.`type_frais` (`id_type_frais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frais_eleves_3`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`mensualites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`mensualites` (
  `id_inscription` INT(10) UNSIGNED NOT NULL,
  `mois` DATE NOT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `date_limite` DATE NULL DEFAULT NULL,
  `is_paid` TINYINT(1) NULL DEFAULT NULL,
  `expected_amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `montant_paye` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_inscription`, `mois`),
  INDEX `fk_mensualites_2_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_mensualites_1`
    FOREIGN KEY (`id_inscription`)
    REFERENCES `smSchool`.`inscription` (`id_inscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mensualites_2`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`notes` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_compo_controle` INT(10) UNSIGNED NOT NULL,
  `note` DECIMAL(6,2) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`, `id_compo_controle`),
  INDEX `fk_notes_2_idx` (`id_compo_controle` ASC),
  CONSTRAINT `fk_notes_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_2`
    FOREIGN KEY (`id_compo_controle`)
    REFERENCES `smSchool`.`compo_controle` (`id_compo_controle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`oeuvre_auteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`oeuvre_auteur` (
  `id_oeuvre_auteur` INT(10) UNSIGNED NOT NULL,
  `id_oeuvre` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_auteur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_oeuvre_auteur`),
  INDEX `fk_oeuvre_auteur_1_idx` (`id_oeuvre` ASC),
  INDEX `fk_oeuvre_auteur_2_idx` (`id_auteur` ASC),
  CONSTRAINT `fk_oeuvre_auteur_1`
    FOREIGN KEY (`id_oeuvre`)
    REFERENCES `smSchool`.`oeuvre` (`id_oeuvre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oeuvre_auteur_2`
    FOREIGN KEY (`id_auteur`)
    REFERENCES `smSchool`.`auteur` (`id_auteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`opt_send_tuteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`opt_send_tuteur` (
  `id_tuteur` INT(10) UNSIGNED NOT NULL,
  `frequence` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mail` TINYINT(1) NULL DEFAULT NULL,
  `sms` TINYINT(1) NULL DEFAULT NULL,
  `whatsapp` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuteur`),
  CONSTRAINT `fk_opt_send_tuteur_1`
    FOREIGN KEY (`id_tuteur`)
    REFERENCES `smSchool`.`tuteur` (`id_tuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`personnel_documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`personnel_documents` (
  `id_personnel` INT(10) UNSIGNED NOT NULL,
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `taille` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `emplacement` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_personnel`, `id_type_document`),
  INDEX `fk_personnel_documents_2_idx` (`id_type_document` ASC),
  CONSTRAINT `fk_personnel_documents_1`
    FOREIGN KEY (`id_personnel`)
    REFERENCES `smSchool`.`personnel` (`id_personnel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personnel_documents_2`
    FOREIGN KEY (`id_type_document`)
    REFERENCES `smSchool`.`type_document` (`id_type_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`presence_controle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`presence_controle` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_compo_controle` INT(10) UNSIGNED NOT NULL,
  `is_present` TINYINT(1) NOT NULL,
  `is_renvoye` TINYINT(1) NULL DEFAULT NULL,
  `is_justifie` TINYINT(1) NULL DEFAULT NULL,
  `heure_renvoie` TIME NULL DEFAULT NULL,
  `raison` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`, `id_compo_controle`),
  INDEX `fk_presence_controle_2_idx` (`id_compo_controle` ASC),
  CONSTRAINT `fk_presence_controle_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presence_controle_2`
    FOREIGN KEY (`id_compo_controle`)
    REFERENCES `smSchool`.`compo_controle` (`id_compo_controle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`presence_cours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`presence_cours` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_cours` INT(10) UNSIGNED NOT NULL,
  `is_present` TINYINT(1) NOT NULL,
  `is_renvoye` TINYINT(1) NULL DEFAULT NULL,
  `is_justifie` TINYINT(1) NULL DEFAULT NULL,
  `heure_renvoie` TIME NULL DEFAULT NULL,
  `raison` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`, `id_cours`),
  INDEX `fk_presence_cours_2_idx` (`id_cours` ASC),
  CONSTRAINT `fk_presence_cours_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presence_cours_2`
    FOREIGN KEY (`id_cours`)
    REFERENCES `smSchool`.`cours` (`id_cours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_contrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_contrat` (
  `id_type_contrat` INT(10) UNSIGNED NOT NULL,
  `type_contrat` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `mode_remuneration` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `caracteristiques` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_contrat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`recrutement_formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`recrutement_formateur` (
  `id_recrutement_f` INT(10) UNSIGNED NOT NULL,
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `list_id_compo_formation` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `date_recrutement` DATE NULL DEFAULT NULL,
  `id_type_contract` INT(10) UNSIGNED NOT NULL,
  `date_debut_contrat` DATE NULL DEFAULT NULL,
  `date_fin_contrat` DATE NULL DEFAULT NULL,
  `salaire_mensuel` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_recrutement_f`),
  INDEX `fk_recrutement_formateur_1_idx` (`id_formateur` ASC),
  INDEX `fk_recrutement_formateur_2_idx` (`id_type_contract` ASC),
  CONSTRAINT `fk_recrutement_formateur_1`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recrutement_formateur_2`
    FOREIGN KEY (`id_type_contract`)
    REFERENCES `smSchool`.`type_contrat` (`id_type_contrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`recrutement_personnel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`recrutement_personnel` (
  `id_recrutement_p` INT(10) UNSIGNED NOT NULL,
  `id_personnel` INT(10) UNSIGNED NOT NULL,
  `date_recrutement` DATE NULL DEFAULT NULL,
  `id_type_contract` INT(10) UNSIGNED NOT NULL,
  `date_debut_contrat` DATE NULL DEFAULT NULL,
  `date_fin_contrat` DATE NULL DEFAULT NULL,
  `salaire_mensuel` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_recrutement_p`),
  INDEX `fk_recrutement_personnel_1_idx` (`id_personnel` ASC),
  INDEX `fk_recrutement_personnel_2_idx` (`id_type_contract` ASC),
  CONSTRAINT `fk_recrutement_personnel_1`
    FOREIGN KEY (`id_personnel`)
    REFERENCES `smSchool`.`personnel` (`id_personnel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recrutement_personnel_2`
    FOREIGN KEY (`id_type_contract`)
    REFERENCES `smSchool`.`type_contrat` (`id_type_contrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`synthese_depense_mensuel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`synthese_depense_mensuel` (
  `id_sdm` INT(10) UNSIGNED NOT NULL,
  `mois_sdm` DATE NULL DEFAULT NULL,
  `recettes` DECIMAL(10,2) NULL DEFAULT NULL,
  `depenses` DECIMAL(10,2) NULL DEFAULT NULL,
  `difference` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_sdm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`tuteur_documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`tuteur_documents` (
  `id_tuteur` INT(10) UNSIGNED NOT NULL,
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `taille` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `emplacement` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuteur`, `id_type_document`),
  INDEX `fk_tuteur_documents_2_idx` (`id_type_document` ASC),
  CONSTRAINT `fk_tuteur_documents_1`
    FOREIGN KEY (`id_tuteur`)
    REFERENCES `smSchool`.`tuteur` (`id_tuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tuteur_documents_2`
    FOREIGN KEY (`id_type_document`)
    REFERENCES `smSchool`.`type_document` (`id_type_document`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`user_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`user_type` (
  `id_user_type` INT(10) UNSIGNED NOT NULL,
  `type_name` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_user_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`users` (
  `id_user` INT(10) UNSIGNED NOT NULL,
  `id_personnel` INT(10) UNSIGNED NOT NULL,
  `username` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password_u` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_user_type` INT(10) UNSIGNED NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_users_1_idx` (`id_personnel` ASC),
  INDEX `fk_users_2_idx` (`id_user_type` ASC),
  CONSTRAINT `fk_users_1`
    FOREIGN KEY (`id_personnel`)
    REFERENCES `smSchool`.`personnel` (`id_personnel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_2`
    FOREIGN KEY (`id_user_type`)
    REFERENCES `smSchool`.`user_type` (`id_user_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`versement_formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`versement_formateur` (
  `id_versement_f` INT(10) UNSIGNED NOT NULL,
  `id_recrutement_f` INT(10) UNSIGNED NOT NULL,
  `debut_period` DATE NULL DEFAULT NULL,
  `fin_period` DATE NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NOT NULL,
  `done` TINYINT(1) UNSIGNED NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_versement_f`),
  INDEX `fk_versement_formateur_1_idx` (`id_recrutement_f` ASC),
  INDEX `fk_versement_formateur_2_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_versement_formateur_1`
    FOREIGN KEY (`id_recrutement_f`)
    REFERENCES `smSchool`.`recrutement_formateur` (`id_recrutement_f`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_versement_formateur_2`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`versement_personnel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`versement_personnel` (
  `id_versement_p` INT(10) UNSIGNED NOT NULL,
  `id_recrutement_p` INT(10) UNSIGNED NOT NULL,
  `debut_period` DATE NULL DEFAULT NULL,
  `fin_period` DATE NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NOT NULL,
  `done` TINYINT(1) UNSIGNED NOT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_versement_p`),
  INDEX `fk_versement_personnel_1_idx` (`id_recrutement_p` ASC),
  INDEX `fk_versement_personnel_2_idx` (`id_moyen_payement` ASC),
  CONSTRAINT `fk_versement_personnel_1`
    FOREIGN KEY (`id_recrutement_p`)
    REFERENCES `smSchool`.`recrutement_personnel` (`id_recrutement_p`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_versement_personnel_2`
    FOREIGN KEY (`id_moyen_payement`)
    REFERENCES `smSchool`.`moyen_payement` (`id_moyen_payement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

USE `smSchool`;

DELIMITER $$
USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`auteur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`auteur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`auteur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`auteur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`images_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`images`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`images_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`images`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`tuteur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`tuteur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`tuteur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`tuteur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`eleve_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`eleve`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`eleve_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`eleve`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formateur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formateur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`bulletin_commentaires_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`bulletin_commentaires`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`bulletin_commentaires_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`bulletin_commentaires`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formations_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`formations`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formations_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`formations`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formation_group_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`formation_group`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();	
    IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;

END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formation_group_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`formation_group`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`periode_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`periode`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`periode_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`periode`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`ensemble_controle_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`ensemble_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`ensemble_controle_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`ensemble_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`controle_type_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`controle_type`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`controle_type_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`controle_type`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`controles_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`controles`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`controles_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`controles`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`matieres_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`matieres`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`matieres_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`matieres`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`compo_formation_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`compo_formation`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`compo_formation_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`compo_formation`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`salles_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`salles`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`salles_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`salles`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_type_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`personnel_type`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_type_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`personnel_type`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW(); 
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`compo_controle_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`compo_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`compo_controle_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`compo_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`cours_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`cours`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`cours_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`cours`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_depense_mensuel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`type_depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_depense_mensuel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`type_depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`moyen_payement_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`moyen_payement`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`moyen_payement_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`moyen_payement`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`depense_mensuel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`depense_mensuel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`depense_special_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`depense_special`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`depense_special_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`depense_special`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`ecole_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`ecole`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`ecole_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`ecole`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`editeur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`editeur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`editeur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`editeur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_document_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`type_document`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_document_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`type_document`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`eleve_documents_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`eleve_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`eleve_documents_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`eleve_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_oeuvre_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`type_oeuvre`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_oeuvre_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`type_oeuvre`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`oeuvre_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`oeuvre`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`oeuvre_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`oeuvre`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`livres_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`livres`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`livres_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`livres`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`emprunts_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`emprunts`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`emprunts_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`emprunts`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formateur_documents_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`formateur_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`formateur_documents_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`formateur_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`inscription_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`inscription`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`inscription_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`inscription`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_frais_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`type_frais`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_frais_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`type_frais`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`frais_eleves_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`frais_eleves`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`frais_eleves_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`frais_eleves`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`mensualites_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`mensualites`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`mensualites_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`mensualites`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW(); 
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`notes_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`notes`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`notes_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`notes`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`oeuvre_auteur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`oeuvre_auteur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`oeuvre_auteur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`oeuvre_auteur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`opt_send_tuteur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`opt_send_tuteur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`opt_send_tuteur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`opt_send_tuteur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_documents_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`personnel_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`personnel_documents_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`personnel_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`presence_controle_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`presence_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`presence_controle_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`presence_controle`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`presence_cours_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`presence_cours`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`presence_cours_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`presence_cours`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_contrat_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`type_contrat`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`type_contrat_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`type_contrat`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`recrutement_formateur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`recrutement_formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`recrutement_formateur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`recrutement_formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`recrutement_personnel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`recrutement_personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`recrutement_personnel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`recrutement_personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`synthese_depense_mensuel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`synthese_depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`synthese_depense_mensuel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`synthese_depense_mensuel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`tuteur_documents_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`tuteur_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`tuteur_documents_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`tuteur_documents`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`user_type_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`user_type`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`user_type_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`user_type`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`users_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`users`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`users_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`users`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`versement_formateur_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`versement_formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`versement_formateur_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`versement_formateur`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`versement_personnel_BEFORE_INSERT`
BEFORE INSERT ON `smSchool`.`versement_personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_creation = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$

USE `smSchool`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `smSchool`.`versement_personnel_BEFORE_UPDATE`
BEFORE UPDATE ON `smSchool`.`versement_personnel`
FOR EACH ROW
BEGIN
	SET NEW.date_modification = NOW();
	IF (@current_id_user IS NOT NULL) THEN
		SET NEW.id_user = @current_id_user;
	END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
