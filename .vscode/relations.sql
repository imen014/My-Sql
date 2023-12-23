/***Exercice 2 : Relation One-to-Many**

Utilisez la base de données "ExercicesRelations" créée dans l'exercice précédent.

1. Ajoutez une table "Département" avec les colonnes suivantes :
   - IDDépartement (clé primaire)
   - NomDépartement

2. Modifiez la table "Personne" pour inclure une colonne "IDDépartement" 
(clé étrangère référençant la table "Département").
*/

CREATE TABLE Département(
    IDDépartement int PRIMARY key AUTO_INCREMENT,
    NomDépartement VARCHAR(100)
);

ALTER Table personne ADD Foreign Key (IDDépartement) REFERENCES Département(IDDépartement);

/***Exercice 3 : Modification de la Structure de Table**

Utilisez toujours la base de données "ExercicesRelations".

1. Ajoutez une colonne "Adresse" à la table "Personne" pour enregistrer l'adresse de chaque personne.

2. Supprimez la colonne "DateExpiration" de la table "CarteDIdentite".*/

alter Table personne add addresse VARCHAR(100);

alter Table cartedidentite drop DateExpiration	;

