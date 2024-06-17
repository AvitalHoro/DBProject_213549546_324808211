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
