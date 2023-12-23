-- Active: 1693690691999@@127.0.0.1@3306
/*1. **Création d'une base de données et de tables** :
   - Créez une base de données nommée "GestionnaireTaches".
   - À l'intérieur de cette base de données, créez une table "Taches" avec les colonnes suivantes : 
"id" (clé primaire, auto-incrémentée), "titre", "description", "date_de_creation".
*/

CREATE DATABASE GestionnaireTaches;P
CREATE TABLE Taches(
    id int PRIMARY KEY AUTO_INCREMENT ,
    titre VARCHAR(150),
    description VARCHAR(150),
    date_de_creation DATE
);
/*2. **Insertion de données** :
   - Insérez quelques tâches fictives dans la table "Taches". Assurez-vous de remplir toutes les
 colonnes.*/

 INSERT INTO Taches(id,titre,description, date_de_creation) VALUES(1,"tache1", "fais au qutidien", "03-09-2023");

/*3. **Sélection de données** :
   - Sélectionnez toutes les tâches de la table "Taches".
   - Sélectionnez uniquement les tâches dont la date de création est antérieure à une date
 spécifique.*/

 SELECT * FROM Taches;