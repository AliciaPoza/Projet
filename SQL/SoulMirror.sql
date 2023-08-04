-- Création de la base de données SoulMirror
CREATE DATABASE IF NOT EXISTS SoulMirror;

-- Selectionner la base de données
USE SoulMirror;

-- Création des tables
CREATE TABLE IF NOT EXISTS role(
	id_role INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	libelle_role VARCHAR(50) NOT NULL UNIQUE
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur(
	id_utilisateur INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_utilisateur VARCHAR(50) NOT NULL,
    prenom_utilisateur VARCHAR(50) NOT NULL,
    pseudo_utilisateur VARCHAR(25) NOT NULL UNIQUE,
    email_utilisateur VARCHAR(70) NOT NULL UNIQUE,
    mot_de_passe_utilisateur VARCHAR(60) NOT NULL,
    id_role INT NOT NULL,
    FOREIGN KEY(id_role) REFERENCES role(id_role)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS message(
	id_message INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	contenu_message TEXT
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS traitement(
	id_traitement INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	alarme_traitement INT
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS sujet(
	id_sujet INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	titre_sujet VARCHAR(100),
    contenu_sujet TEXT,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS appel(
	id_appel INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_appel VARCHAR(100) NOT NULL,
    telephone_appel VARCHAR(10) NOT NULL,
    id_role INT NOT NULL,
    FOREIGN KEY(id_role) REFERENCES role(id_role)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS jour(
	id_jour INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_jour VARCHAR(50) NOT NULL,
    numero_rue_jour INT,
    nom_rue_jour VARCHAR(255),
    code_postal_jour VARCHAR(20),
    ville_jour VARCHAR(100),
    numero_departement_jour VARCHAR(10),
    nom_departement_jour VARCHAR(50),
    telephone_jour VARCHAR(10),
    id_role INT NOT NULL,
    FOREIGN KEY(id_role) REFERENCES role(id_role)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS signalement(
	id_signalement INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	contenu_signalement TEXT,
    id_role INT NOT NULL,
    FOREIGN KEY(id_role) REFERENCES role(id_role)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS commentaire(
	id_commentaire INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	contenu_commentaire TEXT,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur_signalement(
	id_utilisateur INT NOT NULL,
    id_signalement INT NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY(id_signalement) REFERENCES signalement(id_signalement)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur_traitement(
	id_utilisateur INT NOT NULL,
    id_traitement INT NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY(id_traitement) REFERENCES traitement(id_traitement)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur_message_repondre(
	id_utilisateur INT NOT NULL,
    id_message INT NOT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY(id_message) REFERENCES message(id_message)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS utilisateur_ouvrir(
	id_utilisateur INT NOT NULL,
    id_message INT NOT NULL,
    message_ouvert BOOL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY(id_message) REFERENCES message(id_message)
) Engine=InnoDB;