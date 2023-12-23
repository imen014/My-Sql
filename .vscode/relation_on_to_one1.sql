-- Active: 1693771012964@@127.0.0.1@3306@phpmyadmin
/*1. **Créer une table "Personne" avec des informations de base (ID, nom, prénom, date de naissance)
 et une table "Passeport" pour stocker les détails du passeport de chaque personne.
 Assurez-vous qu'il y a une relation one-to-one entre les deux tables.
*/

USE relationOneToOne1;
CREATE Table personne(
    ID int PRIMARY KEY AUTO_INCREMENT,
     nom VARCHAR(100),
      prenom VARCHAR(100),
       date_naissance DATE
);

CREATE TABLE passeport(
    id int PRIMARY key AUTO_INCREMENT,
    numero_de_passeport VARCHAR(15)
);

alter Table personne add id_passeport int;

ALTER TABLE personne add FOREIGN key(id_passeport) REFERENCES passeport(id);

INSERT into personne(id,nom,prenom,date_naissance)VALUES(1,"sebastien","dogotchi","2023-06-09");

INSERT INTO passeport(id,numero_de_passeport)values(1,"x195077");

SELECT * from personne join passeport on personne.id_passeport = passeport.id  where id=1;

UPDATE personne set id_passeport = 1 where id = 1 ;
/******************************************************************/
/*2. **Construisez une base de données pour une bibliothèque. Créez une table "Livre"
 et une table "Auteur". Chaque livre doit être lié à un seul auteur, et chaque auteur
 peut avoir écrit plusieurs livres.
 relaion one to many
*/

use my_library;

CREATE Table livre(
    id int PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100),
    id_auteur int,
    Foreign Key (id_auteur) REFERENCES auteur(id)
);
CREATE Table auteur(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100)
);

INSERT into auteur(id,nom)VALUES(1,"taha jobran");

INSERT INTO livre(id,titre,id_auteur)VALUES(1,"livre taha jobran",1)

SELECT * FROM auteur join livre on auteur.id = livre.id_auteur;
/***********************************************************/
/*3. **Imaginez une application de gestion d'employés.
 Créez une table "Employé" pour stocker 
les informations de base sur les employés (ID, nom, poste) 
et une table "Coordonnées" 
pour stocker les coordonnées 
de chaque employé (adresse, numéro de téléphone, adresse e-mail). 
Assurez-vous qu'un employé est associé à une seule entrée
 de "Coordonnées".
*/
CREATE Table employee(
    ID int PRIMARY key AUTO_INCREMENT,
     nom VARCHAR(50), 
     poste VARCHAR(100)
);

CREATE Table coordonnes(
    adresse_mail VARCHAR(15) PRIMARY key,
    adresse VARCHAR(15),
     numero_telephone VARCHAR(15) 
);

alter Table coordonnes add adresse_mail  VARCHAR(50) UNIQUE PRIMARY KEY

ALTER TABLE employee add Foreign Key (email_employe) REFERENCES coordonnes(adresse_mail); 
/*c'est une relation one to many*/
INSERT INTO employee(ID, nom, poste,email_employe )VALUES(1,"ali","software engineer","ali@gmail.com");
INSERT INTO coordonnes(adresse, numero_telephone, adresse_mail)VALUES("manzah6","93090615","ali@gmail.com");

select * from employee join coordonnes on employee.email_employe = coordonnes.adresse_mail

/*4. **Construisez une base de données pour un site de commerce 
électronique. 
Créez une table "Utilisateur" pour stocker les informations
 d'inscription des utilisateurs 
et une table "Profil" pour stocker des informations 
supplémentaires sur chaque utilisateur,
 telles que l'adresse de livraison. Chaque utilisateur 
 doit être associé à un seul profil.
*/

CREATE Table Utilisateur(
    id int PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    user_phone VARCHAR(50)
);