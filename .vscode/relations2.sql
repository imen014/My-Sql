-- Active: 1693771012964@@127.0.0.1@3306@phpmyadmin
/***Exercice 1 : Création de la Base de Données**

Créez une nouvelle base de données appelée "GestionEcole".

**Exercice 2 : Relation One-to-One**

1. Créez une table "Élève" avec les colonnes suivantes :
   - IDElève (clé primaire)
   - Nom
   - Prénom

2. Créez une table "CarteID" avec les colonnes suivantes :
   - IDCarte (clé primaire)
   - NuméroCarte
   - DateExpiration

3. Utilisez la commande ALTER TABLE pour établir 
une relation one-to-one entre "Élève"
 et "CarteID" en ajoutant une clé étrangère appropriée.*/

USE GestionEcole;
    CREATE Table eleve(
        id_eleve int PRIMARY key AUTO_INCREMENT,
        nom VARCHAR(255),
        prenom VARCHAR(255)
    );

    CREATE Table CarteID(
        IDCarte int PRIMARY KEY AUTO_INCREMENT,
        NuméroCarte VARCHAR(50),
        DateExpiration DATE
);

ALTER Table eleve add Foreign Key () REFERENCES CarteID(IDCarte);

/***Exercice 3 : Relation One-to-Many**

1. Ajoutez une table "Classe" avec les colonnes suivantes :
   - IDClasse (clé primaire)
   - NomClasse

2. Modifiez la table "Élève" en ajoutant une colonne "IDClasse" (clé étrangère référençant 
la table "Classe") pour établir une relation one-to-many entre les élèves et les classes.
*/

CREATE table classe(
    IDClasse int PRIMARY key AUTO_INCREMENT,
    NomClasse VARCHAR(50)
);



alter Table eleve add Foreign Key (IDClasse) REFERENCES classe(IDClasse);

/*/***Exercice 4 : Modification de la Structure de Table**

1. Utilisez la commande ALTER TABLE pour ajouter une colonne 
"DateNaissance" à la table "Élève" 
pour enregistrer la date de naissance de chaque élève.

2. Utilisez la commande ALTER TABLE pour supprimer la colonne
 "DateExpiration" de la table 
"CarteID".*/

alter TABLE CarteID drop DateExpiration;

/***Exercice 5 : Autre Modification de la Structure de Table**

1. Utilisez la commande ALTER TABLE pour ajouter une colonne 
"Niveau" à la table "Classe" 
pour indiquer le niveau de chaque classe 
(par exemple, "Première année", "Deuxième année", etc.).

2. Utilisez la commande ALTER TABLE pour renommer la colonne 
"NomClasse" de la table "Classe" 
en "NomNiveau".
*/

alter table Classe add niveau VARCHAR(50);

ALTER Table Classe CHANGE NomClasse NomNiveau VARCHAR(50);

/***Exercice 6 : Suppression d'une Relation One-to-One**

Utilisez la commande ALTER TABLE pour supprimer la relation 
one-to-one entre "Élève" 
et "CarteID" en supprimant la clé étrangère.
*/

use gestionecole;
ALTER Table eleve drop Foreign Key id_carte;

/***Exercice 7 : Suppression d'une Relation One-to-Many**

Utilisez la commande ALTER TABLE pour supprimer la relation 
one-to-many entre "Élève" 
et "Classe" en supprimant la clé étrangère.*/

use gestionecole;
alter TABLE eleve drop FOREIGN KEY IDClasse;