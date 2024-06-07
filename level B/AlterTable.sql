--remove not null constraint from librarian's name
ALTER TABLE librarian MODIFY LibrarianName varchar2(40);
