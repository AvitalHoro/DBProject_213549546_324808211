--Adding the field price to the book as well as price to the order, 
--and filling it with random values
ALTER TABLE book
ADD bookPrice NUMBER(5, 2);

ALTER TABLE ordering
ADD totalPrice NUMBER(10, 2);

BEGIN
  FOR r IN (SELECT BookID FROM book) LOOP
    UPDATE book
    SET bookPrice = ROUND(DBMS_RANDOM.VALUE(30, 120), 2)
    WHERE BookID = r.BookID;
  END LOOP;
  COMMIT;
END;

--Add a maxAmount field to Bookclass table
ALTER TABLE Bookclass
ADD maxAmount NUMBER;
 
-- add CHECK constraint to Bookclass's maxAmount
ALTER TABLE Bookclass
ADD CONSTRAINT check_maxAmount_integer
CHECK (maxAmount = TRUNC(maxAmount));

--Add random values ​​to existing records
DECLARE
    v_random_value NUMBER;
BEGIN
    FOR rec IN (SELECT classID FROM bookClass) LOOP
        v_random_value := DBMS_RANDOM.VALUE(100, 300);        
        UPDATE bookClass
        SET maxAmount = ROUND(v_random_value)
        WHERE classID = rec.classID;
    END LOOP;
    
    COMMIT;
END;

--Add a isValid field to Bookordering table
ALTER TABLE Bookordering
ADD isValid VARCHAR2(10);

--Add random values ​​to existing records
BEGIN
    UPDATE Bookordering
    SET isValid = 'valid'
    WHERE orderid IS NOT NULL;

    FOR rec IN (SELECT rowid, orderid FROM Bookordering WHERE orderid IS NULL) LOOP
        UPDATE Bookordering
        SET isValid = CASE
                          WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 'valid'
                          ELSE 'notvalid'
                      END
        WHERE rowid = rec.rowid;
    END LOOP;
END;


