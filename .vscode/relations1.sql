-- Active: 1693771012964@@127.0.0.1@3306@phpmyadmin
/***Scénario : Système de Gestion de Bibliothèque**

Vous développez un système de gestion de bibliothèque pour une bibliothèque locale. 
La bibliothèque souhaite informatiser la gestion de ses livres, de ses membres (lecteurs),
 des emprunts et des retours de livres.

**Tables à créer :**

1. "Livres" : Stocke des informations sur les livres, telles que le titre, l'auteur, l'éditeur, 
l'année de publication, etc.

2. "Membres" : Enregistre les détails des membres de la bibliothèque, tels que le nom, l'adresse,
 le numéro de téléphone, etc.

3. "Emprunts" : Enregistre les emprunts de livres par les membres. Cette table devrait contenir 
des informations sur la date d'emprunt et la date de retour prévue.
*/

usE GestionBibliotheque;
CREATE Table livres(
    id int PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(50),
    auteur VARCHAR(50), 
    editeur VARCHAR(50), 
    annee_publication DATE
    );


    CREATE table membres(
        id int PRIMARY KEY AUTO_INCREMENT,
         nom VARCHAR(50), 
         adresse VARCHAR(50),
        phone_number VARCHAR(50)
    );

    CREATE Table emprunts(
        id_livre int,
        id_membre int,
        date_emprunt Date, 
        date_retour_prevue Date,
        PRIMARY KEY(id_livre,id_membre),
        Foreign Key (id_livre) REFERENCES livres(id),
        Foreign Key (id_membre) REFERENCES membres(id)
);