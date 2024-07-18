--����� ���� ��� �� ����� �� ����� �� person ������ �����.

--������� �person �� ������ id
ALTER TABLE Person ADD personId NUMBER;

DECLARE
    max_id NUMBER;
BEGIN
    SELECT MAX(personId) INTO max_id FROM Person;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE seq_id START WITH ' || (max_id + 1) || ' INCREMENT BY 1';
END;

UPDATE Person
SET personId = seq_id.NEXTVAL;

--Person_More_Phone
ALTER TABLE Person_More_Phone ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Person_More_Phone p
USING person pe
ON (p.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET p.personID = pe.personID;

--������ �� ������ personid
ALTER TABLE participant ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO participant p
USING person pe
ON (p.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET p.personID = pe.personID;

--Event_Participant
--������ ����� ����� ������
ALTER TABLE Event_Participant ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Event_Participant ep
USING participant p
ON (ep.mainphone = p.mainphone)
WHEN MATCHED THEN
UPDATE SET ep.personID = p.personID;

--������ ����� ����
ALTER TABLE Manager ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Manager m
USING person pe
ON (m.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET m.personID = pe.personID;

--������ ����� �����
 ALTER TABLE ActivityOperator ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO ActivityOperator a
USING person pe
ON (a.mainphone = pe.mainphone)
WHEN MATCHED THEN
UPDATE SET a.personID = pe.personID;

--Manager_Working_Days
--������ ����� ��� ����� ����
 ALTER TABLE Manager_Working_Days ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Manager_Working_Days mwd
USING Manager m
ON (mwd.mainphone = m.mainphone)
WHEN MATCHED THEN
UPDATE SET mwd.personID = m.personID;

--Event_Operator
 ALTER TABLE Event_Operator ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Event_Operator eo
USING ActivityOperator ao
ON (eo.mainphone = ao.mainphone)
WHEN MATCHED THEN
UPDATE SET eo.personID = ao.personID;

--Event
 ALTER TABLE Event ADD personId NUMBER;

--���� �� ������ ��� �����
MERGE INTO Event e
USING Manager m
ON (e.mainphone = m.mainphone)
WHEN MATCHED THEN
UPDATE SET e.personID = m.personID;

--��� ����� ������ ��������
--���� �� ������ �� ���� �� ������� �� ������ ��� �������
ALTER TABLE Event_Participant DROP CONSTRAINT SYS_C008905;

ALTER TABLE Event DROP CONSTRAINT SYS_C008905;

ALTER TABLE Event_Operator DROP CONSTRAINT SYS_C008905;

ALTER TABLE Manager_Working_Days DROP CONSTRAINT SYS_C008905;

ALTER TABLE Manager DROP CONSTRAINT SYS_C008905;

ALTER TABLE ActivityOperator DROP CONSTRAINT SYS_C008905;

ALTER TABLE participant DROP CONSTRAINT SYS_C008905;

ALTER TABLE Person_More_Phone DROP CONSTRAINT SYS_C008905;

--��� ���� �� ����� ����� �� ���� person
ALTER TABLE Person DROP CONSTRAINT SYS_C008905;

ALTER TABLE Person ADD CONSTRAINT person_key PRIMARY KEY (personId);

--��� ���� �� ����� ����� ��� �������

ALTER TABLE Manager DROP CONSTRAINT SYS_C008905;

ALTER TABLE ActivityOperator DROP CONSTRAINT SYS_C008905;

ALTER TABLE participant DROP CONSTRAINT SYS_C008905;

ALTER TABLE Manager ADD CONSTRAINT manager_key PRIMARY KEY (personId);

ALTER TABLE ActivityOperator ADD CONSTRAINT ao_key PRIMARY KEY (personId);

ALTER TABLE participant ADD CONSTRAINT participant_key PRIMARY KEY (personId);

--����� �� ������ �� ���� �� ���� ������ ����
ALTER TABLE Event_Participant
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
ADD CONSTRAINT fk_participant_personid
FOREIGN KEY (personId) REFERENCES person(personId)
ON UPDATE CASCADE;

