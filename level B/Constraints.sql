-- add CHECK constraint to librarian's password
ALTER TABLE librarian
ADD CONSTRAINT Check_Password_Length
CHECK (LENGTH(Lpassword) > 6);


-- add DEFAULT constraint to order date
ALTER TABLE Ordering
MODIFY orderDate DEFAULT SYSDATE;

-- add NOT NULL constraint to class name
ALTER TABLE bookClass 
MODIFY className varchar2(20) 
CONSTRAINT class_name_not_null NOT NULL;
