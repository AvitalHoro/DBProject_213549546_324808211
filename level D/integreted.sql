--Changing the key of person from main_phone to personid

--Add the column personid to person
ALTER TABLE Person ADD personId NUMBER;

DECLARE
    max_id NUMBER;
BEGIN
    SELECT MAX(readernumber) INTO max_id FROM reader;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_id START WITH ' || (max_id + 1) || ' INCREMENT BY 1';
END;

UPDATE Person
SET personId = seq_id.NEXTVAL;

--Add the column personid to Person_More_Phone
ALTER TABLE Person_More_Phone ADD personId NUMBER;

--Filling the personid column values ​​in the Person_More_Phone table according to the personid column values ​​in the person table
MERGE INTO Person_More_Phone p
USING person pe
ON (p.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET p.personID = pe.personID;

--Add the column personid to participant table
ALTER TABLE participant ADD personId NUMBER;

--Filling the personid column values ​​in the Participant table according to the personid column values ​​in the person table
MERGE INTO participant p
USING person pe
ON (p.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET p.personID = pe.personID;

--Add the column personid to Event_Participant table
ALTER TABLE Event_Participant ADD personId NUMBER;

--Filling the personid column values ​​in the Event_Participant table according to the personid column values ​​in the person table
MERGE INTO Event_Participant ep
USING participant p
ON (ep.mainphone = p.mainphone)
WHEN MATCHED THEN
UPDATE SET ep.personID = p.personID;

--Add the column personid to Manager table
ALTER TABLE Manager ADD personId NUMBER;

--Filling the personid column values ​​in the Manager table according to the personid column values ​​in the person table
MERGE INTO Manager m
USING person pe
ON (m.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET m.personID = pe.personID;

--Add the column personid to ActivityOperator table
 ALTER TABLE ActivityOperator ADD personId NUMBER;

--Filling the personid column values ​​in the ActivityOperator table according to the personid column values ​​in the person table
MERGE INTO ActivityOperator a
USING person pe
ON (a.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET a.personID = pe.personID;

--Add the column personid to Manager_Working_Days table
 ALTER TABLE Manager_Working_Days ADD personId NUMBER;

--Filling the personid column values ​​in the Manager_Working_Days table according to the personid column values ​​in the Manager table
MERGE INTO Manager_Working_Days mwd
USING Manager m
ON (mwd.mainphone = m.mainphone)
WHEN MATCHED THEN
UPDATE SET mwd.personID = m.personID;

--Add the column personid to Event_Operator table
 ALTER TABLE Event_Operator ADD personId NUMBER;

--Filling the personid column values ​​in the Event_Operator table according to the personid column values ​​in the ActivityOperator table
MERGE INTO Event_Operator eo
USING ActivityOperator ao
ON (eo.mainphone = ao.mainphone)
WHEN MATCHED THEN
UPDATE SET eo.personID = ao.personID;

--Add the column personid to Event table
 ALTER TABLE Event ADD personId NUMBER;

--Filling the personid column values ​​in the Event_Operator table according to the personid column values ​​in the Manager table
MERGE INTO Event e
USING Manager m
ON (e.mainphone = m.mainphone)
WHEN MATCHED THEN
UPDATE SET e.personID = m.personID;

--Delete the foreign key constraint from the main_phone column in all tables
ALTER TABLE Event_Participant DROP CONSTRAINT SYS_C009763;

ALTER TABLE Event DROP CONSTRAINT SYS_C009745;

ALTER TABLE Event_Operator DROP CONSTRAINT SYS_C009750;

ALTER TABLE Manager_Working_Days DROP CONSTRAINT SYS_C009767;

ALTER TABLE Manager DROP CONSTRAINT SYS_C009732;

ALTER TABLE ActivityOperator DROP CONSTRAINT SYS_C009722;

ALTER TABLE participant DROP CONSTRAINT SYS_C009754;

ALTER TABLE Person_More_Phone DROP CONSTRAINT SYS_C009771;

--Changing the primary key of the person table
ALTER TABLE Person DROP CONSTRAINT SYS_C009716;

ALTER TABLE Person ADD CONSTRAINT person_key PRIMARY KEY (personId);

--Changing the primary key of all the tables

ALTER TABLE Manager DROP CONSTRAINT SYS_C009731;

ALTER TABLE ActivityOperator DROP CONSTRAINT SYS_C009721;

ALTER TABLE participant DROP CONSTRAINT SYS_C009753;

ALTER TABLE Manager ADD CONSTRAINT manager_key PRIMARY KEY (personId);

ALTER TABLE ActivityOperator ADD CONSTRAINT ao_key PRIMARY KEY (personId);

ALTER TABLE participant ADD CONSTRAINT participant_key PRIMARY KEY (personId);

--Adding the foreign key constraint where we deleted itALTER TABLE Event_Participant
ADD CONSTRAINT fk_Event_Participant_personid
FOREIGN KEY (personId) REFERENCES Participant(personId)
ON UPDATE CASCADE;

ALTER TABLE Event
ADD CONSTRAINT fk_Event_personid
FOREIGN KEY (personId) REFERENCES Manager(personId)
ON UPDATE CASCADE;

ALTER TABLE Event_Operator
ADD CONSTRAINT fk_Event_Operator_personid
FOREIGN KEY (personId) REFERENCES ActivityOperator(personId)
ON UPDATE CASCADE;

ALTER TABLE Manager_Working_Days
ADD CONSTRAINT fk_mwd_personid
FOREIGN KEY (personId) REFERENCES Manager(personId)
ON UPDATE CASCADE;

ALTER TABLE Manager
ADD CONSTRAINT fk_Manager_personid
FOREIGN KEY (personId) REFERENCES person(personId)
ON UPDATE CASCADE;

ALTER TABLE ActivityOperator
ADD CONSTRAINT fk_ActivityOperator_personid
FOREIGN KEY (personId) REFERENCES person(personId)
ON UPDATE CASCADE;

ALTER TABLE participant
ADD CONSTRAINT fk_participant_personid
FOREIGN KEY (personId) REFERENCES person(personId)
ON UPDATE CASCADE;

ALTER TABLE Person_More_Phone
ADD CONSTRAINT fk_pmp_personid
FOREIGN KEY (personId) REFERENCES person(personId)
ON UPDATE CASCADE;

--Deleting the column of main_phone
SELECT a.constraint_name, a.constraint_type, a.status, a.owner, a.table_name, b.column_name FROM all_constraints a JOIN all_cons_columns b ON a.owner = b.owner AND a.constraint_name = b.constraint_name WHERE a.table_name = 'PERSON' AND b.column_name = 'MAINPHONE';  
ALTER TABLE person DROP CONSTRAINT SYS_C009713;



ALTER TABLE Event DROP COLUMN mainphone;



ALTER TABLE Manager DROP COLUMN mainphone;

ALTER TABLE ActivityOperator DROP COLUMN mainphone;

ALTER TABLE participant DROP COLUMN mainphone;



--Deleting the constraint from tables where the primary key is a pair of values

ALTER TABLE Event_Participant
DROP CONSTRAINT SYS_C009761;

ALTER TABLE Event_Participant
ADD CONSTRAINT pk_event_participant PRIMARY KEY (EID, personId);

ALTER TABLE Event_Operator
DROP CONSTRAINT SYS_C009748;

ALTER TABLE Event_Operator
ADD CONSTRAINT pk_event_operator PRIMARY KEY (EID, personId);

ALTER TABLE Manager_Working_Days
DROP CONSTRAINT SYS_C009766;

ALTER TABLE Manager_Working_Days
ADD CONSTRAINT pk_manager_working_days PRIMARY KEY (Working_Days, personId);

ALTER TABLE Person_More_Phone
DROP CONSTRAINT SYS_C009770;

ALTER TABLE Person_More_Phone
ADD CONSTRAINT pk_person_more_phone PRIMARY KEY (More_Phone, personId);







