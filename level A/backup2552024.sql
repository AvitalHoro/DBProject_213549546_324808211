prompt PL/SQL Developer Export Tables for user AHUVA@XE
prompt Created by user on שבת/25/מאי/2024
set feedback off
set define off

prompt Creating BOOKCLASS...
create table BOOKCLASS
(
  classid   INTEGER not null,
  classname VARCHAR2(20),
  locationc VARCHAR2(30),
  color     VARCHAR2(10)
)
;
alter table BOOKCLASS
  add primary key (CLASSID);

prompt Creating BOOK...
create table BOOK
(
  bookname      VARCHAR2(30) not null,
  bookpublisher VARCHAR2(30),
  authorname    VARCHAR2(30),
  publishyear   INTEGER,
  bookid        INTEGER not null,
  classid       INTEGER
)
;
alter table BOOK
  add primary key (BOOKID);
alter table BOOK
  add foreign key (CLASSID)
  references BOOKCLASS (CLASSID);

prompt Creating BOOKCOPYINSTOCK...
create table BOOKCOPYINSTOCK
(
  copycode     INTEGER not null,
  status       VARCHAR2(20),
  purchasedate DATE,
  bookid       INTEGER not null
)
;
alter table BOOKCOPYINSTOCK
  add primary key (COPYCODE);
alter table BOOKCOPYINSTOCK
  add foreign key (BOOKID)
  references BOOK (BOOKID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  supname VARCHAR2(20) not null,
  supid   INTEGER not null,
  sphone  VARCHAR2(11),
  terms   VARCHAR2(80)
)
;
alter table SUPPLIER
  add primary key (SUPID);

prompt Creating LIBRARIAN...
create table LIBRARIAN
(
  librarianname VARCHAR2(20) not null,
  lphone        VARCHAR2(11),
  lusername     VARCHAR2(20) not null,
  lpassword     VARCHAR2(20) not null
)
;
alter table LIBRARIAN
  add primary key (LUSERNAME);

prompt Creating ORDERING...
create table ORDERING
(
  orderdate DATE not null,
  status    VARCHAR2(20) not null,
  orderid   INTEGER not null,
  lusername VARCHAR2(20) not null,
  supid     INTEGER
)
;
alter table ORDERING
  add primary key (ORDERID);
alter table ORDERING
  add foreign key (LUSERNAME)
  references LIBRARIAN (LUSERNAME);
alter table ORDERING
  add foreign key (SUPID)
  references SUPPLIER (SUPID);

prompt Creating READER...
create table READER
(
  readername   VARCHAR2(20) not null,
  readernumber INTEGER not null,
  phone        VARCHAR2(11)
)
;
alter table READER
  add primary key (READERNUMBER);

prompt Creating BOOKORDERING...
create table BOOKORDERING
(
  readerorderdate DATE not null,
  readerorderid   INTEGER not null,
  bookid          INTEGER not null,
  readernumber    INTEGER,
  orderid         INTEGER
)
;
alter table BOOKORDERING
  add primary key (READERORDERID);
alter table BOOKORDERING
  add foreign key (BOOKID)
  references BOOK (BOOKID);
alter table BOOKORDERING
  add foreign key (READERNUMBER)
  references READER (READERNUMBER);
alter table BOOKORDERING
  add foreign key (ORDERID)
  references ORDERING (ORDERID);

prompt Disabling triggers for BOOKCLASS...
alter table BOOKCLASS disable all triggers;
prompt Disabling triggers for BOOK...
alter table BOOK disable all triggers;
prompt Disabling triggers for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK disable all triggers;
prompt Disabling triggers for SUPPLIER...
alter table SUPPLIER disable all triggers;
prompt Disabling triggers for LIBRARIAN...
alter table LIBRARIAN disable all triggers;
prompt Disabling triggers for ORDERING...
alter table ORDERING disable all triggers;
prompt Disabling triggers for READER...
alter table READER disable all triggers;
prompt Disabling triggers for BOOKORDERING...
alter table BOOKORDERING disable all triggers;
prompt Disabling foreign key constraints for BOOK...
alter table BOOK disable constraint SYS_C009278;
prompt Disabling foreign key constraints for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK disable constraint SYS_C009282;
prompt Disabling foreign key constraints for ORDERING...
alter table ORDERING disable constraint SYS_C009288;
alter table ORDERING disable constraint SYS_C009289;
prompt Disabling foreign key constraints for BOOKORDERING...
alter table BOOKORDERING disable constraint SYS_C009294;
alter table BOOKORDERING disable constraint SYS_C009295;
alter table BOOKORDERING disable constraint SYS_C009296;
prompt Deleting BOOKORDERING...
delete from BOOKORDERING;
commit;
prompt Deleting READER...
delete from READER;
commit;
prompt Deleting ORDERING...
delete from ORDERING;
commit;
prompt Deleting LIBRARIAN...
delete from LIBRARIAN;
commit;
prompt Deleting SUPPLIER...
delete from SUPPLIER;
commit;
prompt Deleting BOOKCOPYINSTOCK...
delete from BOOKCOPYINSTOCK;
commit;
prompt Deleting BOOK...
delete from BOOK;
commit;
prompt Deleting BOOKCLASS...
delete from BOOKCLASS;
commit;
prompt Loading BOOKCLASS...
insert into BOOKCLASS (classid, classname, locationc, color)
values (87008, 'fiction', '1st floor column 1', 'pink');
insert into BOOKCLASS (classid, classname, locationc, color)
values (16824, 'biography', '1st floor column 2', 'yellow');
insert into BOOKCLASS (classid, classname, locationc, color)
values (70594, 'science', '1st floor column 3', 'green');
insert into BOOKCLASS (classid, classname, locationc, color)
values (74883, 'history', '2st floor column 1', 'gray');
insert into BOOKCLASS (classid, classname, locationc, color)
values (55242, 'childrens', '2st floor column 2', 'blue');
insert into BOOKCLASS (classid, classname, locationc, color)
values (12001, 'non-fiction', '2st floor column 3', 'red');
commit;
prompt 6 records loaded
prompt Loading BOOK...
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Queen of Air and Darkness', 'Simon & Schuster', 'Donald Winans', 1932, 5189535, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Friend of the Family', 'Houghton Mifflin Harcourt', 'Rueben McNarland', 1971, 7465506, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Tower of Nero', 'Houghton Mifflin Harcourt', 'Delbert DeVito', 1976, 4783161, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lolita', 'Harlequin', 'Juliana Paymer', 1968, 6243823, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Kreutzer Sonata', 'Springer', 'Taye Crimson', 1991, 6280700, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Persuasion', 'Wiley', 'Jeffery Beckinsale', 1933, 5501427, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Gathering Blue', 'Taylor & Francis', 'Karen Guinness', 1937, 6656900, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Northanger Abbey', 'Vintage Books', 'Timothy Rebhorn', 1982, 5600767, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Breaking Dawn', '''Little', 'Joaquin Gilliam', 2014, 6614146, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hunger Games', 'Avon Books', 'Tori Spector', 1943, 5138196, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Great Expectations', 'G.P. Putnam''s Sons', 'Maura Nolte', 2018, 6970091, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Copper Beeches', '''Little', 'Ed Visnjic', 1931, 5463619, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Song of Ice and Fire Serie', 'Abrams Books', 'Geena Bale', 1937, 7314170, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Watsons', 'Grove Press', 'Chubby Dean', 2009, 8778033, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Persuasion', 'Bantam Books', 'Lindsay DiCaprio', 1983, 6862965, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('''Raise High the Roof Beam', 'St. Martin''s Press', 'Catherine Marie', 1958, 9195555, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Divine Comedy', '''Farrar', 'Davis Brown', 2020, 8743449, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Double', 'Elsevier', 'Laurence Carnes', 2023, 9079481, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Great Gatsby', '''Farrar', 'Russell Reilly', 1936, 7507529, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Odyssey', 'Springer', 'Mika Dushku', 2011, 9919494, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('White Nights', 'Harlequin', 'Brian Baranski', 2003, 8944584, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Marble Faun', 'Hachette Book Group', 'Neve Bachman', 1981, 3737868, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Eleanor & Park', 'HarperCollins', 'Jon Manning', 2002, 6930421, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Catching Fire', 'Bloomsbury', 'Miko Leguizamo', 1960, 2232153, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('I Am the Messenger', 'Johns Hopkins University Press', 'Rutger Tyson', 1972, 3793596, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Eclipse', 'MIT Press', 'Jeroen Miller', 1969, 9884767, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Crooked Man', 'Tor Books', 'Vince Sanders', 1954, 8129608, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Family Happiness', 'Cengage Learning', 'Udo Bandy', 2007, 7216483, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Peasant Marey', 'Simon & Schuster', 'Maura Niven', 2002, 6869552, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Poor Folk', 'Ballantine Books', 'Wayne Gagnon', 2010, 5411804, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Possessed', 'Elsevier', 'Sammy Murray', 1955, 8902777, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Nasty Story', 'McGraw-Hill Education', 'Wes Kline', 2003, 4483405, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Go Set a Watchman', 'Tor Books', 'Elle Carlyle', 1990, 6636907, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Moby Dick', 'Scholastic', 'Franz Cazale', 1971, 6185813, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nine Stories', '''Farrar', 'Sigourney Tomei', 1997, 8831441, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Study in Scarlet', 'Hachette Book Group', 'Merle Gray', 1945, 3976724, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dune Series', 'Avon Books', 'Diane Nelligan', 2016, 9632388, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Madame Bovary', 'Cengage Learning', 'Charles Tanon', 1971, 4816455, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Buried Giant', 'Hachette Book Group', 'Claude Cantrell', 1932, 4029199, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Rebecca', 'Houghton Mifflin Harcourt', 'Anjelica El-Saher', 1944, 6313794, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Treasure Island', 'G.P. Putnam''s Sons', 'Aimee Hughes', 2002, 5703628, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Book Thief', 'HarperCollins', 'Tilda Witt', 1985, 2432192, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Tanglewood Tales', 'Ballantine Books', 'Penelope Giannini', 2009, 7360717, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('An Artist of the Floating Worl', 'Penguin Random House', 'Jon Williams', 1966, 3808152, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Angels & Demons', 'HarperCollins', 'Daniel Guinness', 2021, 4582337, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Blithedale Romance', 'Pearson Education', 'Natascha Ifans', 2013, 2228164, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Wiley', 'Angela Meyer', 1943, 6280641, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Remains of the Day', 'Avon Books', 'Albertina Katt', 1987, 2446497, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Ulysses', 'Dover Publications', 'Jonatha Collie', 1962, 4519379, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Case-Book of Sherlock Holm', 'Avon Books', 'Shannon Lattimore', 1934, 1122457, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Goldfinch', 'McGraw-Hill Education', 'Matthew Secada', 2020, 6517077, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Tanglewood Tales', 'Avon Books', 'Jamie May', 1964, 6143198, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Watsons', 'Taylor & Francis', 'Brenda Loveless', 1976, 2444885, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Glass', 'G.P. Putnam''s Sons', 'Devon Goldwyn', 1974, 9970476, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lady Midnight', 'McGraw-Hill Education', 'Edwin Cross', 2016, 7871923, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Leviathan Wakes', 'Graywolf Press', 'Chet Lofgren', 1998, 5814521, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Crime and Punishment', 'St. Martin''s Press', 'Rufus Clooney', 1952, 7379461, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Resurrection', 'G.P. Putnam''s Sons', 'Rawlins MacIsaac', 2014, 3924556, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Winds of Winter', 'Oxford University Press', 'Millie Thompson', 1950, 7034919, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Ready Player One', 'MIT Press', 'Stephen Gugino', 1968, 1014559, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Life of Pi', 'Penguin Random House', 'Jose Mahood', 1992, 6387386, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Martian', 'Dover Publications', 'Seth Fishburne', 1950, 4989446, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Double', 'Harlequin', 'Sophie Curtis', 1949, 9391213, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sound and the Fury', 'Algonquin Books', 'Nathan Hauser', 2021, 7376145, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Babylon''s Ashes', 'Johns Hopkins University Press', 'Barry Barrymore', 1985, 8348437, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Bleak House', 'Houghton Mifflin Harcourt', 'Edie Rankin', 1952, 8071823, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Insurgent', '''Little', 'Cuba LaMond', 2024, 2864462, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Son of Neptune', 'Pearson Education', 'Rosanne Waite', 1983, 5800003, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Bobok', 'Macmillan Publishers', 'Selma Jeter', 2004, 3895521, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Tyrant''s Tomb', 'Tor Books', 'Tramaine Nicholson', 2015, 9047007, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Oxford University Press', 'Robby Tisdale', 1955, 5709144, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('God Emperor of Dune', '''Little', 'Raymond Clark', 1994, 3524103, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Babylon''s Ashes', 'Vintage Books', 'Gilberto Driver', 1975, 8048284, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Scarlet Letter', 'McGraw-Hill Education', 'Emmylou Langella', 1991, 5276694, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Idiot', 'Brown and Company''', 'Morgan Gershon', 1963, 3076515, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('To the Lighthouse', 'Scholastic', 'Woody Lapointe', 2000, 7754410, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Sorcerer''', '''Farrar', 'Ali Gertner', 1994, 4493274, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hobbit', 'Straus and Giroux''', 'Merillee Myers', 1933, 9054397, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Tyrant''s Tomb', 'Bantam Books', 'Jose Finney', 1987, 4215250, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Love and Friendship', 'SAGE Publications', 'Keanu Duschel', 1985, 5682261, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Da Vinci Code', 'Scholastic', 'Oliver Leoni', 1982, 1073399, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Maze Runner', 'Chronicle Books', 'Buffy Walken', 1966, 1840174, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Engineer''s Thumb', 'Crown Publishing Group', 'Helen McKellen', 1940, 2226566, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Time of Contempt', '''Farrar', 'Eliza Gibson', 1945, 7092828, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nemesis Games', 'Abrams Books', 'Mac Keith', 2012, 1500536, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Goldfinch', 'Springer', 'Talvin Jeter', 1948, 2571624, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Persuasion', 'Pearson Education', 'Clarence Avital', 1964, 3032924, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Outsiders', 'Taylor & Francis', 'Andy Swayze', 2015, 4873126, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Moby Dick', 'Tor Books', 'Clea Tambor', 1954, 2130543, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Return of the King', 'Straus and Giroux''', 'Sonny Mathis', 2019, 1209671, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Lord of the Rings', 'Cengage Learning', 'Tom Leary', 2023, 9204702, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Anna Karenina', 'Vintage Books', 'Aidan Potter', 1988, 9063508, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Pierre', 'Hachette Book Group', 'Albertina Scheider', 1986, 4075689, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Babylon''s Ashes', 'G.P. Putnam''s Sons', 'Wesley Bean', 1934, 6929074, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Lady of the Lake', 'Workman Publishing', 'Demi Dupree', 2024, 3663829, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Naval Treaty', 'Ballantine Books', 'Mint Northam', 1930, 8769990, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Chronicles of Narnia', 'Oxford University Press', 'Ted Johansen', 1936, 4595656, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Kingdom of God is Within Y', 'MIT Press', 'Naomi Red', 1971, 8405617, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Sense and Sensibility', 'Bloomsbury', 'Michael Borgnine', 1942, 1530038, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Book Thief', 'Vintage Books', 'Jesus Weaver', 1933, 7819764, null);
commit;
prompt 100 records committed...
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mystery of Edwin Drood', 'Brown and Company''', 'Neve Danger', 1985, 1654022, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Buried Giant', 'Graywolf Press', 'Merle Sellers', 2001, 2376389, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Heroes of Olympus', 'Brown and Company''', 'Ali Plimpton', 1944, 5203317, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Titan''s Curse', 'Harlequin', 'Caroline Postlethwaite', 1993, 5201833, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Tale of Two Cities', 'Hachette Book Group', 'Alannah Jane', 1971, 8624271, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sword of Summer', 'Tor Books', 'Earl Alexander', 1955, 5873270, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Gloria Scott', 'Wiley', 'Nicky Tankard', 1938, 3969700, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Resurrection', 'Harlequin', 'Dermot Theron', 2011, 1222369, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Babylon''s Ashes', 'McGraw-Hill Education', 'Mia Condition', 1997, 1943848, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Great Gatsby', 'Taylor & Francis', 'Richard Armatrading', 1949, 2929209, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Bell Jar', 'Hachette Book Group', 'Regina O''Neill', 1932, 1609418, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mystery of Edwin Drood', 'Straus and Giroux''', 'Rawlins Buscemi', 2004, 1728799, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Brothers Karamazov', 'Oxford University Press', 'Hector Belles', 1982, 8806258, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Twice-Told Tales', 'MIT Press', 'Claude Damon', 1991, 7204674, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Love and Friendship', 'Houghton Mifflin Harcourt', 'Benjamin Taha', 2010, 8518024, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Village of Stepanchikovo', 'Tor Books', 'Vin Patton', 1998, 1659951, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Scorch Trials', 'Houghton Mifflin Harcourt', 'Emily Benson', 1969, 2381912, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Insurgent', 'Scholastic', 'Rade Bush', 1979, 3874130, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Heavenly Christmas Tree', '''Farrar', 'Dean Candy', 2010, 5738584, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Tender is the Night', 'Johns Hopkins University Press', 'Wendy Hatfield', 2007, 8579230, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sea of Monsters', 'Hachette Book Group', 'Albertina Price', 2020, 8332109, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Friend of the Family', 'Graywolf Press', 'Maury Kane', 1959, 6472241, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Buried Giant', 'Algonquin Books', 'Geoffrey Fox', 1965, 5229102, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Da Vinci Code', 'Cengage Learning', 'Rhea Sinatra', 2024, 3370289, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Road', 'Grove Press', 'Lupe Adkins', 2021, 8281102, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Little Women', 'Harlequin', 'Catherine Savage', 1968, 9728352, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Heretics of Dune', 'Oxford University Press', 'Vanessa Weisz', 2005, 8135497, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fall of Gondolin', 'Simon & Schuster', 'Kelli Myles', 1988, 5924109, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Eternal Husband', 'Pearson Education', 'Lin Askew', 2015, 1708426, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Gone with the Wind', '''Little', 'Rupert Shepard', 1953, 2943547, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hunchback of Notre-Dame', 'Cambridge University Press', 'Donald Nicholson', 1969, 7235876, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Engineer''s Thumb', 'Algonquin Books', 'Bobbi Mills', 1984, 4099131, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Heavenly Fire', 'Crown Publishing Group', 'Miko Farris', 1976, 2986035, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Adventures of Tom Sawyer', 'Scholastic', 'Brendan Whitley', 2000, 2644841, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Chronicle Books', 'Raul Colon', 1952, 9957921, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('War and Peace', 'Cengage Learning', 'Vondie Richardson', 2021, 8835831, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Children of Dune', 'Graywolf Press', 'Edgar Caan', 1992, 2275437, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lord of Shadows', 'Wiley', 'Shawn Weaver', 1980, 8806962, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Blue Carbuncle', 'Workman Publishing', 'Clay Mueller-Stahl', 1988, 3796995, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Deathly H', 'Wiley', 'Derrick Rea', 1978, 5730360, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Snow-Image', 'Simon & Schuster', 'Jackson Gracie', 2013, 3658865, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Yellow Face', 'Macmillan Publishers', 'James Hagerty', 1943, 7619376, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Pierre', 'Algonquin Books', 'Morris Conners', 1949, 5078964, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Heretics of Dune', 'Johns Hopkins University Press', 'Gladys Brickell', 1982, 9842814, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Da Vinci Code', 'SAGE Publications', 'Avenged Rauhofer', 1972, 9846390, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Eternal Husband', 'Penguin Random House', 'Cornell Haynes', 1942, 8837780, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Notes from Underground', 'Crown Publishing Group', 'Eddie Gordon', 2014, 2669594, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Little Women', 'Ballantine Books', 'Hikaru Horizon', 2025, 7219055, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Copper Beeches', 'Ballantine Books', 'Radney Flack', 1972, 7661113, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Tiamat''s Wrath', 'Tor Books', 'Tia Cross', 1988, 4175143, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Tower of the Swallow', 'Graywolf Press', 'Raymond Conway', 1953, 7103565, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Slaughterhouse-Five', 'Oxford University Press', 'Lizzy Flack', 1993, 4965843, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Throne of Fire', 'Vintage Books', 'Curt Sandler', 1963, 6405041, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Uncle''s Dream', 'Simon & Schuster', 'Nastassja Sedgwick', 2016, 8653715, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Crown Publishing Group', 'Kelli Heron', 1946, 3689803, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Half-Bloo', 'Houghton Mifflin Harcourt', 'Geoffrey Neuwirth', 1934, 3041444, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nine Stories', 'Harlequin', 'Alessandro Andrews', 1975, 4836700, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Thief', 'Dover Publications', 'Lucinda Hampton', 1952, 6328334, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Sense and Sensibility', 'Simon & Schuster', 'Tramaine McLean', 1978, 9998372, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fellowship of the Ring', 'Springer', 'Darius Nunn', 1952, 4302327, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Twice-Told Tales', 'G.P. Putnam''s Sons', 'Aimee Keen', 2018, 2409887, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Twilight', 'Pearson Education', 'Dennis Woodward', 1982, 4983449, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mortal Instruments', 'SAGE Publications', 'Lydia Benoit', 1981, 7559708, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Fahrenheit 451', 'Workman Publishing', 'Joan Sizemore', 1990, 2129923, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Pale View of Hills', 'Cengage Learning', 'Lucy Sartain', 1974, 2067059, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nocturnes', '''Little', 'Cheech Remar', 2023, 8885181, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Red Pyramid', 'Houghton Mifflin Harcourt', 'Giancarlo Martin', 1955, 5459882, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Girl with the Dragon Tatto', 'Penguin Random House', 'Brad Lewis', 1991, 3405026, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Treasure Island', 'Wiley', 'April Tolkan', 1995, 7041368, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Marble Faun', 'Chronicle Books', 'Sonny Metcalf', 1990, 2488383, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Great Expectations', 'Dover Publications', 'Kid McDowell', 1970, 8151301, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Last Tycoon', 'Cengage Learning', 'Morris Sheen', 1979, 5804934, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Copper Beeches', 'Knopf Doubleday Publishing Gro', 'Bobby Negbaur', 1957, 5728167, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Eclipse', 'Knopf Doubleday Publishing Gro', 'Freddie Bassett', 1977, 6450396, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Jane Eyre', 'Knopf Doubleday Publishing Gro', 'Nora Keen', 1991, 1421886, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Oxford University Press', 'Chubby Dorff', 2025, 1108625, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Trials of Apollo', 'Elsevier', 'Liv Lightfoot', 1965, 9620915, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hunger Games', 'Penguin Random House', 'Lindsey Thomson', 2004, 5500181, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Serpent''s Shadow', 'Crown Publishing Group', 'Bobby Mandrell', 1968, 9897142, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Persepolis Rising', 'Abrams Books', 'Lili Bogguss', 1978, 7747422, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Girl on the Train', 'Cengage Learning', 'Mary-Louise Weiland', 1941, 6121170, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lord of Shadows', 'Wiley', 'Junior Neville', 1933, 9180863, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Fangirl', '''Little', 'Kylie MacIsaac', 1994, 5730581, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Gentle Creature', 'Grove Press', 'Ewan Green', 2019, 7932433, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('White Nights', 'Macmillan Publishers', 'Emma Renfro', 1937, 5782874, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Scorch Trials', 'Macmillan Publishers', 'Jim Blackmore', 2003, 1651278, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Crime and Punishment', 'Crown Publishing Group', 'Colin Diehl', 1943, 7418161, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Little Orphan', 'Graywolf Press', 'Irene Ermey', 1963, 9048854, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('War and Peace', 'Wiley', 'Kris Winans', 1948, 1560037, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Feast for Crows', 'SAGE Publications', 'Chrissie Cohn', 1968, 2661285, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Time of Contempt', 'Dover Publications', 'Tara Mulroney', 1999, 4516818, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Perks of Being a Wallflowe', 'Macmillan Publishers', 'Cesar Womack', 1940, 1595973, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('I Am the Messenger', 'Bloomsbury', 'Holland Krabbe', 1939, 2966952, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Storm of Swords', 'Oxford University Press', 'Mira Madsen', 2010, 5000512, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Heretics of Dune', 'Wiley', 'Shannyn Bonham', 1993, 7215461, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Half-Bloo', 'Grove Press', 'Howard Duke', 1952, 4009908, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Cossacks', '''Farrar', 'Famke Mueller-Stahl', 1963, 2168132, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Yellow Face', 'SAGE Publications', 'Mos Theron', 2024, 2517381, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Alchemist', 'Graywolf Press', 'Geena Secada', 1949, 9422997, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('1984', 'Wiley', 'Charlie Pepper', 1939, 8950643, null);
commit;
prompt 200 records committed...
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dark Artifices', '''Little', 'Andrae Winans', 1995, 1514032, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Son', 'Cengage Learning', 'Salma Benson', 2021, 5290223, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Resurrection', 'Graywolf Press', 'Don Costa', 2025, 1447860, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Blue Carbuncle', 'Wiley', 'Stephen Cattrall', 1995, 5837468, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Nasty Story', '''Little', 'Sylvester Baldwin', 1970, 1571264, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mystery of Edwin Drood', 'St. Martin''s Press', 'Rick Winstone', 2008, 7699468, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Moby Dick', '''Little', 'Elisabeth Farrell', 1978, 6374588, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mortal Instruments', 'SAGE Publications', 'Leo McDowall', 2022, 1915937, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Clash of Kings', 'Cengage Learning', 'Uma Guzman', 1985, 1864586, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dark Artifices', 'Cengage Learning', 'Willie Keith', 1946, 9984657, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Ulysses', 'Hachette Book Group', 'Edie Weber', 1936, 2194728, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Landlady', 'Cambridge University Press', 'Molly Strathairn', 1951, 3236334, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Caliban''s War', 'Cengage Learning', 'Horace Loveless', 1969, 4857798, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Life of Pi', '''Little', 'Mandy Kennedy', 2002, 8680841, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Love and Friendship', 'St. Martin''s Press', 'Kieran Daniels', 1971, 3932967, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dark Artifices', 'Avon Books', 'Judy Prinze', 1966, 9693371, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Redburn', 'Graywolf Press', 'Kitty Ricci', 1961, 3731725, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Lost Souls', 'Hachette Book Group', 'Brian Kravitz', 1937, 7574038, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Life of Pi', 'Cengage Learning', 'Charlton Phillippe', 2022, 3822687, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Les Mis?rables', 'Johns Hopkins University Press', 'Hope Bridges', 1977, 6270618, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Friend of the Family', 'Knopf Doubleday Publishing Gro', 'Sal Farina', 1975, 8627755, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('1984', 'St. Martin''s Press', 'Christine Cherry', 1992, 7961372, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Silmarillion', 'Cambridge University Press', 'Herbie Myers', 2002, 6170735, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Secret Garden', 'Tor Books', 'Benjamin Solido', 1952, 9193770, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Order of ', 'Scholastic', 'Boz Sepulveda', 1972, 1775013, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Study in Scarlet', 'Grove Press', 'Dar Conley', 1957, 6610730, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Wonder-Book for Girls and Bo', 'Knopf Doubleday Publishing Gro', 'Robbie Gleeson', 1970, 6615782, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Study in Scarlet', 'Dover Publications', 'Tara Crowell', 2014, 2283609, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('One Hundred Years of Solitude', 'Cambridge University Press', 'Kitty Iglesias', 2004, 2075459, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Old Man and the Sea', 'Graywolf Press', 'Lily Culkin', 1993, 1924330, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Expanse Series', 'St. Martin''s Press', 'Mos Keener', 1949, 9724432, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Typee', '''Little', 'Ned Idol', 2019, 1619879, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sword of Summer', 'Abrams Books', 'Leslie Zane', 1968, 8880277, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sign of the Four', 'McGraw-Hill Education', 'Belinda Diehl', 2024, 7593273, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Chamber o', 'Springer', 'Tzi De Almeida', 2002, 8053421, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Clockwork Princess', 'Algonquin Books', 'Ronnie Starr', 2010, 1142765, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Beryl Coronet', 'Oxford University Press', 'Kris Singh', 1935, 6207794, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Angels & Demons', 'Houghton Mifflin Harcourt', 'Nastassja Parm', 1983, 6117661, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Last Wish', 'Brown and Company''', 'Lea Malkovich', 1999, 5107500, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Wuthering Heights', 'Chronicle Books', 'Dennis Bedelia', 1939, 4867327, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Remains of the Day', 'Macmillan Publishers', 'Ike Ellis', 1965, 7010653, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Adolescent', 'Ballantine Books', 'Herbie Collie', 1980, 6047933, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Martian', 'Chronicle Books', 'Bobby Tanon', 2022, 4531615, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Curious Case of Benjamin B', 'Scholastic', 'Allan Reeves', 1997, 6446456, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Gambler', 'Taylor & Francis', 'Lea Garner', 1941, 1811902, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Kill Order', 'Grove Press', 'Ike Rispoli', 1941, 4034616, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Deathly H', 'Graywolf Press', 'Bo Schreiber', 1934, 3351688, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Slaughterhouse-Five', 'Workman Publishing', 'Illeana Atkins', 2024, 5260106, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('White-Jacket', 'G.P. Putnam''s Sons', 'Suzanne LaBelle', 2012, 8450547, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Israel Potter', 'HarperCollins', 'Lloyd Chilton', 1944, 7049215, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Chapterhouse: Dune', 'Knopf Doubleday Publishing Gro', 'Emm Austin', 1956, 1866834, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Wuthering Heights', 'Bantam Books', 'Geena Milsap', 1933, 6396129, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The House of the Dead', 'Chronicle Books', 'Brothers Mitchell', 1933, 8328083, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Abaddon''s Gate', 'Dover Publications', 'Jeffrey Stowe', 1989, 8840173, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Franny and Zooey', 'Hachette Book Group', 'Phil Gayle', 1986, 3533058, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Redburn', 'Cambridge University Press', 'Claire Horton', 1966, 2940237, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Clockwork Prince', 'Bloomsbury', 'Nanci Cube', 1936, 4051612, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The House of the Seven Gables', 'G.P. Putnam''s Sons', 'Christina Sizemore', 1995, 2205976, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Ulysses', 'Elsevier', 'Powers Hingle', 2013, 6227536, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Magnus Chase and the Gods of A', 'Johns Hopkins University Press', 'Burt Perez', 1987, 8258548, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Serpent''s Shadow', 'Brown and Company''', 'Aaron Neeson', 1950, 4260056, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fall of Gondolin', 'Tor Books', 'Nora Marin', 1959, 4197591, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Engineer''s Thumb', 'G.P. Putnam''s Sons', 'Micky Presley', 1990, 1168868, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Serpent''s Shadow', 'Algonquin Books', 'Clint Glover', 1934, 8643852, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Blue Carbuncle', 'Pearson Education', 'Nigel Cherry', 1942, 3389429, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Clash of Kings', 'Springer', 'Max Tilly', 1964, 5064258, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Remains of the Day', 'Harlequin', 'Eric Torino', 1935, 2824103, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Engineer''s Thumb', '''Farrar', 'Beverley Hedaya', 2010, 6737897, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Reigate Puzzle', 'Macmillan Publishers', 'Busta McClinton', 1960, 8736964, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Franny and Zooey', '''Farrar', 'Geoff DiFranco', 1932, 4632584, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Road', 'Johns Hopkins University Press', 'Loretta Fox', 2014, 6593829, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Unconsoled', 'Knopf Doubleday Publishing Gro', 'Fats Macy', 2005, 6512679, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Omoo', 'Scholastic', 'Grant Diesel', 1944, 5751110, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Unfinished Tales', 'Wiley', 'Vern Heslov', 1998, 4379844, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Treasure Island', 'G.P. Putnam''s Sons', 'Jason McGriff', 1991, 1622792, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Messenger', 'Harlequin', 'Balthazar Gandolfini', 2023, 1165966, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Scorch Trials', 'G.P. Putnam''s Sons', 'Kurt Hawthorne', 2015, 7609284, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('God Emperor of Dune', 'Vintage Books', 'Ann Playboys', 2012, 7674424, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Son', 'Scholastic', 'Talvin McGowan', 1951, 1401833, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Fallen Angels', 'Scholastic', 'Courtney Gilley', 1934, 1205385, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Clockwork Angel', 'Knopf Doubleday Publishing Gro', 'Anita Checker', 1933, 7254716, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('To Kill a Mockingbird', 'Graywolf Press', 'Lynette Witt', 1971, 8593082, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nicholas Nickleby', 'Cambridge University Press', 'Lara Stowe', 1995, 8092242, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Titan''s Curse', 'Algonquin Books', 'Steven McGregor', 1988, 4091590, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Iliad', 'Wiley', 'Toshiro Tambor', 2015, 2036669, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Last Olympian', 'MIT Press', 'Geena Kier', 2007, 4259544, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Copper Beeches', 'Cambridge University Press', 'Daniel McLachlan', 2018, 1044950, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Half-Bloo', 'Scholastic', 'Wendy Sizemore', 1936, 8964366, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Kingdom of God is Within Y', 'Cambridge University Press', 'Trick Hirsch', 1943, 8149179, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Blithedale Romance', 'Scholastic', 'Carolyn Spiner', 1972, 6590151, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Twilight', 'Chronicle Books', 'Matt Perlman', 1982, 4088650, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Catching Fire', 'Cengage Learning', 'Ernie Kingsley', 2021, 7563661, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Adventures of Tom Sawyer', 'Tor Books', 'Halle Hong', 2023, 4041709, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Anna Karenina', 'Abrams Books', 'Anne Vega', 1986, 8093395, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Peasant Marey', '''Little', 'Samuel Hopper', 1935, 1578025, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Little Dorrit', 'Penguin Random House', 'Tony Krieger', 1987, 3531145, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dombey and Son', 'Tor Books', 'Denise Chandler', 2003, 8082648, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fever Code', 'Bantam Books', 'Heath Moraz', 2013, 1082305, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Fanshawe', 'Elsevier', 'Adina Shepherd', 1953, 4992174, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Secret Garden', 'Penguin Random House', 'Terri Gibson', 1981, 1089380, null);
commit;
prompt 300 records committed...
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Mark of Athena', 'SAGE Publications', 'Diamond Brando', 1992, 5781286, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Honest Thief', 'Cengage Learning', 'Lupe Gayle', 1973, 5619639, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Great Expectations', 'Crown Publishing Group', 'Diane Redgrave', 1956, 3821547, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Dream of Spring', 'Algonquin Books', 'Don Viterelli', 1949, 7616550, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Oliver Twist', 'Workman Publishing', 'Joan Farina', 1966, 9506878, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Valley of Fear', 'Hachette Book Group', 'Clint Thewlis', 1951, 9964895, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Great Gatsby', 'Brown and Company''', 'Parker Crouch', 1939, 2154230, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Sense and Sensibility', '''Farrar', 'Hikaru Wariner', 1985, 9838042, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Tower of Nero', 'Harlequin', 'Orlando Lovitz', 1948, 4797464, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Family Happiness', 'St. Martin''s Press', 'Neve MacDonald', 1940, 6432084, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dune Series', 'MIT Press', 'Warren Koteas', 2013, 1111970, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Silmarillion', 'Straus and Giroux''', 'Stanley Dalton', 1939, 7870637, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Throne of Fire', 'MIT Press', 'Giancarlo Imbruglia', 2004, 4289528, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Mosses from an Old Manse', 'Knopf Doubleday Publishing Gro', 'Mary Beth Pullman', 1982, 3659138, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Cibola Burn', 'MIT Press', 'Tzi Eat World', 2001, 4178382, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Old Curiosity Shop', 'Macmillan Publishers', 'Helen Wolf', 2008, 3637450, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Persepolis Rising', 'Crown Publishing Group', 'Humberto Fisher', 1969, 6667347, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Crocodile', 'Penguin Random House', 'Night Niven', 1992, 1291356, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Pride and Prejudice', 'Chronicle Books', 'Ramsey Idle', 1946, 6547119, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Queen of Air and Darkness', 'Cengage Learning', 'Jimmy Cooper', 1986, 7351735, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Hard Times', 'McGraw-Hill Education', 'Scott Curtis-Hall', 2019, 5229480, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Brothers Karamazov', '''Farrar', 'Tyrone Stevenson', 1991, 6103107, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Brothers Karamazov', 'Dover Publications', 'Tcheky Liotta', 1971, 5167926, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Divergent', 'Simon & Schuster', 'Samuel Winslet', 2025, 3499215, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Call of the Wild', 'Workman Publishing', 'Donna Quinlan', 1946, 4462241, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Curious Case of Benjamin B', 'SAGE Publications', 'Judge Gordon', 1986, 3256677, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Catcher in the Rye', 'Johns Hopkins University Press', 'Cliff Bancroft', 1954, 6949845, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Brothers Karamazov', 'Cengage Learning', 'Cornell Griffin', 1930, 9884035, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Return of the King', 'Avon Books', 'Machine Craddock', 2003, 6256501, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fault in Our Stars', 'Brown and Company''', 'Tcheky Sedgwick', 1970, 3254416, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dune', 'Scholastic', 'Teri White', 1986, 7809181, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Heavenly Fire', 'Crown Publishing Group', 'Davis Langella', 2008, 2502991, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Sword of Summer', 'Hachette Book Group', 'Udo Hynde', 2007, 6462752, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Dark Prophecy', 'Bloomsbury', 'Salma Cruz', 2021, 8428897, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Getting', 'Johns Hopkins University Press', 'Darius Conners', 2019, 5144914, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Heavenly Christmas Tree', 'Cambridge University Press', 'Wallace Atkins', 1954, 7238022, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Mosses from an Old Manse', 'G.P. Putnam''s Sons', 'Keanu Janney', 1987, 5874861, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Christmas Tree and the Wed', 'Houghton Mifflin Harcourt', 'Rhea Peterson', 1949, 5402656, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Don Quixote', 'Tor Books', 'Angelina Pollak', 2005, 8277136, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Little Orphan', 'Bloomsbury', 'Oro Northam', 1987, 8038435, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The House of Hades', 'Pearson Education', 'Jonny Goldberg', 1959, 6092727, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Israel Potter', 'Vintage Books', 'Liam Michaels', 1967, 2033962, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Reigate Puzzle', 'Cambridge University Press', 'Micky Armstrong', 1942, 8964339, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Insurgent', 'Chronicle Books', 'Hope Moffat', 2020, 1169698, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Anna Karenina', 'Springer', 'Selma McDonald', 1985, 3504598, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Storm of Swords', 'Macmillan Publishers', 'Taye Weber', 1950, 3682062, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Resurrection', 'Dover Publications', 'Mary Beth Newman', 2022, 1392791, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hammer of Thor', 'Penguin Random House', 'Raul Venora', 1959, 9877855, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Naval Treaty', 'Avon Books', 'Alannah Gallant', 1956, 4985739, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Unfinished Tales', 'Oxford University Press', 'Vendetta Perez', 1973, 5288876, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Son', 'Simon & Schuster', 'Fats Wood', 1972, 5460290, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Wonder-Book for Girls and Bo', 'Elsevier', 'Tea Kretschmann', 1931, 5370524, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Burning Maze', 'Taylor & Francis', 'Lynn Heald', 2004, 1572315, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Anna Karenina', 'Workman Publishing', 'Pete Sirtis', 1930, 3467701, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Great Expectations', 'Taylor & Francis', 'Mindy Burns', 2020, 2037298, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Madame Bovary', 'Pearson Education', 'Gil Glover', 1958, 8072861, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Friend of the Family', 'Hachette Book Group', 'Dean Fariq', 2003, 3043425, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Slaughterhouse-Five', 'Hachette Book Group', 'Wendy Waits', 2004, 3016170, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Carpenters and Seymour: An Int', 'McGraw-Hill Education', 'Suzy Pigott-Smith', 1947, 6394733, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Beryl Coronet', 'Oxford University Press', 'Barry Vinton', 2022, 5312175, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Barnaby Rudge', 'Grove Press', 'Woody Avital', 1947, 8908416, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Death Cure', 'Algonquin Books', 'Lynette Pollack', 1937, 9856776, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('To Kill a Mockingbird', 'Cengage Learning', 'Todd Payne', 1961, 4230538, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Catch-22', 'Tor Books', 'Kate Statham', 1985, 6568911, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Witcher Series', 'Elsevier', 'Patricia Whitman', 2017, 5994660, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lady Midnight', 'Crown Publishing Group', 'Ving Overstreet', 1978, 8897160, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dune Messiah', 'Grove Press', 'Adrien Bogguss', 1983, 7819907, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Death Cure', 'Straus and Giroux''', 'Philip McAnally', 1992, 6372921, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Son', 'St. Martin''s Press', 'Lili Robbins', 1973, 2952210, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Last Olympian', 'Grove Press', 'Reese Craven', 1972, 3914677, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dombey and Son', 'Crown Publishing Group', 'Treat Basinger', 1990, 4399607, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Fangirl', 'Brown and Company''', 'Vanessa Conroy', 1989, 2298339, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Idiot', 'Cengage Learning', 'Belinda Conroy', 1964, 8450772, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Billy Budd', 'Harlequin', 'Samantha Flack', 1988, 3063581, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dracula', 'McGraw-Hill Education', 'Louise Herrmann', 1959, 8959453, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Little Dorrit', 'Harlequin', 'Larenz Zeta-Jones', 1993, 6585257, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Fellowship of the Ring', 'Crown Publishing Group', 'Harriet Gatlin', 1981, 7132241, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lord of Shadows', 'Macmillan Publishers', 'Jesse Blackwell', 1960, 5215328, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('City of Lost Souls', 'Ballantine Books', 'Pierce Sedaka', 2006, 1164977, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lord of Shadows', 'Brown and Company''', 'Mia Satriani', 1998, 9677057, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Last Olympian', 'Springer', 'Paula Pantoliano', 1977, 5127556, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Harry Potter and the Goblet of', 'Workman Publishing', 'Vincent Kershaw', 1968, 2799487, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Help', 'Pearson Education', 'Jose Lynch', 1982, 6924336, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Hobbit', 'Knopf Doubleday Publishing Gro', 'Billy Redford', 1944, 6246601, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Poor Folk', 'Bantam Books', 'Lesley Rosas', 1938, 4146797, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Bell Jar', 'Workman Publishing', 'Tcheky Berkley', 2014, 6000719, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Pale View of Hills', 'Tor Books', 'Lauren MacIsaac', 2023, 6712465, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Lady Midnight', 'Brown and Company''', 'John Howard', 2021, 4589570, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Bell Jar', 'Workman Publishing', 'Rhona Maxwell', 1981, 8139676, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Nemesis Games', 'Vintage Books', 'Katrin Thomson', 1931, 6789049, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Final Problem', 'Penguin Random House', 'Liquid Coe', 1932, 6966092, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Abaddon''s Gate', 'Knopf Doubleday Publishing Gro', 'Lily Morse', 1970, 3774951, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Two Towers', 'Wiley', 'Embeth Tomlin', 1990, 4372381, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('A Farewell to Arms', 'G.P. Putnam''s Sons', 'Lonnie Harris', 1935, 4712013, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Children of Dune', 'Knopf Doubleday Publishing Gro', 'Alice Rickles', 1991, 1559141, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Heavenly Christmas Tree', '''Little', 'Trace Nightingale', 1998, 4457628, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Final Problem', 'Scholastic', 'Lauren Ferry', 1966, 1899636, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Mockingjay', '''Farrar', 'Heath Chapman', 1932, 3960643, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Bobok', 'Avon Books', 'Vondie Beck', 1983, 8059226, null);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('The Handmaid''s Tale', 'Elsevier', 'Donald Folds', 2011, 9169488, null);
commit;
prompt 400 records loaded
prompt Loading BOOKCOPYINSTOCK...
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (31728425, 'borrowed', to_date('10-03-2001', 'dd-mm-yyyy'), 7103565);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (30644057, 'borrowed', to_date('21-11-1994', 'dd-mm-yyyy'), 2943547);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (36023612, 'in stock', to_date('08-08-2005', 'dd-mm-yyyy'), 3256677);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (18305378, 'in stock', to_date('04-07-2003', 'dd-mm-yyyy'), 7351735);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40496064, 'in stock', to_date('10-12-2001', 'dd-mm-yyyy'), 7932433);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78671712, 'in stock', to_date('16-12-2006', 'dd-mm-yyyy'), 2129923);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (11693710, 'in stock', to_date('12-08-1989', 'dd-mm-yyyy'), 4379844);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1809500, 'in stock', to_date('17-12-1997', 'dd-mm-yyyy'), 2129923);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99873408, 'in stock', to_date('17-05-2017', 'dd-mm-yyyy'), 2986035);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96662049, 'borrowed', to_date('21-07-2010', 'dd-mm-yyyy'), 2129923);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83557024, 'in stock', to_date('11-09-2015', 'dd-mm-yyyy'), 4797464);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (48138526, 'borrowed', to_date('16-01-2001', 'dd-mm-yyyy'), 3504598);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71602813, 'borrowed', to_date('14-10-2008', 'dd-mm-yyyy'), 4857798);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (69991083, 'borrowed', to_date('07-01-1997', 'dd-mm-yyyy'), 9620915);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74002259, 'in stock', to_date('29-04-2010', 'dd-mm-yyyy'), 3774951);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (64070733, 'in stock', to_date('18-11-2004', 'dd-mm-yyyy'), 2067059);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42332000, 'borrowed', to_date('01-09-2015', 'dd-mm-yyyy'), 4009908);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74844291, 'in stock', to_date('05-09-2009', 'dd-mm-yyyy'), 1915937);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (8432450, 'in stock', to_date('04-04-2017', 'dd-mm-yyyy'), 2376389);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43953491, 'in stock', to_date('20-05-2008', 'dd-mm-yyyy'), 8092242);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (54086936, 'borrowed', to_date('06-06-2021', 'dd-mm-yyyy'), 7049215);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43242462, 'in stock', to_date('05-10-2001', 'dd-mm-yyyy'), 2799487);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (16496269, 'in stock', to_date('12-10-1996', 'dd-mm-yyyy'), 2228164);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76837994, 'in stock', to_date('06-11-2022', 'dd-mm-yyyy'), 6610730);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65670663, 'in stock', to_date('09-01-1999', 'dd-mm-yyyy'), 2381912);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21402674, 'borrowed', to_date('06-11-2014', 'dd-mm-yyyy'), 3043425);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55545557, 'in stock', to_date('14-03-1997', 'dd-mm-yyyy'), 5874861);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75191095, 'borrowed', to_date('20-08-1999', 'dd-mm-yyyy'), 8038435);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1107645, 'borrowed', to_date('27-01-1994', 'dd-mm-yyyy'), 8944584);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68786792, 'in stock', to_date('12-06-1993', 'dd-mm-yyyy'), 5924109);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (61856831, 'in stock', to_date('24-08-2011', 'dd-mm-yyyy'), 7661113);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (16856335, 'in stock', to_date('16-07-2000', 'dd-mm-yyyy'), 1572315);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43421825, 'in stock', to_date('01-09-2023', 'dd-mm-yyyy'), 4029199);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (10126463, 'borrowed', to_date('26-04-2001', 'dd-mm-yyyy'), 9195555);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65435493, 'in stock', to_date('29-05-2003', 'dd-mm-yyyy'), 3793596);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90021894, 'borrowed', to_date('02-07-2021', 'dd-mm-yyyy'), 5463619);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (84462432, 'in stock', to_date('16-12-2018', 'dd-mm-yyyy'), 2283609);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (63772192, 'borrowed', to_date('08-03-2015', 'dd-mm-yyyy'), 8743449);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (98815491, 'borrowed', to_date('25-10-1992', 'dd-mm-yyyy'), 4483405);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (24375703, 'borrowed', to_date('23-03-2010', 'dd-mm-yyyy'), 1392791);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2505250, 'borrowed', to_date('31-08-2009', 'dd-mm-yyyy'), 8897160);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (50909112, 'in stock', to_date('17-06-2001', 'dd-mm-yyyy'), 2502991);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (28509222, 'borrowed', to_date('21-11-1988', 'dd-mm-yyyy'), 4009908);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43604011, 'in stock', to_date('23-05-1988', 'dd-mm-yyyy'), 5460290);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (39336146, 'borrowed', to_date('13-08-1998', 'dd-mm-yyyy'), 4589570);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75846638, 'borrowed', to_date('10-08-1991', 'dd-mm-yyyy'), 5782874);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68769683, 'in stock', to_date('26-10-1998', 'dd-mm-yyyy'), 4857798);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (44722637, 'borrowed', to_date('30-01-1999', 'dd-mm-yyyy'), 4595656);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70421039, 'borrowed', to_date('15-06-2024', 'dd-mm-yyyy'), 9984657);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (9317561, 'borrowed', to_date('23-09-2001', 'dd-mm-yyyy'), 5127556);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70780107, 'in stock', to_date('01-06-1998', 'dd-mm-yyyy'), 1915937);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15167217, 'borrowed', to_date('22-12-2009', 'dd-mm-yyyy'), 6170735);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (72337973, 'borrowed', to_date('21-08-2000', 'dd-mm-yyyy'), 7699468);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (39860765, 'borrowed', to_date('03-02-2012', 'dd-mm-yyyy'), 8038435);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78659070, 'borrowed', to_date('11-09-1996', 'dd-mm-yyyy'), 8840173);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (79423782, 'in stock', to_date('14-01-1993', 'dd-mm-yyyy'), 6328334);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (93567904, 'borrowed', to_date('06-11-2008', 'dd-mm-yyyy'), 5107500);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (28106950, 'in stock', to_date('07-02-1992', 'dd-mm-yyyy'), 9884035);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (7448395, 'in stock', to_date('26-08-2017', 'dd-mm-yyyy'), 8071823);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (27202765, 'borrowed', to_date('06-04-2011', 'dd-mm-yyyy'), 3389429);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (9245443, 'in stock', to_date('12-12-2014', 'dd-mm-yyyy'), 3659138);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65975293, 'in stock', to_date('16-06-2006', 'dd-mm-yyyy'), 3793596);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (20355941, 'borrowed', to_date('27-05-1992', 'dd-mm-yyyy'), 7754410);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (5710149, 'in stock', to_date('02-02-1993', 'dd-mm-yyyy'), 8151301);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1869844, 'in stock', to_date('27-07-1985', 'dd-mm-yyyy'), 8680841);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (507725, 'borrowed', to_date('14-01-2008', 'dd-mm-yyyy'), 1169698);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37032406, 'in stock', to_date('22-10-2004', 'dd-mm-yyyy'), 2275437);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (60109907, 'in stock', to_date('10-03-2005', 'dd-mm-yyyy'), 8428897);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55571633, 'in stock', to_date('20-07-1993', 'dd-mm-yyyy'), 7376145);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99502245, 'in stock', to_date('02-03-2013', 'dd-mm-yyyy'), 5994660);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (56976870, 'borrowed', to_date('10-09-2023', 'dd-mm-yyyy'), 1392791);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59389847, 'borrowed', to_date('19-02-2004', 'dd-mm-yyyy'), 5874861);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42333140, 'in stock', to_date('27-03-1990', 'dd-mm-yyyy'), 1595973);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (24031000, 'borrowed', to_date('03-12-2004', 'dd-mm-yyyy'), 2275437);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (92933316, 'in stock', to_date('11-10-2024', 'dd-mm-yyyy'), 4175143);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42024900, 'in stock', to_date('10-09-2017', 'dd-mm-yyyy'), 2033962);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57281357, 'borrowed', to_date('27-10-2012', 'dd-mm-yyyy'), 1609418);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (77346563, 'borrowed', to_date('13-01-2000', 'dd-mm-yyyy'), 6256501);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76220833, 'in stock', to_date('04-07-2015', 'dd-mm-yyyy'), 6924336);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87351924, 'borrowed', to_date('15-04-1996', 'dd-mm-yyyy'), 7132241);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37112469, 'in stock', to_date('26-11-2004', 'dd-mm-yyyy'), 7563661);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (86341988, 'borrowed', to_date('18-01-2005', 'dd-mm-yyyy'), 6185813);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (46920404, 'in stock', to_date('12-10-2005', 'dd-mm-yyyy'), 5730360);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (91086735, 'in stock', to_date('14-04-1985', 'dd-mm-yyyy'), 5276694);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68545577, 'in stock', to_date('04-04-1998', 'dd-mm-yyyy'), 9506878);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (91737939, 'in stock', to_date('01-06-1997', 'dd-mm-yyyy'), 5837468);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (47331167, 'in stock', to_date('12-11-2017', 'dd-mm-yyyy'), 3895521);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (14540137, 'in stock', to_date('23-09-1998', 'dd-mm-yyyy'), 4989446);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83421606, 'borrowed', to_date('28-01-2014', 'dd-mm-yyyy'), 4816455);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (279966, 'in stock', to_date('11-01-1997', 'dd-mm-yyyy'), 6405041);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99393435, 'borrowed', to_date('27-06-1998', 'dd-mm-yyyy'), 2644841);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (77676726, 'borrowed', to_date('20-02-1985', 'dd-mm-yyyy'), 7034919);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59406453, 'in stock', to_date('25-09-2011', 'dd-mm-yyyy'), 6270618);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37638745, 'borrowed', to_date('08-12-2023', 'dd-mm-yyyy'), 4582337);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76445157, 'borrowed', to_date('08-04-1986', 'dd-mm-yyyy'), 8332109);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (36099617, 'in stock', to_date('07-01-2006', 'dd-mm-yyyy'), 4178382);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (54452132, 'in stock', to_date('17-03-2023', 'dd-mm-yyyy'), 8071823);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (49874659, 'borrowed', to_date('13-10-1987', 'dd-mm-yyyy'), 2940237);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (64216005, 'borrowed', to_date('06-09-2017', 'dd-mm-yyyy'), 5144914);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43073883, 'borrowed', to_date('29-08-1997', 'dd-mm-yyyy'), 3682062);
commit;
prompt 100 records committed...
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (62452248, 'borrowed', to_date('16-04-2021', 'dd-mm-yyyy'), 1572315);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70712107, 'in stock', to_date('30-08-2004', 'dd-mm-yyyy'), 7616550);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (48050736, 'borrowed', to_date('27-07-2024', 'dd-mm-yyyy'), 7871923);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42284812, 'in stock', to_date('04-12-2016', 'dd-mm-yyyy'), 4797464);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75690785, 'in stock', to_date('25-09-1999', 'dd-mm-yyyy'), 5138196);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (86823508, 'in stock', to_date('19-12-2006', 'dd-mm-yyyy'), 5000512);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (62791533, 'borrowed', to_date('25-05-1986', 'dd-mm-yyyy'), 9897142);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96657225, 'in stock', to_date('26-07-2001', 'dd-mm-yyyy'), 4099131);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (8694124, 'borrowed', to_date('22-05-1993', 'dd-mm-yyyy'), 8405617);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (49207804, 'in stock', to_date('02-11-2001', 'dd-mm-yyyy'), 6970091);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41265267, 'borrowed', to_date('17-05-2010', 'dd-mm-yyyy'), 4985739);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99735074, 'borrowed', to_date('06-10-2005', 'dd-mm-yyyy'), 4051612);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67735403, 'borrowed', to_date('28-07-2016', 'dd-mm-yyyy'), 6512679);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55612392, 'in stock', to_date('10-12-2023', 'dd-mm-yyyy'), 2298339);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (92722090, 'in stock', to_date('16-07-2022', 'dd-mm-yyyy'), 8908416);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76679229, 'borrowed', to_date('21-06-2001', 'dd-mm-yyyy'), 1209671);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76215277, 'in stock', to_date('02-09-1987', 'dd-mm-yyyy'), 5924109);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74702693, 'borrowed', to_date('20-01-1998', 'dd-mm-yyyy'), 6387386);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (77980475, 'in stock', to_date('09-12-2002', 'dd-mm-yyyy'), 8328083);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (36589376, 'borrowed', to_date('19-03-1986', 'dd-mm-yyyy'), 6047933);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (18450260, 'in stock', to_date('01-03-1998', 'dd-mm-yyyy'), 6517077);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41925230, 'in stock', to_date('21-03-2017', 'dd-mm-yyyy'), 7092828);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (84545896, 'borrowed', to_date('19-01-1988', 'dd-mm-yyyy'), 4483405);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (82496707, 'borrowed', to_date('13-12-1987', 'dd-mm-yyyy'), 6246601);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57214922, 'in stock', to_date('24-03-2014', 'dd-mm-yyyy'), 2986035);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53929183, 'borrowed', to_date('25-12-1991', 'dd-mm-yyyy'), 3504598);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67411183, 'in stock', to_date('18-07-1993', 'dd-mm-yyyy'), 6446456);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (35942001, 'borrowed', to_date('23-08-2007', 'dd-mm-yyyy'), 8092242);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55700668, 'in stock', to_date('13-12-1988', 'dd-mm-yyyy'), 3822687);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42678036, 'borrowed', to_date('03-06-1996', 'dd-mm-yyyy'), 6121170);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75574849, 'borrowed', to_date('13-07-2020', 'dd-mm-yyyy'), 1866834);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17398691, 'borrowed', to_date('17-02-1990', 'dd-mm-yyyy'), 8151301);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74419679, 'borrowed', to_date('18-05-2013', 'dd-mm-yyyy'), 7204674);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70252596, 'borrowed', to_date('22-07-2006', 'dd-mm-yyyy'), 7351735);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53494430, 'borrowed', to_date('27-05-1998', 'dd-mm-yyyy'), 6256501);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (85867665, 'borrowed', to_date('15-12-2003', 'dd-mm-yyyy'), 2517381);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21364375, 'borrowed', to_date('06-06-2024', 'dd-mm-yyyy'), 9047007);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (6167213, 'in stock', to_date('23-09-2016', 'dd-mm-yyyy'), 3774951);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (29513056, 'in stock', to_date('26-05-2007', 'dd-mm-yyyy'), 6185813);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (88319788, 'borrowed', to_date('06-10-2020', 'dd-mm-yyyy'), 4379844);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (60740527, 'in stock', to_date('30-11-1997', 'dd-mm-yyyy'), 5600767);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (20166857, 'borrowed', to_date('06-09-2009', 'dd-mm-yyyy'), 5804934);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (92169660, 'in stock', to_date('14-01-2014', 'dd-mm-yyyy'), 2154230);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (5813194, 'borrowed', to_date('25-11-2014', 'dd-mm-yyyy'), 8258548);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70421241, 'borrowed', to_date('22-08-2004', 'dd-mm-yyyy'), 4965843);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2460095, 'borrowed', to_date('29-10-1985', 'dd-mm-yyyy'), 3524103);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (16876253, 'in stock', to_date('05-07-2002', 'dd-mm-yyyy'), 2036669);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83616273, 'borrowed', to_date('23-10-1993', 'dd-mm-yyyy'), 3822687);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67775382, 'borrowed', to_date('18-11-1997', 'dd-mm-yyyy'), 8092242);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (26536221, 'in stock', to_date('13-06-1987', 'dd-mm-yyyy'), 8048284);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (32072438, 'in stock', to_date('06-03-1995', 'dd-mm-yyyy'), 5730360);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (66907833, 'borrowed', to_date('28-11-2019', 'dd-mm-yyyy'), 2228164);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (18697580, 'in stock', to_date('14-03-2010', 'dd-mm-yyyy'), 8624271);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53668007, 'borrowed', to_date('18-05-2023', 'dd-mm-yyyy'), 7092828);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74009538, 'in stock', to_date('23-04-1985', 'dd-mm-yyyy'), 8736964);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (12946902, 'in stock', to_date('02-07-2014', 'dd-mm-yyyy'), 4712013);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (86082081, 'borrowed', to_date('04-11-2007', 'dd-mm-yyyy'), 9620915);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (36305690, 'in stock', to_date('26-10-2009', 'dd-mm-yyyy'), 4712013);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (20283922, 'in stock', to_date('25-02-2015', 'dd-mm-yyyy'), 8593082);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1291046, 'in stock', to_date('01-06-2024', 'dd-mm-yyyy'), 6568911);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74510907, 'in stock', to_date('17-10-2020', 'dd-mm-yyyy'), 3063581);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40791224, 'borrowed', to_date('11-12-2012', 'dd-mm-yyyy'), 6394733);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (88120118, 'in stock', to_date('25-06-2002', 'dd-mm-yyyy'), 4595656);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (20627283, 'in stock', to_date('09-12-2001', 'dd-mm-yyyy'), 1165966);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41232736, 'in stock', to_date('17-08-2016', 'dd-mm-yyyy'), 1915937);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (51323527, 'borrowed', to_date('03-11-2008', 'dd-mm-yyyy'), 4091590);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (84581107, 'in stock', to_date('08-10-2008', 'dd-mm-yyyy'), 1164977);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83840666, 'borrowed', to_date('14-09-1998', 'dd-mm-yyyy'), 2446497);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (9190334, 'borrowed', to_date('25-03-1996', 'dd-mm-yyyy'), 6405041);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (45423465, 'borrowed', to_date('27-06-1986', 'dd-mm-yyyy'), 8653715);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (14945039, 'in stock', to_date('25-01-2012', 'dd-mm-yyyy'), 3658865);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2554478, 'borrowed', to_date('27-02-2004', 'dd-mm-yyyy'), 5127556);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (3514883, 'borrowed', to_date('17-08-1999', 'dd-mm-yyyy'), 4175143);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (52162108, 'borrowed', to_date('08-05-1989', 'dd-mm-yyyy'), 9919494);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (94993854, 'in stock', to_date('22-09-2017', 'dd-mm-yyyy'), 4041709);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90136178, 'borrowed', to_date('16-03-1989', 'dd-mm-yyyy'), 1014559);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41091978, 'in stock', to_date('01-12-1999', 'dd-mm-yyyy'), 6374588);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (98587822, 'in stock', to_date('07-04-2021', 'dd-mm-yyyy'), 3969700);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (9466750, 'in stock', to_date('15-02-1990', 'dd-mm-yyyy'), 4215250);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (31093836, 'in stock', to_date('14-09-2005', 'dd-mm-yyyy'), 8082648);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (79667060, 'borrowed', to_date('13-07-1993', 'dd-mm-yyyy'), 9193770);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (49928121, 'borrowed', to_date('29-02-1992', 'dd-mm-yyyy'), 5994660);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (6143453, 'borrowed', to_date('23-06-2018', 'dd-mm-yyyy'), 9842814);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (19548277, 'borrowed', to_date('11-05-2002', 'dd-mm-yyyy'), 2275437);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (29923855, 'borrowed', to_date('23-11-2004', 'dd-mm-yyyy'), 1530038);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (29190421, 'in stock', to_date('01-05-2009', 'dd-mm-yyyy'), 9728352);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87863576, 'in stock', to_date('12-11-2019', 'dd-mm-yyyy'), 9897142);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37137707, 'borrowed', to_date('24-09-1987', 'dd-mm-yyyy'), 6590151);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71200328, 'borrowed', to_date('13-08-2013', 'dd-mm-yyyy'), 1500536);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (23179579, 'in stock', to_date('18-10-2009', 'dd-mm-yyyy'), 5501427);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53296988, 'in stock', to_date('20-08-2012', 'dd-mm-yyyy'), 4372381);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (51621308, 'borrowed', to_date('30-11-2020', 'dd-mm-yyyy'), 5751110);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (19891622, 'borrowed', to_date('11-05-2022', 'dd-mm-yyyy'), 2444885);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40560918, 'borrowed', to_date('20-06-2019', 'dd-mm-yyyy'), 3063581);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87095782, 'borrowed', to_date('13-04-2003', 'dd-mm-yyyy'), 8959453);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83623843, 'borrowed', to_date('20-07-2000', 'dd-mm-yyyy'), 9422997);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (58090961, 'borrowed', to_date('28-06-2013', 'dd-mm-yyyy'), 7314170);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (23985017, 'borrowed', to_date('29-08-2014', 'dd-mm-yyyy'), 1864586);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43624780, 'borrowed', to_date('17-11-2019', 'dd-mm-yyyy'), 3499215);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (27593385, 'in stock', to_date('10-10-1992', 'dd-mm-yyyy'), 5229102);
commit;
prompt 200 records committed...
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21267917, 'in stock', to_date('28-08-1992', 'dd-mm-yyyy'), 8332109);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74588476, 'in stock', to_date('19-08-2011', 'dd-mm-yyyy'), 3043425);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22943751, 'in stock', to_date('23-04-1995', 'dd-mm-yyyy'), 1514032);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67105955, 'in stock', to_date('26-09-2008', 'dd-mm-yyyy'), 8135497);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (12268105, 'in stock', to_date('19-05-2007', 'dd-mm-yyyy'), 1840174);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21292032, 'borrowed', to_date('03-10-2019', 'dd-mm-yyyy'), 1165966);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17909076, 'in stock', to_date('20-04-2013', 'dd-mm-yyyy'), 6387386);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (79926834, 'in stock', to_date('27-04-1992', 'dd-mm-yyyy'), 9204702);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74399780, 'in stock', to_date('29-10-1998', 'dd-mm-yyyy'), 4197591);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (10697719, 'borrowed', to_date('05-12-2023', 'dd-mm-yyyy'), 2298339);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (25715986, 'in stock', to_date('14-06-2000', 'dd-mm-yyyy'), 1811902);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70519220, 'borrowed', to_date('07-09-1988', 'dd-mm-yyyy'), 6462752);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (3166800, 'borrowed', to_date('16-11-1994', 'dd-mm-yyyy'), 1708426);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (34061957, 'in stock', to_date('23-11-2011', 'dd-mm-yyyy'), 9724432);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (93021426, 'in stock', to_date('07-05-1997', 'dd-mm-yyyy'), 4462241);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96314426, 'in stock', to_date('28-03-1994', 'dd-mm-yyyy'), 3731725);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71773882, 'borrowed', to_date('03-08-2002', 'dd-mm-yyyy'), 4712013);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53808252, 'in stock', to_date('18-01-1992', 'dd-mm-yyyy'), 7574038);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (28466687, 'borrowed', to_date('05-12-1991', 'dd-mm-yyyy'), 8769990);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (31351341, 'borrowed', to_date('12-09-1998', 'dd-mm-yyyy'), 8072861);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21947395, 'borrowed', to_date('19-03-2008', 'dd-mm-yyyy'), 3076515);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83138981, 'borrowed', to_date('21-05-1997', 'dd-mm-yyyy'), 4259544);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21588617, 'in stock', to_date('05-03-1988', 'dd-mm-yyyy'), 1421886);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41648914, 'in stock', to_date('03-11-2019', 'dd-mm-yyyy'), 5127556);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43855175, 'borrowed', to_date('17-11-2022', 'dd-mm-yyyy'), 4797464);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15554812, 'borrowed', to_date('22-03-2001', 'dd-mm-yyyy'), 7132241);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (94037058, 'borrowed', to_date('22-04-1993', 'dd-mm-yyyy'), 6207794);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59875291, 'in stock', to_date('24-07-2021', 'dd-mm-yyyy'), 2275437);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42327625, 'in stock', to_date('14-01-2002', 'dd-mm-yyyy'), 8964366);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15791341, 'in stock', to_date('03-04-2000', 'dd-mm-yyyy'), 2644841);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (80266984, 'borrowed', to_date('20-07-2016', 'dd-mm-yyyy'), 9998372);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70393583, 'borrowed', to_date('27-11-2015', 'dd-mm-yyyy'), 8837780);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70813253, 'in stock', to_date('09-11-1996', 'dd-mm-yyyy'), 1899636);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75717218, 'in stock', to_date('08-09-2010', 'dd-mm-yyyy'), 3924556);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (82114496, 'borrowed', to_date('28-08-2022', 'dd-mm-yyyy'), 7661113);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (70567262, 'borrowed', to_date('20-08-2019', 'dd-mm-yyyy'), 7563661);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87813969, 'borrowed', to_date('25-08-1985', 'dd-mm-yyyy'), 9632388);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (35734233, 'borrowed', to_date('06-12-2012', 'dd-mm-yyyy'), 7961372);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (86357720, 'borrowed', to_date('02-04-1993', 'dd-mm-yyyy'), 6667347);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (14386446, 'in stock', to_date('03-01-1986', 'dd-mm-yyyy'), 9957921);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (16446159, 'borrowed', to_date('06-06-2003', 'dd-mm-yyyy'), 5837468);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22268054, 'in stock', to_date('14-08-2010', 'dd-mm-yyyy'), 1164977);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (61842526, 'borrowed', to_date('07-03-2019', 'dd-mm-yyyy'), 2940237);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (50267841, 'in stock', to_date('27-05-2002', 'dd-mm-yyyy'), 4088650);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17881982, 'borrowed', to_date('19-10-1997', 'dd-mm-yyyy'), 4493274);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (63114487, 'in stock', to_date('16-06-2019', 'dd-mm-yyyy'), 7619376);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (27449317, 'borrowed', to_date('09-12-1996', 'dd-mm-yyyy'), 5682261);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1740538, 'in stock', to_date('02-05-2014', 'dd-mm-yyyy'), 1014559);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55059546, 'borrowed', to_date('29-03-2009', 'dd-mm-yyyy'), 3524103);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22279396, 'in stock', to_date('09-08-2011', 'dd-mm-yyyy'), 2488383);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (94620934, 'in stock', to_date('07-05-1992', 'dd-mm-yyyy'), 5738584);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (29627167, 'in stock', to_date('01-08-1986', 'dd-mm-yyyy'), 4836700);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (79651839, 'borrowed', to_date('07-12-2003', 'dd-mm-yyyy'), 6585257);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (19906219, 'in stock', to_date('11-03-2011', 'dd-mm-yyyy'), 9063508);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (64653788, 'borrowed', to_date('24-07-2024', 'dd-mm-yyyy'), 8806962);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78416849, 'in stock', to_date('04-01-2022', 'dd-mm-yyyy'), 6446456);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (14991904, 'in stock', to_date('25-03-2017', 'dd-mm-yyyy'), 9047007);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (33084434, 'in stock', to_date('31-07-1986', 'dd-mm-yyyy'), 7103565);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1902692, 'in stock', to_date('24-07-1993', 'dd-mm-yyyy'), 6547119);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (94966478, 'in stock', to_date('06-09-2008', 'dd-mm-yyyy'), 7559708);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (48341590, 'borrowed', to_date('18-12-1995', 'dd-mm-yyyy'), 1209671);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (83059394, 'borrowed', to_date('07-01-1995', 'dd-mm-yyyy'), 4483405);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68811288, 'in stock', to_date('01-04-2004', 'dd-mm-yyyy'), 6170735);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22163042, 'borrowed', to_date('13-12-2015', 'dd-mm-yyyy'), 1530038);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (9637204, 'borrowed', to_date('11-08-2017', 'dd-mm-yyyy'), 2283609);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1662939, 'in stock', to_date('18-04-2005', 'dd-mm-yyyy'), 9193770);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (72919359, 'in stock', to_date('08-04-1990', 'dd-mm-yyyy'), 1142765);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75850726, 'in stock', to_date('01-02-1990', 'dd-mm-yyyy'), 5728167);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (20387799, 'borrowed', to_date('16-07-2014', 'dd-mm-yyyy'), 5873270);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (16706345, 'in stock', to_date('15-01-1994', 'dd-mm-yyyy'), 5804934);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90661528, 'in stock', to_date('07-09-1990', 'dd-mm-yyyy'), 3405026);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (81101834, 'borrowed', to_date('26-02-1990', 'dd-mm-yyyy'), 7616550);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (4496365, 'borrowed', to_date('26-05-2021', 'dd-mm-yyyy'), 7699468);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (32011479, 'in stock', to_date('06-04-2001', 'dd-mm-yyyy'), 5730581);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (93604894, 'borrowed', to_date('14-08-2002', 'dd-mm-yyyy'), 8281102);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (56874685, 'borrowed', to_date('21-08-2014', 'dd-mm-yyyy'), 1222369);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (7642324, 'in stock', to_date('22-10-2013', 'dd-mm-yyyy'), 8736964);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74392162, 'in stock', to_date('15-10-2000', 'dd-mm-yyyy'), 3895521);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (32213797, 'borrowed', to_date('05-01-2023', 'dd-mm-yyyy'), 7215461);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22390754, 'in stock', to_date('27-07-1999', 'dd-mm-yyyy'), 6092727);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (45997421, 'borrowed', to_date('10-06-2016', 'dd-mm-yyyy'), 2824103);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (50517239, 'borrowed', to_date('17-03-2011', 'dd-mm-yyyy'), 3774951);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2619575, 'borrowed', to_date('06-08-2022', 'dd-mm-yyyy'), 7418161);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17354142, 'borrowed', to_date('13-09-2018', 'dd-mm-yyyy'), 1082305);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (33437752, 'in stock', to_date('05-09-2008', 'dd-mm-yyyy'), 8880277);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (27759904, 'in stock', to_date('05-12-2002', 'dd-mm-yyyy'), 3874130);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87818618, 'borrowed', to_date('23-03-2005', 'dd-mm-yyyy'), 8950643);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (97085824, 'in stock', to_date('20-05-2006', 'dd-mm-yyyy'), 5814521);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59732985, 'borrowed', to_date('26-11-2005', 'dd-mm-yyyy'), 4595656);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (89314101, 'in stock', to_date('09-01-2007', 'dd-mm-yyyy'), 3793596);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (4173030, 'in stock', to_date('03-09-1995', 'dd-mm-yyyy'), 6789049);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (84573230, 'borrowed', to_date('03-10-2013', 'dd-mm-yyyy'), 3932967);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99443288, 'borrowed', to_date('03-08-2024', 'dd-mm-yyyy'), 4379844);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2463640, 'borrowed', to_date('11-06-2001', 'dd-mm-yyyy'), 2036669);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (58290870, 'in stock', to_date('17-01-2009', 'dd-mm-yyyy'), 8518024);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (8670044, 'in stock', to_date('20-11-2018', 'dd-mm-yyyy'), 4178382);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65179863, 'borrowed', to_date('24-04-2009', 'dd-mm-yyyy'), 8908416);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57094124, 'borrowed', to_date('25-03-2000', 'dd-mm-yyyy'), 8428897);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15681622, 'borrowed', to_date('04-12-2024', 'dd-mm-yyyy'), 3960643);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (12476428, 'borrowed', to_date('23-06-2001', 'dd-mm-yyyy'), 4873126);
commit;
prompt 300 records committed...
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57638300, 'in stock', to_date('11-10-2009', 'dd-mm-yyyy'), 9632388);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21136033, 'borrowed', to_date('15-05-2021', 'dd-mm-yyyy'), 6966092);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15256516, 'borrowed', to_date('03-05-1999', 'dd-mm-yyyy'), 3016170);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (41047095, 'borrowed', to_date('09-10-2002', 'dd-mm-yyyy'), 1943848);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (69965696, 'in stock', to_date('19-01-1986', 'dd-mm-yyyy'), 3932967);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (5308905, 'borrowed', to_date('30-11-2018', 'dd-mm-yyyy'), 6636907);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67633881, 'borrowed', to_date('16-09-1997', 'dd-mm-yyyy'), 5229102);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42251687, 'in stock', to_date('16-04-2021', 'dd-mm-yyyy'), 4197591);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (49215656, 'borrowed', to_date('15-01-1990', 'dd-mm-yyyy'), 6227536);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (92391039, 'in stock', to_date('20-12-1994', 'dd-mm-yyyy'), 6387386);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (14328896, 'in stock', to_date('17-12-2021', 'dd-mm-yyyy'), 8897160);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (33074524, 'in stock', to_date('25-12-2004', 'dd-mm-yyyy'), 9620915);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (13881294, 'in stock', to_date('26-05-2001', 'dd-mm-yyyy'), 9998372);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (24183371, 'borrowed', to_date('12-03-1997', 'dd-mm-yyyy'), 9884767);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (46879498, 'in stock', to_date('07-10-1994', 'dd-mm-yyyy'), 2228164);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37689605, 'borrowed', to_date('25-06-2010', 'dd-mm-yyyy'), 2226566);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (64489011, 'in stock', to_date('30-12-1985', 'dd-mm-yyyy'), 1572315);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57334608, 'in stock', to_date('14-06-1997', 'dd-mm-yyyy'), 7204674);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (60747338, 'in stock', to_date('16-03-2014', 'dd-mm-yyyy'), 3659138);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74104045, 'in stock', to_date('12-01-2010', 'dd-mm-yyyy'), 9838042);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (91089543, 'borrowed', to_date('06-01-1995', 'dd-mm-yyyy'), 3043425);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (51360977, 'borrowed', to_date('05-03-2017', 'dd-mm-yyyy'), 8950643);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99129066, 'in stock', to_date('19-11-2001', 'dd-mm-yyyy'), 6243823);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (8405405, 'in stock', to_date('30-09-1996', 'dd-mm-yyyy'), 9897142);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (38617700, 'in stock', to_date('11-11-2012', 'dd-mm-yyyy'), 2298339);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96973354, 'in stock', to_date('04-03-1995', 'dd-mm-yyyy'), 5460290);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74076799, 'borrowed', to_date('25-08-1997', 'dd-mm-yyyy'), 3874130);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (74391843, 'in stock', to_date('28-10-2008', 'dd-mm-yyyy'), 8835831);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (5412787, 'in stock', to_date('26-12-1991', 'dd-mm-yyyy'), 5288876);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96560365, 'in stock', to_date('21-05-2023', 'dd-mm-yyyy'), 6517077);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78523810, 'borrowed', to_date('14-01-2004', 'dd-mm-yyyy'), 9180863);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68393642, 'in stock', to_date('17-04-2023', 'dd-mm-yyyy'), 7819907);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (69640497, 'borrowed', to_date('19-09-2002', 'dd-mm-yyyy'), 7507529);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (46182210, 'in stock', to_date('30-04-1986', 'dd-mm-yyyy'), 7870637);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (82847887, 'borrowed', to_date('25-07-2013', 'dd-mm-yyyy'), 5411804);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (58362339, 'in stock', to_date('01-01-2000', 'dd-mm-yyyy'), 2986035);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (28507997, 'in stock', to_date('24-04-1996', 'dd-mm-yyyy'), 2381912);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (21454817, 'borrowed', to_date('30-09-2009', 'dd-mm-yyyy'), 8149179);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (53511810, 'in stock', to_date('06-01-2022', 'dd-mm-yyyy'), 9180863);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37533099, 'borrowed', to_date('24-05-2006', 'dd-mm-yyyy'), 4531615);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (77468948, 'borrowed', to_date('01-04-2009', 'dd-mm-yyyy'), 5229480);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (4698820, 'borrowed', to_date('07-03-2014', 'dd-mm-yyyy'), 3976724);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37796059, 'borrowed', to_date('19-10-2000', 'dd-mm-yyyy'), 6270618);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (3909708, 'borrowed', to_date('02-10-2003', 'dd-mm-yyyy'), 9693371);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15979356, 'in stock', to_date('14-12-2006', 'dd-mm-yyyy'), 6593829);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (51766841, 'borrowed', to_date('09-01-1999', 'dd-mm-yyyy'), 1619879);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99907588, 'borrowed', to_date('30-07-2011', 'dd-mm-yyyy'), 3076515);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (27838579, 'borrowed', to_date('27-06-2005', 'dd-mm-yyyy'), 4595656);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (7888860, 'borrowed', to_date('19-01-2015', 'dd-mm-yyyy'), 6949845);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (145730, 'borrowed', to_date('24-09-2012', 'dd-mm-yyyy'), 5709144);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40756739, 'in stock', to_date('07-03-2016', 'dd-mm-yyyy'), 2432192);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (23384614, 'in stock', to_date('26-02-2008', 'dd-mm-yyyy'), 9079481);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (18857628, 'in stock', to_date('24-04-1996', 'dd-mm-yyyy'), 5501427);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (6191092, 'borrowed', to_date('08-10-2014', 'dd-mm-yyyy'), 4857798);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40056023, 'in stock', to_date('29-01-1985', 'dd-mm-yyyy'), 6396129);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78268965, 'in stock', to_date('01-10-1985', 'dd-mm-yyyy'), 4595656);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37369809, 'in stock', to_date('10-05-2021', 'dd-mm-yyyy'), 6374588);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (86212977, 'in stock', to_date('12-12-2004', 'dd-mm-yyyy'), 2952210);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (46079797, 'in stock', to_date('22-05-1997', 'dd-mm-yyyy'), 9728352);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55667923, 'in stock', to_date('30-12-2007', 'dd-mm-yyyy'), 6270618);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17414774, 'in stock', to_date('14-04-2011', 'dd-mm-yyyy'), 2929209);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (4827052, 'borrowed', to_date('12-10-2005', 'dd-mm-yyyy'), 8082648);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (79282030, 'in stock', to_date('19-08-1995', 'dd-mm-yyyy'), 1111970);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (80920204, 'in stock', to_date('28-02-1993', 'dd-mm-yyyy'), 8950643);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (10239107, 'borrowed', to_date('01-05-2020', 'dd-mm-yyyy'), 8837780);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (94824637, 'borrowed', to_date('15-06-2013', 'dd-mm-yyyy'), 5730581);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15839152, 'borrowed', to_date('11-05-1988', 'dd-mm-yyyy'), 1500536);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22295854, 'in stock', to_date('06-02-2016', 'dd-mm-yyyy'), 5201833);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57049340, 'borrowed', to_date('26-09-1996', 'dd-mm-yyyy'), 1165966);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (75507852, 'borrowed', to_date('24-01-2003', 'dd-mm-yyyy'), 8129608);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (2625600, 'borrowed', to_date('22-09-2023', 'dd-mm-yyyy'), 4516818);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (10649712, 'in stock', to_date('05-02-2022', 'dd-mm-yyyy'), 8093395);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65612068, 'borrowed', to_date('28-10-2009', 'dd-mm-yyyy'), 5260106);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (93910660, 'in stock', to_date('29-09-2003', 'dd-mm-yyyy'), 7351735);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96563959, 'in stock', to_date('05-03-1987', 'dd-mm-yyyy'), 8579230);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (73445940, 'in stock', to_date('01-03-2007', 'dd-mm-yyyy'), 1924330);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68466120, 'borrowed', to_date('24-07-2021', 'dd-mm-yyyy'), 3932967);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (40735783, 'in stock', to_date('10-04-1989', 'dd-mm-yyyy'), 3663829);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (68274023, 'borrowed', to_date('16-05-2006', 'dd-mm-yyyy'), 3663829);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (63078009, 'in stock', to_date('28-05-2015', 'dd-mm-yyyy'), 4146797);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (1776517, 'borrowed', to_date('18-08-2010', 'dd-mm-yyyy'), 7103565);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (44280940, 'borrowed', to_date('14-11-2019', 'dd-mm-yyyy'), 3256677);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (56886615, 'borrowed', to_date('12-06-2016', 'dd-mm-yyyy'), 8880277);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (19836249, 'in stock', to_date('28-01-1994', 'dd-mm-yyyy'), 7238022);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (15370271, 'in stock', to_date('28-02-1987', 'dd-mm-yyyy'), 1111970);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (56690054, 'borrowed', to_date('01-09-2000', 'dd-mm-yyyy'), 1169698);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (36898823, 'borrowed', to_date('03-10-2008', 'dd-mm-yyyy'), 3976724);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96669393, 'borrowed', to_date('22-12-1996', 'dd-mm-yyyy'), 7204674);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37551947, 'borrowed', to_date('07-04-2006', 'dd-mm-yyyy'), 8450772);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (43569936, 'borrowed', to_date('28-08-1992', 'dd-mm-yyyy'), 6568911);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (99230107, 'in stock', to_date('19-03-2016', 'dd-mm-yyyy'), 5215328);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87327169, 'in stock', to_date('02-10-1996', 'dd-mm-yyyy'), 1943848);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (11760367, 'borrowed', to_date('23-06-2018', 'dd-mm-yyyy'), 6462752);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (56016430, 'in stock', to_date('25-07-2021', 'dd-mm-yyyy'), 7661113);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (57887716, 'borrowed', to_date('15-05-2018', 'dd-mm-yyyy'), 5730360);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78424455, 'borrowed', to_date('29-10-2016', 'dd-mm-yyyy'), 2376389);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (10115562, 'borrowed', to_date('25-03-2005', 'dd-mm-yyyy'), 8593082);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (959308, 'borrowed', to_date('29-05-2020', 'dd-mm-yyyy'), 7465506);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (76114067, 'borrowed', to_date('30-04-1999', 'dd-mm-yyyy'), 9984657);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17667474, 'in stock', to_date('17-06-2023', 'dd-mm-yyyy'), 5730581);
commit;
prompt 400 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jarvis Saxon', 94772454, '055-3671110', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Corey Chestnut', 514935755, '058-1546229', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cole Scott', 75913192, '055-3370984', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ice Lonsdale', 167601443, '051-2582959', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rutger Jeter', 440380246, '050-1421733', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ben Griffith', 905880078, '056-6371979', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cherry Moody', 679569190, '053-3485381', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Fionnula Hayek', 667870421, '058-8271276', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Angela Belles', 313351240, '054-1052375', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lea Palmer', 437040180, '054-2960584', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gene Sharp', 153043622, '058-9326085', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Glenn Cruz', 55247198, '058-9848746', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gordie Soda', 418533018, '050-4868417', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Bradley Shepherd', 159397170, '055-4775282', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jim Ribisi', 801617705, '054-8888521', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Spike Lipnicki', 857340698, '055-4180303', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Manu Bale', 306726335, '059-0704676', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jena Vince', 564890327, '052-5587129', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Collin Lange', 380302839, '054-3842549', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Bobby Driver', 6601843, '056-5240477', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mena Bandy', 208174923, '058-0598940', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Renee Holmes', 921457925, '056-3151246', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gordon Rowlands', 697511693, '059-7713252', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debby McCain', 372535135, '057-9380611', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kitty Hobson', 639954227, '050-3557331', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Wayne Walsh', 611182719, '055-3411586', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Brenda Weaver', 963334548, '056-9428753', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Raymond Sylvian', 57495060, '055-1270400', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rachael Robinson', 525161276, '052-8539275', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nora Haggard', 291567036, '055-7081361', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Annette Tomlin', 71042379, '051-5587120', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Morgan Pryce', 721436189, '056-3138073', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jean-Claude Ricci', 30847668, '056-9223430', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nick Palmieri', 695448905, '058-6835415', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lauren Applegate', 16882160, '054-1341486', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jonathan Rankin', 91525539, '055-1627795', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jarvis White', 995180343, '055-4563858', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sean Tate', 120860299, '052-5046380', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rosco Birch', 426713740, '054-4083255', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kathy McDonnell', 147255716, '053-8668143', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Madeleine Stiers', 460669398, '050-7667746', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kathy Beatty', 977868232, '052-0154143', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Clarence Dafoe', 124466561, '050-2847477', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Candice Tomei', 557946746, '052-8295397', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('William Roberts', 838963088, '058-2335051', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lenny Camp', 70946112, '052-6809389', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chaka Swinton', 992433442, '053-8754745', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ruth Detmer', 699483958, '058-6540877', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Vin Quinones', 555179349, '052-3529570', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nathan Waite', 838498962, '058-8984204', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Patty Rizzo', 350867603, '059-2349614', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lea Wariner', 92152364, '053-9275172', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jet Lineback', 80022009, '054-8473850', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Leslie Cocker', 576631155, '052-1443997', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lupe Perez', 970471522, '054-4141859', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Night Crudup', 956626456, '055-1409607', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Blair Lynne', 282106770, '058-5310854', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Vertical Cornell', 201726200, '053-9121722', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Christina Mitra', 995459581, '052-2941186', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Julio Stevens', 477380247, '050-2881857', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jean-Luc Rodriguez', 978368209, '055-3717689', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Alana Boone', 535955532, '050-0042995', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tea Lithgow', 647512176, '054-6554825', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Angie Keitel', 778676368, '052-0506995', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chris Phillippe', 326756634, '058-7067130', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Heath Magnuson', 28090014, '056-8771835', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Juliette Heald', 211972209, '056-2803034', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Linda Caine', 941367064, '056-5896285', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debbie Dysart', 245149638, '057-1623853', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Javon Stiller', 242825608, '052-0981788', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Victor Cale', 503044571, '050-9578465', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Melanie Kattan', 6530800, '052-9578056', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ann Saxon', 832414450, '051-2817971', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Javon Rydell', 806412391, '051-7953443', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tilda Jackson', 747645391, '054-7294883', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Emily Miller', 39121462, '050-8547690', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Omar Weisz', 578001438, '053-1879046', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pamela Lauper', 96954562, '053-3865160', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rachid Trejo', 743616054, '051-4470244', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('David Boothe', 236413817, '057-6199357', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Davey Numan', 602134711, '058-4634869', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Vivica McAnally', 841610087, '052-3365779', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rich Saucedo', 452175112, '055-8121007', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Amanda Porter', 342691816, '053-3397737', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kate Aiken', 506489909, '051-4796793', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Denny Tankard', 658599356, '054-8552014', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Johnny Beck', 893473441, '055-3484015', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gordon O''Connor', 809810518, '057-1506980', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rob Dupree', 530557177, '058-4542617', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Dwight Margolyes', 122906694, '058-2416118', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Liam Damon', 82609437, '053-7610172', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Breckin Domino', 999197659, '050-3985708', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Peter Richardson', 903967705, '055-8918221', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Marty Thurman', 49645763, '058-0048028', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Halle Harris', 837922190, '052-5822886', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lee Worrell', 765451524, '050-6864708', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Liquid Sinise', 426293381, '056-3360457', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tommy Gatlin', 697632951, '053-4037691', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Seth Carradine', 535638640, '058-2625090', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mili Kinnear', 813278022, '056-3105853', 'Sunday-Thursday: between 8:00 and 16:00');
commit;
prompt 100 records committed...
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Forest Russo', 378836385, '055-1613134', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Aaron Gosdin', 310152730, '051-0422059', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tamala Johnson', 429462199, '054-2994748', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chuck Galecki', 7923661, '053-4632806', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Trace Sainte-Marie', 460820324, '052-1050923', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Andrew Janney', 818411449, '053-6418505', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jean-Luc Phillippe', 756146155, '057-3137589', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rob Cantrell', 706565361, '055-8079168', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Merillee Soul', 572346453, '056-9372867', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rutger Austin', 367224956, '053-8281284', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Merillee Levy', 872139325, '051-8860858', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joshua Greene', 58645243, '052-7478823', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tramaine Rankin', 380924269, '051-5497797', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Wayne Head', 396086390, '055-4681626', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Clint Rourke', 649663400, '050-6058801', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joseph Gugino', 283092402, '059-5682789', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Stevie Twilley', 122914099, '050-8339466', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Aidan Nielsen', 485215833, '058-7016383', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Franz Logue', 645218925, '055-4765730', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Maury Dorff', 575537162, '059-2221541', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Eliza Larter', 206031166, '056-4399962', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Luke Napolitano', 67462170, '052-5269969', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cathy Vai', 998158247, '057-0115183', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kristin Sirtis', 590709480, '058-4866498', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rick Cobbs', 907657057, '053-3922508', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Randall Tennison', 961930055, '052-7617406', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Praga Chung', 950081028, '050-3536890', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Morris Mellencamp', 252198537, '057-5881602', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ed Brooks', 62572520, '054-3499133', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Betty McAnally', 94803718, '050-9864905', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joy Hector', 813006444, '058-8286639', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nik Moffat', 724031814, '050-3829025', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Radney Wayans', 640850868, '059-5232487', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rebeka Herndon', 953834830, '055-7066823', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Wendy Reilly', 585570271, '059-3366893', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lennie Kinski', 510142746, '054-6789364', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sophie Ricci', 786920820, '059-8540932', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Andrae McAnally', 885616474, '058-6311612', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kirk Close', 97106895, '056-6035947', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Merillee Diesel', 584321723, '051-6776238', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ryan Stills', 30555406, '057-7553211', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Beth Reynolds', 201234528, '059-1473487', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carole Harnes', 579812763, '056-3246576', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Bobbi Harrison', 616408884, '050-2216265', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pamela Torino', 310574622, '058-3153213', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jeffery Warwick', 77356053, '058-7725288', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Patrick Sutherland', 778607716, '052-5417659', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Selma Pigott-Smith', 611415434, '057-3534553', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Neil Perez', 837904541, '050-1912335', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Bradley Landau', 326084240, '051-7333532', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joely Sedgwick', 727798681, '057-1018841', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Woody Farina', 433082953, '051-6115558', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Betty Cornell', 21761746, '058-0127641', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Morgan Westerberg', 809943420, '055-7431377', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nikki Vanian', 767454043, '050-9823484', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Radney Ingram', 214159641, '059-1529451', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mika Hiatt', 947006629, '059-6561106', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Miguel Caan', 530917933, '051-3257619', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jackie Lithgow', 386601355, '058-4509888', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Stellan Mifune', 800215934, '052-1087357', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robby Holden', 667727188, '058-2699618', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kieran Simpson', 13233375, '058-8845160', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Colleen Harnes', 9644622, '054-8063326', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mint Glover', 680698654, '051-4043326', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Natacha Cronin', 29759431, '050-2292391', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Wang Berenger', 118267504, '051-2021865', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lara Payne', 171177123, '056-5825740', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Drew De Almeida', 85403893, '055-8460729', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jesus Neeson', 403748797, '055-9645040', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carrie Ranger', 601656458, '059-0616998', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Anna Akins', 623999640, '058-2596332', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rade Rossellini', 479361783, '051-0952334', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Holland Jessee', 27119851, '055-4304695', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mili Rains', 955076093, '057-2840428', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lara Conroy', 354357944, '058-2553936', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kasey Johansson', 550480108, '052-5153554', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cledus Brown', 326015810, '052-1268351', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Annie Santana', 856251055, '054-8749748', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('France Farina', 793432892, '058-0978547', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ceili Loeb', 550535005, '058-6938683', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Aidan Rickles', 897129821, '051-2427127', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Night Koyana', 498002894, '059-0739320', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Drew McCain', 648714096, '053-4356069', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tal Blair', 233983651, '052-8907703', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robert Diehl', 407680747, '056-6072094', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debbie Brock', 243170713, '059-1176654', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carrie-Anne Himmelma', 143641086, '050-1524449', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rachel Squier', 158139735, '057-4240204', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Janeane Van Der Beek', 191493666, '052-9625522', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Junior Moffat', 285869832, '050-8285683', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mira Condition', 545583789, '050-8154578', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Marty Francis', 981129682, '054-5313954', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Richard Pollack', 53772964, '052-3326845', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Walter O''Keefe', 538672711, '059-9244270', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rosanna Downey', 68607357, '052-8827423', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Katie Kier', 505023644, '053-4072191', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chloe Walken', 802032568, '057-1685459', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Roberta Hayek', 335445396, '054-4015835', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Taryn Wariner', 695176722, '059-0378208', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pamela Stills', 184324760, '053-5323852', 'Wednesday: between 10:00 and 12:00');
commit;
prompt 200 records committed...
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Dennis Green', 152318024, '058-7680199', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Anita Kleinenberg', 850062270, '057-6374745', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rosanne Holden', 499853553, '051-1279018', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Caroline Loggins', 586367613, '059-9883992', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Hikaru Archer', 901694862, '050-0427885', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robin Arnold', 759846707, '053-4828974', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debra McGregor', 496545465, '050-5705157', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Coley Stoltz', 352927052, '055-0950778', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Scott DiCaprio', 828464731, '059-4879360', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kimberly Kweller', 527539278, '052-2407318', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nina Conners', 447216171, '055-0029027', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Elijah Nolte', 18493438, '057-3270584', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Taylor MacNeil', 289948301, '053-0576317', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ashley Osmond', 131553339, '058-7722424', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Andrae Leachman', 698086866, '055-7803201', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Roger Torino', 358658902, '050-1447266', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ann Meyer', 387903977, '058-8601064', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tobey McDonnell', 960502820, '055-5175904', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debra Luongo', 182188298, '055-2586442', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joy Thornton', 128882876, '054-1203381', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Clarence Chesnutt', 634697560, '052-0917563', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kasey Jones', 43791288, '054-4138896', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Shelby Roundtree', 726519706, '057-8125789', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gran Atkinson', 254337249, '052-2209472', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rod Utada', 851760809, '051-2737865', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chely Midler', 231650707, '053-7711656', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Davis Cruise', 724341650, '050-6075115', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cliff Sanchez', 596197988, '050-1880966', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Edgar Mould', 156358422, '059-2022260', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Juan Jay', 631644533, '052-6255470', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jane Dalley', 557367484, '059-1076105', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jill Price', 378113125, '058-0399532', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ron Spacey', 566743359, '050-8742640', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joshua Green', 324702801, '052-9467175', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ned Marin', 240233766, '052-7562468', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Natalie Folds', 843572655, '059-1564657', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Teena Affleck', 769691914, '053-4623187', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Orlando Pacino', 941720185, '053-6915674', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kenny Fogerty', 306296821, '054-5045759', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lucy Ward', 472328295, '057-9126710', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gordie Drive', 558762014, '054-7442173', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Liv McDonnell', 783732680, '054-7779291', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robbie Purefoy', 886405503, '051-1329485', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Debi Stowe', 99081825, '057-0453603', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Julia Kristofferson', 281168236, '056-4168692', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Goran Burrows', 782521980, '053-9820571', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carl Elliott', 285406677, '057-1513288', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Crystal Bryson', 338495564, '054-8254817', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Harris Curtis', 183564255, '057-9960891', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kiefer Yulin', 845079750, '054-4471438', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rupert Lawrence', 639229749, '052-0587836', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sonny Gryner', 430999055, '055-0712128', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Yolanda Laws', 736197677, '059-9227504', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Spike Patillo', 463979625, '051-0203176', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('George Arkin', 529419902, '053-6737419', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Leon Barry', 62176464, '054-6503792', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jerry Winslet', 695794500, '059-2278729', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rachel DiBiasio', 927827533, '051-8319491', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Darren Hershey', 52113672, '056-0156057', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Merrill Caldwell', 678963997, '054-4872165', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Bonnie Paquin', 148205489, '058-5293310', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Danni Esposito', 465969758, '059-8368458', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('James Clark', 137552876, '059-9923250', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sharon Bragg', 226396725, '059-4828051', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rhett Barnett', 256087782, '057-5456314', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Charlton Vaughn', 818298231, '055-5640482', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Karen Nash', 930397220, '058-9134837', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jackson Tucker', 343768982, '054-4279634', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Arturo Sinise', 578768369, '052-6703489', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Marlon Rea', 859011853, '053-9439384', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pete Aaron', 581213711, '052-4486641', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Corey Witt', 472299464, '059-5632548', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Edwin Botti', 130124668, '051-4113952', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Terry Navarro', 218589282, '051-7610700', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Isaiah Capshaw', 765334130, '054-1466073', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Udo Addy', 610153570, '052-8943465', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Roy Alexander', 960039000, '050-5906560', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robin Spall', 380213374, '052-6440341', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Selma Mars', 790675836, '059-9499927', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kay Weisberg', 653930286, '053-2000647', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Henry Wills', 616585390, '058-4504528', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nickel Stills', 670121454, '058-3857540', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rich Koteas', 557121653, '058-2107886', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Terry Berkeley', 909505686, '053-0754159', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Wayman Howard', 462461270, '054-6476132', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sammy Graham', 673618469, '057-8109201', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jake McBride', 143065974, '059-4912309', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Miriam Palmieri', 94146004, '059-9847794', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Elvis Schneider', 186729997, '053-0096640', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kenneth Broza', 367113889, '055-7932919', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Maxine Balaban', 887258465, '057-5879201', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sona D''Onofrio', 849293865, '051-0024325', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Olga Lipnicki', 955153001, '052-9110404', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Courtney Watley', 65784378, '053-0542415', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Denzel Katt', 855541615, '052-6164464', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jeffrey Dunaway', 271472128, '053-4731189', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pam Stewart', 945254852, '054-5879464', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ramsey Reno', 194289440, '058-0092778', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ben Secada', 405589276, '058-3554519', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Edgar Clarkson', 104798728, '059-8013669', 'Sunday-Thursday: between 8:00 and 16:00');
commit;
prompt 300 records committed...
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tamala Warden', 605493473, '059-5767186', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Night Evanswood', 622885155, '050-5906553', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Earl Gill', 333486729, '057-5063731', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jennifer Everett', 811868236, '057-3906044', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Clarence Newton', 285583312, '055-0358717', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ed Crowe', 996629835, '055-9080037', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gwyneth Luongo', 117289194, '050-6920267', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('James Sirtis', 996860585, '056-3756393', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ali Lovitz', 592350877, '055-3980616', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Max Weisz', 454903735, '050-9990579', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Loretta Belles', 543595210, '055-2685149', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Darren Rowlands', 965481634, '055-7404525', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Miki Sinise', 529901232, '057-8490195', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Collective Rodriguez', 250798833, '056-9375253', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tony Northam', 772320969, '051-6724875', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Lila Santa Rosa', 741699972, '052-9513791', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Darren Gaynor', 809177633, '056-0256064', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Malcolm Logue', 913882055, '057-9163818', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jerry Carrey', 178298318, '059-5894367', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Claire de Lancie', 781661616, '056-5879468', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sylvester Gere', 75859989, '057-9555697', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carlos Reno', 257168846, '056-0610202', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gena Ermey', 974033150, '050-9693152', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rosario Yorn', 123060604, '053-9730969', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Dianne McGriff', 654789354, '052-4584911', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mika Leguizamo', 659914838, '050-5324321', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Danni Schock', 100146275, '050-6622563', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Maureen Mahoney', 903768161, '050-0685815', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Dermot Donovan', 266577657, '055-0457020', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Anna Hamilton', 66405309, '053-9458366', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Dick Eckhart', 718066745, '059-7210957', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cuba Sinatra', 141634264, '056-9362987', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kyra Rizzo', 28266639, '053-1118865', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Curt Gore', 797347517, '050-4825158', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Herbie Astin', 51436444, '051-8799869', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rik Clayton', 162742550, '052-5879297', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mika Street', 525173186, '051-0404720', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Fred Shelton', 518803639, '057-8863296', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Keanu Cleese', 808488536, '057-4178229', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Loretta Cox', 834094272, '052-5065835', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Charlie Laws', 245698211, '051-6712537', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ani Koteas', 152785808, '053-0706924', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Maxine Humphrey', 113966335, '058-2195651', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rachel Stormare', 635456467, '059-6115441', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rhett Preston', 215935668, '058-6264755', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Murray Douglas', 258210957, '052-8907849', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Brian Creek', 147082830, '058-7927269', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rebecca Hackman', 862937924, '055-5293499', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Randy Osmond', 236715300, '054-1568777', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Heath Dunaway', 529976129, '058-4681685', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Phil Greenwood', 823688721, '054-0497312', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kay Zappacosta', 625051968, '053-7221975', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Suzanne Latifah', 967126394, '055-3003794', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Fairuza Reed', 489421374, '056-4138682', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Casey Fraser', 476794708, '054-0096154', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jimmie Chilton', 626326818, '055-9086234', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Peabo Frost', 413572810, '058-0297645', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Robby Almond', 586825663, '054-2212643', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ming-Na Strathairn', 382058355, '055-8420478', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Taylor Edmunds', 773891413, '058-8113020', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Stephen Candy', 839770827, '057-6447143', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Nastassja Goodman', 397516807, '059-8910459', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Selma Cozier', 704174790, '057-8882436', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Cledus Rhodes', 461458624, '059-7130112', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Anne Preston', 922744091, '054-4945122', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Fionnula Alda', 294682564, '059-7422727', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Joe Preston', 245255480, '057-8718833', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ozzy Tinsley', 974340983, '051-6892188', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Franco Pitney', 693918677, '055-8615812', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rene Bogguss', 860651444, '057-0110599', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Molly Clinton', 782295397, '053-2890524', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Jackie Squier', 449609844, '055-2165415', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ewan Gill', 6324486, '057-4283729', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Derek Kinney', 701955008, '059-8377164', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gin Green', 829600667, '059-3063384', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Mary-Louise Lynch', 212462423, '053-2964487', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Gloria Marin', 614511329, '056-2073459', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Tal Stiers', 466637605, '055-5507541', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Carlos Everett', 638553307, '057-4364320', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kenneth McFadden', 168578057, '057-8160666', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pete Spector', 718863475, '050-8112766', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Hal McKennitt', 830995985, '056-3292351', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Morgan Walker', 699258680, '057-2845063', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Charlie Fender', 246923788, '050-9641005', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sander De Niro', 381665942, '053-8795211', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Peabo Nash', 726733463, '054-4557253', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sissy Garber', 38797342, '054-4647571', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Oded Lopez', 354943318, '059-8176945', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Frank Carradine', 518091844, '050-6069994', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Sara Leigh', 985710298, '054-2622208', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Vertical Giannini', 880269651, '050-7793908', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ossie Posener', 341079822, '056-9143784', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Edgar Holeman', 387197471, '053-8113977', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Isaiah Diesel', 781222035, '059-5320238', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Pete Remar', 229270562, '051-3947110', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Chrissie Pride', 188803210, '053-1682681', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Kenneth Dillane', 567516233, '051-4972665', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Demi Ferrell', 560175531, '052-5215138', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Rosanne Byrne', 293534214, '058-5154473', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('Ned Shepherd', 709087072, '054-7893687', 'Sunday-Friday: between 8:00 and 13:00');
commit;
prompt 400 records loaded
prompt Loading LIBRARIAN...
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bebe McGregor', '050-3623000', 'YvA8lms', 'rCCp6dVWD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lydia Geldof', '054-4947227', 'D1m6IOOCj', 'yiv29EPbzfr');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Caroline Danes', '051-0984295', 'hN5TC', 'ekUDekGl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eugene Parm', '050-6146938', 'JilrDWCyXsDSQq', 'dxcoo3p9B32bm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Thora Douglas', '057-0767602', 'pOqXY7TWny', 'AJP8LklRLVJ6');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cameron Burns', '050-5589584', 'W8EtgraF', '3F8MJhunz9GKf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rhett England', '054-2093893', '7TdItftw', 'sOgeL1G75l');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Fats McGowan', '059-8336627', 'Ik5XZjfg4j1D', 'LdYGsoyu');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gena Feliciano', '055-1127882', '1r2zD3TJ36K4IoHgKYYi', '5sZv4HP7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Roscoe Bosco', '057-2634285', 'A5ZxNc', 'dV8KVKVK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Luis Graham', '050-3821575', 'LTSwABp6kDsU4', 'eIXmUiKBlbH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Betty Weir', '058-5381876', 'bsVznw7Gi4Ee3H6', 'cqQWkD68');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Temuera Hunt', '054-4131198', 'ubxCv2uGgBwvM6', 'Md2yB69ea4d');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Taye Wariner', '056-8213879', 'YELni23quqVx', 'EyL5dfNd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mika Nakai', '058-5655793', 'UVeEs4uENDs', 'KWvRf020W6Ab');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Robby Seagal', '057-7760065', '9LoFe1uZNL7I6RjUH', 'bPncinvosTAzN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hookah Keith', '050-1964753', '4BDcK', 'T8DzPlsFr');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bob Saucedo', '054-8322407', 'G3RcumAWn8nihW8kvh', 'JGpWldLU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rod Plowright', '050-9473334', '14ycgxz9poTvi769l', 'zDWLCiixaJ7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rhea Ryder', '052-7292811', '0go77rhhgR', 'Z79BmwSV');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sheryl Gough', '051-5887332', 'NWfALCL', 'kxzJVYJcKj7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Murray Lyonne', '052-6993076', 'sKxX2N8GHHNMD', 'Jzja2Rr9mO9');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ruth Lang', '051-9262804', 'fnqbqk5Hc', '9RSOaC5m');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sal Winstone', '055-6119106', 'LsQJCplxgm2EQh9609', 'xPF1eANrJJ5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lynette Devine', '055-9185824', 'iwsUl4nzoOt55', 'B3cZl0akMz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Frank Beatty', '059-6934240', '4JrDRWhb9ffXP9r8ly4X', 'EpECBB6W');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eliza Tisdale', '050-5263896', 'Kp9vETCsnfg7BNE82Gi', 'wjcPmM9K6LIS');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jeff Spears', '050-4437090', 'mBsyxj', 'dIXJzTUTTtRq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Angelina Coburn', '051-1166310', 'J7j8X3448g1G', 'D2rIKvV7y');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Diane Armatrading', '053-8689638', 'NgT4v96snEAgIWk', 'reHbZiAz0');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sara Hersh', '053-2555670', 'U4HZ6wO6C4qqwmNZLZb', 'Lau8T6C2r36');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tori Walker', '058-1170996', 'eJAbxEAWAODv', 'l4ma9iUETb');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Elvis Carrere', '056-6053973', 'nsjfIMpJ1LzgJWsQH', 'PUD1cOayOOjI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Joaquin Spine', '056-7963072', 'DyXDwvO', 'l0Khl0A5aiSZ5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rebeka Paul', '057-3647281', 'tALoNOkVix2CrWkVC', 'dJFJxWuTmJaBB');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pelvic Miles', '052-3885139', 'ZMrYQByKHdXOyg', '6whcfvNGaqlbJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sandra Latifah', '057-3603695', 't8ASehBGKede63mleXt', 'F0VIuMOoJUod');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Joely Coyote', '053-1283211', '6RgjjeBDNWV6FBzm6SfT', 'KS9Bn5yozIgf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ronnie Kinney', '058-4563977', '998rww', 'q0vOcpn1MR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Irene McGowan', '050-1115684', '77kQuFDV9', 'ZJFPRMsBCJh');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Swoosie Numan', '058-9268764', '4WftvQX5qIxQp', 'Kkea69VySvlR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Michael Collie', '051-3573233', 'GGNLDSz1M88ISNtIQZHr', 'gIdaciazBw2tT');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jon Clooney', '053-3890264', 'mF35ulSJPjIRBXP6oTY', '9YdZ5XHds4OXD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('John Berry', '050-9461457', 'jviZb9A07JT10', 'w3w5wnjApcqKU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jimmy Imbruglia', '052-8981987', 'ueAVErYCNwD2R', 'WgMlQ8ICFH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vince Buscemi', '059-8551312', 'BbPihuol0rZvjqbD', 'HH70v7TPr8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Davis Mac', '051-2673193', 'Gz6u5PVpjTRmQQQy', '2pEFwBW7Sa');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Charlie Hornsby', '059-7585182', 'yLHHOQXyYtS', 'TTxwS1o0gLUOH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kelly Nivola', '051-4340588', 'G4oGgKzFax2Q', 'MEh4PfhBFV8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rik Colon', '054-9069326', 'PEvFaHp2d1dje3W', '8Sp2LCG7TMUaZ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jeanne Adams', '052-9712458', 'uuTDoRy4', '6oOJBqiLy3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Nile Hirsch', '059-5673178', '5FjlyC4SJBPLffp', 'Nm4UBz4hJWf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Victor Flack', '057-9645646', 'CmMPpaq01RvX75', 'YVTIRA2Y2aRge');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Maceo Ceasar', '059-3640832', 'eU9K15aClF44lhi', 'iMlLneCV');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Marlon Grant', '052-9476970', 'C5gZwOWYL', 'FpTaqcHeUUGI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kylie Cochran', '056-8849028', 'TpIvnSS9wNGnKqp1', 'T33Tgq3gX3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eric Skaggs', '058-0353517', 'kjoL54gWAnowS5Giv55', 'gdpzjz5uZyB');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chi Pollak', '054-9849332', 'LMy7FsyI9a4CJ', 'xyrJA0mwhafz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Benjamin Kattan', '055-4928232', 'ApK8g4iBhI', '0AaDKeZhdKkY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Daniel De Almeida', '058-4357463', '8bFimDd6wO2cs52', 'HUs0gQRj');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Heath Coyote', '051-2024572', 'GzGOi', 'fejmqa2v356s6');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rita Maxwell', '051-6096905', 'uy9vG', 'P2Lt9E1daTS2L');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Saul Jones', '052-3604662', 'TaYn1FG8NIjjj2', 'R33CSDyHpd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kyra Cobbs', '055-9817000', 'kbLRp6zL4', '6A232hSeSP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Denis Bullock', '059-9861621', 'JNdfF', 'V6yTcgqb68mw');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ronny Krumholtz', '057-9502386', '5KwWA1VBbGs5vb', 'OF9wLnsNKFxyH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bob Ticotin', '051-6602642', 'I2wxE', 'OVdwLDgLJGFwg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Naomi Kravitz', '053-6103753', 'e60Bro', 'VOtH5A5i5E0TR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Connie Red', '053-0344352', '9Jl6y6jZ9Uf', 'ZIy1kcNIuA66');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Val Cronin', '055-6521500', 'pJWpbt8q2gjgoG', 'FLT7Fefcm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kylie Colin Young', '055-5978458', '3KDH22EhGvknX', 'CwveyHLgDm1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mena Finn', '054-0779081', 'QARjBrXd', 'h8Abgpoe');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cameron Hatosy', '058-9156036', 's6DNkaxa9lA1UF', '3WTlDUpx');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sophie Zahn', '056-4043153', 'RoMMwKHNN0QXTfot1xFb', 'ocB2oL27TL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Leslie Costello', '055-0280799', 'I9hoOwV5sixWL', 'RMNasdUmxTed');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Trini Postlethwaite', '057-9392969', 'nq7uC6cU2Hkr56LsG2', 'ugo7FvrR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Austin Mould', '053-5052928', 'oVPFoyuMZE', 'ycYB23Jz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Maura McPherson', '059-7383904', 's46DQ', 'R0k6594w');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Isabella Paquin', '054-0860806', 'hg5gwgMZBjk7NX', 'ikN13liY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Geoffrey Whitman', '055-7137564', 'z18xrefDY', 'wzHJgh4j0A5z8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ryan Pastore', '052-2968649', 'sX5coMStSjRRF7NntX', 'Iz2NY9xcf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rhea Franks', '050-4888610', 'HeiMOjPp4Oy', 'VtGYACcBZUuq4');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Anita Hewett', '051-3281727', 'oLA7UA54YWNhS', 'KPotbMYZp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ritchie Roberts', '056-2297006', 'ioBX4GJ', 'LXFbKKtb3yW8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rosanne Penders', '058-2195155', 'k9GLbaqVpO307q', 'ixSjWYiFktgjB');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dean Cruz', '059-3615296', 'l70cpG9iaKrUG', 'D1xFz4mg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Allan Cherry', '052-2796340', 'JxuScWdBwzxZ', 'DfLurCJCDQ0kF');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dianne Carlyle', '058-7231171', 'F7Y4NdQ3xEVnDXC3VY', 'dXEbUkqc');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jaime Berkeley', '057-1144071', 'yYAJyGCqXb7vl2h6', 'TEkGsOgBq2a');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pelvic Gambon', '057-7259999', 'A5M9o7', 'QNgH9qUWa6F');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rebecca Meniketti', '054-8874034', 'Bd8vC5gZa', 'ACksoPFFtWQ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Angela Ammons', '052-8387737', 'OWlqsjqelfAbF', '0ORFfbJQdZ5v');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eliza Greenwood', '050-8756828', 'RkYaGONiu4EnBXH', 'cY0YFPpnrn1Ia');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gerald Loeb', '051-4372040', 'opzxANskyIaGNm', 'mtWmmSsi');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Andie Lewis', '052-2991303', 'JTiK0fvKHNAE', 'CTPcx7Y6AWT');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lance Janney', '054-7582226', 'pd1326VQ9UJgLoTX', 'CO4yiaFGr5mO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Suzanne Aaron', '059-3840704', 'kBWMiApAGhkT5LxQ', 'wmWbcqHRo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Patricia Dawson', '052-5917318', '5Pugej74Y', 'edlOER3wnhvt');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Melba Rossellini', '058-4137267', 'X5COTa8QPJY', 'QDosQUpcLt5R');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Garry Jordan', '056-4448023', 'bkcX6KjCtUVACAbYVaHL', '7gGnlAM10');
commit;
prompt 100 records committed...
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dionne Avalon', '051-8036002', 'MoSfxstUcnDKU6lO4', 'nqPVBoFZSpu');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Terrence Rizzo', '050-7304239', '4UGutJ8AjJqxPxJo', '3YYkS4YJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mike Cocker', '055-0969048', '5nti7eUCmMzHHFB', 'KW3ncUObd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lloyd Li', '051-7395972', 'jBF39ntZN', 'e0kPoXD4O76z');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Norm Grant', '056-7933845', '1AX2m', 'I9AItOB49Zmts');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Michael Palin', '055-2943801', 'RN1mFtGWRs', 'Vl8qHvIau0tio');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Merrilee Hall', '055-9110449', '9OzfwKQ6ePBNh', '963FLX1ydSTS');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lara Nivola', '052-8417537', 'aNp8f8iK21hOu3dUSV', 'DVHGsEum');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Salma Hughes', '054-0507912', 'jw0wNWspqb8vq2hYh0', 'UmBuHVQMpp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Leonardo Mueller-Sta', '050-1929744', 'O2BG1cL', 'ATFoeXBJv');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jody Nivola', '054-1552984', 'mA570i9Zreotgh', 'VQgUVB7RP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rowan McDonald', '053-7766292', 'eqquXdrXnDsqLtoUWQ', 'WuPKFGWO5ij5X');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chalee Hannah', '057-4368995', 'KGUYOtEfgXRvLMTGIK', 'HSI8YrJ6');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lenny Shannon', '059-7521298', 'fepI53AbOp98th5kBsP', 'KszkogJgSEo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cole Bening', '057-0740056', 'ABfYO', 'd4SrbEp651O');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lee Bright', '059-5863341', 'xkIJibDar2wgWeCZLm', 'obt3NA1xqS');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Don Tempest', '057-9106857', 'ZbzVPdbgTkkqnpqQRW', 'fSsVTMH63');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ray Sanchez', '057-4089417', 'QBKRhfIHx9', 'Vs1GkLTwC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chrissie Flatts', '057-6588815', 'pbZHBfhB', 'GdH2h3Q25J0');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Nickel Hatfield', '050-1086699', 'Qc5lkVr', 'WM9hyCZn');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Owen O''Neal', '051-6322572', 'u3w0R8Cl1Fv8QXs', 'o1gGmnkg30xW');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Busta Purefoy', '059-8265820', 'Vcgr6GVnOzpakuxen3H', '22HutoI4aA5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rhys Balk', '058-2504717', 'mWJOncL1byyyODJ', 'X0JhijmX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Shannon Robards', '053-8212293', 'lPtzDccAve', 'eQS29XlWCqhi');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rich Summer', '054-2946887', 'xQxMk8Vcum', 'r9GQVeMWsL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Candice Santana', '053-7859898', 'RMeEMCC0', '6lTk6VsdG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Brittany Farris', '059-7796345', 'wZ9FVn5OTHfXXEt', 'NCRBtre33ob');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Minnie Giannini', '056-4103224', '5kmtYAV4cJ4GQED99', 'hVFMSOItg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pamela Crosby', '051-2670586', 'xszMQoftG4yAaaV', 'IuSBYL1Fkx');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Daryl Martin', '055-1641619', 'HfW3eYQFTyAVeWQDe', '3KK0vtUkaehk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vivica Matheson', '053-5290869', 'AUSqSkL19gXDP6T', 'GDcwwQgG6H');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Collin Lopez', '054-3090922', 'ESUGvF3ZzfxQitDjKHW', 'liaY5vIr3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dianne DeVita', '058-1426370', 'Q2P2lT4bPmPgRg3mjm', 'fJiwbPjAa');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sam Foxx', '051-3947907', 'UBCsxbFnHCgje3eLpg', 'kSyQflIff');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Angela Singh', '055-4591531', '7vdnzUfT1xL78UTk', 'HYjJeSPdvjeVb');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Beth Hawke', '057-2430353', 'caz5tMxy', '0cjLzehIJX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kevin Playboys', '056-6331436', '92sVxCx94Kn9OArG0hJ', '3UuHhAb7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Roberta Osment', '057-4539067', '4dkM1', 'BN63Wqn21');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Graham Conroy', '055-1086894', 'ZHbrPC4hK', '2FfiYR8A');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Billy Voight', '050-4480334', 'FVsvTl', 'pjmpqe7nqM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Amanda Eldard', '052-3447597', 'Nm4OrIIzF', 'ylWX9yKJNo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Christopher McIntyre', '057-0979940', 'ebaTVhsjqrrUD', 'FB0D6V40PeDfR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Elisabeth Giamatti', '058-4284357', 'kj2EE', 'hEdQgD1azc9');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bryan Travolta', '052-0615939', 'FQFNuijVCXMv', '6vKmecsW');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jean-Claude Polley', '057-5180336', '4YWArQOQRlMSlAUeo', 'cPQi0cM0');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sylvester Busey', '053-2178521', 'qqPrJzaTMw', 'GSCiH1CRx');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vanessa Spall', '058-7979671', 'BEBVY2aOsDg4', 'qBBw9T0TkV2K');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Alfred Meniketti', '051-8674697', 'ptaOLyw5', 'Ww6hyFY44H');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Busta Conners', '059-4142563', 'nNDlS', 'CgmB47QeK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kevn Atkinson', '058-9198391', 'WWhYFd', 'SPcpuk969elC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Peter Stamp', '055-1793692', 'N4K9R51hrEKPKNDvcy', '5MoSi5Pr8QYP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gordon Woodard', '059-0894371', '67hxnNri9HcEkh4LM', 'vuzArtGD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Doug Wilder', '057-0138569', 'ZCcUzEsTsMAm', 'R3V9Xr2WhbfiJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dionne Levy', '050-2462695', '3PekGzTz8', 'IU4ju4pq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Matt Mann', '059-6544622', 'cAKVKk4SX2CHJcv', 'MxdHZkusd9xRB');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Edie Alda', '058-7974857', 'DF0CAhzFjyP6PSAtE', 'Jzsoh4eSqxsuR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tony Spiner', '059-5115867', '9uoHhxhnk', 'GSxVtiTh0');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Andy Cole', '053-4650478', 'GT8uD0w8nuKC7Geg', 'BXaWqMDLfBG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Daniel Belle', '056-4989777', 'pt8AVd1EkFr', 'uObcU6MdI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vertical McPherson', '058-5843075', 'l0QMqPVviwO', 'bTfTzUgOyvX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rascal Pitt', '054-4763408', 'w2jOSiPGCr7WgX', 'kcp7DTmcqvp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Albert Garner', '050-7738267', 'NTrNjWCkgu', 'NLcmUPHZI2Q');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Maceo Hannah', '054-0903461', 'OWheS1Q4E', 'MNQoRSxv6uE2');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Anna Weaving', '058-0148039', 'AgT6Rj7eWB', 'au7MeASJp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rene Affleck', '057-3806744', 'trVaGk7UPHf', 'D3II9e9d3zr');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Derek Hawthorne', '052-0287834', '6tJAUA9dpvWbhD6', 'hnKaAX7nUdTO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Angelina Ifans', '051-2960601', 'esTnJzqwfJDb1RN', 'OmgIrc9j1i');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bette Durning', '054-9348061', 'meyftpS', 'UHawoncMa');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chaka Carrere', '052-8493310', 'ZYfDe', 'Is4421Xs9tXH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kitty Dawson', '052-7106870', 'uVzg9Dt8ZsN9v3dJ3dIA', 'nnKemUNm7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Frankie Stiles', '053-5049455', 'SP9tnAyygr', 'RItYtkBtxXlxe');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gord Sedaka', '053-9306941', 'w9M64IuqkgIGrwV', '2aZy8iJz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jody Lemmon', '056-6775444', 'm0nRHdT4YSxnp4HC', '3ajYGth3pQ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Thelma Gryner', '057-9036692', 'HeVQCWzZ9', 'qjgQ7e6vrjLK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Harriet Dooley', '051-6132914', 's7DuJdcNj9luFgO', 'iRFXM7AM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Richard Gracie', '056-5232672', 'BtOkglQ3UfX8Sk1kmGX', '6r4PZTWG5UD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Seann Rivers', '050-4916857', '8Wm4kLbDjFqdHG', 'ZEceUVnrBKC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Carrie Nolte', '055-9019039', 'yRbKHUEwhkWcs', 'M5yX6JDwI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Marina Savage', '052-6176681', 'uhyYWGE1ks', 'bripMFzlL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Oro Ronstadt', '050-9971004', 'mmty7IxiYORtEB', 'RX3X172L');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ritchie Barrymore', '059-8999330', 'fPoB9CeCvabs7e79nc', '5cmqsE7vN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Horace Hong', '054-2387528', 'Y921tD2xFLkAHqKZ', 'AyPVifHASs');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Andie Dempsey', '057-6039674', 'znEQ5XkWeCghTAFlHkQ', 'm3TxWqf9Hd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lari Arjona', '054-9987334', 'vWvPymVgBWDuTBdAQO', '7sL6pI5mpf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gene King', '056-0794554', 'awo1zeJDqe5pB2IH', 'P6C0TN0zRm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lucinda Bandy', '057-7561115', 'rKMzUyJh8PoX4iEA', 'ZJDbnWrq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lin Graham', '052-1525423', 'p90c1O03QfZ7v', 'h4RWiD7EF3IE');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bridgette Rosas', '050-6042793', 'Ckfgqq', 'lOyQRox8GJIN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ceili Portman', '050-1965038', 'M5YZG1YShP6GO', 'WR8lqrW6tdDj');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bonnie Isaacs', '055-8645676', 'KcNu142gEWV85Su', 'D7aGM7fucF2');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Frankie Finn', '054-3302040', '7eFkVRbVGjose', 'WfBCQo9oIeo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jeff Red', '054-7784416', 'wlgBZsn3zsGSfggCCONk', 'VTpRjxixK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Stockard Glover', '051-9421868', 'n3F05s8U', 'hV0nbnvo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rosanna Bracco', '058-8171956', 'v3c6Vp9NkeJTpH', '2CgxHuWc');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Luke Atkinson', '058-1330796', 'K5uzSKftSbu3', 'nXqDwbQXjWufr');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Joaquim Armstrong', '057-0408662', 'hVeIShviQnr0wP', 'zgCzy43niyrEA');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Debby Popper', '051-7430456', 'vq8IGrg6Eh4LE', 's8BwsmgNhV9jd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tom Walsh', '058-0087612', 'hskCcIU3VDlZIg43', 'BjlQvdBJHC4');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Aimee Preston', '053-6481782', 'ul1l7pSIBLzMt5', 'y9qVKuqb4u');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Glenn Lindo', '058-8719773', 'hLLs9', '2yeREwqya5c');
commit;
prompt 200 records committed...
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gavin Mulroney', '058-9129679', 'DRVvFrGnuAuko', '5MJF9vKwUpypJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Avril Tennison', '056-6302733', 'qczXa8Ztf5', 'bk3wBReTnp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ving Pacino', '054-6411308', 'QNUoZrNrfy1M', 'RCI40JruxXQi');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bruce Shearer', '055-8014849', 'lv3J0vkG6qgZVxh', 'y5rICWls8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Diane Guzman', '058-2290335', 'ln9Pkkn', 'b5R5r8tqE');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Herbie Chambers', '052-3254822', 'lHqVGXeJERlE', 'Vvxr1yKyVJAq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Isaac Quinlan', '050-8503570', '13lptw', 'rfp6Fltpdo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Javon Holly', '053-4956076', '0PyXjH', 'H04L2pBW2kBTI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Carl Shocked', '058-0184499', '7yBWvJCDJo', 'Zj2EIIVbI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Glenn Adams', '057-3227969', 'dGDmfhtkwzVDr2g67s9', 'x5Qd3VNESo5qs');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lena Neill', '058-3567960', 'aBnWGUEwUUFLs', 'XIZEgCXQI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Teri Ford', '053-3633948', '9eZmnZEnzK4', 'F4MkJJVDhG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cheryl Cocker', '056-1039585', 'DUGJl', 'mGswXlJWC1vG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mary-Louise Fisher', '050-9752001', 'aFAR0M', 'YMopFnNKYaY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jamie Blanchett', '056-6371592', 'niXMyr4iNND5u', 'm4Z85swT1td');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Willie Gray', '054-6496492', 'rtMnU8KgjznGzIya', 'rWbnFPBvWl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Nils Feliciano', '052-3283986', 'h9aBcw', 'u3i0dYjV3KJV');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lonnie Detmer', '050-3330353', 'FZQmQpbjn1t', 'cONexHElWB8KO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tobey Curtis-Hall', '051-7033506', 'pk9Psd', 'P9PqJB6Mbey6');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kevn Swank', '057-0242108', 'bS1vbkSg68QfFD', '8ED9URtp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jane Oszajca', '050-0165524', 'rZPeO5TZPrRTiU', 'IzHJdTofDc');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mykelti Carrington', '055-1576797', 'qgdsCPmjaeUuj6ufA93', 'fNiRKhyUB7f');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Terrence Dunst', '051-8882002', 'DPbvPoP81sRA', 'd4kV7bR1l');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tobey Lovitz', '056-6147647', 'URu1y7G', 'd97JfipSJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Harold Tyler', '053-1047744', 'xjIhBlQxAdykn8pnUMH', '04GV3Zc8iTXvX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Robbie Ammons', '052-6583245', 'zudnc0wfS', 'QbIIRtXoLT9X');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cole Mahood', '059-9367054', '4WmAX59GOAHU', 'cRWWe9wV3N5E');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Penelope Broadbent', '056-7199205', 'iRUMWL48OfoYikw', 'pzE2HJ4WXn');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Horace Conway', '056-9860078', 'zWq15mScgJXOLSdu9', 'KOOQPKPixZ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rebecca Tobolowsky', '055-7101317', 'bAHUvhStSz3i6Er', 'ArKiDneTKmc90');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lara Domino', '058-0418997', 'vesDkRnpf1s4VJmUm2RK', 'cTNzCX0L7qxv');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Trick Dayne', '052-5980197', 'fTnJQuFgFMt', 'piQBBgOPjYv4');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ricardo Wilder', '056-1492265', 'r7SeDBA', 'edj3jtE4');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Luis Berry', '052-7734422', '4Gtv8KLvIxOE', 'DTS0NecedyHem');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Allan Field', '052-1477273', 'HCmp4yiHC', 'rMTZC72Awe');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jennifer Overstreet', '053-7400363', 'gaSgu', 'Kit1GZkxdjm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Art Jenkins', '052-1274492', 'zwVGSSVTFKJIZu3wIJiT', 'omx1D9bq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Terry Goodall', '059-8523522', 'W8ATjt', '2cdY57lowI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Brenda Miller', '059-5582574', 'eKkEScUDardbtYpjh', 'PzbjKx56M');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Meg McNarland', '053-4152776', 'IQ7W67n', '30FAzvPy');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Maggie Logue', '053-9271334', '6x1Eqyz1P4iUj', 'wN9ZmDMRwKN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tzi Pleasence', '059-9333112', 'rLjpthHhC42', 'YqmZM4GhWMmL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cledus Hewitt', '056-2018494', 'nANMdfNG', 'y6NzYn9X');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Nastassja Cornell', '051-5457816', '4XCmvGXG', 'hk1OKIA1X74TY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Davy Mantegna', '053-9479226', 'xEV30pv9QAAIq11', '1yQwetCP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Derek Silverman', '057-4498528', 'i503jW', '0p7WyCoda9');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Russell Gagnon', '053-5637837', 'StFYE0y15IZJB1eF', 'kmr2Er3K3Z');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sinead Matheson', '057-9384985', 'kuza0JrnwKrmWXMss6P', 'YzluoKHs76');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Samuel Gracie', '053-3562538', 'pmwJoZFYVqU', 'vAxmh4tBHjG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Keanu Carr', '050-9031314', 'I0swU1txAESLtMLJ3', 'wIAaTitgPL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Horace Goodall', '056-8877344', 'bn5dwpaCur', 'Rpquw7RAOEeOW');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kieran Evans', '053-7824299', 'yrE4Np', 'i5GnNJnTiylh');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jeanne Creek', '054-6879360', 'MUQIr7Bzb', '8HIsrdLN30rV');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Powers Hamilton', '053-5771527', 'YPgqf8Nqh', 'KVQc2v23Gf6');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tilda Zeta-Jones', '050-4761093', '2mlbGwxNAIdMCHv', 'UnAz2wEDfpL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dom Colin Young', '058-4227379', 'j13hBfVGllQ', 'Y0akULcQJg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Anjelica Malone', '050-8939799', 'iN5h0ngTkQBYD', 'ziHRW3s5Rhb');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cevin Minogue', '059-8577333', 'reMWqvmZSqLhoT', 'hbN652ETJq4Q');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dermot Diffie', '052-7336677', '2FtKhEo', 'DBIdJsevik');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jon Rivers', '053-0400989', '9Bp4W1', '98GhBACYP5KJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Terrence Loggins', '055-5823322', 'ceElbQ', 'gCyEBaP6Rx');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Desmond Barkin', '054-0457309', 'FDp4S', 'g7f7szBgNg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vienna Dzundza', '050-7681326', '7vITAtUp1tRZMv', '7RhxRxcnPM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Bernie McDonald', '057-4336727', 'wCxUWODRBD', 'Jq7iHGoxVNUf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Toshiro Coughlan', '058-1076528', 'KgoWfOq', 'HgKV2oyn');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Crispin Scott', '052-7431075', 'rmL6pF1xzE0CXbmMXGwU', 'M5XAF74We72kC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ernest Phillippe', '054-1765925', '8NjYsaKXJtyo', 'fQ3JfIPLu57');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Wayman Johnson', '050-3890743', 'Wah4UVBYgvE', 't6kwMlwfyAxZh');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jimmy Flatts', '053-4131810', 'Z9WzldUs', 'g4KmGjWLtfMT9');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Roddy Herrmann', '057-5751098', 'TGp88ZlE9bAUmXii', 'EkHZqEl3epM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('James Edmunds', '055-6432830', 'J6YRxVbJ04sneWlmD', 'kDav6NIb42q');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ike Gayle', '050-7323160', 'UCaMIOw62yd', 'DzB4VZdd4h');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Beverley von Sydow', '052-8890134', 'P873F5fy2vy2ihn5', 'a6O7dXOJI5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tea Lynne', '058-7078476', 'WbtXqWEhg', 'M47bgQ75wZux3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Neil Paquin', '057-8408551', 'tewksGvn1', 'Bczr2ggPCUWQs');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Queen Lennox', '057-8371066', 'JSBSo8OAfYHj0', 'qcv0V3cQ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Terry Mitra', '059-7267982', '1tNiGGui', 'ZILp9IPQb5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lari Utada', '051-6066582', 'gqTy9', 'jPVKAXOyConIK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Joan Rebhorn', '057-7000524', 'rSpnQZ', 'OXYxKiaKLAUk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hilton Salonga', '053-7717213', '2AJSKaD1lH2NyOtlvWL', '0TAZSi6A');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rolando Tilly', '051-4574177', 'uuPxV7yUuY9Jgk', 'S80GTvkU0O2');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Victoria Jackson', '053-5748333', 'fPRV5QRmOA', 'qza1y7byWt3n0');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pamela Porter', '059-0639756', 'ks860aAZVqoj5FC', 'meXkI7Uuhr');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Angie Marx', '051-7063643', 'JJa828', 'w5uHgDyqHAoe');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pam Supernaw', '054-5890532', 'ewlY8x2pQENCoR1MO', 'ABSLXpmR');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eddie Love', '059-8324629', 'OMFLaaKyz0EZ3TH5p', 'yyz5xXuWMJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Boyd Tambor', '054-1936037', 'huclSuh6x', 'UHnvwJq3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Garry Cockburn', '052-7480689', 'gVS6Wpd0Xj190V17We', 'toqbgwSXMgOa');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ronnie Farris', '058-0279099', 'fMGxcEydXlKa0a', '3kztF2tH1AugU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Barbara Fisher', '059-0975936', '26cQFzbGF', '0t89qaqsCM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Eugene Burrows', '055-6536920', '3pAodoV395DyJc', 'JfYXv33KSaE');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Katrin Levin', '052-8256596', 'q9Ahw', '50LmBq0G');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Neil Houston', '056-8828367', 'dNs9FBzO44', 'NcA1uAkMn');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rick Roberts', '053-6366418', '7o16Pakj1yk2IVhb', 'zeQILD2dXvXg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Maxine Quaid', '059-1502391', 'pB74oRnE8OxAd', 'w9MWVyHqeDQK1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Manu Watley', '052-8824711', 'DX6a6hk', 'RTbKWtgl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vanessa Clark', '057-4677081', 'avsWLMOZqw6GXEMU', 'rXQBjbJcH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Leo Thomson', '055-4071441', 'GsDZhMfgwre2HaL2cUx', 'irjM9hXHRg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Pat Carrington', '054-0608295', 'jGfQBVc', 'bMdd2j2MiX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Madeleine Nightingal', '054-5157706', 'aAKRzcq', 'FWpk1Bzuefwo');
commit;
prompt 300 records committed...
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Suzi Goldblum', '057-4433531', 'lpkz80fysDg', 'xRb84rwmFm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Nikki Roberts', '058-2641098', 'JkWh1D8VFLQT7', 'm5UNsyvmq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rosie Foxx', '052-1861261', 'GgFFYmV6', 'hcz5QQLOhDj');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hugo Payton', '051-5279717', 'efNRJJ6OsLJS9YaL', 'dltouVhdXXtjc');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jill Northam', '052-2563214', 'x6EV5wgS3FjhYJiKk', '3ljbdLASCY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Meg Negbaur', '058-6593787', 'RCxyd62fFt6O', 'NTgxuuoiAFuNd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kiefer Redgrave', '059-7595612', '0v8DPylsh', '3afBTsEuiv5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Whoopi Sossamon', '050-8564642', 'egzONb2LD', 'bNb4USYSBzIC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Fiona Streep', '055-9259455', 'RLDXS6', 'pTyK32hTY0I');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Emerson Steiger', '055-7678776', 'go1pZVFFrdslWGTJRW', '8LVjgzilgY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Collective Coyote', '058-0677123', 'EI1APpUmZmutqjUQ', 'xz5zn3jZP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Robbie Watley', '053-1839128', 'To1Szckbx1N', 'tcJptVliwtUP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tcheky Rizzo', '052-4223531', '0TjegPfE', 'u2KN6QY3GRPKl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chaka Tyler', '052-0870996', '88yPbRpcV55h', 'dDSoCk2ofHk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Donald Collie', '052-1018034', 'NNyGPFyUfq8', 'NcfpW1EvUz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Willie Valentin', '059-3030375', 'wZo8nHMtT', '4lGDR1Sq8goS1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Alfred Moss', '050-1484066', 'vZpzWlLf03x8m2Y0ELvh', '8M2Er15F');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lily Mason', '050-1303529', 'GFRYYM4p', 'WPgkEXJruRk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Faye Sarandon', '058-8655355', 'iSp2Ys046UHQcSVQwNIc', 'xOzMc4RH1SkO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Reese Nightingale', '055-8118015', '6Gnvv', '1VVJEcmvMJI');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Demi Sepulveda', '058-0556786', 'GNq790epPX', 'dlWvzOFQUU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Colin Gryner', '056-0334612', 'u2pW7TPhh997W5', 'awI99DP4');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rueben Feuerstein', '056-7420993', 'ntoPCwDa9dcu0Epy', 'YB3M2Clr8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Annette Bandy', '052-0846623', 'nXaiSjNe17M54Vht', 'p8yuZ2oC1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Vivica Aaron', '057-2291242', 'SJbSUn66g', 'wHsVMLo2IQq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lea Rains', '057-5613462', 'HzgJGmNAbUXk38dO5y', 'bLfEcnBXvD0I5');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hugh Winter', '057-5287630', 'h8xvbT3Nj4', 'NrJ2qEJlCK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jackson Scorsese', '054-9323600', 'r6ds5wx6', 'CAXbOsum');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Allison Cronin', '056-7392079', 'kbfUk1', 'fYJm9hYRxs');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Greg Vicious', '050-6150315', 'EPQBWEfzkAhxFM5kEaZ', 'nd4tE6XCPzAk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Heath Hart', '057-0871597', 'y2gvO9PwXWz823NA', 'ZMcotVCMCtlG');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Lila Mattea', '054-2266695', 'EKHYOvxf8R7TuO6Ki8ou', 'aK0SD9X69zsGY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jason Herndon', '053-1668974', 'RmOHvejIKVwuA1cUZ', 'EvcMLbh3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tia Davies', '059-0396459', 'qArSA0zPbqX2vLY', 'S2o7xfReNpoWP');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Orlando DeVita', '058-0931233', 'yV6WZdTK6kweu', '0aivl1Sb7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Roberta Paymer', '050-3931519', 'EM4g3BxU', '6RxMEPTx1o');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ming-Na Eat World', '059-2316512', 'tZJByHfK2H48GXJXUfbZ', 'iSstSrEce0f4o');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ricardo Schwimmer', '053-2545940', 'BC0v9', '3gcLwauo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Solomon Palmer', '054-0810884', 'WnujvlBY', 'kYxaCR5GyHQl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Larry Zahn', '057-3580575', 'ayiAopL4gP', 'eh2xsNh7czYV3');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Janeane Tanon', '056-8258219', '9eOvoUGBDswRys', 'bzWhvGymrrjY');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Anjelica Place', '050-2724114', '7K4hamXxgg3D9', 'QWHSpj9oya');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Roberta McGregor', '056-5987027', 'y1SusqfFce19fUfDaQrw', '7sqYNg1U5Hinb');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jesus Lynne', '056-3089735', 'vUrlc59', 'DUDiJBmQiZdXz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Seth Lee', '059-6336060', 'in10MpGEg7UO4QpS', 's9pD7nyy1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chad Gaynor', '058-4123221', '46w2gCcZVTb', 'AwYawFhIYTwKm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Edwin Cleary', '053-7182256', 'XoBaekIhHBrnDRaB', 'IW6UhbipF');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jimmie Johnson', '050-1162645', 'NaMyTC', 'Hwx4GtP7rvm');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dionne Lorenz', '051-7811951', 'DQllwStsF', '7X8U9PYxFgsbo');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Toni Savage', '056-1260609', 't4Q2YvwxLFU3Vtd26', 'QsPY8YOO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rhea De Niro', '055-1812945', 'ZWhDELT9', 'Ab3JTNZ92');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Belinda Cross', '052-0929531', 'SdgFTVfv7', 'KoMjqncqL');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mandy Goodall', '058-5493343', 'VJebe', 'Y2DvBxd9EKM');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Phoebe Reeve', '053-4652332', '26R0McExOblE31', 'p3GY8fkyP6x2');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Davis Kier', '055-6735310', 'patPOO1Fs41yrgu1usZ', '93N8tOfOQN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Emma Ruffalo', '054-8838946', 'lH4SOOCN', 'XOy0ooPWpEWC');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Mickey Coyote', '059-1322269', '60IPScQUKUVi5b24', 'ZA4g31VC0Vc');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Gates Haslam', '056-7161379', 'w7lZpT5Gbeu', '0X5RYo7E5y5ct');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Kevn Heald', '057-3550794', '3hDAkmE03Hxj', 'zEfMnUgPd');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Katie Esposito', '054-2039590', 'abcHpKak', 'snh9gKKD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Elijah Balaban', '057-4648554', 'rKK4KShxZPgJ', 'BBjEh99oDaz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('April Blanchett', '057-3608180', 'eQhiap1z', 'kLADoMXDWoU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Adrien Steagall', '051-6780020', 'Fuip7yW7C', '1zjOzgNCZnk0l');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Sydney Lynn', '054-0805961', 'K0dwf4yUKrX2SYx2', 'PN5EhvkLDq');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Chris Whitwam', '057-0768911', 'tZ8tzPXk3xJW', '1GxoJ4aYAvA');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Edward Jane', '056-2584731', '79K3wsO8e1Poud1', 'yWWwxUmh7fnp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dermot Brando', '054-2569359', 'Xw7tu0cN2MfC8XZZoxVe', '5e86yTYl');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Donald Plummer', '059-2069497', 'muYX63JNxHxQ', 'E4BZPK2Y');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Geggy McCoy', '054-8795035', '3uVOvXjoI5t3GYt', 'VaHO19kGs0MO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Luke Nugent', '059-4563917', 'pF2RTu7P', 'NHt0tUOko');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Colm Saucedo', '056-5886180', 'f09acOudkQs3', 'MWlVYaA2F');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jeffery Matarazzo', '053-5331391', 'XWXV6pUWKWXwr', '5lDkr6h8pcSTp');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Tony Platt', '051-8791215', '2y5V0jxRs9HhPqLeq', 'dsgkEXGP8u');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Wayne Root', '053-9081824', 'sajRkhRSQX0mXfDhM', 'g411LETARAxa');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Burt Blige', '053-9914628', 'hftG9HXyYxBuXzQPm', 'wVy4TG3bE');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jay Bancroft', '054-2691161', '9K2xbESdFQA', 'XbsJNZHufFT8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Suzy Swayze', '053-7768298', '4O8qMQGMD8BK5neKR', 'haXgdmOi5vE1');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dick Alda', '050-3084262', 'L88KkTD9tY', 'dnvjjL7X1oU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Claude McLean', '056-3380139', 'HtnOeSYpnIZVME4iV3iQ', 'SuuS8hY5gOxRv');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Ted Stiers', '053-9647964', '7cAlQ4xO4HX44', 'lc3tWLMY47kUz');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Martha Stevens', '050-3614222', 'gnG49jesphl8', 'g3V6CQyhpPo9k');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Jill Eastwood', '054-6378849', 'IV6LHymz8dxpBl4Ksk8M', '1U9LyyOhElp2');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hazel Zellweger', '054-3632136', 'DqBMBozOjQH0OrzZ0j0L', 'vjRnZAZiusw');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Alfie Cherry', '051-0342086', 'SDyoMuEM', 'd4rSeKZFuhb');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Fairuza Irons', '051-9884833', 'UA3tBh4Ox5LiunrMhWL', 'OvkSb2MBOO');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Hex Armatrading', '051-0974562', '70mZHPsZvR', 'TmZycIdIjrJBe');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rod Gayle', '050-3417040', 'rOR8HLZLsZ', 'WQiO3RPN2QN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Cole Grant', '058-5098072', 'CMO153RT0bJw8coJDSnb', 'gaGgwfGPfD');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Samantha Fonda', '055-7860977', '3cFmDO', 'UTENXl13ou1dN');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Rod Hartnett', '054-2854976', 'R0WgmA', 'Sb6RbrDzgcVrB');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Dom Sawa', '058-3082708', 'AfsFvyrER', 'nRjYthUwlwFck');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Anita Soda', '053-0542477', 'y0MAjoleaUZTRTZ5Qzu', '8xJYv3tt');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Horace Duke', '057-4841430', 'rczHSMU80lM99Fe', '3XBRiKefk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Don Cross', '056-9814582', 'FslXPcuoQ', 'unkRpHqLJ');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Olympia Portman', '057-0965752', '75bw5JfJ9gkDin', 'ylnEhsNwkk');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Scott Avital', '057-4400730', '84sd6ODb', 'EyaupnJg8');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Junior Reiner', '058-2338862', 'SabObpz', 'TOhUd7fCX');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Davy Northam', '057-0254903', 'fqT76S', '9q2DKLHv17heg');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Harrison Myles', '054-2718731', 'ZjKjD', 'HZYrhgZLLwGU');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('Harris Shepherd', '053-6679490', 'NC6l3QJSzYAa', 'iKYfUjoBd9of');
commit;
prompt 400 records loaded
prompt Loading ORDERING...
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-01-2002', 'dd-mm-yyyy'), 'Cancelled', 77016412, 'i503jW', 120860299);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-08-1994', 'dd-mm-yyyy'), 'Delivered', 21014090, 'DUGJl', 66405309);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-11-1989', 'dd-mm-yyyy'), 'Cancelled', 13635246, 'HeiMOjPp4Oy', 91525539);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-10-2018', 'dd-mm-yyyy'), 'Delivered', 42432175, 'Z9WzldUs', 162742550);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-03-1991', 'dd-mm-yyyy'), 'Shipped', 57140893, '3hDAkmE03Hxj', 586825663);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-04-1987', 'dd-mm-yyyy'), 'Cancelled', 28592193, 'sajRkhRSQX0mXfDhM', 55247198);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-12-2006', 'dd-mm-yyyy'), 'Delivered', 15183558, 'pd1326VQ9UJgLoTX', 695794500);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-08-2017', 'dd-mm-yyyy'), 'Shipped', 14869867, 'hftG9HXyYxBuXzQPm', 71042379);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-08-2014', 'dd-mm-yyyy'), 'Confirmed', 56686607, 't8ASehBGKede63mleXt', 572346453);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-05-2021', 'dd-mm-yyyy'), 'Cancelled', 16367334, 'D1m6IOOCj', 596197988);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-05-2003', 'dd-mm-yyyy'), 'Delivered', 88004875, 'ceElbQ', 699483958);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-11-2002', 'dd-mm-yyyy'), 'Confirmed', 40377056, 'gaSgu', 462461270);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-12-2008', 'dd-mm-yyyy'), 'Confirmed', 26868228, 'HtnOeSYpnIZVME4iV3iQ', 324702801);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-08-2009', 'dd-mm-yyyy'), 'Cancelled', 17791571, 'uy9vG', 648714096);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 'Confirmed', 49332773, 'k9GLbaqVpO307q', 765451524);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-07-2015', 'dd-mm-yyyy'), 'Shipped', 53310889, 'znEQ5XkWeCghTAFlHkQ', 62176464);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-11-2018', 'dd-mm-yyyy'), 'Cancelled', 68124698, '92sVxCx94Kn9OArG0hJ', 909505686);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-08-2016', 'dd-mm-yyyy'), 'Shipped', 18391305, 'L88KkTD9tY', 141634264);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-02-2011', 'dd-mm-yyyy'), 'Confirmed', 67903758, 'HtnOeSYpnIZVME4iV3iQ', 856251055);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-05-2019', 'dd-mm-yyyy'), 'Cancelled', 66449602, 'gaSgu', 823688721);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-06-1992', 'dd-mm-yyyy'), 'Confirmed', 46925058, 'zWq15mScgJXOLSdu9', 447216171);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-04-2001', 'dd-mm-yyyy'), 'Confirmed', 13448939, 'ueAVErYCNwD2R', 289948301);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 'Cancelled', 26512133, '7K4hamXxgg3D9', 809810518);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-11-2003', 'dd-mm-yyyy'), 'Confirmed', 73375116, 'Qc5lkVr', 66405309);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-01-2004', 'dd-mm-yyyy'), 'Shipped', 30748348, 'aBnWGUEwUUFLs', 354943318);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-01-1999', 'dd-mm-yyyy'), 'Confirmed', 2889869, '26R0McExOblE31', 885616474);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-11-1985', 'dd-mm-yyyy'), 'Confirmed', 69717769, 'JxuScWdBwzxZ', 367113889);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-06-2006', 'dd-mm-yyyy'), 'Cancelled', 87329088, 'Nm4OrIIzF', 851760809);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-05-1996', 'dd-mm-yyyy'), 'Cancelled', 69459210, 'pk9Psd', 880269651);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-10-2024', 'dd-mm-yyyy'), 'Delivered', 77127677, 'rSpnQZ', 601656458);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-02-2021', 'dd-mm-yyyy'), 'Cancelled', 39897612, 'KgoWfOq', 695448905);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-11-2014', 'dd-mm-yyyy'), 'Confirmed', 93016828, '0v8DPylsh', 342691816);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-09-2003', 'dd-mm-yyyy'), 'Delivered', 98500004, 'LsQJCplxgm2EQh9609', 186729997);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-02-2015', 'dd-mm-yyyy'), 'Shipped', 27399154, 'aBnWGUEwUUFLs', 324702801);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-03-2018', 'dd-mm-yyyy'), 'Delivered', 85467237, 'fqT76S', 592350877);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-02-1990', 'dd-mm-yyyy'), 'Cancelled', 35599637, 'BbPihuol0rZvjqbD', 7923661);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-07-2013', 'dd-mm-yyyy'), 'Delivered', 55502229, 'Ckfgqq', 823688721);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-12-2010', 'dd-mm-yyyy'), 'Shipped', 87542546, 'RmOHvejIKVwuA1cUZ', 525173186);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-03-2010', 'dd-mm-yyyy'), 'Shipped', 53810865, 'dGDmfhtkwzVDr2g67s9', 855541615);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-08-2008', 'dd-mm-yyyy'), 'Confirmed', 54646163, 'r7SeDBA', 28266639);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-10-1989', 'dd-mm-yyyy'), 'Shipped', 10594533, 'IV6LHymz8dxpBl4Ksk8M', 897129821);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-10-2019', 'dd-mm-yyyy'), 'Delivered', 74430140, 'YPgqf8Nqh', 386601355);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-04-1997', 'dd-mm-yyyy'), 'Shipped', 8738642, '84sd6ODb', 602134711);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-10-2004', 'dd-mm-yyyy'), 'Cancelled', 15507064, 'iSp2Ys046UHQcSVQwNIc', 584321723);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-11-2014', 'dd-mm-yyyy'), 'Shipped', 20735605, 'go1pZVFFrdslWGTJRW', 529976129);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-06-1998', 'dd-mm-yyyy'), 'Confirmed', 80873306, 'HCmp4yiHC', 387197471);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-08-2009', 'dd-mm-yyyy'), 'Confirmed', 22756542, 'reMWqvmZSqLhoT', 477380247);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-07-1993', 'dd-mm-yyyy'), 'Delivered', 386261, '5FjlyC4SJBPLffp', 122914099);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-05-1992', 'dd-mm-yyyy'), 'Delivered', 95173077, 'z18xrefDY', 28266639);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-10-1995', 'dd-mm-yyyy'), 'Cancelled', 13434734, 'W8EtgraF', 382058355);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-12-2009', 'dd-mm-yyyy'), 'Confirmed', 91064416, 'lPtzDccAve', 66405309);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-10-2012', 'dd-mm-yyyy'), 'Cancelled', 78760661, 'avsWLMOZqw6GXEMU', 802032568);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-06-1989', 'dd-mm-yyyy'), 'Shipped', 26879677, 'OMFLaaKyz0EZ3TH5p', 367113889);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-06-2014', 'dd-mm-yyyy'), 'Delivered', 3963139, 'Kp9vETCsnfg7BNE82Gi', 16882160);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-07-1995', 'dd-mm-yyyy'), 'Confirmed', 74848075, 'pk9Psd', 231650707);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-01-1986', 'dd-mm-yyyy'), 'Delivered', 1323799, 'BtOkglQ3UfX8Sk1kmGX', 592350877);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-07-2019', 'dd-mm-yyyy'), 'Shipped', 72832056, 'kbfUk1', 326015810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-03-1994', 'dd-mm-yyyy'), 'Shipped', 52179145, 'wCxUWODRBD', 16882160);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-06-2021', 'dd-mm-yyyy'), 'Cancelled', 9623725, '7eFkVRbVGjose', 338495564);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-10-2024', 'dd-mm-yyyy'), 'Cancelled', 26574474, 'CMO153RT0bJw8coJDSnb', 783732680);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-07-2024', 'dd-mm-yyyy'), 'Shipped', 21507744, 'WWhYFd', 930397220);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-11-1993', 'dd-mm-yyyy'), 'Shipped', 915836, 'pk9Psd', 530917933);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-03-2022', 'dd-mm-yyyy'), 'Confirmed', 26677939, 'iwsUl4nzoOt55', 590709480);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-11-2010', 'dd-mm-yyyy'), 'Shipped', 19726030, '3cFmDO', 182188298);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-07-2017', 'dd-mm-yyyy'), 'Cancelled', 4458510, 'vq8IGrg6Eh4LE', 667727188);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-03-2014', 'dd-mm-yyyy'), 'Shipped', 67514102, 'hVeIShviQnr0wP', 378113125);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-01-1995', 'dd-mm-yyyy'), 'Cancelled', 59359688, 'uy9vG', 378113125);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-05-2019', 'dd-mm-yyyy'), 'Shipped', 37121217, 'ubxCv2uGgBwvM6', 538672711);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-04-1985', 'dd-mm-yyyy'), 'Delivered', 20063829, '8NjYsaKXJtyo', 885616474);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-01-2020', 'dd-mm-yyyy'), 'Cancelled', 5460019, 'k9GLbaqVpO307q', 460669398);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-11-2021', 'dd-mm-yyyy'), 'Confirmed', 58774530, 'uhyYWGE1ks', 558762014);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-09-2020', 'dd-mm-yyyy'), 'Cancelled', 92408100, 'DQllwStsF', 647512176);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-09-1990', 'dd-mm-yyyy'), 'Shipped', 4795883, 'HzgJGmNAbUXk38dO5y', 55247198);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-01-2003', 'dd-mm-yyyy'), 'Confirmed', 75392673, 'IQ7W67n', 947006629);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-03-2012', 'dd-mm-yyyy'), 'Delivered', 78641255, 'h9aBcw', 781661616);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-05-2023', 'dd-mm-yyyy'), 'Cancelled', 13044195, 'CmMPpaq01RvX75', 930397220);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-04-1995', 'dd-mm-yyyy'), 'Cancelled', 64601005, 'xQxMk8Vcum', 75859989);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-02-2004', 'dd-mm-yyyy'), 'Cancelled', 92559828, '0PyXjH', 704174790);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-02-2005', 'dd-mm-yyyy'), 'Confirmed', 62221818, 'ueAVErYCNwD2R', 806412391);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-06-2016', 'dd-mm-yyyy'), 'Delivered', 40604721, 'EPQBWEfzkAhxFM5kEaZ', 550535005);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-09-2001', 'dd-mm-yyyy'), 'Confirmed', 96962589, 'I2wxE', 645218925);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-01-2016', 'dd-mm-yyyy'), 'Confirmed', 70628518, 'ueAVErYCNwD2R', 585570271);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-05-1992', 'dd-mm-yyyy'), 'Confirmed', 36745231, '75bw5JfJ9gkDin', 802032568);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-10-1991', 'dd-mm-yyyy'), 'Confirmed', 68273252, 'AUSqSkL19gXDP6T', 778607716);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-02-1996', 'dd-mm-yyyy'), 'Cancelled', 32796201, 'gnG49jesphl8', 505023644);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-10-2005', 'dd-mm-yyyy'), 'Confirmed', 13868025, 'yV6WZdTK6kweu', 639954227);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-06-2020', 'dd-mm-yyyy'), 'Cancelled', 984096, 'ZjKjD', 659914838);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-12-2006', 'dd-mm-yyyy'), 'Cancelled', 39296830, 'nsjfIMpJ1LzgJWsQH', 333486729);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-12-2010', 'dd-mm-yyyy'), 'Delivered', 36327030, 'in10MpGEg7UO4QpS', 726733463);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-11-2016', 'dd-mm-yyyy'), 'Delivered', 6894936, 'mWJOncL1byyyODJ', 578001438);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-04-2013', 'dd-mm-yyyy'), 'Confirmed', 43612571, 'X5COTa8QPJY', 326756634);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-07-2007', 'dd-mm-yyyy'), 'Confirmed', 12107034, 'rKK4KShxZPgJ', 718066745);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-04-1987', 'dd-mm-yyyy'), 'Cancelled', 27185395, 'K0dwf4yUKrX2SYx2', 191493666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-06-1992', 'dd-mm-yyyy'), 'Delivered', 57105092, 'fPRV5QRmOA', 955153001);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-08-1994', 'dd-mm-yyyy'), 'Cancelled', 35435218, 'e60Bro', 91525539);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-07-2009', 'dd-mm-yyyy'), 'Cancelled', 75063711, 'zudnc0wfS', 430999055);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-05-1997', 'dd-mm-yyyy'), 'Shipped', 23578555, 'VJebe', 756146155);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-02-1997', 'dd-mm-yyyy'), 'Cancelled', 76890257, 'hVeIShviQnr0wP', 566743359);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-08-1990', 'dd-mm-yyyy'), 'Shipped', 31129764, 'KcNu142gEWV85Su', 909505686);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-11-2001', 'dd-mm-yyyy'), 'Confirmed', 88641943, 'avsWLMOZqw6GXEMU', 338495564);
commit;
prompt 100 records committed...
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-11-1986', 'dd-mm-yyyy'), 'Cancelled', 70643962, 'HeVQCWzZ9', 525161276);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-11-1999', 'dd-mm-yyyy'), 'Confirmed', 84093031, 'huclSuh6x', 721436189);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-06-2012', 'dd-mm-yyyy'), 'Cancelled', 64100073, 'hg5gwgMZBjk7NX', 704174790);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-04-2009', 'dd-mm-yyyy'), 'Delivered', 43033640, 'I0swU1txAESLtMLJ3', 49645763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-09-1997', 'dd-mm-yyyy'), 'Confirmed', 3395159, 'yLHHOQXyYtS', 245255480);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-06-2016', 'dd-mm-yyyy'), 'Confirmed', 32234609, 'fqT76S', 586825663);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-06-1998', 'dd-mm-yyyy'), 'Confirmed', 75350462, 'ESUGvF3ZzfxQitDjKHW', 701955008);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-02-1994', 'dd-mm-yyyy'), 'Cancelled', 92022558, 'SabObpz', 85403893);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-07-1990', 'dd-mm-yyyy'), 'Delivered', 68438716, 'r7SeDBA', 772320969);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-11-2011', 'dd-mm-yyyy'), 'Delivered', 14305674, 'pk9Psd', 466637605);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-12-1996', 'dd-mm-yyyy'), 'Delivered', 11713301, 'Fuip7yW7C', 727798681);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-08-1999', 'dd-mm-yyyy'), 'Cancelled', 77045021, '9OzfwKQ6ePBNh', 367113889);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-02-1987', 'dd-mm-yyyy'), 'Cancelled', 28677048, 'BEBVY2aOsDg4', 996860585);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-12-2002', 'dd-mm-yyyy'), 'Cancelled', 14865932, 'KGUYOtEfgXRvLMTGIK', 82609437);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-09-1988', 'dd-mm-yyyy'), 'Delivered', 88552149, 'IQ7W67n', 538672711);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-09-2011', 'dd-mm-yyyy'), 'Shipped', 96282692, '1tNiGGui', 326015810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-08-2012', 'dd-mm-yyyy'), 'Confirmed', 95709916, 'oLA7UA54YWNhS', 535955532);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-07-2000', 'dd-mm-yyyy'), 'Delivered', 3412244, 'HtnOeSYpnIZVME4iV3iQ', 30555406);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-04-1989', 'dd-mm-yyyy'), 'Shipped', 77193785, 'l0QMqPVviwO', 53772964);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-12-2021', 'dd-mm-yyyy'), 'Delivered', 70771400, 'PEvFaHp2d1dje3W', 418533018);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-08-1998', 'dd-mm-yyyy'), 'Cancelled', 88598912, 'mBsyxj', 801617705);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-06-1992', 'dd-mm-yyyy'), 'Delivered', 81965427, 'rOR8HLZLsZ', 903768161);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-08-1991', 'dd-mm-yyyy'), 'Delivered', 67311031, 'u3w0R8Cl1Fv8QXs', 818411449);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-02-2010', 'dd-mm-yyyy'), 'Shipped', 24344192, 'p90c1O03QfZ7v', 252198537);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-02-2005', 'dd-mm-yyyy'), 'Delivered', 99043331, 'NgT4v96snEAgIWk', 472328295);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-09-2005', 'dd-mm-yyyy'), 'Shipped', 9134812, 'GsDZhMfgwre2HaL2cUx', 724341650);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-07-1988', 'dd-mm-yyyy'), 'Cancelled', 20535850, 'GzGOi', 182188298);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-01-2006', 'dd-mm-yyyy'), 'Confirmed', 74917612, '4YWArQOQRlMSlAUeo', 113966335);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-06-2003', 'dd-mm-yyyy'), 'Delivered', 19467972, '2AJSKaD1lH2NyOtlvWL', 667870421);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-03-2009', 'dd-mm-yyyy'), 'Shipped', 81220383, 'eKkEScUDardbtYpjh', 218589282);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-05-1995', 'dd-mm-yyyy'), 'Cancelled', 10396520, 'vesDkRnpf1s4VJmUm2RK', 697632951);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-01-1993', 'dd-mm-yyyy'), 'Cancelled', 45285022, '13lptw', 53772964);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-06-2018', 'dd-mm-yyyy'), 'Confirmed', 37102946, 'huclSuh6x', 387197471);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-11-2015', 'dd-mm-yyyy'), 'Delivered', 95607052, 'WnujvlBY', 171177123);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-03-1992', 'dd-mm-yyyy'), 'Confirmed', 11099085, 'A5ZxNc', 313351240);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-07-2009', 'dd-mm-yyyy'), 'Confirmed', 8202435, 'KgoWfOq', 310574622);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-01-1991', 'dd-mm-yyyy'), 'Cancelled', 81968405, 'DF0CAhzFjyP6PSAtE', 743616054);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-06-1985', 'dd-mm-yyyy'), 'Confirmed', 93070220, 'lH4SOOCN', 695794500);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-06-1986', 'dd-mm-yyyy'), 'Delivered', 15674526, '0go77rhhgR', 857340698);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-04-2012', 'dd-mm-yyyy'), 'Cancelled', 12766559, 'kuza0JrnwKrmWXMss6P', 695448905);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-12-2000', 'dd-mm-yyyy'), 'Delivered', 32956906, 'fPoB9CeCvabs7e79nc', 252198537);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-02-2007', 'dd-mm-yyyy'), 'Confirmed', 27788186, 'JxuScWdBwzxZ', 503044571);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-08-1995', 'dd-mm-yyyy'), 'Cancelled', 2573692, 'uuTDoRy4', 229270562);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-05-2018', 'dd-mm-yyyy'), 'Delivered', 5277842, 'WWhYFd', 718863475);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-12-2008', 'dd-mm-yyyy'), 'Delivered', 64894395, '5KwWA1VBbGs5vb', 285406677);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-08-2001', 'dd-mm-yyyy'), 'Delivered', 71066670, 'kuza0JrnwKrmWXMss6P', 254337249);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-05-1989', 'dd-mm-yyyy'), 'Shipped', 14125204, 'XoBaekIhHBrnDRaB', 726733463);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-10-2007', 'dd-mm-yyyy'), 'Confirmed', 932098, 'mF35ulSJPjIRBXP6oTY', 77356053);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-05-1999', 'dd-mm-yyyy'), 'Cancelled', 13566391, 'DRVvFrGnuAuko', 183564255);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 'Confirmed', 86461126, '84sd6ODb', 49645763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-09-2012', 'dd-mm-yyyy'), 'Shipped', 22831334, '9eOvoUGBDswRys', 887258465);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-01-1990', 'dd-mm-yyyy'), 'Confirmed', 37248483, 'SdgFTVfv7', 49645763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-03-2011', 'dd-mm-yyyy'), 'Confirmed', 94132647, '5nti7eUCmMzHHFB', 778607716);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-05-2000', 'dd-mm-yyyy'), 'Shipped', 13953420, 'ceElbQ', 635456467);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-07-2010', 'dd-mm-yyyy'), 'Delivered', 67713424, 'Vcgr6GVnOzpakuxen3H', 579812763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-07-2001', 'dd-mm-yyyy'), 'Shipped', 36333117, 'fMGxcEydXlKa0a', 995459581);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-10-2015', 'dd-mm-yyyy'), 'Shipped', 75254649, 'FDp4S', 75859989);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-07-1998', 'dd-mm-yyyy'), 'Shipped', 73337354, 'wZo8nHMtT', 527539278);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-08-1997', 'dd-mm-yyyy'), 'Shipped', 38142222, 'BEBVY2aOsDg4', 614511329);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-12-2007', 'dd-mm-yyyy'), 'Shipped', 75097256, 'RLDXS6', 921457925);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-06-2017', 'dd-mm-yyyy'), 'Delivered', 21546976, 'avsWLMOZqw6GXEMU', 625051968);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-10-2018', 'dd-mm-yyyy'), 'Delivered', 49043244, 'C5gZwOWYL', 167601443);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-10-2003', 'dd-mm-yyyy'), 'Confirmed', 29845052, 'efNRJJ6OsLJS9YaL', 396086390);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-04-2005', 'dd-mm-yyyy'), 'Cancelled', 84734710, 'hg5gwgMZBjk7NX', 447216171);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-02-2022', 'dd-mm-yyyy'), 'Confirmed', 14121447, 'yRbKHUEwhkWcs', 767454043);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-03-1993', 'dd-mm-yyyy'), 'Delivered', 31644234, 'ZjKjD', 970471522);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-06-1996', 'dd-mm-yyyy'), 'Confirmed', 14519788, 'ZHbrPC4hK', 849293865);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-07-2017', 'dd-mm-yyyy'), 'Confirmed', 24558295, 'DyXDwvO', 352927052);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-04-2004', 'dd-mm-yyyy'), 'Confirmed', 61056393, 'w7lZpT5Gbeu', 53772964);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-04-2013', 'dd-mm-yyyy'), 'Shipped', 35875151, 'OWheS1Q4E', 557946746);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-11-2022', 'dd-mm-yyyy'), 'Cancelled', 57848355, 'SP9tnAyygr', 786920820);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-01-1999', 'dd-mm-yyyy'), 'Delivered', 7875506, '3PekGzTz8', 68607357);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-06-2009', 'dd-mm-yyyy'), 'Confirmed', 37507044, 'DUGJl', 586367613);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-02-1992', 'dd-mm-yyyy'), 'Confirmed', 85762413, 'yRbKHUEwhkWcs', 326015810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-08-1992', 'dd-mm-yyyy'), 'Delivered', 30203355, 'iwsUl4nzoOt55', 96954562);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-04-2017', 'dd-mm-yyyy'), 'Delivered', 15660875, 'rOR8HLZLsZ', 841610087);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-12-2016', 'dd-mm-yyyy'), 'Delivered', 65278457, '5FjlyC4SJBPLffp', 236715300);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-02-2007', 'dd-mm-yyyy'), 'Cancelled', 79423328, 'ApK8g4iBhI', 765334130);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-03-2020', 'dd-mm-yyyy'), 'Confirmed', 7502096, 'UBCsxbFnHCgje3eLpg', 250798833);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-05-1995', 'dd-mm-yyyy'), 'Cancelled', 6255958, 'r6ds5wx6', 104798728);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-03-2002', 'dd-mm-yyyy'), 'Delivered', 18913413, 'SabObpz', 67462170);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-07-2002', 'dd-mm-yyyy'), 'Cancelled', 93679893, 'JJa828', 581213711);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-06-2007', 'dd-mm-yyyy'), 'Delivered', 59466669, 'eU9K15aClF44lhi', 485215833);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-03-2014', 'dd-mm-yyyy'), 'Shipped', 5010730, 'ZjKjD', 809810518);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-02-1999', 'dd-mm-yyyy'), 'Confirmed', 20993916, 'x6EV5wgS3FjhYJiKk', 555179349);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-09-2011', 'dd-mm-yyyy'), 'Delivered', 91484341, 'xkIJibDar2wgWeCZLm', 212462423);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-02-1986', 'dd-mm-yyyy'), 'Cancelled', 84842889, '7yBWvJCDJo', 30847668);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-04-2015', 'dd-mm-yyyy'), 'Cancelled', 17524321, 'gVS6Wpd0Xj190V17We', 648714096);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-10-2002', 'dd-mm-yyyy'), 'Delivered', 11981722, 'dNs9FBzO44', 860651444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-10-2019', 'dd-mm-yyyy'), 'Delivered', 18046399, 's7DuJdcNj9luFgO', 70946112);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-06-2020', 'dd-mm-yyyy'), 'Cancelled', 35781059, 'TpIvnSS9wNGnKqp1', 697511693);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-01-2023', 'dd-mm-yyyy'), 'Cancelled', 43484496, 'm0nRHdT4YSxnp4HC', 525161276);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-02-1992', 'dd-mm-yyyy'), 'Cancelled', 68120015, 'NNyGPFyUfq8', 403748797);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-05-1986', 'dd-mm-yyyy'), 'Delivered', 86708427, 'To1Szckbx1N', 797347517);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-05-1989', 'dd-mm-yyyy'), 'Delivered', 36870452, 'mA570i9Zreotgh', 901694862);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-08-2007', 'dd-mm-yyyy'), 'Shipped', 80948049, 'vUrlc59', 645218925);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-12-1991', 'dd-mm-yyyy'), 'Shipped', 42355556, 'K5uzSKftSbu3', 800215934);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-07-1987', 'dd-mm-yyyy'), 'Cancelled', 36808275, 'kj2EE', 605493473);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-05-2009', 'dd-mm-yyyy'), 'Delivered', 84793636, 'ebaTVhsjqrrUD', 147255716);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-01-1987', 'dd-mm-yyyy'), 'Delivered', 15534926, 'sKxX2N8GHHNMD', 94803718);
commit;
prompt 200 records committed...
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-10-2015', 'dd-mm-yyyy'), 'Shipped', 38991205, '4WftvQX5qIxQp', 460820324);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-09-1998', 'dd-mm-yyyy'), 'Delivered', 91829782, 'vesDkRnpf1s4VJmUm2RK', 649663400);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-08-2016', 'dd-mm-yyyy'), 'Cancelled', 23832125, 'caz5tMxy', 326015810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-09-2009', 'dd-mm-yyyy'), 'Shipped', 38112888, '4Gtv8KLvIxOE', 974340983);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-04-2008', 'dd-mm-yyyy'), 'Delivered', 78248961, 'HzgJGmNAbUXk38dO5y', 759846707);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-04-1997', 'dd-mm-yyyy'), 'Cancelled', 7582585, 'MoSfxstUcnDKU6lO4', 285583312);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-11-1989', 'dd-mm-yyyy'), 'Cancelled', 33595844, 'fepI53AbOp98th5kBsP', 913882055);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-03-2017', 'dd-mm-yyyy'), 'Confirmed', 77982197, 'mWJOncL1byyyODJ', 695448905);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-11-1987', 'dd-mm-yyyy'), 'Delivered', 26997527, 'lv3J0vkG6qgZVxh', 433082953);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-07-2024', 'dd-mm-yyyy'), 'Delivered', 20823584, 'u2pW7TPhh997W5', 426293381);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-09-2012', 'dd-mm-yyyy'), 'Cancelled', 53300331, 'wCxUWODRBD', 429462199);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-08-1986', 'dd-mm-yyyy'), 'Delivered', 49239522, 'kbfUk1', 387197471);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-10-1988', 'dd-mm-yyyy'), 'Delivered', 69915317, 'eJAbxEAWAODv', 813278022);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-10-2008', 'dd-mm-yyyy'), 'Delivered', 36179824, 'NWfALCL', 709087072);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-01-2016', 'dd-mm-yyyy'), 'Delivered', 70923580, '4O8qMQGMD8BK5neKR', 622885155);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-12-1992', 'dd-mm-yyyy'), 'Confirmed', 3459212, 'PEvFaHp2d1dje3W', 186729997);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-04-2004', 'dd-mm-yyyy'), 'Delivered', 64630390, 'v3c6Vp9NkeJTpH', 218589282);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-08-1987', 'dd-mm-yyyy'), 'Cancelled', 46021300, '2mlbGwxNAIdMCHv', 58645243);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-08-2000', 'dd-mm-yyyy'), 'Delivered', 79022354, 'DPbvPoP81sRA', 905880078);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-09-1991', 'dd-mm-yyyy'), 'Delivered', 54772098, 'NWfALCL', 564890327);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-06-2008', 'dd-mm-yyyy'), 'Cancelled', 34780563, 'fTnJQuFgFMt', 206031166);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-02-2010', 'dd-mm-yyyy'), 'Shipped', 9843597, 'gVS6Wpd0Xj190V17We', 783732680);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-10-2019', 'dd-mm-yyyy'), 'Shipped', 86683782, 'v3c6Vp9NkeJTpH', 590709480);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-08-2001', 'dd-mm-yyyy'), 'Delivered', 17313388, 'fnqbqk5Hc', 514935755);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-03-2019', 'dd-mm-yyyy'), 'Cancelled', 9744258, 's7DuJdcNj9luFgO', 903967705);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-11-1999', 'dd-mm-yyyy'), 'Confirmed', 82247827, 'pbZHBfhB', 977868232);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-06-2001', 'dd-mm-yyyy'), 'Confirmed', 23913244, 'kj2EE', 167601443);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-08-2006', 'dd-mm-yyyy'), 'Delivered', 48990599, 'HeVQCWzZ9', 999197659);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-06-2000', 'dd-mm-yyyy'), 'Cancelled', 36391557, '5nti7eUCmMzHHFB', 289948301);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-02-2017', 'dd-mm-yyyy'), 'Shipped', 20534518, 'A5M9o7', 828464731);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-03-2011', 'dd-mm-yyyy'), 'Delivered', 2713223, 'lv3J0vkG6qgZVxh', 781661616);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-10-2018', 'dd-mm-yyyy'), 'Cancelled', 70139959, 'yYAJyGCqXb7vl2h6', 283092402);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-09-2004', 'dd-mm-yyyy'), 'Confirmed', 28333425, 'vesDkRnpf1s4VJmUm2RK', 622885155);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-06-2001', 'dd-mm-yyyy'), 'Delivered', 756562, '5KwWA1VBbGs5vb', 941367064);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-06-1994', 'dd-mm-yyyy'), 'Delivered', 31093161, 'Ik5XZjfg4j1D', 254337249);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-10-2020', 'dd-mm-yyyy'), 'Confirmed', 71891104, 'rZPeO5TZPrRTiU', 143641086);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-11-1995', 'dd-mm-yyyy'), 'Confirmed', 35793153, 'iwsUl4nzoOt55', 578001438);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-01-1994', 'dd-mm-yyyy'), 'Shipped', 83590342, 'To1Szckbx1N', 578768369);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-10-1998', 'dd-mm-yyyy'), 'Shipped', 319827, 'rKK4KShxZPgJ', 781222035);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-03-1988', 'dd-mm-yyyy'), 'Confirmed', 4454684, 'xszMQoftG4yAaaV', 226396725);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-04-1991', 'dd-mm-yyyy'), 'Cancelled', 51611421, '9K2xbESdFQA', 695448905);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-07-2000', 'dd-mm-yyyy'), 'Delivered', 60330653, '9Bp4W1', 71042379);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-11-1996', 'dd-mm-yyyy'), 'Shipped', 19787948, '3uVOvXjoI5t3GYt', 830995985);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-01-1992', 'dd-mm-yyyy'), 'Confirmed', 56892164, 'Z9WzldUs', 352927052);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-04-2004', 'dd-mm-yyyy'), 'Delivered', 49826183, 'gqTy9', 648714096);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-02-2013', 'dd-mm-yyyy'), 'Shipped', 39596245, 'QNUoZrNrfy1M', 100146275);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-10-1988', 'dd-mm-yyyy'), 'Cancelled', 94131062, '60IPScQUKUVi5b24', 811868236);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-07-2021', 'dd-mm-yyyy'), 'Confirmed', 19689044, 'KgoWfOq', 830995985);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-02-1987', 'dd-mm-yyyy'), 'Cancelled', 35104166, 'GT8uD0w8nuKC7Geg', 578768369);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-06-1993', 'dd-mm-yyyy'), 'Delivered', 40201837, 'kbLRp6zL4', 995459581);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 'Delivered', 63516351, 'bn5dwpaCur', 152785808);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-04-2006', 'dd-mm-yyyy'), 'Shipped', 59958280, 'xEV30pv9QAAIq11', 802032568);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-06-1992', 'dd-mm-yyyy'), 'Cancelled', 8427743, '7cAlQ4xO4HX44', 386601355);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-05-1986', 'dd-mm-yyyy'), 'Cancelled', 39630061, 'DF0CAhzFjyP6PSAtE', 913882055);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-09-2002', 'dd-mm-yyyy'), 'Shipped', 3940825, 'UA3tBh4Ox5LiunrMhWL', 759846707);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-03-2006', 'dd-mm-yyyy'), 'Cancelled', 31475401, 'j13hBfVGllQ', 372535135);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-10-1986', 'dd-mm-yyyy'), 'Cancelled', 68439573, 'lPtzDccAve', 271472128);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-09-2007', 'dd-mm-yyyy'), 'Cancelled', 91418947, '75bw5JfJ9gkDin', 52113672);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-03-1998', 'dd-mm-yyyy'), 'Shipped', 44214249, 'patPOO1Fs41yrgu1usZ', 418533018);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-02-2019', 'dd-mm-yyyy'), 'Delivered', 47468417, 'ioBX4GJ', 706565361);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-05-2014', 'dd-mm-yyyy'), 'Cancelled', 32850655, 'oLA7UA54YWNhS', 843572655);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-11-1995', 'dd-mm-yyyy'), 'Cancelled', 30957316, 'TaYn1FG8NIjjj2', 413572810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-02-2016', 'dd-mm-yyyy'), 'Cancelled', 47521586, '9uoHhxhnk', 654789354);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-10-2015', 'dd-mm-yyyy'), 'Cancelled', 28615285, 'VJebe', 767454043);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-07-1999', 'dd-mm-yyyy'), 'Cancelled', 81778002, 'kbLRp6zL4', 178298318);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-01-2008', 'dd-mm-yyyy'), 'Cancelled', 78077779, 'uuPxV7yUuY9Jgk', 245698211);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-05-2000', 'dd-mm-yyyy'), 'Shipped', 29573119, 'znEQ5XkWeCghTAFlHkQ', 271472128);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-03-2013', 'dd-mm-yyyy'), 'Confirmed', 28839411, '9Jl6y6jZ9Uf', 701955008);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-05-2011', 'dd-mm-yyyy'), 'Shipped', 63706177, '998rww', 378113125);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-11-2016', 'dd-mm-yyyy'), 'Shipped', 83693057, 'ntoPCwDa9dcu0Epy', 584321723);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-01-1991', 'dd-mm-yyyy'), 'Delivered', 5911534, 'SabObpz', 724031814);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-04-1995', 'dd-mm-yyyy'), 'Delivered', 83810422, 'ebaTVhsjqrrUD', 610153570);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-06-2006', 'dd-mm-yyyy'), 'Cancelled', 87020683, 'uhyYWGE1ks', 765334130);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-02-2013', 'dd-mm-yyyy'), 'Cancelled', 30510415, '4YWArQOQRlMSlAUeo', 291567036);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-11-1986', 'dd-mm-yyyy'), 'Cancelled', 95116153, 'w7lZpT5Gbeu', 341079822);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-01-2015', 'dd-mm-yyyy'), 'Confirmed', 1135811, 'ApK8g4iBhI', 640850868);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-04-2011', 'dd-mm-yyyy'), 'Cancelled', 97784291, '4BDcK', 285406677);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-12-1987', 'dd-mm-yyyy'), 'Confirmed', 45090836, '60IPScQUKUVi5b24', 699483958);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-07-2007', 'dd-mm-yyyy'), 'Cancelled', 70729245, 'DyXDwvO', 783732680);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-06-2017', 'dd-mm-yyyy'), 'Confirmed', 98424825, 'yLHHOQXyYtS', 489421374);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-08-2024', 'dd-mm-yyyy'), 'Shipped', 42162764, 'v3c6Vp9NkeJTpH', 886405503);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-07-1995', 'dd-mm-yyyy'), 'Delivered', 78557666, 'j13hBfVGllQ', 648714096);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-08-1996', 'dd-mm-yyyy'), 'Shipped', 26009503, 'uuPxV7yUuY9Jgk', 233983651);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-08-2021', 'dd-mm-yyyy'), 'Confirmed', 13261211, 'niXMyr4iNND5u', 543595210);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-03-2000', 'dd-mm-yyyy'), 'Confirmed', 54060680, 'BC0v9', 640850868);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-07-2015', 'dd-mm-yyyy'), 'Delivered', 8750474, 'reMWqvmZSqLhoT', 960039000);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-09-2003', 'dd-mm-yyyy'), 'Cancelled', 44861482, 'tZ8tzPXk3xJW', 813006444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-05-2023', 'dd-mm-yyyy'), 'Confirmed', 75336042, 'meyftpS', 306726335);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-03-1989', 'dd-mm-yyyy'), 'Cancelled', 45394940, 'SabObpz', 183564255);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-08-2015', 'dd-mm-yyyy'), 'Delivered', 745614, '0TjegPfE', 653930286);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-12-2006', 'dd-mm-yyyy'), 'Delivered', 4447109, 's46DQ', 790675836);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-12-2017', 'dd-mm-yyyy'), 'Delivered', 42645635, 'jGfQBVc', 767454043);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-06-2002', 'dd-mm-yyyy'), 'Cancelled', 4644013, 'DPbvPoP81sRA', 55247198);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-02-2014', 'dd-mm-yyyy'), 'Confirmed', 57963664, 'ayiAopL4gP', 378113125);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-09-2015', 'dd-mm-yyyy'), 'Delivered', 82025217, 'w2jOSiPGCr7WgX', 955153001);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-03-2022', 'dd-mm-yyyy'), 'Confirmed', 42168146, 'esTnJzqwfJDb1RN', 489421374);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-06-1993', 'dd-mm-yyyy'), 'Delivered', 43872554, '75bw5JfJ9gkDin', 880269651);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-03-2022', 'dd-mm-yyyy'), 'Cancelled', 44551303, 'i503jW', 579812763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-01-2013', 'dd-mm-yyyy'), 'Confirmed', 67594068, 'rLjpthHhC42', 907657057);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-04-2017', 'dd-mm-yyyy'), 'Confirmed', 55137836, 'mWJOncL1byyyODJ', 99081825);
commit;
prompt 300 records committed...
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-04-2000', 'dd-mm-yyyy'), 'Shipped', 51293928, '2mlbGwxNAIdMCHv', 823688721);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-08-1986', 'dd-mm-yyyy'), 'Confirmed', 81096456, 'ZWhDELT9', 921457925);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-02-2018', 'dd-mm-yyyy'), 'Cancelled', 38520477, 'w2jOSiPGCr7WgX', 447216171);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-03-2011', 'dd-mm-yyyy'), 'Delivered', 38447189, 'awo1zeJDqe5pB2IH', 678963997);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-10-2008', 'dd-mm-yyyy'), 'Cancelled', 77228790, 'HzgJGmNAbUXk38dO5y', 811868236);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-01-2012', 'dd-mm-yyyy'), 'Delivered', 15689341, 'rtMnU8KgjznGzIya', 558762014);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-07-1988', 'dd-mm-yyyy'), 'Shipped', 77949744, '9eOvoUGBDswRys', 699483958);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-01-2021', 'dd-mm-yyyy'), 'Shipped', 47103379, 'Fuip7yW7C', 790675836);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-04-2014', 'dd-mm-yyyy'), 'Confirmed', 17311818, 'WnujvlBY', 872139325);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-10-2023', 'dd-mm-yyyy'), 'Confirmed', 3264965, 'rmL6pF1xzE0CXbmMXGwU', 433082953);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-03-2003', 'dd-mm-yyyy'), 'Cancelled', 31956739, 'iRUMWL48OfoYikw', 678963997);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-09-2015', 'dd-mm-yyyy'), 'Cancelled', 81740481, 'IV6LHymz8dxpBl4Ksk8M', 49645763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-09-2004', 'dd-mm-yyyy'), 'Confirmed', 59291771, 'PEvFaHp2d1dje3W', 503044571);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-01-1990', 'dd-mm-yyyy'), 'Confirmed', 49472824, 'niXMyr4iNND5u', 614511329);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-10-2004', 'dd-mm-yyyy'), 'Delivered', 45279131, '0TjegPfE', 380924269);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-07-2018', 'dd-mm-yyyy'), 'Delivered', 83461037, 'CmMPpaq01RvX75', 326084240);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-12-2022', 'dd-mm-yyyy'), 'Cancelled', 78075987, 'MoSfxstUcnDKU6lO4', 800215934);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-08-2024', 'dd-mm-yyyy'), 'Delivered', 12713400, '7o16Pakj1yk2IVhb', 622885155);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-10-2021', 'dd-mm-yyyy'), 'Cancelled', 87534626, '9uoHhxhnk', 211972209);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-05-2009', 'dd-mm-yyyy'), 'Confirmed', 46759155, 'nNDlS', 91525539);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-01-1989', 'dd-mm-yyyy'), 'Shipped', 93904489, 'fqT76S', 30555406);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-04-2009', 'dd-mm-yyyy'), 'Cancelled', 80469401, 'ApK8g4iBhI', 695176722);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-08-1991', 'dd-mm-yyyy'), 'Confirmed', 88673677, 'W8EtgraF', 294682564);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-06-1987', 'dd-mm-yyyy'), 'Delivered', 95131625, 'ayiAopL4gP', 706565361);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-01-2003', 'dd-mm-yyyy'), 'Shipped', 99989634, 'wZ9FVn5OTHfXXEt', 781661616);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-04-2016', 'dd-mm-yyyy'), 'Shipped', 47624337, 'kbLRp6zL4', 104798728);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-07-2022', 'dd-mm-yyyy'), 'Cancelled', 9375980, '8bFimDd6wO2cs52', 767454043);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-09-1993', 'dd-mm-yyyy'), 'Shipped', 40680942, '5Pugej74Y', 741699972);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-05-2007', 'dd-mm-yyyy'), 'Delivered', 82227944, 'WbtXqWEhg', 236413817);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-12-2010', 'dd-mm-yyyy'), 'Delivered', 82942028, 'vesDkRnpf1s4VJmUm2RK', 590709480);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-10-2016', 'dd-mm-yyyy'), 'Cancelled', 69118871, 'U4HZ6wO6C4qqwmNZLZb', 996860585);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-06-2013', 'dd-mm-yyyy'), 'Cancelled', 57078677, 'y2gvO9PwXWz823NA', 256087782);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-05-2009', 'dd-mm-yyyy'), 'Cancelled', 38825059, 'NNyGPFyUfq8', 667870421);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-01-1994', 'dd-mm-yyyy'), 'Delivered', 24260195, '1tNiGGui', 454903735);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-05-2012', 'dd-mm-yyyy'), 'Delivered', 55380769, 'UVeEs4uENDs', 85403893);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-07-1998', 'dd-mm-yyyy'), 'Shipped', 85082304, '5nti7eUCmMzHHFB', 243170713);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-09-2023', 'dd-mm-yyyy'), 'Shipped', 83876900, 't4Q2YvwxLFU3Vtd26', 557121653);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 'Confirmed', 95217455, 'Ckfgqq', 18493438);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-03-2006', 'dd-mm-yyyy'), 'Confirmed', 97006839, 'bkcX6KjCtUVACAbYVaHL', 67462170);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-05-2010', 'dd-mm-yyyy'), 'Cancelled', 18369828, '4dkM1', 773891413);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-12-2014', 'dd-mm-yyyy'), 'Confirmed', 26616934, 'tewksGvn1', 977868232);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-02-2001', 'dd-mm-yyyy'), 'Cancelled', 82488690, 'ln9Pkkn', 978368209);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-04-2016', 'dd-mm-yyyy'), 'Delivered', 10673571, '92sVxCx94Kn9OArG0hJ', 191493666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-10-2001', 'dd-mm-yyyy'), 'Cancelled', 95236434, '6RgjjeBDNWV6FBzm6SfT', 338495564);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-01-2000', 'dd-mm-yyyy'), 'Cancelled', 43010294, 'qgdsCPmjaeUuj6ufA93', 992433442);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-10-2006', 'dd-mm-yyyy'), 'Shipped', 82810687, 'yLHHOQXyYtS', 581213711);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 'Shipped', 89017252, 'WbtXqWEhg', 335445396);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-03-2000', 'dd-mm-yyyy'), 'Delivered', 78427943, 'meyftpS', 291567036);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-11-1990', 'dd-mm-yyyy'), 'Delivered', 92505465, 'yRbKHUEwhkWcs', 813278022);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-02-2009', 'dd-mm-yyyy'), 'Cancelled', 63396612, 'wlgBZsn3zsGSfggCCONk', 18493438);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-05-1997', 'dd-mm-yyyy'), 'Cancelled', 6667369, 'tZJByHfK2H48GXJXUfbZ', 183564255);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-06-2009', 'dd-mm-yyyy'), 'Shipped', 72517714, 'bAHUvhStSz3i6Er', 62572520);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-08-2016', 'dd-mm-yyyy'), 'Shipped', 11788255, 'pOqXY7TWny', 252198537);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-12-2003', 'dd-mm-yyyy'), 'Confirmed', 10705744, 'KcNu142gEWV85Su', 756146155);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-06-1992', 'dd-mm-yyyy'), 'Confirmed', 6732852, 'jw0wNWspqb8vq2hYh0', 706565361);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-12-1992', 'dd-mm-yyyy'), 'Delivered', 68583117, 'tALoNOkVix2CrWkVC', 437040180);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-05-1986', 'dd-mm-yyyy'), 'Shipped', 37030210, '88yPbRpcV55h', 985710298);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-08-1997', 'dd-mm-yyyy'), 'Confirmed', 15900097, 'ESUGvF3ZzfxQitDjKHW', 765451524);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-11-2016', 'dd-mm-yyyy'), 'Cancelled', 72066337, 'CmMPpaq01RvX75', 306296821);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-09-2015', 'dd-mm-yyyy'), 'Shipped', 87264685, 'ln9Pkkn', 901694862);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-09-1991', 'dd-mm-yyyy'), 'Cancelled', 97732505, 'CMO153RT0bJw8coJDSnb', 765451524);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-06-1989', 'dd-mm-yyyy'), 'Confirmed', 71374043, 'K0dwf4yUKrX2SYx2', 903768161);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-10-2011', 'dd-mm-yyyy'), 'Cancelled', 57174907, '3hDAkmE03Hxj', 245149638);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-11-1986', 'dd-mm-yyyy'), 'Confirmed', 24198353, 'Bd8vC5gZa', 30555406);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-10-2008', 'dd-mm-yyyy'), 'Cancelled', 37482960, 'egzONb2LD', 856251055);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-05-1994', 'dd-mm-yyyy'), 'Confirmed', 7095056, '0go77rhhgR', 236413817);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-04-1994', 'dd-mm-yyyy'), 'Confirmed', 21596412, '6tJAUA9dpvWbhD6', 950081028);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-09-2002', 'dd-mm-yyyy'), 'Confirmed', 59638072, 'VJebe', 698086866);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-08-2001', 'dd-mm-yyyy'), 'Cancelled', 2501470, 'pbZHBfhB', 413572810);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-03-1985', 'dd-mm-yyyy'), 'Shipped', 50729064, '7eFkVRbVGjose', 310152730);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-05-2000', 'dd-mm-yyyy'), 'Shipped', 57516103, 'U4HZ6wO6C4qqwmNZLZb', 168578057);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-05-2008', 'dd-mm-yyyy'), 'Shipped', 13060099, 'NWfALCL', 440380246);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-08-2023', 'dd-mm-yyyy'), 'Cancelled', 65752379, '0TjegPfE', 557367484);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-04-1995', 'dd-mm-yyyy'), 'Delivered', 85601894, 'opzxANskyIaGNm', 476794708);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-01-1987', 'dd-mm-yyyy'), 'Confirmed', 63273503, '3hDAkmE03Hxj', 605493473);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-12-2020', 'dd-mm-yyyy'), 'Shipped', 47794757, 'ks860aAZVqoj5FC', 706565361);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-12-2000', 'dd-mm-yyyy'), 'Cancelled', 168355, 'GT8uD0w8nuKC7Geg', 851760809);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-12-2020', 'dd-mm-yyyy'), 'Delivered', 44917352, '88yPbRpcV55h', 130124668);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-11-2014', 'dd-mm-yyyy'), 'Confirmed', 77152444, 'kj2EE', 837922190);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-10-1991', 'dd-mm-yyyy'), 'Delivered', 60805569, '3hDAkmE03Hxj', 293534214);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('31-05-1994', 'dd-mm-yyyy'), 'Delivered', 68844623, 'rtMnU8KgjznGzIya', 697632951);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('26-03-2004', 'dd-mm-yyyy'), 'Shipped', 46470862, 'uuPxV7yUuY9Jgk', 243170713);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-09-1990', 'dd-mm-yyyy'), 'Delivered', 57334325, 'ewlY8x2pQENCoR1MO', 974033150);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-12-1988', 'dd-mm-yyyy'), 'Delivered', 99841712, 'Kp9vETCsnfg7BNE82Gi', 579812763);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-05-2022', 'dd-mm-yyyy'), 'Shipped', 86344203, 'HzgJGmNAbUXk38dO5y', 386601355);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-12-2014', 'dd-mm-yyyy'), 'Delivered', 49096530, 'caz5tMxy', 449609844);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-12-2009', 'dd-mm-yyyy'), 'Shipped', 97586391, '2y5V0jxRs9HhPqLeq', 718066745);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-10-2019', 'dd-mm-yyyy'), 'Cancelled', 51249559, 'nsjfIMpJ1LzgJWsQH', 765451524);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-12-2002', 'dd-mm-yyyy'), 'Delivered', 73978250, 'fnqbqk5Hc', 654789354);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-06-1993', 'dd-mm-yyyy'), 'Delivered', 64301597, 'GGNLDSz1M88ISNtIQZHr', 378113125);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-02-2019', 'dd-mm-yyyy'), 'Confirmed', 66275471, 'GFRYYM4p', 838963088);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-05-2013', 'dd-mm-yyyy'), 'Confirmed', 80930041, 'nq7uC6cU2Hkr56LsG2', 306296821);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-08-2016', 'dd-mm-yyyy'), 'Cancelled', 84825384, 'rtMnU8KgjznGzIya', 872139325);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-03-2013', 'dd-mm-yyyy'), 'Delivered', 69162693, '2y5V0jxRs9HhPqLeq', 117289194);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-05-1998', 'dd-mm-yyyy'), 'Confirmed', 49514633, '2y5V0jxRs9HhPqLeq', 452175112);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-01-2003', 'dd-mm-yyyy'), 'Delivered', 48764434, 'GzGOi', 231650707);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-12-2008', 'dd-mm-yyyy'), 'Cancelled', 9310443, 'To1Szckbx1N', 426293381);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-01-2023', 'dd-mm-yyyy'), 'Shipped', 23160789, 'tZJByHfK2H48GXJXUfbZ', 454903735);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 'Cancelled', 20646359, 'tZ8tzPXk3xJW', 168578057);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-12-1988', 'dd-mm-yyyy'), 'Cancelled', 87196277, 'lPtzDccAve', 354357944);
commit;
prompt 400 records loaded
prompt Loading READER...
insert into READER (readername, readernumber, phone)
values ('Sona Stone', 3472472, '058-8605740');
insert into READER (readername, readernumber, phone)
values ('Lois Guzman', 2455037, '052-1366645');
insert into READER (readername, readernumber, phone)
values ('Lindsey Black', 7731665, '051-5743606');
insert into READER (readername, readernumber, phone)
values ('Lila Whitley', 9813691, '059-5614817');
insert into READER (readername, readernumber, phone)
values ('Sonny Hayek', 1948058, '059-2446166');
insert into READER (readername, readernumber, phone)
values ('Eugene Channing', 4027121, '056-7306864');
insert into READER (readername, readernumber, phone)
values ('Joey Reiner', 2619943, '056-7081674');
insert into READER (readername, readernumber, phone)
values ('Gena Madsen', 9034535, '059-8505222');
insert into READER (readername, readernumber, phone)
values ('Trini Dreyfuss', 9715811, '052-0945217');
insert into READER (readername, readernumber, phone)
values ('Buffy Russell', 4747229, '058-2243785');
insert into READER (readername, readernumber, phone)
values ('Hector Hudson', 6955657, '053-1950177');
insert into READER (readername, readernumber, phone)
values ('Lucinda Lunch', 2424703, '050-6007379');
insert into READER (readername, readernumber, phone)
values ('Paul Williams', 5226870, '054-4337117');
insert into READER (readername, readernumber, phone)
values ('Gerald Sylvian', 9185773, '051-3023054');
insert into READER (readername, readernumber, phone)
values ('Jamie Parker', 6555536, '051-4099056');
insert into READER (readername, readernumber, phone)
values ('Julianne Cozier', 1277460, '051-7704789');
insert into READER (readername, readernumber, phone)
values ('Cameron Michaels', 8702253, '050-6527945');
insert into READER (readername, readernumber, phone)
values ('Morgan Minogue', 1770518, '056-2603593');
insert into READER (readername, readernumber, phone)
values ('Harry Foster', 7766836, '050-0408629');
insert into READER (readername, readernumber, phone)
values ('Johnette DiCaprio', 2217974, '056-9442943');
insert into READER (readername, readernumber, phone)
values ('Adam Meyer', 7430534, '058-1106909');
insert into READER (readername, readernumber, phone)
values ('Lauren Knight', 2779035, '052-1448235');
insert into READER (readername, readernumber, phone)
values ('Nicky Worrell', 2322070, '051-6221405');
insert into READER (readername, readernumber, phone)
values ('Lonnie Gugino', 1445614, '054-7279311');
insert into READER (readername, readernumber, phone)
values ('Cherry Zeta-Jones', 4083915, '053-8148378');
insert into READER (readername, readernumber, phone)
values ('Jodie Hunter', 6151715, '057-5409728');
insert into READER (readername, readernumber, phone)
values ('Demi Rispoli', 5531195, '056-5146931');
insert into READER (readername, readernumber, phone)
values ('Vonda Weber', 3168426, '052-6769481');
insert into READER (readername, readernumber, phone)
values ('Cheech Rock', 1312765, '051-5448209');
insert into READER (readername, readernumber, phone)
values ('Dylan Dench', 6172351, '051-6415641');
insert into READER (readername, readernumber, phone)
values ('Marley Heatherly', 4840030, '050-8128859');
insert into READER (readername, readernumber, phone)
values ('David Root', 6701635, '059-1834254');
insert into READER (readername, readernumber, phone)
values ('Debbie Kristofferson', 4270452, '051-9268158');
insert into READER (readername, readernumber, phone)
values ('Fairuza Kennedy', 3269025, '052-2820204');
insert into READER (readername, readernumber, phone)
values ('Shannyn Moraz', 4877533, '054-2413839');
insert into READER (readername, readernumber, phone)
values ('Sylvester Holiday', 2968258, '059-9564189');
insert into READER (readername, readernumber, phone)
values ('Raul Hiatt', 4565387, '050-6516092');
insert into READER (readername, readernumber, phone)
values ('Rade Lindo', 1386426, '050-3658963');
insert into READER (readername, readernumber, phone)
values ('Dan Skaggs', 9822707, '056-7567085');
insert into READER (readername, readernumber, phone)
values ('Patrick McIntosh', 9581453, '057-7297433');
insert into READER (readername, readernumber, phone)
values ('Rachel O''Sullivan', 5165777, '055-8560136');
insert into READER (readername, readernumber, phone)
values ('Sammy Greenwood', 9160932, '058-9852709');
insert into READER (readername, readernumber, phone)
values ('France Shalhoub', 1970667, '051-3971174');
insert into READER (readername, readernumber, phone)
values ('Udo Ranger', 4302916, '058-5176443');
insert into READER (readername, readernumber, phone)
values ('Danni Guest', 7410828, '052-4757205');
insert into READER (readername, readernumber, phone)
values ('Graham Boone', 1494654, '051-1197396');
insert into READER (readername, readernumber, phone)
values ('Mandy Humphrey', 9449662, '053-9629888');
insert into READER (readername, readernumber, phone)
values ('Rip Garr', 7387202, '058-9015815');
insert into READER (readername, readernumber, phone)
values ('Julia Kweller', 3541134, '050-2145144');
insert into READER (readername, readernumber, phone)
values ('Anne Hopper', 4230878, '053-9710215');
insert into READER (readername, readernumber, phone)
values ('Buddy Knight', 8690641, '058-5036617');
insert into READER (readername, readernumber, phone)
values ('Jose Berkoff', 7638684, '058-6896293');
insert into READER (readername, readernumber, phone)
values ('Freda Cassidy', 4502882, '051-6595969');
insert into READER (readername, readernumber, phone)
values ('Noah Sarsgaard', 2738186, '059-9035967');
insert into READER (readername, readernumber, phone)
values ('Barbara Coyote', 9569541, '058-9857987');
insert into READER (readername, readernumber, phone)
values ('Pamela Ponty', 9828587, '055-1354649');
insert into READER (readername, readernumber, phone)
values ('Howie Heron', 6250062, '053-5484140');
insert into READER (readername, readernumber, phone)
values ('Sinead Laws', 6855471, '055-1400015');
insert into READER (readername, readernumber, phone)
values ('Giancarlo Sinise', 5822543, '050-6125574');
insert into READER (readername, readernumber, phone)
values ('Winona Dillane', 4344273, '053-2836633');
insert into READER (readername, readernumber, phone)
values ('Emily Thompson', 4839572, '054-3208758');
insert into READER (readername, readernumber, phone)
values ('Laurie Caviezel', 7653878, '054-0413331');
insert into READER (readername, readernumber, phone)
values ('Hilary Nelson', 8991623, '059-8212179');
insert into READER (readername, readernumber, phone)
values ('Peter Page', 7343159, '054-3175176');
insert into READER (readername, readernumber, phone)
values ('Shawn Seagal', 1881662, '059-0996421');
insert into READER (readername, readernumber, phone)
values ('Jena Ifans', 3074954, '057-4379134');
insert into READER (readername, readernumber, phone)
values ('Bryan Walsh', 7075277, '059-7145008');
insert into READER (readername, readernumber, phone)
values ('Leon McCabe', 3583229, '057-6385704');
insert into READER (readername, readernumber, phone)
values ('Karen Teng', 7742545, '058-3429476');
insert into READER (readername, readernumber, phone)
values ('Marisa Benet', 6260410, '052-0032707');
insert into READER (readername, readernumber, phone)
values ('Anthony Connelly', 6811828, '050-4086932');
insert into READER (readername, readernumber, phone)
values ('Trace Griggs', 2494684, '055-9924558');
insert into READER (readername, readernumber, phone)
values ('Rip Stigers', 3648110, '055-2045846');
insert into READER (readername, readernumber, phone)
values ('Heather Winter', 9381105, '058-9763714');
insert into READER (readername, readernumber, phone)
values ('Nathan Derringer', 1147084, '059-8008843');
insert into READER (readername, readernumber, phone)
values ('Teri Moss', 4078634, '050-1074357');
insert into READER (readername, readernumber, phone)
values ('Jude Broza', 1467080, '058-3824479');
insert into READER (readername, readernumber, phone)
values ('Alfie MacNeil', 2695145, '058-7359742');
insert into READER (readername, readernumber, phone)
values ('Rose Dillane', 4501918, '058-1222362');
insert into READER (readername, readernumber, phone)
values ('Brendan Duchovny', 4139083, '050-4178676');
insert into READER (readername, readernumber, phone)
values ('Sheena Loveless', 4421744, '057-7829736');
insert into READER (readername, readernumber, phone)
values ('Lili Heald', 5810475, '055-6307516');
insert into READER (readername, readernumber, phone)
values ('Cyndi Skaggs', 9071043, '057-8153303');
insert into READER (readername, readernumber, phone)
values ('Jonathan Brody', 6472183, '050-6334972');
insert into READER (readername, readernumber, phone)
values ('Stevie De Niro', 9328367, '050-1090619');
insert into READER (readername, readernumber, phone)
values ('Rodney Peterson', 8316043, '052-8206101');
insert into READER (readername, readernumber, phone)
values ('Yaphet Hall', 5921907, '055-2756667');
insert into READER (readername, readernumber, phone)
values ('Gina Fierstein', 6906582, '053-5182266');
insert into READER (readername, readernumber, phone)
values ('Pierce Worrell', 8510484, '059-8418883');
insert into READER (readername, readernumber, phone)
values ('Casey Lucas', 3415486, '054-2512488');
insert into READER (readername, readernumber, phone)
values ('Rik Rudd', 5659171, '050-9288336');
insert into READER (readername, readernumber, phone)
values ('Bob Reno', 9660781, '057-4492124');
insert into READER (readername, readernumber, phone)
values ('Liam Adams', 8683629, '058-7705683');
insert into READER (readername, readernumber, phone)
values ('Toshiro Gandolfini', 3578799, '052-3450957');
insert into READER (readername, readernumber, phone)
values ('Bret Williams', 5509661, '051-9085485');
insert into READER (readername, readernumber, phone)
values ('Lou Campbell', 6221528, '054-3741125');
insert into READER (readername, readernumber, phone)
values ('Kurt Gary', 1417923, '058-7751219');
insert into READER (readername, readernumber, phone)
values ('Rich Logue', 4391407, '054-4407420');
insert into READER (readername, readernumber, phone)
values ('Kevin Vaughn', 7433072, '059-1538319');
insert into READER (readername, readernumber, phone)
values ('Minnie Jackman', 3230786, '053-9395431');
commit;
prompt 100 records committed...
insert into READER (readername, readernumber, phone)
values ('Miranda Sayer', 2885916, '055-4196215');
insert into READER (readername, readernumber, phone)
values ('John Crowe', 5734197, '051-2337822');
insert into READER (readername, readernumber, phone)
values ('Elisabeth Wilson', 5700522, '050-7789779');
insert into READER (readername, readernumber, phone)
values ('Pierce Gaines', 1270175, '059-2998228');
insert into READER (readername, readernumber, phone)
values ('Angela Michaels', 5242198, '052-9312916');
insert into READER (readername, readernumber, phone)
values ('Kazem Adler', 2821797, '054-7730663');
insert into READER (readername, readernumber, phone)
values ('Lynn Saucedo', 6754712, '059-6304598');
insert into READER (readername, readernumber, phone)
values ('Lydia Cetera', 8511864, '052-9731086');
insert into READER (readername, readernumber, phone)
values ('Sophie McDowell', 8019145, '052-3537002');
insert into READER (readername, readernumber, phone)
values ('CeCe Ruffalo', 5684987, '050-1146450');
insert into READER (readername, readernumber, phone)
values ('Caroline El-Saher', 9258854, '052-3601918');
insert into READER (readername, readernumber, phone)
values ('Sona Sepulveda', 4476599, '058-2743044');
insert into READER (readername, readernumber, phone)
values ('Gloria Chao', 3367314, '055-1352402');
insert into READER (readername, readernumber, phone)
values ('Jeanne Stiers', 1319868, '050-5727090');
insert into READER (readername, readernumber, phone)
values ('Jane Cassidy', 2339510, '056-8521825');
insert into READER (readername, readernumber, phone)
values ('Todd Blair', 4751735, '054-5835608');
insert into READER (readername, readernumber, phone)
values ('Mac Cale', 3409603, '057-6665084');
insert into READER (readername, readernumber, phone)
values ('Diamond Mattea', 9299797, '056-7107307');
insert into READER (readername, readernumber, phone)
values ('Danny Woods', 3278793, '055-2254770');
insert into READER (readername, readernumber, phone)
values ('Viggo Dayne', 5939051, '059-4646172');
insert into READER (readername, readernumber, phone)
values ('Gerald Costello', 4259432, '056-6550122');
insert into READER (readername, readernumber, phone)
values ('Courtney Pitney', 1921267, '057-3717696');
insert into READER (readername, readernumber, phone)
values ('Wang Geldof', 6119620, '051-2416468');
insert into READER (readername, readernumber, phone)
values ('Joely Tomlin', 8869835, '055-7577565');
insert into READER (readername, readernumber, phone)
values ('Franz Liotta', 7750533, '059-8622071');
insert into READER (readername, readernumber, phone)
values ('Rhona Winstone', 9128410, '058-8140265');
insert into READER (readername, readernumber, phone)
values ('Ahmad Leguizamo', 5407315, '050-4308656');
insert into READER (readername, readernumber, phone)
values ('Nickel Goldberg', 4789162, '051-7649395');
insert into READER (readername, readernumber, phone)
values ('Daryl Stevens', 8974520, '051-7284033');
insert into READER (readername, readernumber, phone)
values ('Jody Numan', 8126367, '053-9252673');
insert into READER (readername, readernumber, phone)
values ('Tom Parker', 2299144, '054-7005975');
insert into READER (readername, readernumber, phone)
values ('Leelee Affleck', 7633600, '050-4683090');
insert into READER (readername, readernumber, phone)
values ('Thomas Coe', 1550137, '056-5349238');
insert into READER (readername, readernumber, phone)
values ('Aaron Rush', 5636839, '056-8550279');
insert into READER (readername, readernumber, phone)
values ('Kirsten Hirsch', 8527922, '055-1987148');
insert into READER (readername, readernumber, phone)
values ('Vern Plimpton', 5536378, '051-8382240');
insert into READER (readername, readernumber, phone)
values ('Dave Kinski', 4081706, '051-6795874');
insert into READER (readername, readernumber, phone)
values ('Sean Unger', 8972120, '052-2803789');
insert into READER (readername, readernumber, phone)
values ('Daryle Graham', 4473120, '050-8910673');
insert into READER (readername, readernumber, phone)
values ('Rob Pleasure', 6391895, '053-0174135');
insert into READER (readername, readernumber, phone)
values ('David Seagal', 5671310, '054-7873301');
insert into READER (readername, readernumber, phone)
values ('Buddy Chung', 6413613, '050-4899133');
insert into READER (readername, readernumber, phone)
values ('Jim Caine', 8252076, '050-9961607');
insert into READER (readername, readernumber, phone)
values ('Bobby Calle', 1980978, '051-1833867');
insert into READER (readername, readernumber, phone)
values ('Gabrielle Barnett', 1006673, '052-2546961');
insert into READER (readername, readernumber, phone)
values ('Christmas Schneider', 6703371, '054-1463815');
insert into READER (readername, readernumber, phone)
values ('Colin Franklin', 7175502, '053-1751136');
insert into READER (readername, readernumber, phone)
values ('Kirsten Remar', 7273501, '050-7325160');
insert into READER (readername, readernumber, phone)
values ('Geoff Carrington', 2529517, '059-2858958');
insert into READER (readername, readernumber, phone)
values ('Jude Curtis', 4740734, '056-0230538');
insert into READER (readername, readernumber, phone)
values ('Ritchie Humphrey', 7274926, '054-3176655');
insert into READER (readername, readernumber, phone)
values ('Bobbi Gooding', 9290090, '058-1402289');
insert into READER (readername, readernumber, phone)
values ('Alex Derringer', 2491108, '051-6294993');
insert into READER (readername, readernumber, phone)
values ('Samuel Franks', 6200457, '054-3487799');
insert into READER (readername, readernumber, phone)
values ('Holland Vinton', 4003399, '056-5527691');
insert into READER (readername, readernumber, phone)
values ('Angela O''Keefe', 8266862, '054-6641225');
insert into READER (readername, readernumber, phone)
values ('Goldie Lane', 7472759, '056-0407954');
insert into READER (readername, readernumber, phone)
values ('Angelina Cohn', 8739683, '057-7984569');
insert into READER (readername, readernumber, phone)
values ('Devon Shatner', 9659139, '058-0678210');
insert into READER (readername, readernumber, phone)
values ('Kevin Speaks', 5081181, '054-2184464');
insert into READER (readername, readernumber, phone)
values ('Cheryl Mahood', 6884288, '058-9641159');
insert into READER (readername, readernumber, phone)
values ('Sissy Gibson', 4789167, '055-0427703');
insert into READER (readername, readernumber, phone)
values ('Sal Kweller', 8649620, '051-6554546');
insert into READER (readername, readernumber, phone)
values ('Patti Eldard', 8721787, '058-6452874');
insert into READER (readername, readernumber, phone)
values ('Sydney Branagh', 5008631, '055-2023683');
insert into READER (readername, readernumber, phone)
values ('Woody Barry', 8395852, '054-3924385');
insert into READER (readername, readernumber, phone)
values ('Sheryl McLachlan', 6159661, '055-0256401');
insert into READER (readername, readernumber, phone)
values ('Eileen Lindley', 5117227, '053-0706223');
insert into READER (readername, readernumber, phone)
values ('Saffron Swayze', 6243080, '050-2528785');
insert into READER (readername, readernumber, phone)
values ('Sonny Harary', 2243110, '051-7936762');
insert into READER (readername, readernumber, phone)
values ('Shelby Jackson', 4451881, '058-4308261');
insert into READER (readername, readernumber, phone)
values ('Art Farrow', 4111377, '057-9720352');
insert into READER (readername, readernumber, phone)
values ('Rueben Geldof', 3114514, '055-2491577');
insert into READER (readername, readernumber, phone)
values ('Terry Van Der Beek', 9541494, '054-4538150');
insert into READER (readername, readernumber, phone)
values ('Maxine Sepulveda', 8415054, '059-0458067');
insert into READER (readername, readernumber, phone)
values ('Carrie-Anne MacDonal', 2864106, '055-9437198');
insert into READER (readername, readernumber, phone)
values ('Ice Ferry', 5995845, '055-5586779');
insert into READER (readername, readernumber, phone)
values ('Mandy Sharp', 2161227, '057-7595324');
insert into READER (readername, readernumber, phone)
values ('Laurence Lucien', 6898139, '059-6672626');
insert into READER (readername, readernumber, phone)
values ('Chad Tillis', 4854359, '051-9460609');
insert into READER (readername, readernumber, phone)
values ('Yolanda Olyphant', 1454262, '050-5778797');
insert into READER (readername, readernumber, phone)
values ('Brendan Roth', 7098247, '057-7124664');
insert into READER (readername, readernumber, phone)
values ('Embeth Barnett', 9322150, '055-8590636');
insert into READER (readername, readernumber, phone)
values ('Christina Freeman', 8569020, '056-7673766');
insert into READER (readername, readernumber, phone)
values ('Jena Darren', 7626644, '057-8259885');
insert into READER (readername, readernumber, phone)
values ('Nikka Slater', 9448320, '052-1702192');
insert into READER (readername, readernumber, phone)
values ('Natacha Prinze', 8499716, '053-4880750');
insert into READER (readername, readernumber, phone)
values ('Jarvis Kier', 9207161, '056-0749420');
insert into READER (readername, readernumber, phone)
values ('Angela Levert', 2680144, '058-8759629');
insert into READER (readername, readernumber, phone)
values ('Dan Snider', 8377294, '051-2057729');
insert into READER (readername, readernumber, phone)
values ('Ruth Wagner', 3690492, '050-5212342');
insert into READER (readername, readernumber, phone)
values ('Taye Heald', 5012073, '051-1583693');
insert into READER (readername, readernumber, phone)
values ('Stephen Stormare', 1653780, '058-3964895');
insert into READER (readername, readernumber, phone)
values ('Rick Rowlands', 6473536, '052-8975167');
insert into READER (readername, readernumber, phone)
values ('Gwyneth Stiles', 8271171, '055-3679797');
insert into READER (readername, readernumber, phone)
values ('Vertical Estevez', 5131331, '050-3688527');
insert into READER (readername, readernumber, phone)
values ('Dylan Reinhold', 7740404, '059-1618536');
insert into READER (readername, readernumber, phone)
values ('Famke McKellen', 4149818, '059-4127302');
insert into READER (readername, readernumber, phone)
values ('Pamela Moriarty', 7259581, '050-2611427');
insert into READER (readername, readernumber, phone)
values ('Hank Liotta', 6852335, '052-7402114');
commit;
prompt 200 records committed...
insert into READER (readername, readernumber, phone)
values ('Colleen Blige', 6764647, '058-4346862');
insert into READER (readername, readernumber, phone)
values ('Sandra Checker', 7943944, '059-4096009');
insert into READER (readername, readernumber, phone)
values ('Angelina Fierstein', 3549628, '055-5668951');
insert into READER (readername, readernumber, phone)
values ('Lin Gracie', 5518192, '054-1500054');
insert into READER (readername, readernumber, phone)
values ('Liv Fisher', 2718206, '056-2222389');
insert into READER (readername, readernumber, phone)
values ('Carlene Downie', 1372474, '052-1057606');
insert into READER (readername, readernumber, phone)
values ('Isaac Stuart', 8241601, '053-4111987');
insert into READER (readername, readernumber, phone)
values ('Seann Raye', 8010589, '052-1509874');
insert into READER (readername, readernumber, phone)
values ('Katie Everett', 8243244, '051-1785231');
insert into READER (readername, readernumber, phone)
values ('Toshiro Cole', 8415088, '058-4714319');
insert into READER (readername, readernumber, phone)
values ('Dar Church', 2187243, '055-8887012');
insert into READER (readername, readernumber, phone)
values ('Scott Fox', 3288994, '056-8960737');
insert into READER (readername, readernumber, phone)
values ('Katrin Copeland', 6614626, '057-4718417');
insert into READER (readername, readernumber, phone)
values ('Omar Solido', 9990333, '051-0843150');
insert into READER (readername, readernumber, phone)
values ('Kiefer Chambers', 7811309, '054-4756060');
insert into READER (readername, readernumber, phone)
values ('Machine Linney', 1490135, '053-1163615');
insert into READER (readername, readernumber, phone)
values ('Aida Balaban', 1360040, '058-0430539');
insert into READER (readername, readernumber, phone)
values ('Delbert Stills', 1283872, '053-8882881');
insert into READER (readername, readernumber, phone)
values ('Millie Lynskey', 7436530, '050-0284049');
insert into READER (readername, readernumber, phone)
values ('Uma Freeman', 1983613, '050-6117263');
insert into READER (readername, readernumber, phone)
values ('Debby Rispoli', 5661293, '053-5173579');
insert into READER (readername, readernumber, phone)
values ('Heather Steiger', 9721201, '054-4325740');
insert into READER (readername, readernumber, phone)
values ('Nora Gershon', 5109577, '057-4452387');
insert into READER (readername, readernumber, phone)
values ('Danni Affleck', 6058217, '056-7272741');
insert into READER (readername, readernumber, phone)
values ('Colin Mollard', 5198736, '050-1820181');
insert into READER (readername, readernumber, phone)
values ('Freddie Rundgren', 7445862, '056-9628743');
insert into READER (readername, readernumber, phone)
values ('Elle Lindley', 8250146, '057-9338651');
insert into READER (readername, readernumber, phone)
values ('Chaka Boorem', 8679185, '056-0969166');
insert into READER (readername, readernumber, phone)
values ('Nanci Hopper', 5185492, '052-7237467');
insert into READER (readername, readernumber, phone)
values ('Rufus Jonze', 2051536, '058-5954970');
insert into READER (readername, readernumber, phone)
values ('Val Lennox', 5298433, '059-0582586');
insert into READER (readername, readernumber, phone)
values ('Stockard Dooley', 5656834, '056-9544811');
insert into READER (readername, readernumber, phone)
values ('Fairuza Caan', 1824309, '050-8965264');
insert into READER (readername, readernumber, phone)
values ('Stephanie Chinlund', 2911275, '058-9064147');
insert into READER (readername, readernumber, phone)
values ('George Strathairn', 2161767, '052-2341421');
insert into READER (readername, readernumber, phone)
values ('Elias Taylor', 6891447, '050-2527496');
insert into READER (readername, readernumber, phone)
values ('Rose Hynde', 1300654, '059-1971479');
insert into READER (readername, readernumber, phone)
values ('Samuel Cotton', 1947297, '058-3829670');
insert into READER (readername, readernumber, phone)
values ('Hector Dourif', 9397323, '057-7891914');
insert into READER (readername, readernumber, phone)
values ('Liv Mirren', 4900172, '053-2587317');
insert into READER (readername, readernumber, phone)
values ('Rick Puckett', 9728792, '055-7531907');
insert into READER (readername, readernumber, phone)
values ('Mika Quatro', 9843722, '051-1299300');
insert into READER (readername, readernumber, phone)
values ('Karon Pryce', 3910300, '059-9393376');
insert into READER (readername, readernumber, phone)
values ('Vanessa Ryan', 1955729, '051-3286200');
insert into READER (readername, readernumber, phone)
values ('Rip Dillane', 9633192, '056-5866733');
insert into READER (readername, readernumber, phone)
values ('Bette Hall', 4035585, '051-7588299');
insert into READER (readername, readernumber, phone)
values ('Robby Wilkinson', 8067156, '053-1665197');
insert into READER (readername, readernumber, phone)
values ('Queen Carmen', 3882196, '052-2529274');
insert into READER (readername, readernumber, phone)
values ('Steven Hunter', 1502125, '052-8140530');
insert into READER (readername, readernumber, phone)
values ('Minnie Chappelle', 4917937, '057-8024329');
insert into READER (readername, readernumber, phone)
values ('Dustin Wainwright', 9290741, '059-0975844');
insert into READER (readername, readernumber, phone)
values ('Mel Phillippe', 5426422, '056-3597503');
insert into READER (readername, readernumber, phone)
values ('Emmylou Akins', 6025302, '052-6933041');
insert into READER (readername, readernumber, phone)
values ('Diamond Wilder', 8329998, '055-4635912');
insert into READER (readername, readernumber, phone)
values ('Nathan Watson', 4076850, '050-0026240');
insert into READER (readername, readernumber, phone)
values ('Courtney Whitmore', 8153280, '051-9959367');
insert into READER (readername, readernumber, phone)
values ('Brooke Unger', 1216901, '059-6653240');
insert into READER (readername, readernumber, phone)
values ('Samuel Shand', 7117720, '055-6637943');
insert into READER (readername, readernumber, phone)
values ('Walter Graham', 1283928, '056-9210775');
insert into READER (readername, readernumber, phone)
values ('Jean-Luc Portman', 1476075, '059-8366869');
insert into READER (readername, readernumber, phone)
values ('Sheena Irons', 7311631, '055-1105703');
insert into READER (readername, readernumber, phone)
values ('Mandy Arden', 9813099, '054-2449030');
insert into READER (readername, readernumber, phone)
values ('Petula Dillon', 4492256, '059-5507475');
insert into READER (readername, readernumber, phone)
values ('Jake Zellweger', 5999406, '056-2382261');
insert into READER (readername, readernumber, phone)
values ('Ving Tisdale', 8869630, '054-2341601');
insert into READER (readername, readernumber, phone)
values ('Teri Jenkins', 5251248, '059-8014311');
insert into READER (readername, readernumber, phone)
values ('Kid Senior', 5148414, '056-7926119');
insert into READER (readername, readernumber, phone)
values ('Reese Henstridge', 2471146, '054-8687449');
insert into READER (readername, readernumber, phone)
values ('Joe Assante', 9119547, '059-9238655');
insert into READER (readername, readernumber, phone)
values ('Rodney Nunn', 4423218, '059-7529560');
insert into READER (readername, readernumber, phone)
values ('Azucar Gough', 6481823, '054-2371243');
insert into READER (readername, readernumber, phone)
values ('April Gibbons', 8668370, '058-3766443');
insert into READER (readername, readernumber, phone)
values ('Nigel Olyphant', 5161697, '057-7867979');
insert into READER (readername, readernumber, phone)
values ('Lynette Barkin', 1275787, '056-1768047');
insert into READER (readername, readernumber, phone)
values ('Ice Anderson', 4746823, '055-4971787');
insert into READER (readername, readernumber, phone)
values ('Tilda Chao', 8476262, '054-0733485');
insert into READER (readername, readernumber, phone)
values ('Rowan Kline', 7007169, '056-1351802');
insert into READER (readername, readernumber, phone)
values ('Vanessa Phoenix', 8825304, '056-0767836');
insert into READER (readername, readernumber, phone)
values ('Rik Reeves', 7705641, '058-2192292');
insert into READER (readername, readernumber, phone)
values ('Trick Bentley', 2721187, '057-5913733');
insert into READER (readername, readernumber, phone)
values ('Allison Weber', 2180860, '052-1504184');
insert into READER (readername, readernumber, phone)
values ('Celia Mac', 4115347, '057-7536386');
insert into READER (readername, readernumber, phone)
values ('Lance Collie', 3011674, '053-3411123');
insert into READER (readername, readernumber, phone)
values ('Daryl Moody', 2821204, '054-0018059');
insert into READER (readername, readernumber, phone)
values ('Carlene Mathis', 7176399, '056-0783968');
insert into READER (readername, readernumber, phone)
values ('Angie Sample', 4613955, '055-2315522');
insert into READER (readername, readernumber, phone)
values ('John Coe', 4902722, '050-0092662');
insert into READER (readername, readernumber, phone)
values ('Buffy Sorvino', 2035649, '057-8278288');
insert into READER (readername, readernumber, phone)
values ('Victor Diaz', 3053483, '059-2522809');
insert into READER (readername, readernumber, phone)
values ('Cevin Woodward', 9823587, '052-1652593');
insert into READER (readername, readernumber, phone)
values ('Kevin Lachey', 2885539, '056-5655326');
insert into READER (readername, readernumber, phone)
values ('Christopher Emmett', 3334257, '051-4283387');
insert into READER (readername, readernumber, phone)
values ('Kelly de Lancie', 1763226, '053-6181063');
insert into READER (readername, readernumber, phone)
values ('Nik Bonneville', 6099598, '059-9079446');
insert into READER (readername, readernumber, phone)
values ('Patricia Rickman', 3047537, '050-5621762');
insert into READER (readername, readernumber, phone)
values ('Judge Shatner', 7705454, '056-2229531');
insert into READER (readername, readernumber, phone)
values ('Rebeka Colon', 9552185, '050-5803108');
insert into READER (readername, readernumber, phone)
values ('Nikki Diaz', 7730471, '058-1946133');
insert into READER (readername, readernumber, phone)
values ('Jude King', 6205479, '059-1934967');
insert into READER (readername, readernumber, phone)
values ('Jay Thomas', 2442810, '051-7608160');
commit;
prompt 300 records committed...
insert into READER (readername, readernumber, phone)
values ('Stanley Watson', 6606394, '058-9752988');
insert into READER (readername, readernumber, phone)
values ('France Kurtz', 3206472, '058-2984648');
insert into READER (readername, readernumber, phone)
values ('Saul Barry', 5095844, '057-1945159');
insert into READER (readername, readernumber, phone)
values ('Juliana Gryner', 9186408, '052-5925761');
insert into READER (readername, readernumber, phone)
values ('Tony Katt', 7591566, '050-0444291');
insert into READER (readername, readernumber, phone)
values ('Terri Ermey', 8835171, '051-6317816');
insert into READER (readername, readernumber, phone)
values ('Kyle Withers', 6641069, '054-4818772');
insert into READER (readername, readernumber, phone)
values ('John Damon', 6006540, '050-1948842');
insert into READER (readername, readernumber, phone)
values ('Leo McIntyre', 8286009, '054-8115988');
insert into READER (readername, readernumber, phone)
values ('Debra Mason', 8532764, '057-6255756');
insert into READER (readername, readernumber, phone)
values ('Leonardo Mulroney', 5984456, '059-1772824');
insert into READER (readername, readernumber, phone)
values ('Jann Armatrading', 9257066, '057-5112510');
insert into READER (readername, readernumber, phone)
values ('Carlene Alda', 5686793, '051-8217683');
insert into READER (readername, readernumber, phone)
values ('Liam Breslin', 9299091, '057-3622363');
insert into READER (readername, readernumber, phone)
values ('Oliver Conway', 7312860, '056-8839536');
insert into READER (readername, readernumber, phone)
values ('Bridget Meyer', 5017604, '054-7007314');
insert into READER (readername, readernumber, phone)
values ('Ceili Harris', 8588729, '058-0733908');
insert into READER (readername, readernumber, phone)
values ('Maceo Spacek', 3404750, '051-7886343');
insert into READER (readername, readernumber, phone)
values ('Marty Sellers', 1303707, '050-5113675');
insert into READER (readername, readernumber, phone)
values ('Merillee Kidman', 5286141, '051-9178125');
insert into READER (readername, readernumber, phone)
values ('Gerald Goodall', 5108952, '053-5381064');
insert into READER (readername, readernumber, phone)
values ('Edwin Bacharach', 2842663, '058-0862661');
insert into READER (readername, readernumber, phone)
values ('Loren Diffie', 3730745, '050-0401533');
insert into READER (readername, readernumber, phone)
values ('Stevie Spacek', 9370683, '054-9254414');
insert into READER (readername, readernumber, phone)
values ('Glenn Elliott', 2386734, '058-3678196');
insert into READER (readername, readernumber, phone)
values ('Fairuza Sepulveda', 9916538, '056-1339650');
insert into READER (readername, readernumber, phone)
values ('Temuera Warden', 2084625, '058-8127071');
insert into READER (readername, readernumber, phone)
values ('Loren Mantegna', 3715857, '053-2109955');
insert into READER (readername, readernumber, phone)
values ('Ashton Keith', 6751104, '051-8707199');
insert into READER (readername, readernumber, phone)
values ('Sharon Stanley', 4673047, '056-9753676');
insert into READER (readername, readernumber, phone)
values ('Earl Tisdale', 9430689, '056-5023797');
insert into READER (readername, readernumber, phone)
values ('Donal Tucci', 2921909, '052-7182275');
insert into READER (readername, readernumber, phone)
values ('Ahmad Owen', 6088135, '051-0082438');
insert into READER (readername, readernumber, phone)
values ('Crystal Hidalgo', 1124856, '050-4143920');
insert into READER (readername, readernumber, phone)
values ('Angela Nakai', 5770996, '051-2191755');
insert into READER (readername, readernumber, phone)
values ('Lesley Hawke', 3658140, '059-6609369');
insert into READER (readername, readernumber, phone)
values ('Jim Shaw', 5081492, '052-5625031');
insert into READER (readername, readernumber, phone)
values ('Bryan Duchovny', 3533998, '050-4783483');
insert into READER (readername, readernumber, phone)
values ('Cheech Satriani', 2524756, '055-4965902');
insert into READER (readername, readernumber, phone)
values ('Joely Soda', 5040726, '059-4911271');
insert into READER (readername, readernumber, phone)
values ('Vivica Harrelson', 4712732, '052-8447359');
insert into READER (readername, readernumber, phone)
values ('Sal Buffalo', 8020506, '052-6940825');
insert into READER (readername, readernumber, phone)
values ('Kyle Rapaport', 2043639, '050-6104267');
insert into READER (readername, readernumber, phone)
values ('Jack Keeslar', 8615386, '050-4621154');
insert into READER (readername, readernumber, phone)
values ('Meredith Sarsgaard', 6250370, '057-3094326');
insert into READER (readername, readernumber, phone)
values ('Nicky Waite', 7931779, '054-5539878');
insert into READER (readername, readernumber, phone)
values ('Chubby Moss', 2224917, '056-4775512');
insert into READER (readername, readernumber, phone)
values ('Jeremy Pierce', 7654033, '057-6579618');
insert into READER (readername, readernumber, phone)
values ('Drew Van Damme', 7332750, '059-2402035');
insert into READER (readername, readernumber, phone)
values ('George Mantegna', 4817461, '054-9939912');
insert into READER (readername, readernumber, phone)
values ('Miguel Crimson', 3423184, '058-8688650');
insert into READER (readername, readernumber, phone)
values ('Trace Union', 1465423, '058-9645102');
insert into READER (readername, readernumber, phone)
values ('Betty Hanks', 7811381, '052-2401249');
insert into READER (readername, readernumber, phone)
values ('Matthew Gayle', 2409461, '059-8915039');
insert into READER (readername, readernumber, phone)
values ('Keanu Carr', 3644121, '058-8905245');
insert into READER (readername, readernumber, phone)
values ('Gin Lynskey', 6800752, '050-2780543');
insert into READER (readername, readernumber, phone)
values ('Carl Coe', 5362500, '057-2280179');
insert into READER (readername, readernumber, phone)
values ('Madeline Schock', 7720421, '054-0370897');
insert into READER (readername, readernumber, phone)
values ('Molly Nielsen', 5242936, '051-6652998');
insert into READER (readername, readernumber, phone)
values ('Chrissie Sawa', 8483977, '055-4433450');
insert into READER (readername, readernumber, phone)
values ('Teena Condition', 2549829, '055-1554684');
insert into READER (readername, readernumber, phone)
values ('Richard Sarsgaard', 7842330, '054-5632219');
insert into READER (readername, readernumber, phone)
values ('Andrae Stiers', 9438346, '051-1901393');
insert into READER (readername, readernumber, phone)
values ('Wallace Laws', 2987045, '053-6902166');
insert into READER (readername, readernumber, phone)
values ('Dylan Darren', 6952618, '055-2721428');
insert into READER (readername, readernumber, phone)
values ('Tobey Archer', 6955687, '054-0716082');
insert into READER (readername, readernumber, phone)
values ('Rich Thewlis', 8531921, '058-3057724');
insert into READER (readername, readernumber, phone)
values ('Henry Hawke', 6308799, '052-4707024');
insert into READER (readername, readernumber, phone)
values ('Joy Rosas', 3161788, '050-2572148');
insert into READER (readername, readernumber, phone)
values ('Wayne Hudson', 6620309, '050-2389811');
insert into READER (readername, readernumber, phone)
values ('Chet Skaggs', 3550654, '053-6695355');
insert into READER (readername, readernumber, phone)
values ('Alfie Torres', 7560650, '055-2896885');
insert into READER (readername, readernumber, phone)
values ('Azucar Pesci', 4734861, '056-3924531');
insert into READER (readername, readernumber, phone)
values ('Roy Shaye', 4045297, '058-6151730');
insert into READER (readername, readernumber, phone)
values ('LeVar Caviezel', 3874919, '051-8458816');
insert into READER (readername, readernumber, phone)
values ('Billy Moraz', 7284977, '051-4384973');
insert into READER (readername, readernumber, phone)
values ('Rose Harnes', 1774221, '053-4964900');
insert into READER (readername, readernumber, phone)
values ('Chad Herrmann', 1651235, '054-6699477');
insert into READER (readername, readernumber, phone)
values ('Harris Street', 6659148, '052-1545474');
insert into READER (readername, readernumber, phone)
values ('Bebe Kapanka', 4465703, '053-7668301');
insert into READER (readername, readernumber, phone)
values ('Teri Emmett', 1021069, '053-8968375');
insert into READER (readername, readernumber, phone)
values ('Denise De Niro', 9104990, '056-8646584');
insert into READER (readername, readernumber, phone)
values ('Toni Basinger', 1571685, '055-3096917');
insert into READER (readername, readernumber, phone)
values ('Louise Manning', 5586419, '052-0968918');
insert into READER (readername, readernumber, phone)
values ('Fionnula Renfro', 4181146, '053-2929145');
insert into READER (readername, readernumber, phone)
values ('Vertical Unger', 8098170, '058-8116923');
insert into READER (readername, readernumber, phone)
values ('Earl Stoltz', 3369926, '057-4067037');
insert into READER (readername, readernumber, phone)
values ('Jude Kleinenberg', 5608251, '052-7192191');
insert into READER (readername, readernumber, phone)
values ('Lindsay MacNeil', 6901342, '052-0358793');
insert into READER (readername, readernumber, phone)
values ('Vern Applegate', 6129333, '052-1049741');
insert into READER (readername, readernumber, phone)
values ('Robin Oates', 7185804, '055-3144156');
insert into READER (readername, readernumber, phone)
values ('Manu Tobolowsky', 3580872, '054-7284540');
insert into READER (readername, readernumber, phone)
values ('Danni Lavigne', 8066483, '052-0322872');
insert into READER (readername, readernumber, phone)
values ('Peter Pacino', 7409569, '056-6522089');
insert into READER (readername, readernumber, phone)
values ('Buddy Shatner', 1666742, '052-1598950');
insert into READER (readername, readernumber, phone)
values ('Anna Dempsey', 9252025, '052-5165251');
insert into READER (readername, readernumber, phone)
values ('Lupe Cronin', 8371394, '055-1366326');
insert into READER (readername, readernumber, phone)
values ('Kurt Serbedzija', 4981242, '054-6192352');
insert into READER (readername, readernumber, phone)
values ('Connie Barrymore', 1556477, '059-7645208');
insert into READER (readername, readernumber, phone)
values ('Kristin McNarland', 9978919, '050-3224012');
commit;
prompt 400 records loaded
prompt Loading BOOKORDERING...
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-01-1990', 'dd-mm-yyyy'), 33598061, 7961372, 3578799, 85762413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-06-2007', 'dd-mm-yyyy'), 2514534, 7314170, 7185804, 80873306);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-05-1999', 'dd-mm-yyyy'), 33861369, 8593082, 3168426, 53810865);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-05-2017', 'dd-mm-yyyy'), 1745363, 6970091, 8615386, 85762413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-08-2009', 'dd-mm-yyyy'), 73940479, 3663829, 1319868, 26997527);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-06-1985', 'dd-mm-yyyy'), 53197223, 3895521, 4476599, 745614);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-08-1995', 'dd-mm-yyyy'), 12888425, 7871923, 9448320, 95131625);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-10-2017', 'dd-mm-yyyy'), 14852, 3731725, 4076850, 59291771);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-10-1985', 'dd-mm-yyyy'), 66948236, 2986035, 7811309, 49472824);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-10-2015', 'dd-mm-yyyy'), 45233973, 1619879, 2721187, 82810687);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-01-2007', 'dd-mm-yyyy'), 23944071, 6450396, 9034535, 6732852);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-06-2010', 'dd-mm-yyyy'), 32941498, 4230538, 9322150, 7582585);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-06-2004', 'dd-mm-yyyy'), 30116741, 9724432, 9185773, 8750474);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-04-2008', 'dd-mm-yyyy'), 53849942, 4836700, 4712732, 83461037);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-06-1994', 'dd-mm-yyyy'), 33192080, 8778033, 3690492, 56686607);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-04-1990', 'dd-mm-yyyy'), 12612537, 7747422, 9381105, 26009503);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-05-2009', 'dd-mm-yyyy'), 7406175, 5463619, 6200457, 45285022);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-05-2023', 'dd-mm-yyyy'), 2481695, 7418161, 6243080, 31093161);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-03-1995', 'dd-mm-yyyy'), 61123693, 4041709, 7730471, 96282692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-01-2004', 'dd-mm-yyyy'), 32551518, 1840174, 2921909, 31093161);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-12-2021', 'dd-mm-yyyy'), 47544173, 3016170, 1006673, 95131625);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-10-1994', 'dd-mm-yyyy'), 405145, 8624271, 3730745, 20735605);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-09-2005', 'dd-mm-yyyy'), 58370197, 4146797, 8153280, 42355556);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-02-1993', 'dd-mm-yyyy'), 36375531, 9884767, 8415054, 36808275);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 58973921, 3774951, 2471146, 30748348);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-05-2012', 'dd-mm-yyyy'), 95384900, 3822687, 6025302, 85762413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 13837593, 2517381, 5148414, 70643962);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-01-1996', 'dd-mm-yyyy'), 93139549, 4516818, 6614626, 37121217);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-12-1999', 'dd-mm-yyyy'), 47360439, 8944584, 3648110, 83461037);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-12-2003', 'dd-mm-yyyy'), 36205388, 6185813, 4746823, 78248961);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-07-2010', 'dd-mm-yyyy'), 42891685, 4075689, 8510484, 69915317);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-12-1990', 'dd-mm-yyyy'), 25004309, 9632388, 7720421, 95116153);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-05-2019', 'dd-mm-yyyy'), 4770145, 6667347, 5198736, 91064416);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-05-2018', 'dd-mm-yyyy'), 57931125, 5738584, 5426422, 51293928);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-10-2014', 'dd-mm-yyyy'), 18863163, 7961372, 6884288, 47624337);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-11-2017', 'dd-mm-yyyy'), 22417992, 3924556, 3533998, 4795883);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-07-1999', 'dd-mm-yyyy'), 6312359, 8038435, 2718206, 99989634);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-09-1987', 'dd-mm-yyyy'), 63604255, 6472241, 7098247, 55502229);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2013', 'dd-mm-yyyy'), 84363103, 4582337, 8020506, 13868025);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-07-2021', 'dd-mm-yyyy'), 76290991, 4259544, 7274926, 99989634);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-11-1987', 'dd-mm-yyyy'), 63098078, 6103107, 8974520, 32956906);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-11-2009', 'dd-mm-yyyy'), 15566715, 3914677, 5509661, 93679893);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-08-1994', 'dd-mm-yyyy'), 90493355, 2129923, 8972120, 36333117);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-09-2013', 'dd-mm-yyyy'), 22060539, 6396129, 5659171, 9134812);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-08-2004', 'dd-mm-yyyy'), 46409117, 5730360, 6129333, 89017252);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-02-1991', 'dd-mm-yyyy'), 76948379, 3256677, 8377294, 17791571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-04-2001', 'dd-mm-yyyy'), 38828990, 5201833, 9258854, 44917352);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-10-1995', 'dd-mm-yyyy'), 86971610, 5501427, 8499716, 57105092);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-03-2005', 'dd-mm-yyyy'), 99539586, 8405617, 3580872, 3412244);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-07-2008', 'dd-mm-yyyy'), 57106044, 6930421, 4423218, 15689341);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-02-2012', 'dd-mm-yyyy'), 98764952, 6313794, 7430534, 8427743);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-02-2001', 'dd-mm-yyyy'), 47948747, 6929074, 8869630, 31093161);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-08-2002', 'dd-mm-yyyy'), 9943944, 6517077, 7811309, 35104166);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-06-1992', 'dd-mm-yyyy'), 11601289, 7661113, 3278793, 81968405);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-01-1985', 'dd-mm-yyyy'), 12566116, 8579230, 5661293, 4447109);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-09-2017', 'dd-mm-yyyy'), 58436270, 4088650, 6221528, 77228790);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-03-1990', 'dd-mm-yyyy'), 8057209, 3254416, 9430689, 59638072);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-03-2009', 'dd-mm-yyyy'), 12803145, 8139676, 6260410, 92505465);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2019', 'dd-mm-yyyy'), 4443126, 9422997, 6391895, 13635246);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-08-1990', 'dd-mm-yyyy'), 14431325, 5781286, 2051536, 58774530);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-11-2023', 'dd-mm-yyyy'), 99116428, 6092727, 6058217, 35875151);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-03-2023', 'dd-mm-yyyy'), 67136245, 7010653, 1445614, 5460019);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-03-1998', 'dd-mm-yyyy'), 79892213, 3822687, 7842330, 2573692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-06-2024', 'dd-mm-yyyy'), 20733010, 5203317, 5659171, 67514102);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-09-2024', 'dd-mm-yyyy'), 13688525, 4379844, 6884288, 97784291);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-10-2019', 'dd-mm-yyyy'), 14011217, 1209671, 4740734, 28333425);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-05-1991', 'dd-mm-yyyy'), 56530131, 4215250, 9715811, 85762413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-12-1985', 'dd-mm-yyyy'), 690408, 8277136, 2491108, 72832056);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-09-2021', 'dd-mm-yyyy'), 36170089, 6472241, 2619943, 21546976);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-09-2007', 'dd-mm-yyyy'), 15815983, 6737897, 1372474, 8202435);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-07-2017', 'dd-mm-yyyy'), 36638033, 8880277, 8511864, 31129764);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-05-1986', 'dd-mm-yyyy'), 30588714, 1864586, 4981242, 30957316);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-11-1993', 'dd-mm-yyyy'), 9788476, 7699468, 6243080, 31475401);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-05-2021', 'dd-mm-yyyy'), 35769540, 8071823, 7117720, 99043331);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-08-2006', 'dd-mm-yyyy'), 16973583, 4260056, 3168426, 27185395);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-01-2024', 'dd-mm-yyyy'), 87041951, 8806258, 2494684, 57078677);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-11-1992', 'dd-mm-yyyy'), 92672907, 1222369, 4076850, 53300331);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-09-2003', 'dd-mm-yyyy'), 96130689, 5189535, 7638684, 55380769);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 5973238, 2205976, 8531921, 69118871);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-10-1986', 'dd-mm-yyyy'), 31656475, 2226566, 4078634, 91484341);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-09-1985', 'dd-mm-yyyy'), 90046731, 8151301, 5008631, 11981722);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-02-2008', 'dd-mm-yyyy'), 2142290, 7092828, 1372474, 13868025);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-08-2006', 'dd-mm-yyyy'), 70217137, 8964366, 7472759, 23832125);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-09-2014', 'dd-mm-yyyy'), 35552864, 6547119, 5242936, 2573692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-01-2017', 'dd-mm-yyyy'), 88057925, 8950643, 2051536, 9310443);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-10-2001', 'dd-mm-yyyy'), 96699726, 9897142, 4115347, 69915317);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-04-2017', 'dd-mm-yyyy'), 82022162, 9180863, 8569020, 47794757);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-04-2022', 'dd-mm-yyyy'), 94650904, 1811902, 4751735, 52179145);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-08-2011', 'dd-mm-yyyy'), 39372844, 8450547, 3874919, 5277842);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-06-1987', 'dd-mm-yyyy'), 24524102, 5260106, 8371394, 47794757);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-10-1995', 'dd-mm-yyyy'), 72770, 4230538, 7445862, 33595844);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-02-2021', 'dd-mm-yyyy'), 50859839, 6862965, 6855471, 95236434);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-01-2017', 'dd-mm-yyyy'), 54904523, 3063581, 2529517, 386261);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-01-2006', 'dd-mm-yyyy'), 72674367, 3960643, 7750533, 14865932);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-12-1986', 'dd-mm-yyyy'), 68416890, 5874861, 8721787, 4458510);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-2002', 'dd-mm-yyyy'), 8585173, 2033962, 1494654, 34780563);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-01-2006', 'dd-mm-yyyy'), 17056896, 1122457, 7842330, 9843597);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-08-2019', 'dd-mm-yyyy'), 70168581, 9970476, 1216901, 23578555);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-12-2001', 'dd-mm-yyyy'), 61365688, 4595656, 5251248, 93016828);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-06-2019', 'dd-mm-yyyy'), 78927904, 2986035, 4917937, 26616934);
commit;
prompt 100 records committed...
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-12-1998', 'dd-mm-yyyy'), 90132157, 8769990, 5700522, 59638072);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-04-1993', 'dd-mm-yyyy'), 51799821, 6568911, 6751104, 19787948);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-01-2021', 'dd-mm-yyyy'), 29923865, 6593829, 8972120, 26616934);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-02-1990', 'dd-mm-yyyy'), 46981756, 1014559, 9258854, 49332773);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-06-1986', 'dd-mm-yyyy'), 78331612, 4989446, 8588729, 49239522);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-03-2018', 'dd-mm-yyyy'), 83267127, 3808152, 4391407, 13261211);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-11-1995', 'dd-mm-yyyy'), 94260040, 2298339, 2821797, 10594533);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-02-2019', 'dd-mm-yyyy'), 17310557, 2154230, 8020506, 92408100);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-11-2011', 'dd-mm-yyyy'), 26531607, 6517077, 7176399, 52179145);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-10-1993', 'dd-mm-yyyy'), 46473307, 3808152, 3415486, 57516103);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-12-2011', 'dd-mm-yyyy'), 24656935, 3796995, 8377294, 97586391);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-02-2001', 'dd-mm-yyyy'), 41949552, 2644841, 8098170, 19689044);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-08-2013', 'dd-mm-yyyy'), 83171804, 1291356, 1300654, 80930041);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-01-1990', 'dd-mm-yyyy'), 47911901, 5738584, 3423184, 37102946);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-06-2011', 'dd-mm-yyyy'), 43266534, 2226566, 1300654, 78557666);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-08-2022', 'dd-mm-yyyy'), 17129861, 9391213, 8721787, 81778002);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-11-1987', 'dd-mm-yyyy'), 10744512, 2283609, 6250062, 70923580);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-08-2010', 'dd-mm-yyyy'), 88120992, 7674424, 7311631, 48764434);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-04-1995', 'dd-mm-yyyy'), 29058086, 9180863, 5999406, 64630390);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-08-2004', 'dd-mm-yyyy'), 22129093, 7593273, 7075277, 64601005);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-03-1991', 'dd-mm-yyyy'), 43291609, 7238022, 3168426, 74430140);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-11-1994', 'dd-mm-yyyy'), 28721962, 9897142, 8690641, 78248961);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-11-1985', 'dd-mm-yyyy'), 27190851, 3524103, 1666742, 59638072);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-05-1985', 'dd-mm-yyyy'), 43028163, 7932433, 1502125, 88598912);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-07-2022', 'dd-mm-yyyy'), 61223463, 1108625, 6898139, 21596412);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2020', 'dd-mm-yyyy'), 83587850, 6869552, 6884288, 77228790);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-08-1989', 'dd-mm-yyyy'), 71583166, 4965843, 9160932, 54646163);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-08-2002', 'dd-mm-yyyy'), 25530244, 4797464, 8067156, 98424825);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-03-1986', 'dd-mm-yyyy'), 9107011, 2952210, 8531921, 31644234);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-07-1985', 'dd-mm-yyyy'), 35705715, 2036669, 9843722, 57105092);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-04-1999', 'dd-mm-yyyy'), 50825089, 7819764, 4840030, 98500004);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-03-2016', 'dd-mm-yyyy'), 56916291, 5138196, 9299091, 14121447);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-03-2014', 'dd-mm-yyyy'), 26085210, 6610730, 7653878, 59359688);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-04-2012', 'dd-mm-yyyy'), 37193014, 7819764, 6006540, 65752379);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-09-1996', 'dd-mm-yyyy'), 4157521, 9897142, 7185804, 78641255);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-07-1990', 'dd-mm-yyyy'), 92858384, 5751110, 6088135, 46021300);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-08-1988', 'dd-mm-yyyy'), 61109769, 2298339, 7343159, 94131062);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-03-2008', 'dd-mm-yyyy'), 78452257, 5709144, 2680144, 56892164);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-01-1995', 'dd-mm-yyyy'), 40738122, 4462241, 1300654, 10396520);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-12-2016', 'dd-mm-yyyy'), 55792528, 4260056, 3206472, 56686607);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-06-2024', 'dd-mm-yyyy'), 75955857, 4531615, 2409461, 40604721);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-03-1989', 'dd-mm-yyyy'), 89505478, 9877855, 5984456, 92559828);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-2001', 'dd-mm-yyyy'), 37998853, 3370289, 6473536, 13434734);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-08-1996', 'dd-mm-yyyy'), 94111225, 1728799, 6606394, 36870452);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-09-1991', 'dd-mm-yyyy'), 49165067, 1811902, 1774221, 9623725);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-12-2001', 'dd-mm-yyyy'), 90927079, 8806258, 6952618, 6894936);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-07-2019', 'dd-mm-yyyy'), 80277549, 2130543, 9119547, 93679893);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-08-2002', 'dd-mm-yyyy'), 26386861, 6280700, 9541494, 11788255);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-02-1998', 'dd-mm-yyyy'), 33820534, 5290223, 7075277, 73337354);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-09-2006', 'dd-mm-yyyy'), 31261139, 4009908, 5165777, 94132647);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-11-2011', 'dd-mm-yyyy'), 91473719, 2943547, 4492256, 18913413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-07-2002', 'dd-mm-yyyy'), 28103191, 7674424, 7811381, 95116153);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-08-1991', 'dd-mm-yyyy'), 3045057, 5189535, 7740404, 67903758);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-04-1999', 'dd-mm-yyyy'), 4837004, 1659951, 4492256, 88641943);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-05-2022', 'dd-mm-yyyy'), 68182754, 5619639, 9430689, 15507064);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-03-2021', 'dd-mm-yyyy'), 93574227, 8624271, 3549628, 83876900);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-12-2002', 'dd-mm-yyyy'), 67050757, 1142765, 5531195, 68438716);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-10-2013', 'dd-mm-yyyy'), 64923957, 9919494, 8569020, 49472824);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 65214061, 3793596, 6754712, 31475401);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-11-2022', 'dd-mm-yyyy'), 67969772, 8082648, 1465423, 40201837);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-12-1987', 'dd-mm-yyyy'), 51394444, 5814521, 8972120, 72066337);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-2005', 'dd-mm-yyyy'), 88226681, 2168132, 9569541, 38112888);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-04-2016', 'dd-mm-yyyy'), 36663641, 4091590, 1319868, 28615285);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-12-1993', 'dd-mm-yyyy'), 75422571, 5619639, 6151715, 77152444);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-01-1990', 'dd-mm-yyyy'), 63626058, 1209671, 4035585, 77949744);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-06-2012', 'dd-mm-yyyy'), 5188777, 3914677, 9430689, 932098);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-05-1997', 'dd-mm-yyyy'), 40321071, 3682062, 9715811, 64630390);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-06-1985', 'dd-mm-yyyy'), 34291247, 2226566, 7433072, 12713400);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-02-2023', 'dd-mm-yyyy'), 52433880, 6000719, 2243110, 64894395);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-01-1999', 'dd-mm-yyyy'), 90758508, 2517381, 8010589, 40201837);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-01-1997', 'dd-mm-yyyy'), 79953214, 8736964, 9828587, 57516103);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-04-1995', 'dd-mm-yyyy'), 10825877, 5751110, 4877533, 91418947);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-06-1993', 'dd-mm-yyyy'), 77759255, 4965843, 3288994, 77949744);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-10-2017', 'dd-mm-yyyy'), 50596315, 7418161, 7409569, 23578555);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-01-2024', 'dd-mm-yyyy'), 11898820, 4230538, 9449662, 98500004);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-01-2011', 'dd-mm-yyyy'), 56263123, 4178382, 2529517, 32850655);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 53369465, 6328334, 6620309, 5911534);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-10-2011', 'dd-mm-yyyy'), 20674261, 5463619, 8649620, 32956906);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 39704457, 7418161, 6391895, 1135811);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-07-2012', 'dd-mm-yyyy'), 72768654, 6000719, 6620309, 35793153);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-06-2010', 'dd-mm-yyyy'), 64083500, 9838042, 8721787, 69459210);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-12-2017', 'dd-mm-yyyy'), 98751553, 8806962, 7943944, 67903758);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-10-1999', 'dd-mm-yyyy'), 40318191, 1864586, 1651235, 3264965);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-11-2013', 'dd-mm-yyyy'), 67793657, 6405041, 1571685, 37507044);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-11-1995', 'dd-mm-yyyy'), 2988950, 6667347, 8683629, 87196277);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-07-2008', 'dd-mm-yyyy'), 61247206, 5682261, 9581453, 4458510);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-01-2018', 'dd-mm-yyyy'), 31703967, 9632388, 6172351, 35793153);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-05-1986', 'dd-mm-yyyy'), 22143126, 8627755, 2386734, 17524321);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-04-2001', 'dd-mm-yyyy'), 79912903, 4215250, 3011674, 80873306);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-05-2014', 'dd-mm-yyyy'), 40552983, 5460290, 5586419, 9375980);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-01-2008', 'dd-mm-yyyy'), 92628538, 5411804, 8250146, 15534926);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-12-2020', 'dd-mm-yyyy'), 2853212, 7932433, 3409603, 64301597);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-02-1994', 'dd-mm-yyyy'), 66868167, 6387386, 9071043, 24260195);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-02-2007', 'dd-mm-yyyy'), 38144065, 7871923, 6006540, 92408100);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-08-2005', 'dd-mm-yyyy'), 25274050, 9193770, 6606394, 17791571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-07-2010', 'dd-mm-yyyy'), 48061746, 4260056, 2968258, 47521586);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-07-2009', 'dd-mm-yyyy'), 37833119, 2228164, 7943944, 67903758);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-08-2021', 'dd-mm-yyyy'), 90400343, 5167926, 9438346, 99043331);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-09-1995', 'dd-mm-yyyy'), 7584046, 8653715, 5770996, 62221818);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-08-2012', 'dd-mm-yyyy'), 58372790, 4178382, 7943944, 36327030);
commit;
prompt 200 records committed...
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-09-1992', 'dd-mm-yyyy'), 22467139, 2966952, 2619943, 67514102);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-09-1998', 'dd-mm-yyyy'), 46659950, 1168868, 7943944, 88004875);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-08-1994', 'dd-mm-yyyy'), 6598613, 5411804, 4230878, 81968405);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-10-2011', 'dd-mm-yyyy'), 35344315, 6394733, 2885916, 36333117);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-09-2001', 'dd-mm-yyyy'), 50613538, 8258548, 5242198, 7502096);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-04-1987', 'dd-mm-yyyy'), 12293343, 8048284, 8835171, 21507744);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-08-2012', 'dd-mm-yyyy'), 19496899, 9884035, 6764647, 26009503);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-04-2002', 'dd-mm-yyyy'), 92565812, 4983449, 8679185, 1135811);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-10-2009', 'dd-mm-yyyy'), 26918089, 2154230, 6620309, 73337354);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-05-1987', 'dd-mm-yyyy'), 56265269, 1728799, 5518192, 37121217);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-07-2016', 'dd-mm-yyyy'), 82231854, 8059226, 4451881, 27185395);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-03-1990', 'dd-mm-yyyy'), 97191444, 8071823, 7591566, 95607052);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-09-1987', 'dd-mm-yyyy'), 62111148, 7376145, 7430534, 12766559);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-01-1992', 'dd-mm-yyyy'), 14668408, 6929074, 7740404, 29573119);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-11-2011', 'dd-mm-yyyy'), 46892063, 9856776, 4917937, 85762413);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-06-1996', 'dd-mm-yyyy'), 8161137, 7870637, 9728792, 91418947);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-07-1986', 'dd-mm-yyyy'), 42241683, 9054397, 6205479, 42168146);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-06-1990', 'dd-mm-yyyy'), 97462440, 9728352, 3550654, 36179824);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-10-2005', 'dd-mm-yyyy'), 58426673, 5167926, 2921909, 44861482);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-10-2018', 'dd-mm-yyyy'), 71461859, 7747422, 6172351, 36333117);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-03-2020', 'dd-mm-yyyy'), 36977939, 1864586, 4081706, 14869867);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-11-2009', 'dd-mm-yyyy'), 85322182, 4816455, 7653878, 13953420);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-06-2009', 'dd-mm-yyyy'), 12635426, 4462241, 2549829, 86344203);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-09-1994', 'dd-mm-yyyy'), 5484111, 8258548, 8020506, 45394940);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-07-1987', 'dd-mm-yyyy'), 7961134, 1111970, 8974520, 4454684);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-1998', 'dd-mm-yyyy'), 62664640, 7754410, 4740734, 26868228);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-04-2000', 'dd-mm-yyyy'), 12123490, 4983449, 4712732, 95173077);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-10-2003', 'dd-mm-yyyy'), 95370829, 9964895, 7750533, 80469401);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-04-1995', 'dd-mm-yyyy'), 85213281, 1659951, 6641069, 80948049);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-09-1987', 'dd-mm-yyyy'), 75010048, 5138196, 7312860, 20823584);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-09-2004', 'dd-mm-yyyy'), 36736676, 1864586, 1955729, 49096530);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-12-1989', 'dd-mm-yyyy'), 21380582, 6372921, 2051536, 12713400);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-04-2000', 'dd-mm-yyyy'), 65643799, 7559708, 8377294, 2573692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-11-2014', 'dd-mm-yyyy'), 16477082, 7870637, 8286009, 11788255);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-09-2020', 'dd-mm-yyyy'), 25918903, 1619879, 4149818, 10396520);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-07-2004', 'dd-mm-yyyy'), 12875245, 6270618, 5407315, 36327030);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-01-2012', 'dd-mm-yyyy'), 60322206, 7204674, 4139083, 88598912);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-08-2005', 'dd-mm-yyyy'), 675517, 4457628, 2885539, 53300331);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-01-2020', 'dd-mm-yyyy'), 89601699, 5260106, 4746823, 81778002);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-01-2008', 'dd-mm-yyyy'), 70000649, 8059226, 1476075, 26677939);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-05-2015', 'dd-mm-yyyy'), 362294, 4009908, 1921267, 11713301);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-05-2016', 'dd-mm-yyyy'), 76313940, 4783161, 2864106, 35875151);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-01-1991', 'dd-mm-yyyy'), 46423936, 2444885, 5185492, 7875506);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-06-1993', 'dd-mm-yyyy'), 1112132, 3932967, 2529517, 28677048);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-09-2012', 'dd-mm-yyyy'), 54919055, 8680841, 7273501, 60805569);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-12-1996', 'dd-mm-yyyy'), 32742098, 9054397, 5939051, 57174907);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 58914566, 2444885, 2494684, 50729064);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-01-1988', 'dd-mm-yyyy'), 35407179, 7559708, 8679185, 37102946);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-08-1986', 'dd-mm-yyyy'), 86287198, 8643852, 9104990, 36333117);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-10-1992', 'dd-mm-yyyy'), 11717204, 2669594, 9397323, 4454684);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-05-2018', 'dd-mm-yyyy'), 37717270, 8579230, 2161227, 77949744);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-03-2016', 'dd-mm-yyyy'), 52174330, 6103107, 5008631, 80873306);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-08-2022', 'dd-mm-yyyy'), 95640163, 4516818, 4078634, 31093161);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-12-1987', 'dd-mm-yyyy'), 31290779, 9838042, 7259581, 35599637);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-01-1996', 'dd-mm-yyyy'), 5374677, 3914677, 5656834, 17791571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-12-2021', 'dd-mm-yyyy'), 52943048, 4712013, 9916538, 91064416);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-01-1991', 'dd-mm-yyyy'), 66027618, 4399607, 8683629, 7582585);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-02-1987', 'dd-mm-yyyy'), 91308203, 8332109, 2084625, 68273252);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-12-1992', 'dd-mm-yyyy'), 22966367, 6615782, 6751104, 83810422);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-06-1991', 'dd-mm-yyyy'), 48184910, 4457628, 1653780, 5277842);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-03-1990', 'dd-mm-yyyy'), 47853701, 9620915, 4344273, 75336042);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-04-2018', 'dd-mm-yyyy'), 85984116, 5709144, 4003399, 39897612);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-02-1997', 'dd-mm-yyyy'), 6197612, 4178382, 5148414, 12713400);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-04-1995', 'dd-mm-yyyy'), 9307077, 4519379, 2217974, 28839411);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-07-1988', 'dd-mm-yyyy'), 53122723, 7507529, 1571685, 78248961);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-05-2015', 'dd-mm-yyyy'), 19627864, 2376389, 5661293, 26512133);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-01-1988', 'dd-mm-yyyy'), 53799392, 5501427, 3161788, 75097256);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-02-1991', 'dd-mm-yyyy'), 90154478, 5064258, 2243110, 30203355);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-03-1987', 'dd-mm-yyyy'), 27795176, 2283609, 4259432, 78427943);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-07-2020', 'dd-mm-yyyy'), 66670331, 7219055, 8271171, 82227944);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 2644172, 2446497, 9843722, 36808275);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-03-1986', 'dd-mm-yyyy'), 96057282, 9391213, 2322070, 9134812);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-06-2022', 'dd-mm-yyyy'), 19865943, 7574038, 1550137, 27399154);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-09-1986', 'dd-mm-yyyy'), 71233994, 2232153, 6614626, 42162764);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-01-2020', 'dd-mm-yyyy'), 36766188, 7235876, 2442810, 67594068);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-01-2000', 'dd-mm-yyyy'), 37356831, 1559141, 8510484, 83461037);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-04-2008', 'dd-mm-yyyy'), 66287770, 5370524, 4003399, 67311031);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-04-2020', 'dd-mm-yyyy'), 17069569, 8627755, 3472472, 10673571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-11-1999', 'dd-mm-yyyy'), 37516241, 1401833, 1502125, 80469401);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-06-1986', 'dd-mm-yyyy'), 25993048, 9842814, 1970667, 77045021);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-11-2018', 'dd-mm-yyyy'), 26338659, 1578025, 8511864, 73978250);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-06-2023', 'dd-mm-yyyy'), 2686557, 8959453, 6472183, 20534518);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-08-2008', 'dd-mm-yyyy'), 70141362, 1044950, 6159661, 54646163);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-06-1996', 'dd-mm-yyyy'), 86888751, 2966952, 6473536, 86344203);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-04-2011', 'dd-mm-yyyy'), 64911213, 3796995, 7445862, 81965427);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-08-2016', 'dd-mm-yyyy'), 23227089, 4531615, 5242936, 36391557);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-08-2020', 'dd-mm-yyyy'), 11846020, 6462752, 6151715, 96282692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-07-2020', 'dd-mm-yyyy'), 1400448, 9957921, 3715857, 82227944);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-05-1987', 'dd-mm-yyyy'), 36217872, 3663829, 8499716, 38447189);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-01-2021', 'dd-mm-yyyy'), 93659514, 7092828, 4492256, 19726030);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-06-2016', 'dd-mm-yyyy'), 70175948, 5260106, 6260410, 14869867);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-06-1991', 'dd-mm-yyyy'), 17039903, 5459882, 1476075, 70771400);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-02-1997', 'dd-mm-yyyy'), 48360578, 8428897, 5509661, 2573692);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-06-2021', 'dd-mm-yyyy'), 63952860, 8769990, 9299091, 19787948);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-09-1985', 'dd-mm-yyyy'), 78686894, 9204702, 4259432, 21596412);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-04-1986', 'dd-mm-yyyy'), 88514805, 2502991, 2864106, 82942028);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-06-2020', 'dd-mm-yyyy'), 89238294, 8093395, 9438346, 97732505);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-02-2008', 'dd-mm-yyyy'), 43603886, 8902777, 5700522, 49826183);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-05-2009', 'dd-mm-yyyy'), 15405354, 6328334, 3648110, 756562);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-05-1989', 'dd-mm-yyyy'), 92718996, 2130543, 1445614, 63706177);
commit;
prompt 300 records committed...
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-01-2010', 'dd-mm-yyyy'), 77618676, 3796995, 1006673, 22831334);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-10-2019', 'dd-mm-yyyy'), 55068940, 1165966, 8415054, 75350462);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-06-2022', 'dd-mm-yyyy'), 17434378, 5127556, 2821797, 78427943);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-08-2014', 'dd-mm-yyyy'), 6609066, 4175143, 5608251, 31956739);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-10-2013', 'dd-mm-yyyy'), 15648318, 1142765, 5939051, 27185395);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-03-1986', 'dd-mm-yyyy'), 67428082, 1559141, 4421744, 77949744);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-04-2016', 'dd-mm-yyyy'), 67704807, 3663829, 7387202, 28592193);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-11-1987', 'dd-mm-yyyy'), 86549541, 1168868, 6555536, 95173077);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-03-2017', 'dd-mm-yyyy'), 48800002, 6924336, 1770518, 79423328);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-01-2010', 'dd-mm-yyyy'), 81460444, 7215461, 1494654, 57516103);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-05-2001', 'dd-mm-yyyy'), 32915247, 9620915, 8835171, 43484496);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-07-1989', 'dd-mm-yyyy'), 34719593, 9391213, 1881662, 91418947);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-02-1986', 'dd-mm-yyyy'), 56646249, 2232153, 4789167, 49514633);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-03-2010', 'dd-mm-yyyy'), 59591089, 8579230, 8721787, 7875506);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('02-05-2009', 'dd-mm-yyyy'), 95293025, 7674424, 8266862, 10673571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-04-2017', 'dd-mm-yyyy'), 4349922, 7103565, 9659139, 984096);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-12-1988', 'dd-mm-yyyy'), 9676898, 9048854, 1275787, 14305674);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-07-2003', 'dd-mm-yyyy'), 25160255, 8908416, 3334257, 86683782);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-01-2016', 'dd-mm-yyyy'), 9189407, 6970091, 1948058, 94131062);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-03-1988', 'dd-mm-yyyy'), 46266878, 1572315, 1490135, 13044195);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-1999', 'dd-mm-yyyy'), 89953799, 4029199, 8271171, 7875506);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-01-1988', 'dd-mm-yyyy'), 96823453, 1659951, 7943944, 10673571);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-08-2023', 'dd-mm-yyyy'), 52338848, 7376145, 5770996, 19726030);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-06-2021', 'dd-mm-yyyy'), 35642919, 3924556, 6250062, 13261211);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-11-2018', 'dd-mm-yyyy'), 37521211, 8643852, 5921907, 14519788);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-10-2024', 'dd-mm-yyyy'), 73993346, 7661113, 7274926, 26616934);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-04-2023', 'dd-mm-yyyy'), 2334265, 3389429, 5686793, 67594068);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-11-2000', 'dd-mm-yyyy'), 24191351, 5189535, 7409569, 61056393);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-09-1998', 'dd-mm-yyyy'), 45331456, 5994660, 5131331, 65278457);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-10-2000', 'dd-mm-yyyy'), 88817916, 7360717, 5226870, 3412244);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-08-1997', 'dd-mm-yyyy'), 94601285, 3063581, 7842330, 15660875);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-04-2017', 'dd-mm-yyyy'), 29481811, 6667347, 1947297, 70771400);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2003', 'dd-mm-yyyy'), 57878615, 2929209, 8415088, 85082304);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-05-1991', 'dd-mm-yyyy'), 11996578, 5994660, 4734861, 98424825);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-01-2003', 'dd-mm-yyyy'), 96992028, 6568911, 7742545, 78760661);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-01-2011', 'dd-mm-yyyy'), 87035650, 5288876, 5684987, 95131625);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-03-2012', 'dd-mm-yyyy'), 91153663, 7563661, 5661293, 13566391);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-08-2022', 'dd-mm-yyyy'), 35281092, 8653715, 1556477, 49332773);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-08-2012', 'dd-mm-yyyy'), 33012477, 7092828, 4391407, 30510415);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-08-2014', 'dd-mm-yyyy'), 9218175, 2669594, 4423218, 6732852);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-05-2002', 'dd-mm-yyyy'), 16587478, 5874861, 5770996, 57174907);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('03-01-1994', 'dd-mm-yyyy'), 10902757, 7034919, 1502125, 67514102);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-04-1998', 'dd-mm-yyyy'), 24913396, 3351688, 4465703, 28333425);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-02-1995', 'dd-mm-yyyy'), 49956969, 2194728, 2885916, 78557666);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-02-1991', 'dd-mm-yyyy'), 46564111, 7204674, 6473536, 81965427);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-10-2000', 'dd-mm-yyyy'), 81847460, 7559708, 4747229, 78077779);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-04-2013', 'dd-mm-yyyy'), 6627956, 9856776, 1763226, 75063711);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-08-2016', 'dd-mm-yyyy'), 18184957, 1014559, 4900172, 64301597);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-08-1998', 'dd-mm-yyyy'), 30421716, 4519379, 7705454, 91418947);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-08-2016', 'dd-mm-yyyy'), 61978693, 7507529, 2217974, 48990599);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('31-01-1995', 'dd-mm-yyyy'), 31295878, 8405617, 8721787, 92408100);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-10-2002', 'dd-mm-yyyy'), 35393797, 1943848, 7175502, 77228790);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-12-2009', 'dd-mm-yyyy'), 28499623, 2033962, 8098170, 11981722);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-11-2015', 'dd-mm-yyyy'), 60431509, 7418161, 9552185, 48990599);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-05-2007', 'dd-mm-yyyy'), 92097343, 3774951, 7410828, 26512133);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-06-2019', 'dd-mm-yyyy'), 23658939, 8093395, 5921907, 78760661);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-02-2018', 'dd-mm-yyyy'), 31145258, 1899636, 9990333, 73978250);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-03-2016', 'dd-mm-yyyy'), 48054079, 4632584, 7445862, 26009503);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-10-2002', 'dd-mm-yyyy'), 57259763, 6374588, 7740404, 13044195);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-11-1996', 'dd-mm-yyyy'), 5231052, 7041368, 1283928, 54646163);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-03-1986', 'dd-mm-yyyy'), 13656591, 6143198, 6413613, 81965427);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-04-2001', 'dd-mm-yyyy'), 41673845, 4289528, 9813099, 95236434);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-07-1985', 'dd-mm-yyyy'), 27861471, 3256677, 9252025, 56892164);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-06-2012', 'dd-mm-yyyy'), 22801046, 9884767, 2524756, 97006839);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-01-2010', 'dd-mm-yyyy'), 97964501, 9964895, 4076850, 13060099);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-11-2002', 'dd-mm-yyyy'), 7123539, 5619639, 6754712, 15660875);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-09-2013', 'dd-mm-yyyy'), 98446183, 1708426, 4981242, 17313388);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('28-03-2013', 'dd-mm-yyyy'), 14328409, 8092242, 6200457, 82247827);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-07-2000', 'dd-mm-yyyy'), 59544872, 5730360, 1006673, 88004875);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-10-2023', 'dd-mm-yyyy'), 82235604, 3774951, 4734861, 84825384);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-11-2001', 'dd-mm-yyyy'), 60974395, 8450547, 4476599, 386261);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-03-2018', 'dd-mm-yyyy'), 97298625, 5781286, 9728792, 59958280);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('04-07-2006', 'dd-mm-yyyy'), 29005687, 2824103, 2299144, 53810865);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-11-1999', 'dd-mm-yyyy'), 36244825, 1222369, 4789167, 99043331);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-06-2003', 'dd-mm-yyyy'), 63759349, 3524103, 3550654, 11788255);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-12-2000', 'dd-mm-yyyy'), 37786825, 1209671, 8483977, 26512133);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-10-2016', 'dd-mm-yyyy'), 81333438, 4075689, 5081181, 65278457);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-02-2003', 'dd-mm-yyyy'), 86046589, 3914677, 8271171, 44861482);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-05-2013', 'dd-mm-yyyy'), 7797339, 5500181, 7117720, 72066337);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-02-2012', 'dd-mm-yyyy'), 58037837, 1708426, 8483977, 13448939);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-12-2002', 'dd-mm-yyyy'), 92156414, 7871923, 4565387, 60330653);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-08-2003', 'dd-mm-yyyy'), 4500546, 2036669, 3472472, 95131625);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-07-2010', 'dd-mm-yyyy'), 65212054, 5078964, 6811828, 70923580);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-02-2022', 'dd-mm-yyyy'), 65971639, 6387386, 5671310, 63516351);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-10-2001', 'dd-mm-yyyy'), 15085537, 3658865, 8098170, 57848355);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-05-1992', 'dd-mm-yyyy'), 14878641, 4260056, 6129333, 57174907);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-04-2000', 'dd-mm-yyyy'), 95748738, 9897142, 4502882, 65278457);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-02-2003', 'dd-mm-yyyy'), 12794887, 9842814, 8243244, 6255958);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-11-1997', 'dd-mm-yyyy'), 89098496, 7041368, 4734861, 20823584);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 43994172, 1108625, 2339510, 85082304);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-11-2016', 'dd-mm-yyyy'), 74363131, 4379844, 8098170, 46470862);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('10-01-2012', 'dd-mm-yyyy'), 95004566, 4372381, 5999406, 57174907);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-09-2005', 'dd-mm-yyyy'), 87443573, 5201833, 4613955, 52179145);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-05-2017', 'dd-mm-yyyy'), 22494341, 5800003, 7332750, 44214249);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-12-2005', 'dd-mm-yyyy'), 8571328, 5370524, 9990333, 43033640);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('06-11-1992', 'dd-mm-yyyy'), 3592582, 1622792, 2339510, 83590342);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-10-1992', 'dd-mm-yyyy'), 22082072, 7747422, 9822707, 64301597);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-04-2002', 'dd-mm-yyyy'), 58508178, 2033962, 7273501, 2713223);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('26-03-1987', 'dd-mm-yyyy'), 73706493, 2444885, 9660781, 79423328);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-02-2019', 'dd-mm-yyyy'), 54867062, 8149179, 1445614, 87329088);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for BOOK...
alter table BOOK enable constraint SYS_C009278;
prompt Enabling foreign key constraints for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK enable constraint SYS_C009282;
prompt Enabling foreign key constraints for ORDERING...
alter table ORDERING enable constraint SYS_C009288;
alter table ORDERING enable constraint SYS_C009289;
prompt Enabling foreign key constraints for BOOKORDERING...
alter table BOOKORDERING enable constraint SYS_C009294;
alter table BOOKORDERING enable constraint SYS_C009295;
alter table BOOKORDERING enable constraint SYS_C009296;
prompt Enabling triggers for BOOKCLASS...
alter table BOOKCLASS enable all triggers;
prompt Enabling triggers for BOOK...
alter table BOOK enable all triggers;
prompt Enabling triggers for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK enable all triggers;
prompt Enabling triggers for SUPPLIER...
alter table SUPPLIER enable all triggers;
prompt Enabling triggers for LIBRARIAN...
alter table LIBRARIAN enable all triggers;
prompt Enabling triggers for ORDERING...
alter table ORDERING enable all triggers;
prompt Enabling triggers for READER...
alter table READER enable all triggers;
prompt Enabling triggers for BOOKORDERING...
alter table BOOKORDERING enable all triggers;

set feedback on
set define on
prompt Done
