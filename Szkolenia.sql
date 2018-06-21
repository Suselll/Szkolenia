#Tworzenie bazy
DROP DATABASE Szkolenia;
CREATE DATABASE Szkolenia;
USE Szkolenia;

CREATE TABLE Pracownik (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(10),
    nazwisko VARCHAR(30),
    PESEL VARCHAR(11) UNIQUE,
    Data_ur DATE
);
CREATE TABLE Szkoleniowiec (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    dzial ENUM('Marketing', 'CallCenter', 'Księgowość', 'Zarządzanie')
);
CREATE TABLE Dzial (
    dzial ENUM('Marketing', 'CallCenter', 'Księgowość', 'Zarządzanie') PRIMARY KEY,
    budzet FLOAT,
    liczba_pracownikow INT
);
CREATE TABLE Superwizor (
    superwizor VARCHAR(45) PRIMARY KEY,
    dzial ENUM('Marketing', 'CallCenter', 'Księgowość', 'Zarządzanie')
);
CREATE TABLE Stanowisko (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    stanowisko ENUM('Szkoleniowiec', 'Starszy szkoleniowiec', '10-ty Dan')
);
CREATE TABLE Stanowisko_wynagrodzenie (
    stanowisko ENUM('Szkoleniowiec', 'Starszy szkoleniowiec', '10-ty Dan') PRIMARY KEY,
    wynagrodzenie FLOAT
);
CREATE TABLE Wykształcenie (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    uczelnia VARCHAR(45),
    tytul ENUM('licencjat', 'magister', 'podyplomowe', 'MBA')
);
CREATE TABLE Logowanie (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(45),
    haslo VARCHAR(45)
);

show tables;


#Dane
insert into Pracownik values (1,'Monika' ,'Rzeszutowska' ,'80102209194','1980-10-22');
insert into Pracownik values (2,'Dominika','Wolska','89032809470','1989-03-28');
insert into Pracownik values (3,'Weronika','Dyszel','81051524469','1981-05-15');
insert into Pracownik values (4,'Anastazja','Dulska','89030219669','1989-03-02');
insert into Pracownik values (5,'Andżelika','Skalska','89040110127','1989-04-01');
insert into Pracownik values (6,'Genowefa','Samądzka','74042300033','1974-04-23');
insert into Pracownik values (7,'Amelia','Wiśniewska','77041714645','1977-04-17');
insert into Pracownik values (8,'Rozalia','Białowąs','88031121513','1988-03-11');
insert into Pracownik values (9,'Fiona','Czekalis','90072410985','1990-07-24');
insert into Pracownik values (10,'Rozamunda','Kawkowska','79072611430','1979-07-26');
SELECT 
    *
FROM
    Pracownik;

insert into Szkoleniowiec values (1,'Marketing');
insert into Szkoleniowiec values (2,'Marketing');
insert into Szkoleniowiec values (3,'Marketing');
insert into Szkoleniowiec values (4,'CallCenter');
insert into Szkoleniowiec values (5,'CallCenter');
insert into Szkoleniowiec values (6,'Księgowość');
insert into Szkoleniowiec values (7,'CallCenter');
insert into Szkoleniowiec values (8,'Zarządzanie');
insert into Szkoleniowiec values (9,'Zarządzanie');
insert into Szkoleniowiec values (10,'Księgowość');
SELECT 
    *
FROM
    Szkoleniowiec;

insert into Dzial values ('Marketing',5000000,3);
insert into Dzial values ('CallCenter',5000000,3);
insert into Dzial values ('Księgowość',5000000,2);
insert into Dzial values ('Zarządzanie',5000000,2);
SELECT 
    *
FROM
    Dzial;

insert into Superwizor values ('Gniewkowska','Marketing');
insert into Superwizor values ('Kowalska','CallCenter');
insert into Superwizor values ('Mścisławska','Księgowość');
insert into Superwizor values ('Zambrowska','Zarządzanie');
SELECT 
    *
FROM
    Superwizor;

insert into Stanowisko values (1,'Szkoleniowiec');
insert into Stanowisko values (2,'Szkoleniowiec');
insert into Stanowisko values (3,'Szkoleniowiec');
insert into Stanowisko values (4,'Starszy szkoleniowiec');
insert into Stanowisko values (5,'Starszy szkoleniowiec');
insert into Stanowisko values (6,'Starszy szkoleniowiec');
insert into Stanowisko values (7,'Starszy szkoleniowiec');
insert into Stanowisko values (8,'Starszy szkoleniowiec');
insert into Stanowisko values (9,'10-ty Dan');
insert into Stanowisko values (10,'10-ty Dan');
SELECT 
    *
FROM
    Stanowisko;

insert into Stanowisko_wynagrodzenie values ('Szkoleniowiec',10000);
insert into Stanowisko_wynagrodzenie values ('Starszy szkoleniowiec',15000);
insert into Stanowisko_wynagrodzenie values ('10-ty Dan',150000);
SELECT 
    *
FROM
    Stanowisko_wynagrodzenie;

insert into Wykształcenie values (1,'Uniwersytet Warszawski','licencjat');
insert into Wykształcenie values (2,'Uniwersytet Warszawski','licencjat');
insert into Wykształcenie values (3,'Uniwersytet Warszawski','magister');
insert into Wykształcenie values (4,'Uniwersytet Jagielloński','magister');
insert into Wykształcenie values (5,'Uniwersytet Jagielloński','podyplomowe');
insert into Wykształcenie values (6,'Uniwersytet Jagielloński','podyplomowe');
insert into Wykształcenie values (7,'Uniwersytet Adama Mickiewicza','MBA');
insert into Wykształcenie values (8,'Uniwersytet Adama Mickiewicza','MBA');
insert into Wykształcenie values (9,'Uniwersytet Adama Mickiewicza','MBA');
insert into Wykształcenie values (10,'Uniwersytet Śląski','MBA');
SELECT 
    *
FROM
    Wykształcenie;

insert into Logowanie values (101,'Root1','lama');
insert into Logowanie values (102,'Root2','joozek');
insert into Logowanie values (103,'Root3','regau');
insert into Logowanie values (104,'Root4','rwandau');
SELECT 
    *
FROM
    Logowanie;
    
    
#Selecty i widoki
SELECT 
    pr.ID, pr.imie, pr.nazwisko, sz.dzial, su.superwizor
FROM
    Pracownik AS pr,
    Szkoleniowiec AS sz,
    Dzial AS dz,
    Superwizor AS su
WHERE
    pr.ID = sz.ID AND sz.dzial = dz.dzial
        AND dz.dzial = su.dzial
ORDER BY dz.dzial DESC , pr.nazwisko ASC;

CREATE VIEW struktura AS
    SELECT 
        pr.ID, pr.imie, pr.nazwisko, sz.dzial, su.superwizor
    FROM
        Pracownik AS pr,
        Szkoleniowiec AS sz,
        Dzial AS dz,
        Superwizor AS su
    WHERE
        pr.ID = sz.ID AND sz.dzial = dz.dzial
            AND dz.dzial = su.dzial
    ORDER BY dz.dzial DESC , pr.nazwisko ASC;

SELECT 
    *
FROM
    struktura;

SELECT 
    pr.ID, pr.imie, pr.nazwisko, st.stanowisko, sw.wynagrodzenie
FROM
    Pracownik AS pr
        LEFT JOIN
    Stanowisko AS st ON pr.ID = st.ID
        LEFT JOIN
    Stanowisko_wynagrodzenie AS sw ON st.stanowisko = sw.stanowisko
ORDER BY sw.wynagrodzenie DESC , ID ASC;

CREATE VIEW pozycja AS
    SELECT 
        pr.ID, pr.imie, pr.nazwisko, st.stanowisko, sw.wynagrodzenie
    FROM
        Pracownik AS pr
            LEFT JOIN
        Stanowisko AS st ON pr.ID = st.ID
            LEFT JOIN
        Stanowisko_wynagrodzenie AS sw ON st.stanowisko = sw.stanowisko
    ORDER BY sw.wynagrodzenie DESC , ID ASC;

SELECT 
    *
FROM
    pozycja;

SELECT 
    pr.imie, pr.nazwisko, wy.*
FROM
    Pracownik AS pr,
    Wykształcenie AS wy
WHERE
    pr.ID = wy.ID
ORDER BY pr.ID ASC;

CREATE VIEW umiejętności AS
    SELECT 
        pr.imie, pr.nazwisko, wy.*
    FROM
        Pracownik AS pr,
        Wykształcenie AS wy
    WHERE
        pr.ID = wy.ID
    ORDER BY pr.ID ASC;

SELECT 
    *
FROM
    umiejętności;