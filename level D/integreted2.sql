--Integration of the data of our database

--put a null option in the tables of the people we don't want to fill in all the fields for them
ALTER TABLE Person
MODIFY Address varchar2(40) NULL;

ALTER TABLE Person
MODIFY Mail varchar2(30) NULL;

ALTER TABLE Person
MODIFY Age INT NULL;

--Increasing the phone number size to the standard size
ALTER TABLE Person
MODIFY mainPhone VARCHAR(11);

--Inserting data from all the tables that inherit from person into the main table
INSERT INTO Person (personId, pname, mainPhone, Address, Mail, Age)
SELECT 
    personId AS new_personId,
    LibrarianName AS pname,
    Lphone AS mainPhone,
    NULL AS Address,  -- assuming other columns can be NULL or have default values
    NULL AS Mail,
    NULL AS Age
FROM 
    Librarian;
    
INSERT INTO Person (personId, pname, mainPhone, Address, Mail, Age)
SELECT 
    Supid AS new_personId,
    supname AS pname,
    sphone AS mainPhone,
    NULL AS Address,  -- assuming other columns can be NULL or have default values
    NULL AS Mail,
    NULL AS Age
FROM 
    supplier;

INSERT INTO Person (personId, pname, mainPhone, Address, Mail, Age)
SELECT 
    readerNumber AS new_personId,
    readername AS pname,
    phone AS mainPhone,
    NULL AS Address,  -- assuming other columns can be NULL or have default values
    NULL AS Mail,
    NULL AS Age
FROM 
    reader;

--Deleting data where the number of persoid already exists as a key    
select * 
from reader r
join person p on r.readernumber=p.personid 

delete from reader
where readernumber=1 or readernumber=2

delete from bookordering
where readernumber=1 or readernumber=2
    
--A change for a librarian because until now his key was varchar and now it will be number
ALTER TABLE ordering DROP CONSTRAINT SYS_C009794; --forgin key in ordering

ALTER TABLE librarian ADD personId NUMBER;

MERGE INTO librarian l
USING person pe
ON (l.librarianname = pe.pname)
WHEN MATCHED THEN
UPDATE SET l.personID = pe.personID;

DELETE FROM person p
WHERE p.address IS NULL
AND p.pname IN (
    SELECT l.librarianname
    FROM librarian l
);

--Find the maximum number of personid
DECLARE
    maxid NUMBER;
BEGIN
    SELECT MAX(personId) INTO maxid FROM Person;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_id2 START WITH ' || (maxid + 1) || ' INCREMENT BY 1';
END;

--Update primary key of personid for librarian
UPDATE librarian
SET personId = seq_id2.NEXTVAL;

ALTER TABLE Librarian
ADD CONSTRAINT fk_librarian_person
FOREIGN KEY (personId) REFERENCES Person(personId)

ALTER TABLE Librarian DROP CONSTRAINT SYS_C009788;--drop primarykey constraint from libranian

ALTER TABLE Librarian ADD CONSTRAINT Librarian_key PRIMARY KEY (personId);

--Filling the personid column values ​​in the ordering table according to the personid column values ​​in the librarian table
ALTER TABLE ordering ADD personId NUMBER;

MERGE INTO ordering o
USING librarian li
ON (o.lusername = li.lusername)
WHEN MATCHED THEN
UPDATE SET o.personID = li.personID;

ALTER TABLE ordering
ADD CONSTRAINT fk_librarian_ordering
FOREIGN KEY (personId) REFERENCES librarian(personId)
ON UPDATE CASCADE;

--Adding a foreign key constraint to supplier and reader
SELECT *
FROM supplier
WHERE supid NOT IN (SELECT personid FROM person);

insert into person (personId, pname, mainPhone, Address, Mail, Age)
values(111111111, 'f', '058-4458777', null, null, null);
insert into person (personId, pname, mainPhone, Address, Mail, Age)
values(222222222, 'g', '058-4428777', null, null, null);
insert into person (personId, pname, mainPhone, Address, Mail, Age)
values(333333333, 'h', '058-4458747', null, null, null);

ALTER TABLE supplier
ADD CONSTRAINT fk_supplier_person
FOREIGN KEY (supid) REFERENCES Person(personId)
ON UPDATE CASCADE;

SELECT readernumber
FROM reader
WHERE readernumber NOT IN (SELECT personid FROM person);

delete from reader where readernumber=3644121

ALTER TABLE reader
ADD CONSTRAINT fk_reader_person
FOREIGN KEY (readernumber) REFERENCES Person(personId)
ON UPDATE CASCADE;

--Deleting all duplicate columns
ALTER TABLE reader
DROP COLUMN readername;

ALTER TABLE reader
DROP COLUMN phone;

ALTER TABLE librarian
DROP COLUMN librarianname;

ALTER TABLE librarian
DROP COLUMN lphone;

ALTER TABLE supplier
DROP COLUMN supname;

ALTER TABLE supplier
DROP COLUMN sphone;

ALTER TABLE ordering
DROP COLUMN lusername;




    
