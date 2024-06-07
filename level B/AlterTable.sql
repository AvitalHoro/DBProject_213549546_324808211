--Add the ON DELETE CASCADE constraint to ordering so we can delete a librarian
ALTER TABLE ordering DROP CONSTRAINT SYS_C008809;

ALTER TABLE ordering
ADD CONSTRAINT SYS_C008809
FOREIGN KEY (LuserName) REFERENCES librarian(LuserName) ON DELETE CASCADE;

--remove not null constraint from librarian's name
ALTER TABLE librarian MODIFY LibrarianName varchar2(40);
