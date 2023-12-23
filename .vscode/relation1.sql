-- Active: 1693771012964@@127.0.0.1@3306@phpmyadmin
/**
**Tables :**

1. **Livres :** Cette table contiendra des informations sur les livres disponibles 
dans la bibliothèque, notamment l'ISBN (numéro d'identification unique du livre),
 le titre, l'auteur, le genre, l'année de publication, etc.

    - ISBN (Clé primaire)
    - Titre
    - Auteur
    - Genre
    - Année de publication*/

    CREATE DATABASE IF NOT EXISTS BIBLIOTHEQUE;
    USE bibliotheque;
    CREATE TABLE LIVRES(
        ISBN int PRIMARY KEY AUTO_INCREMENT,
        titre VARCHAR(255),
        auteur VARCHAR(255),
        genre VARCHAR(10),
        annee_publication DATE
    );

/*2. **Emprunteurs :** Cette table stockera les détails des personnes qui empruntent des livres, 
tels que leur ID, nom, adresse, et adresse e-mail.

    - ID (Clé primaire)
    - Nom
    - Adresse
    - Email
*/

CREATE TABLE Emprunteurs(
    id int PRIMARY key AUTO_INCREMENT,
    nom VARCHAR(255),
    adresse VARCHAR(255),
    email VARCHAR(50)
);
/*3. **Emprunts :** Cette table enregistrera les emprunts de livres, avec des informations 
sur l'ID de l'emprunt, l'ISBN du livre emprunté, l'ID de l'emprunteur, la date d'emprunt, 
la date de retour prévue, etc.

    - ID (Clé primaire)
    - ISBN (Clé étrangère faisant référence à la table "Livres")
    - EmprunteurID (Clé étrangère faisant référence à la table "Emprunteurs")
    - DateEmprunt
    - DateRetourPrevue*/

    CREATE Table emprunts(
        id int PRIMARY key AUTO_INCREMENT,
        DateEmprunt Date,
        DateRetourPrevue Date,
        isbn int,
        emprunteur_id int,
        Foreign Key (isbn) REFERENCES LIVRES(ISBN),
        Foreign Key (emprunteur_id) REFERENCES Emprunteurs(id)
        );

/* **Relations :**

- La table "Emprunts" est liée à la table "Livres" via la colonne ISBN, ce qui permet 
de savoir quel livre est emprunté.

- La table "Emprunts" est liée à la table "Emprunteurs" via la colonne EmprunteurID,
 ce qui permet de savoir qui a emprunté le livre.

**Contraintes :**

- Les colonnes ID de chaque table sont définies comme des clés primaires, garantissant ainsi 
l'unicité des valeurs dans chaque table.

- Les colonnes ISBN dans la table "Emprunts" et EmprunteurID dans la table "Emprunts" sont définies 
comme des clés étrangères, assurant l'intégrité référentielle entre les tables.

**Cela constitue la description de la base de données pour votre bibliothèque.**
 Vous pouvez maintenant créer cette base de données dans MySQL en utilisant les commandes SQL 
que j'ai fournies précédemment, puis ajouter des données factices et exécuter des requêtes
 pour gérer la bibliothèque.

*********************************************************************************/

/*********************************************************************************
voici les énoncés des exercices SQL :

**Exercice 1 :**
Écrivez une requête SQL qui affiche le nom de l'emprunteur, 
le titre du livre emprunté 
et la date d'emprunt pour chaque emprunt. Utilisez une jointure 
pour relier les tables appropriées.*/

SELECT e.dateEmprunt, em.nom AS nom_emprunteur,
 l.titre AS titre_de_livre_emprunte
 from  emprunts AS e
 join emprunteurs AS em ON e.emprunteur_id = em.id
 join livres AS l ON e.isbn = l.isbn;

 /***Exercice 2 :**
Ajoutez une nouvelle colonne "DateRetourRéelle" à la table 
"Emprunts" pour enregistrer 
la date de retour réelle des livres empruntés.*/

ALTER TABLE Emprunts ADD DateRetourReelle Date;

/***Exercice 3 :**
Mettez à jour la table "Emprunts" pour enregistrer la date 
de retour réelle pour certains emprunts.
*/

UPDATE Emprunts SET DateRetourReelle = "2023-09-05";

/***Exercice 4 :**
Écrivez une requête SQL qui affiche le nom de l'emprunteur, le titre du livre emprunté, 
la date d'emprunt et la date de retour réelle pour chaque emprunt. Utilisez une jointure 
pour relier les tables appropriées.*/

SELECT em.nom, l.titre as titre_de_livre_emprunté, e.DateEmprunt, e.DateRetourReelle
FROM emprunteurs AS em
join emprunts AS e on em.id = e.emprunteur_id
join livres as l on  e.isbn = l.isbn;

/***Exercice 5 :**
Supprimez un livre spécifique de la table "Livres" 
et tous les emprunts associés de la table
 "Emprunts". Assurez-vous de gérer les contraintes d'intégrité 
 référentielle.
*/

Delete l from livres as l
where l.isbn in (SELECT e.isbn from emprunts as e);

/***Exercice 6 :**
Écrivez une requête SQL qui affiche le nom de l'emprunteur, 
le titre du livre emprunté,
 la date d'emprunt et la date de retour réelle pour tous 
 les emprunts qui n'ont pas encore 
été retournés (DateRetourRéelle est NULL).*/

SELECT em.nom, l.titre, e.DateEmprunt, e.DateRetourReelle
from emprunteurs as em
join emprunts as e on em.id = e.emprunteur_id
join livres as l on l.isbn = e.isbn;

/***Exercice 7 :**
Utilisez ALTER TABLE pour ajouter une nouvelle 
colonne "Commentaire" à la table "Livres" 
pour stocker des commentaires sur les livres.*/

alter Table livres add Commentaires VARCHAR(255);

/***Exercice 8 :**
Mettez à jour la table "Livres" pour ajouter des commentaires 
à certains livres spécifiques.
*/

update livres set commentaires = "commentaire pour id 1" where isbn = 1;

/***Exercice 9 :**
Écrivez une requête SQL qui affiche le titre du livre, 
le nom de l'auteur, le genre 
et les commentaires pour chaque livre.*/

Select titre, auteur, commentaires, genre from livres;

