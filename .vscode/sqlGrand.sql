USE Library;
/*1. Table "Livres" (Books) :
   - ID (Clé primaire)
   - Titre (Title)
   - Auteur_ID (Clé étrangère liée à la table "Auteurs")
   - Editeur_ID (Clé étrangère liée à la table "Editeurs")
   - Année_de_publication (Publication_Year)
   - Prix (Price)*/
   CREATE TABLE Books(
    id int PRIMARY key AUTO_INCREMENT,
    titre VARCHAR(100),
    auteur_id int,
    editeur_id int,
    annee_publication DATE,
    prix FLOAT,
    Foreign Key (auteur_id) REFERENCES Authors(id),
    Foreign Key (editeur_id) REFERENCES Publishers(id)
   );
/*
2. Table "Auteurs" (Authors) :
   - ID (Clé primaire)
   - Nom (Last_Name)
   - Prénom (First_Name)
   - Date_de_naissance (Date_of_Birth)*/

   CREATE TABLE Authors(
    id int PRIMARY key AUTO_INCREMENT,
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    Date_of_birth DATE
   );

/*3. Table "Editeurs" (Publishers) :
   - ID (Clé primaire)
   - Nom (Name)
   - Adresse (Address)
   - Téléphone (Phone)
*/
USE Library;
CREATE TABLE Publishers(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(100),
    phone VARCHAR(15)
);


# ***Niveau débutant :**

/*1. Sélectionnez tous les enregistrements d'une table.*/
SELECT * FROM Books;

/*#2. Sélectionnez des colonnes spécifiques d'une table.*/
SELECT titre,auteur_id FROM books;

/*#3. Utilisez la clause WHERE pour filtrer les résultats.*/
SELECT titre,annee_publication FROM books where id = 1

/*#4. Triez les résultats en utilisant la clause ORDER BY.*/

SELECT * FROM books order by annee_publication desc;
/*#*****5. Utilisez la clause LIMIT (ou équivalente selon la base de données) pour limiter le nombre 
#de résultats retournés.****** */

SELECT * from books  LIMIT 1,3

/*#6. Utilisez les opérateurs logiques (AND, OR) pour combiner des conditions dans une clause WHERE.*/

SELECT * FROM books where id = 1 or auteur_id = 1;

SELECT * from books where annee_publication > '1990' and titre like '%abc%';
/*#7. Comptez le nombre total d'enregistrements dans une table.*/

SELECT COUNT(id) as nombre_enrigistrement from books;
/*#8. Calculez la somme, la moyenne, le minimum et le maximum d'une colonne numérique.*/
SELECT Sum(prix) as prix_total_livres FROM books;
SELECT AVG(prix) as moyenne_prix FROM books;

SELECT min(prix) as min_prix FROM books;

SELECT MAX(prix) as max_price from books;

/*#9. Insérez de nouvelles données dans une table.*/
INSERT into Authors(id,last_name,first_name,Date_of_birth)VALUES
(1,"ahmed","ali ","2000-09-04"),
(2,"ali","rami", "2001-08-04"),
(3,"raouul","medhat","1998-07-04");

INSERT into publishers(id,name,address,phone)VALUES
(1,"medhat","manar6","21450002"),
(2,"majdi", "ben yousef","95421500"),
(3,"mahdi","hazem","94777880");
INSERT into books(id,titre,auteur_id,editeur_id,annee_publication,prix)VALUES
(1,"book1",2,3,1993,15.5);
/*#10. Mettez à jour des enregistrements existants dans une table.*/

Update books set editeur_id = 1  where titre = "book1";

/***Niveau intermédiaire :**

11. Utilisez des jointures (INNER JOIN, LEFT JOIN, RIGHT JOIN) pour combiner des données 
de plusieurs tables.*/
/*12. Groupez les données et utilisez les fonctions d'agrégation (SUM, AVG, COUNT, etc.) 
avec GROUP BY.*/
/*13. Filtrez les résultats des jointures avec la clause HAVING.*/
/*14. Supprimez des enregistrements d'une table.*/
/*15. Créez une table temporaire et insérez des données.*/
/*16. Modifiez la structure d'une table (ajoutez, supprimez ou modifiez des colonnes).*/
/*17. Utilisez les sous-requêtes (subqueries) pour résoudre des problèmes complexes.*/
/*18. Effectuez des mises à jour en utilisant des jointures.*/
/*19. Créez des index pour améliorer les performances des requêtes.*/
/*20. Exportez/importez des données depuis/vers un fichier CSV.*/