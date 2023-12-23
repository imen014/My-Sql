-- Active: 1693771012964@@127.0.0.1@3306@phpmyadmin
/*Supposons que vous avez deux tables : "Personnes" et "Détails_Personne", liées par une relation
 "one-to-one". La table "Personnes" contient des informations générales sur les personnes, 
tandis que la table "Détails_Personne" contient des informations spécifiques à chaque personne.
 Chaque entrée dans la table "Personnes" est associée à une entrée correspondante 
dans la table "Détails_Personne" par une clé étrangère.

1. **Créez les tables :** Écrivez les requêtes SQL pour créer les deux tables "Personnes" 
et "Détails_Personne" avec les colonnes appropriées.
*/

CREATE DATABASE coordonnes_personnes;
use coordonnes_personnes;
CREATE Table personne(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    carte_identite int UNIQUE,
    Foreign Key (carte_identite) REFERENCES details_personnes(carte_identite)
);

CREATE Table details_personnes(
    carte_identite int PRIMARY key AUTO_INCREMENT,
    date_dernier_voyage DATE
);

/*2. **Insérez des données :** Ajoutez des données de test à vos tables pour plusieurs personnes 
avec leurs détails correspondants. Assurez-vous que chaque personne a une entrée correspondante 
dans la table "Détails_Personne".*/
INSERT into details_personnes(carte_identite,date_dernier_voyage)VALUES
(111,08/09/2023),
(112,09/08/2023),
(113,16/08/2023);

INSERT into personne(id,nom,prenom,carte_identite)VALUES
(1,"ali","mourad",111),
(2,"rahim","adel",112),
(3,"nader","ali",113);

/*3. **Sélectionnez des données :** Écrivez des requêtes SQL pour sélectionner toutes les personnes 
et leurs détails correspondants. Utilisez une jointure pour combiner les informations 
des deux tables.*/

SELECT * from personne join details_personnes on personne.carte_identite = details_personnes.carte_identite;

/*4. **Mise à jour des données :** Modifiez les détails d'une personne spécifique dans la table 
"Détails_Personne". Assurez-vous que la modification se reflète correctement dans la jointure 
avec la table "Personnes".*/

update details_personnes set date_dernier_voyage = "2023-09-08" where carte_identite = 111;

/*5. **Suppression de données :** Supprimez une personne de la table "Personnes" et assurez-vous
 que l'entrée correspondante dans la table "Détails_Personne" est également supprimée.
*/

delete from personne  WHERE(select * from personne as p join details_personnes as dt on p.carte_identite = dt.carte_identite where id = 2);

/*6. **Ajout de contraintes de clé étrangère :** Ajoutez une contrainte de clé étrangère 
pour garantir qu'une personne dans la table "Personnes" doit avoir une entrée correspondante 
dans la table "Détails_Personne". Essayez d'insérer une personne sans détails et vérifiez 
comment la contrainte de clé étrangère réagit.
*/

insert into personne(id,nom,prenom)VALUES(4,"ali","ben trad");

SELECT * FROM personne;

/*7. **Modification de la relation :** Supprimez la contrainte de clé étrangère et changez
 la relation entre les tables de "one-to-one" à "many-to-one". Modifiez ensuite les données 
pour refléter cette nouvelle relation.
*/
/***********************************************************************/
/***Exercice 1:** Créez une table "Adresse" avec des colonnes pour stocker l'adresse
 de chaque personne. Assurez-vous qu'il y a une relation "one-to-one" entre la table "Personnes" 
et la table "Adresse".
*/

CREATE TABLE address(
    id int PRIMARY KEY AUTO_INCREMENT,
    adresse VARCHAR(50)
);

ALTER TABLE personne add Foreign Key (id_adresse) REFERENCES address(id);

/***Exercice 2:** Insérez des données de test dans la table "Adresse" pour chaque personne de la table
 "Personnes". Assurez-vous que chaque personne a une adresse correspondante.
*/

INSERT INTO address(id,adresse)VALUES(1,"manar 6"),(2,"manzah");
SELECT * FROM personne;

update personne set id_adresse = 2 where id = 4;

/***Exercice 3:** Modifiez la table "Personnes" pour inclure une colonne "email". Assurez-vous que 
la relation "one-to-one" entre la table "Personnes" et la table "Adresse" reste intacte.
*/