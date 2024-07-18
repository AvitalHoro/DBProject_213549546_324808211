--���� ������� �� ����� ����� �������� �� ���� ����, ����� ���� �� �������� ����
--���� ����� �� ����� person ����������� �� ������� ����
--������ ��� ���� ���� �� �� ����� ����� ���� �null
ALTER TABLE Person
MODIFY Address varchar2(40) NULL;

ALTER TABLE Person
MODIFY Mail varchar2(30) NULL;

ALTER TABLE Person
MODIFY Age INT NULL;

--����� �� ��� �� ������ ����� ������
ALTER TABLE Person
MODIFY mainPhone VARCHAR(11);

--����� �� ������� ��� ������� ������� ���� ����� ������
INSERT INTO Person (personId, pname, mainPhone, Address, Mail, Age)
SELECT 
    (SELECT MAX(personId) FROM Person) + ROW_NUMBER() OVER (ORDER BY LibrarianName) AS new_personId,
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
    
--���� ��� ����� ����� �� ��� ����� ������� �� �� ��� �����

ALTER TABLE ordering DROP CONSTRAINT SYS_C008883; --forgin key in ordering

ALTER TABLE librarian ADD personId NUMBER;

MERGE INTO librarian l
USING person pe
ON (l.LPHONE = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET l.personID = pe.personID;

ALTER TABLE Librarian
ADD CONSTRAINT fk_librarian_person
FOREIGN KEY (personId) REFERENCES Person(personId)
ON UPDATE CASCADE;

ALTER TABLE Librarian DROP CONSTRAINT SYS_C008864;--drop primarykey constraint from libranian

ALTER TABLE Librarian ADD CONSTRAINT Librarian_key PRIMARY KEY (personId);


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

--����� ���� ���� ������ ��� ������ ��� ����� ���� ��
ALTER TABLE supplier
ADD CONSTRAINT fk_supplier_person
FOREIGN KEY (supid) REFERENCES Person(personId)
ON UPDATE CASCADE;

ALTER TABLE reader
ADD CONSTRAINT fk_reader_person
FOREIGN KEY (readernumber) REFERENCES Person(personId)
ON UPDATE CASCADE;

--���� ��� �� ����� �� �� ������� �������� ��������
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

--������!


    
