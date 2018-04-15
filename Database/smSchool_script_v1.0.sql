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
-- Table `smSchool`.`eleve`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`eleve` (
  `id_eleve` INT(10) UNSIGNED NOT NULL,
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_tuteur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `code_eleve` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(75) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nationalite` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `photo` BLOB NULL DEFAULT NULL,
  `date_inscription` DATETIME NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formateur` (
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `code_formateur` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(75) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nationalite` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `photo` BLOB NULL DEFAULT NULL,
  `specialite` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `annee_experience` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_recrutement` DATETIME NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_formateur`))
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
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `code_formation` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom_formation` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `niveau` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `classe` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `type_formation` VARCHAR(70) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `filiere` VARCHAR(70) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `group_number` INT(2) NULL DEFAULT NULL,
  `group_name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `annee_scolaire` DATE NULL DEFAULT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
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
  `periode_name` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `code` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_periode` INT(10) UNSIGNED NOT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `code_controle_type` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `frequence` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `id_ensemble_controle` INT(10) UNSIGNED NOT NULL,
  `id_controle` INT(10) UNSIGNED NOT NULL,
  `code` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `id_controle_type` INT(10) UNSIGNED NOT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `nom` VARCHAR(75) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `description` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `langue` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `code_salle` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom_salle` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `superficie` FLOAT NULL DEFAULT NULL,
  `capacite` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `emplacement` BLOB NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_salle`))
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
  `date_compo_formation` DATE NULL DEFAULT NULL,
  `heure_debut` TIME NULL DEFAULT NULL,
  `heure_fin` TIME NULL DEFAULT NULL,
  `id_salle` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_formateur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `description_contenu` BLOB NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `is_done` TINYINT(1) NULL DEFAULT NULL,
  `is_annule` TINYINT(1) NULL DEFAULT NULL,
  `raison_annulation` BLOB NULL DEFAULT NULL,
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
  `date_cours` DATE NULL DEFAULT NULL,
  `heure_debut` TIME NULL DEFAULT NULL,
  `heure_fin` TIME NULL DEFAULT NULL,
  `id_salle` INT(10) UNSIGNED NULL DEFAULT NULL,
  `id_formateur` INT(10) UNSIGNED NULL DEFAULT NULL,
  `description_contenu` BLOB NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `is_done` TINYINT(1) NULL DEFAULT NULL,
  `is_annule` TINYINT(1) NULL DEFAULT NULL,
  `raison_annulation` BLOB NULL DEFAULT NULL,
  `id_cours_remplacement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `check_presence_done` TINYINT(1) NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  INDEX `fk_cours_1_idx` (`id_compo_formation` ASC),
  INDEX `fk_cours_2_idx` (`id_salle` ASC),
  INDEX `fk_cours_3_idx` (`id_formateur` ASC),
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
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_depense_mensuel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_depense_mensuel` (
  `id_type_depense` INT(10) UNSIGNED NOT NULL,
  `code_depense` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `intitule` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `intitule_mp` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `beneficiaire` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mois` DATE NULL DEFAULT NULL,
  `debut_period` DATE NULL DEFAULT NULL,
  `fin_period` DATE NULL DEFAULT NULL,
  `montant` DECIMAL(10,2) NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `done` TINYINT(1) NULL DEFAULT NULL,
  `facture_numero` INT(11) NULL DEFAULT NULL,
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
  `code_depense_s` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `beneficiaire` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `intitule` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `date_depense` DATE NULL DEFAULT NULL,
  `montant` DECIMAL(10,2) NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NULL DEFAULT NULL,
  `facture_numero` INT(11) NULL DEFAULT NULL,
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
  `logo` BLOB NULL DEFAULT NULL,
  `nom` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_fondation` DATE NULL DEFAULT NULL,
  `director_name` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` BLOB NULL DEFAULT NULL,
  `tel_fixe` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `autorisation_number` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`type_document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`type_document` (
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `nom_document` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `document` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
-- Table `smSchool`.`fonction_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`fonction_type` (
  `id_fonction` INT(10) UNSIGNED NOT NULL,
  `intitule_fonction` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_fonction`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`formateur_documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`formateur_documents` (
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `id_type_document` INT(10) UNSIGNED NOT NULL,
  `document` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `intitule_frais` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `montant` DECIMAL(10,2) NULL DEFAULT NULL,
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
  `commentaires` BLOB NULL DEFAULT NULL,
  `date_versement` DATE NULL DEFAULT NULL,
  `id_moyen_payement` INT(10) UNSIGNED NOT NULL,
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
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `commentaire_formateur` BLOB NULL DEFAULT NULL,
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
-- Table `smSchool`.`tuteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`tuteur` (
  `id_tuteur` INT(10) UNSIGNED NOT NULL,
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `code_tuteur` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(75) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nationalite` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `photo` BLOB NULL DEFAULT NULL,
  `date_inscription` DATETIME NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuteur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `smSchool`.`opt_send_tuteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`opt_send_tuteur` (
  `id_tuteur` INT(10) UNSIGNED NOT NULL,
  `frequence` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
-- Table `smSchool`.`personnel_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`personnel_type` (
  `id_personnel_type` INT(10) UNSIGNED NOT NULL,
  `fonction_name` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `grade` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `id_badge` INT(10) UNSIGNED NULL DEFAULT NULL,
  `code_personnel` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `prenom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nom` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `sexe` TINYINT(1) NULL DEFAULT NULL,
  `date_naissance` DATE NULL DEFAULT NULL,
  `tel1` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel2` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tel3` VARCHAR(13) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `email` VARCHAR(75) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `adresse` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `nationalite` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `photo` BLOB NULL DEFAULT NULL,
  `id_personnel_type` INT(10) UNSIGNED NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_personnel`),
  INDEX `fk_personnel_1_idx` (`id_personnel_type` ASC),
  CONSTRAINT `fk_personnel_1`
    FOREIGN KEY (`id_personnel_type`)
    REFERENCES `smSchool`.`personnel_type` (`id_personnel_type`)
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
  `document` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `id_controle` INT(10) UNSIGNED NOT NULL,
  `is_present` TINYINT(1) NULL DEFAULT NULL,
  `is_renvoye` TINYINT(1) NULL DEFAULT NULL,
  `heure_renvoie` TIME NULL DEFAULT NULL,
  `raison` BLOB NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_eleve`, `id_controle`),
  INDEX `fk_presence_controle_2_idx` (`id_controle` ASC),
  CONSTRAINT `fk_presence_controle_1`
    FOREIGN KEY (`id_eleve`)
    REFERENCES `smSchool`.`eleve` (`id_eleve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presence_controle_2`
    FOREIGN KEY (`id_controle`)
    REFERENCES `smSchool`.`controles` (`id_controle`)
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
  `is_present` TINYINT(1) NULL DEFAULT NULL,
  `is_renvoye` TINYINT(1) NULL DEFAULT NULL,
  `heure_renvoie` TIME NULL DEFAULT NULL,
  `raison` BLOB NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
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
-- Table `smSchool`.`recrutement_formateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smSchool`.`recrutement_formateur` (
  `id_recrutement_f` INT(10) UNSIGNED NOT NULL,
  `id_formateur` INT(10) UNSIGNED NOT NULL,
  `date_recrutement` DATE NULL DEFAULT NULL,
  `type_contract` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_debut_contrat` DATE NULL DEFAULT NULL,
  `date_fin_contrat` DATE NULL DEFAULT NULL,
  `salaire_mensuel` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_recrutement_f`),
  INDEX `fk_recrutement_formateur_1_idx` (`id_formateur` ASC),
  CONSTRAINT `fk_recrutement_formateur_1`
    FOREIGN KEY (`id_formateur`)
    REFERENCES `smSchool`.`formateur` (`id_formateur`)
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
  `type_contract` VARCHAR(200) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `date_debut_contrat` DATE NULL DEFAULT NULL,
  `date_fin_contrat` DATE NULL DEFAULT NULL,
  `salaire_mensuel` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
  `date_creation` DATETIME NULL DEFAULT NULL,
  `date_modification` DATETIME NULL DEFAULT NULL,
  `id_user` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_recrutement_p`),
  INDEX `fk_recrutement_personnel_1_idx` (`id_personnel` ASC),
  CONSTRAINT `fk_recrutement_personnel_1`
    FOREIGN KEY (`id_personnel`)
    REFERENCES `smSchool`.`personnel` (`id_personnel`)
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
  `total` DECIMAL(10,2) NULL DEFAULT NULL,
  `commentaires` BLOB NULL DEFAULT NULL,
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
  `document` VARCHAR(1000) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `type_name` VARCHAR(500) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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
  `username` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password_u` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
