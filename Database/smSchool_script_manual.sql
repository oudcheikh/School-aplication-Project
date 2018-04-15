CREATE DATABASE smSchool;

CREATE TABLE eleve (
  id_eleve int(10) unsigned NOT NULL,
  id_badge int(10) unsigned DEFAULT NULL,
  id_tuteur int(10) unsigned DEFAULT NULL,
  code_eleve varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  nom varchar(45) DEFAULT NULL,
  sexe tinyint(1) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  tel1 varchar(13) DEFAULT NULL,
  tel2 varchar(13) DEFAULT NULL,
  tel3 varchar(13) DEFAULT NULL,
  email varchar(75) DEFAULT NULL,
  adresse varchar(1000) DEFAULT NULL,
  nationalite varchar(45) DEFAULT NULL,
  commentaires blob,
  photo blob,
  date_inscription datetime DEFAULT NULL,
  date_creation datetime DEFAULT NULL,
  date_modification datetime DEFAULT NULL,
  id_user int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id_eleve)
) ENGINE=InnoDB;


CREATE TABLE tuteur (
  id_tuteur int(10) unsigned NOT NULL,
  id_badge int(10) unsigned DEFAULT NULL,
  code_tuteur varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  nom varchar(45) DEFAULT NULL,
  sexe tinyint(1) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  tel1 varchar(13) DEFAULT NULL,
  tel2 varchar(13) DEFAULT NULL,
  tel3 varchar(13) DEFAULT NULL,
  email varchar(75) DEFAULT NULL,
  adresse varchar(1000) DEFAULT NULL,
  nationalite varchar(45) DEFAULT NULL,
  commentaires blob,
  photo blob,
  date_inscription datetime DEFAULT NULL,
  date_creation datetime DEFAULT NULL,
  date_modification datetime DEFAULT NULL,
  id_user int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id_tuteur)
) ENGINE=InnoDB;

CREATE TABLE personnel (
  id_personnel int(10) unsigned NOT NULL,
  id_badge int(10) unsigned DEFAULT NULL,
  code_personnel varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  nom varchar(45) DEFAULT NULL,
  sexe tinyint(1) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  tel1 varchar(13) DEFAULT NULL,
  tel2 varchar(13) DEFAULT NULL,
  tel3 varchar(13) DEFAULT NULL,
  email varchar(75) DEFAULT NULL,
  adresse varchar(1000) DEFAULT NULL,
  nationalite varchar(45) DEFAULT NULL,
  commentaires blob,
  photo blob,
  id_personnel_type int(10) unsigned DEFAULT NULL,
  date_creation datetime DEFAULT NULL,
  date_modification datetime DEFAULT NULL,
  id_user int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id_personnel)
) ENGINE=InnoDB;

CREATE TABLE formateur (
  id_formateur int(10) unsigned NOT NULL,
  id_badge int(10) unsigned DEFAULT NULL,
  code_formateur varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  nom varchar(45) DEFAULT NULL,
  sexe tinyint(1) DEFAULT NULL,
  date_naissance date DEFAULT NULL,
  tel1 varchar(13) DEFAULT NULL,
  tel2 varchar(13) DEFAULT NULL,
  tel3 varchar(13) DEFAULT NULL,
  email varchar(75) DEFAULT NULL,
  adresse varchar(1000) DEFAULT NULL,
  nationalite varchar(45) DEFAULT NULL,
  commentaires blob,
  photo blob,
  specialite varchar(100) DEFAULT NULL,
  annee_experience varchar(100) DEFAULT NULL,
  date_recrutement datetime DEFAULT NULL,
  date_creation datetime DEFAULT NULL,
  date_modification datetime DEFAULT NULL,
  id_user int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id_formateur)
) ENGINE=InnoDB;

CREATE TABLE formations (
 id_formation int(10) unsigned NOT NULL,
 code_formation varchar(45) DEFAULT NULL,
 nom_formation varchar(100) DEFAULT NULL,
 niveau varchar(50) DEFAULT NULL,
 classe varchar(50) DEFAULT NULL,
 type varchar(70) DEFAULT NULL,
 filiere varchar(70) DEFAULT NULL,
 frais_inscription  decimal(15,2) DEFAULT NULL,
 mensualite decimal(15,2) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_formation)
) ENGINE=InnoDB;
 

CREATE TABLE inscription (
 id_inscription int(10) unsigned NOT NULL,
 id_eleve int(10) unsigned NOT NULL,
 id_formation_group int(10) unsigned NOT NULL,
 date_inscription datetime NOT NULL,
 date_fin_inscription datetime DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_inscription)
) ENGINE=InnoDB;
 
CREATE TABLE formation_group (
 id_formation_group int(10) unsigned NOT NULL,
 id_formation int(10) unsigned NOT NULL,
 group_number int(2) DEFAULT NULL,
 group_name varchar(50) DEFAULT NULL,
 annee_scolaire date DEFAULT NULL,
 date_debut date DEFAULT NULL,
 date_fin date DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_formation_group)
) ENGINE=InnoDB;

CREATE TABLE matieres (
 id_matiere int(10) unsigned NOT NULL,
 nom varchar(75) DEFAULT NULL,
 description varchar(1000) DEFAULT NULL,
 langue varchar(50) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_matiere)
) ENGINE=InnoDB;

CREATE TABLE compo_formation (
 id_compo_formation int(10) unsigned NOT NULL,
 id_formation_group int(10) unsigned NOT NULL,
 id_matiere int(10) unsigned NOT NULL,
 coefficient int(2) DEFAULT NULL,
 id_periode int(10) unsigned NOT NULL,
 id_formateur int(10) unsigned NOT NULL,
 prix_horaire decimal(10,2) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_compo_formation)
) ENGINE=InnoDB;

CREATE TABLE notes (
 id_eleve int(10) unsigned NOT NULL,
 id_compo_controle int(10) unsigned NOT NULL,
 note decimal(6,2) DEFAULT NULL,
 commentaire_formateur blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_eleve, id_compo_controle)
) ENGINE=InnoDB;

CREATE TABLE compo_controle (
 id_compo_controle int(10) unsigned NOT NULL,
 id_controle int(10) unsigned NOT NULL,
 id_compo_formation int(10) unsigned NOT NULL,
 date_compo_formation date DEFAULT NULL,
 heure_debut time DEFAULT NULL,
 heure_fin time DEFAULT NULL,
 id_salle  int(10) unsigned DEFAULT NULL,
 id_formateur int(10) unsigned DEFAULT NULL,
 description_contenu blob,
 commentaires blob,
 is_done tinyint(1) DEFAULT NULL,
 is_annule tinyint(1) DEFAULT NULL,
 raison_annulation blob,
 id_controle_remplacement int(10) unsigned DEFAULT NULL,
 check_presence_done tinyint(1) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_compo_controle)
) ENGINE=InnoDB;

CREATE TABLE cours (
 id_cours int(10) unsigned NOT NULL,
 id_compo_formation int(10) unsigned NOT NULL,
 date_cours date DEFAULT NULL,
 heure_debut time DEFAULT NULL,
 heure_fin time DEFAULT NULL,
 id_salle  int(10) unsigned DEFAULT NULL,
 id_formateur int(10) unsigned DEFAULT NULL,
 description_contenu blob,
 commentaires blob,
 is_done tinyint(1) DEFAULT NULL,
 is_annule tinyint(1) DEFAULT NULL,
 raison_annulation blob,
 id_cours_remplacement int(10) unsigned DEFAULT NULL,
 check_presence_done tinyint(1) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_cours)
) ENGINE=InnoDB;

CREATE TABLE salles (
 id_salle int(10) unsigned NOT NULL,
 code_salle varchar(45) DEFAULT NULL,
 nom_salle varchar(100) DEFAULT NULL,
 superficie float DEFAULT NULL,
 capacite SMALLINT unsigned DEFAULT NULL,
 emplacement blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_salle)
) ENGINE=InnoDB;

CREATE TABLE tuteur_documents (
 id_tuteur int(10) unsigned NOT NULL,
 id_type_document int(10) unsigned NOT NULL,
 document varchar(1000) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_tuteur, id_type_document)
) ENGINE=InnoDB;

CREATE TABLE eleve_documents (
 id_eleve int(10) unsigned NOT NULL,
 id_type_document int(10) unsigned NOT NULL,
 document varchar(1000) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_eleve, id_type_document)
) ENGINE=InnoDB;

CREATE TABLE personnel_documents (
 id_personnel int(10) unsigned NOT NULL,
 id_type_document int(10) unsigned NOT NULL,
 document varchar(1000) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_personnel, id_type_document)
) ENGINE=InnoDB;

CREATE TABLE formateur_documents (
 id_formateur int(10) unsigned NOT NULL,
 id_type_document int(10) unsigned NOT NULL,
 document varchar(1000) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_formateur, id_type_document)
) ENGINE=InnoDB;

CREATE TABLE controle_type (
 id_controle_type int(10) unsigned NOT NULL,
 code_controle_type varchar(45) DEFAULT NULL,
 nom varchar(500) DEFAULT NULL,
 frequence varchar(100) DEFAULT NULL,
 during_cours tinyint(1) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_controle_type)
) ENGINE=InnoDB;

CREATE TABLE mensualites (
 id_inscription int(10) unsigned NOT NULL,
 mois date NOT NULL,
 date_debut date DEFAULT NULL,
 date_fin date DEFAULT NULL,
 date_limite date DEFAULT NULL,
 is_paid tinyint(1) DEFAULT NULL,
 expected_amount decimal(10,2) DEFAULT NULL,
 montant_paye decimal(10,2) DEFAULT NULL,
 commentaires blob,
 date_versement date DEFAULT NULL,
 id_moyen_payement int(10) unsigned DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_inscription, mois)
) ENGINE=InnoDB;  

CREATE TABLE fonction_type (
 id_fonction int(10) unsigned NOT NULL,
 intitule_fonction varchar(500) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_fonction)
) ENGINE=InnoDB;

CREATE TABLE presence_controle (
 id_eleve int(10) unsigned NOT NULL,
 id_controle int(10) unsigned NOT NULL,
 is_present tinyint(1) DEFAULT NULL,
 is_renvoye tinyint(1) DEFAULT NULL,
 heure_renvoie time DEFAULT NULL,
 raison blob,
 commentaire blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_eleve, id_controle)
) ENGINE=InnoDB; 

CREATE TABLE presence_cours (
 id_eleve int(10) unsigned NOT NULL,
 id_cours int(10) unsigned NOT NULL,
 is_present tinyint(1) DEFAULT NULL,
 is_renvoye tinyint(1) DEFAULT NULL,
 heure_renvoie time DEFAULT NULL,
 raison blob,
 commentaire blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_eleve, id_cours)
) ENGINE=InnoDB;

CREATE TABLE controles (
 id_ensemble_controle int(10) unsigned NOT NULL,
 id_controle int(10) unsigned NOT NULL,
 code varchar(50) DEFAULT NULL,
 nom varchar(500) DEFAULT NULL,
 id_controle_type int(10) unsigned NOT NULL,
 date_debut date DEFAULT NULL, 
 date_fin date DEFAULT NULL,
 commentaires blob,
 coefficient smallint unsigned DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_controle)
) ENGINE=InnoDB; 

CREATE TABLE ensemble_controle (
 id_ensemble_controle int(10) unsigned NOT NULL,
 id_formation_group int(10) unsigned NOT NULL,
 code varchar(50) DEFAULT NULL,
 nom varchar(500) DEFAULT NULL,
 id_periode int(10) unsigned NOT NULL,
 date_debut date DEFAULT NULL,
 date_fin date DEFAULT NULL,
 commentaires blob,
 coefficient smallint unsigned DEFAULT NULL, 
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_ensemble_controle)
) ENGINE=InnoDB;

CREATE TABLE users (
 id_user int(10) unsigned NOT NULL,
 id_personnel int(10) unsigned NOT NULL,
 username varchar(100) DEFAULT NULL,
 password_u varchar(100) DEFAULT NULL,
 id_user_type int(10) unsigned NOT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 PRIMARY KEY (id_user)
) ENGINE=InnoDB; 

CREATE TABLE bulletin_commentaires (
 id_eleve int(10) unsigned NOT NULL,
 id_ensemble_controle int(10) unsigned DEFAULT NULL,
 id_controle int(10) unsigned DEFAULT NULL,
 id_compo_controle int(10) unsigned DEFAULT NULL,
 id_formateur int(10) unsigned DEFAULT NULL,
 commentaires blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB; 

CREATE TABLE user_type (
 id_user_type int(10) unsigned NOT NULL,
 type_name varchar(500) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_user_type)
) ENGINE=InnoDB;  

CREATE TABLE periode (
 id_periode int(10) unsigned NOT NULL,
 periode_name varchar(500) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_periode)
) ENGINE=InnoDB; 

CREATE TABLE ecole (
 logo blob,
 nom varchar(500) DEFAULT NULL,
 date_fondation date DEFAULT NULL,
 director_name varchar(500) DEFAULT NULL,
 adresse blob,
 tel_fixe varchar(13) DEFAULT NULL,
 autorisation_number varchar(100) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB;  

CREATE TABLE personnel_type (
 id_personnel_type int(10) unsigned NOT NULL,
 fonction_name varchar(500) DEFAULT NULL,
 grade varchar(100) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_personnel_type)
) ENGINE=InnoDB; 

CREATE TABLE type_frais (
 id_type_frais int(10) unsigned NOT NULL,
 id_formation int(10) unsigned NOT NULL,
 intitule_frais varchar(1000) DEFAULT NULL,
 montant decimal(10,2) DEFAULT NULL,
 id_period int(10) unsigned NOT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_type_frais)
) ENGINE=InnoDB;  

CREATE TABLE frais_eleves (
 id_frais int(10) unsigned NOT NULL,
 id_inscription int(10) unsigned NOT NULL,
 id_type_frais int(10) unsigned NOT NULL,
 date_debut date DEFAULT NULL,
 date_fin date DEFAULT NULL,
 date_limite date DEFAULT NULL,
 is_paid tinyint(1) DEFAULT NULL,
 montant_paye decimal(10,2) DEFAULT NULL,
 commentaires blob,
 date_versement date DEFAULT NULL,
 id_moyen_payement int(10) unsigned NOT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_frais)
) ENGINE = InnoDB;

CREATE TABLE moyen_payement (
 id_moyen_payement int(10) unsigned NOT NULL,
 intitule_mp varchar(500) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_moyen_payement)
) ENGINE = InnoDB;

CREATE TABLE recrutement_formateur (
 id_recrutement_f int(10) unsigned NOT NULL,
 id_formateur int(10) unsigned NOT NULL,
 date_recrutement date DEFAULT NULL,
 type_contract varchar(200) DEFAULT NULL,
 date_debut_contrat date DEFAULT NULL,
 date_fin_contrat date DEFAULT NULL,
 salaire_mensuel decimal(10,2) DEFAULT NULL,
 commentaires blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_recrutement_f)
) ENGINE = InnoDB;
 
CREATE TABLE recrutement_personnel (
 id_recrutement_p int(10) unsigned NOT NULL,
 id_personnel int(10) unsigned NOT NULL,
 date_recrutement date DEFAULT NULL,
 type_contract varchar(200) DEFAULT NULL,
 date_debut_contrat date DEFAULT NULL,
 date_fin_contrat date DEFAULT NULL,
 salaire_mensuel decimal(10,2) DEFAULT NULL,
 commentaires blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_recrutement_p)
) ENGINE = InnoDB;

CREATE TABLE versement_formateur (
 id_versement_f int(10) unsigned NOT NULL,
 id_recrutement_f int(10) unsigned NOT NULL,
 debut_period date DEFAULT NULL,
 fin_period date DEFAULT NULL,
 date_versement date DEFAULT NULL,
 id_moyen_payement int(10) unsigned NOT NULL,
 done tinyint(1) unsigned NOT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_versement_f)
) ENGINE = InnoDB;

CREATE TABLE versement_personnel (
 id_versement_p int(10) unsigned NOT NULL,
 id_recrutement_p int(10) unsigned NOT NULL,
 debut_period date DEFAULT NULL,
 fin_period date DEFAULT NULL,
 date_versement date DEFAULT NULL,
 id_moyen_payement int(10) unsigned NOT NULL,
 done tinyint(1) unsigned NOT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_versement_p)
) ENGINE = InnoDB;

CREATE TABLE depense_special (
 id_depense_s int(10) unsigned NOT NULL,
 code_depense_s varchar(100) DEFAULT NULL,
 beneficiaire varchar(200) DEFAULT NULL,
 intitule varchar(500) DEFAULT NULL,
 commentaires blob,
 date_depense date DEFAULT NULL,
 montant decimal(10,2) DEFAULT NULL,
 id_moyen_payement int(10) unsigned DEFAULT NULL,
 facture_numero int default NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_depense_s)
) ENGINE = InnoDB;

CREATE TABLE depense_mensuel (
 id_depense_m int(10) unsigned NOT NULL,
 id_type_depense int(10) unsigned NOT NULL,
 beneficiaire varchar(200) DEFAULT NULL,
 mois date DEFAULT NULL,
 debut_period date DEFAULT NULL,
 fin_period date DEFAULT NULL,
 montant decimal(10,2) DEFAULT NULL,
 date_versement date DEFAULT NULL,
 id_moyen_payement int(10) unsigned DEFAULT NULL,
 done tinyint(1) DEFAULT NULL,
 facture_numero int default NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_depense_m)
) ENGINE = InnoDB;

CREATE TABLE type_depense_mensuel (
 id_type_depense int(10) unsigned NOT NULL,
 code_depense varchar(100) DEFAULT NULL,
 intitule varchar(1000) DEFAULT NULL,
 commentaires blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_type_depense)
) ENGINE = InnoDB; 

CREATE TABLE synthese_depense_mensuel ( 
 id_sdm int(10) unsigned NOT NULL,
 mois_sdm date DEFAULT NULL,
 total decimal(10,2) DEFAULT NULL, 
 commentaires blob,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_sdm)
) ENGINE = InnoDB;

CREATE TABLE opt_send_tuteur (
 id_tuteur int(10) unsigned NOT NULL,
 frequence varchar(200) DEFAULT NULL,
 mail tinyint(1) DEFAULT NULL,
 sms tinyint(1) DEFAULT NULL,
 whatsapp tinyint(1) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_tuteur)
) ENGINE = InnoDB;

CREATE TABLE type_document (
 id_type_document int(10) unsigned NOT NULL,
 nom_document varchar(500) DEFAULT NULL,
 is_mandatory tinyint(1) DEFAULT NULL,
 date_creation datetime DEFAULT NULL,
 date_modification datetime DEFAULT NULL,
 id_user int(10) unsigned DEFAULT NULL,
 PRIMARY KEY (id_type_document)
) ENGINE = InnoDB;
