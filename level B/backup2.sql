prompt PL/SQL Developer Export Tables for user AHUVA@XE
prompt Created by user on שבת 08 יוני 2024
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
  add primary key (COPYCODE, BOOKID);
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
alter table BOOK disable constraint SYS_C009550;
prompt Disabling foreign key constraints for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK disable constraint SYS_C009554;
prompt Disabling foreign key constraints for ORDERING...
alter table ORDERING disable constraint SYS_C009560;
alter table ORDERING disable constraint SYS_C009561;
prompt Disabling foreign key constraints for BOOKORDERING...
alter table BOOKORDERING disable constraint SYS_C009566;
alter table BOOKORDERING disable constraint SYS_C009567;
alter table BOOKORDERING disable constraint SYS_C009568;
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
values (1, 'Children', 'Floor 1 Column 2', 'Maroon');
insert into BOOKCLASS (classid, classname, locationc, color)
values (2, 'Beautiful literature', 'Floor 2 Column 9', 'Purple');
insert into BOOKCLASS (classid, classname, locationc, color)
values (3, 'Science fiction', 'Floor 2 Column 4', 'Magenta');
insert into BOOKCLASS (classid, classname, locationc, color)
values (4, 'Game', 'Floor 1 Column 6', 'Yellow');
insert into BOOKCLASS (classid, classname, locationc, color)
values (5, 'Fantasies', 'Floor 2 Column 5', 'Orange');
insert into BOOKCLASS (classid, classname, locationc, color)
values (6, 'Youth', 'Floor 2 Column 3', 'Green');
insert into BOOKCLASS (classid, classname, locationc, color)
values (7, 'Adults', 'Floor 1 Column 11', 'Teal');
insert into BOOKCLASS (classid, classname, locationc, color)
values (8, 'Russian', 'Floor 3 Column 4', 'Blue');
insert into BOOKCLASS (classid, classname, locationc, color)
values (9, 'Audiobook', 'Floor 1 Column 7', 'Brown');
insert into BOOKCLASS (classid, classname, locationc, color)
values (11, 'Childrens English', 'Floor 2 Column 7', 'Pink');
insert into BOOKCLASS (classid, classname, locationc, color)
values (12, 'Adult English', 'Floor 2 Column 8', 'Gray');
insert into BOOKCLASS (classid, classname, locationc, color)
values (13, 'Poetry', 'Floor 3 Column 3', 'Black');
insert into BOOKCLASS (classid, classname, locationc, color)
values (14, 'Digital book', 'Floor 1 Column 8', 'White');
insert into BOOKCLASS (classid, classname, locationc, color)
values (15, 'French', 'Floor 3 Column 3', 'Silver');
insert into BOOKCLASS (classid, classname, locationc, color)
values (16, 'Voltage', 'Floor 2 Column 2', 'Gold');
insert into BOOKCLASS (classid, classname, locationc, color)
values (17, 'Comics', 'Floor 1 Column 4', 'Cyan');
insert into BOOKCLASS (classid, classname, locationc, color)
values (18, 'Holocaust', 'Floor 3 Column 4', 'Lime');
insert into BOOKCLASS (classid, classname, locationc, color)
values (19, 'Legacy', 'Floor 1 Column 10', 'Olive');
insert into BOOKCLASS (classid, classname, locationc, color)
values (20, 'Biography', 'Floor 1 Column 9', 'Chocolate');
insert into BOOKCLASS (classid, classname, locationc, color)
values (21, 'Judaism', 'Floor 1 Column 5', 'Coral');
insert into BOOKCLASS (classid, classname, locationc, color)
values (22, 'Nonfiction', 'Floor 1 Column 10', 'Aqua');
insert into BOOKCLASS (classid, classname, locationc, color)
values (23, 'Studies', 'Floor 3 Column 1', 'Violet');
insert into BOOKCLASS (classid, classname, locationc, color)
values (24, 'Toddler', 'Floor 1 Column 3', 'Red');
commit;
prompt 23 records loaded
prompt Loading BOOK...
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Ordet (Word, The)', 'HarperCollins', 'Reggi Waller', 1996, 1, 22);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Landscape in the Mist', 'Scholastic Corporation', 'Charis Verheijden', 2004, 2, 6);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Sound of Redemption', 'Puffin book', 'Timofei Cholwell', 2005, 3, 20);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Doomsday', 'Straus and Giroux', 'Ursula Bushe', 2007, 4, 19);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Emma', 'Penguin Random House', 'Bill Warbys', 1996, 5, 24);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Talking Picture', 'Farrar', 'Fernando Milson', 1994, 6, 7);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Donald Glover: Weirdo', 'Farrar', 'Charlena Batters', 2006, 7, 2);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Legends of the Canyon', 'Penguin book', 'Gualterio Molland', 1985, 8, 23);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('On the Outs', 'Knopf Doubleday Group', 'Vladimir Chaplain', 2000, 9, 12);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Snow White (Blancanieves)', 'Vintage book', 'Pietra O Gara', 2007, 10, 11);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Man on the Trapeze', 'Knopf Doubleday Group', 'Katy Le Barre', 1993, 11, 14);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Numbskull Emptybrook', 'Houghton Mifflin', 'August Caplan', 2007, 12, 18);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Rhino Season (Fasle kargadan)', 'Bloomsbury Publishing', 'Jacques Rhymer', 2000, 13, 19);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Other Son', 'Bloomsbury Publishing', 'Kameko Kobpac', 2002, 14, 21);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Tombstone', 'Vintage book', 'Lesley Corrao', 2001, 15, 21);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Circle of Eight', 'Bloomsbury Publishing', 'Martainn Tyne', 1994, 16, 22);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Splendor in the Grass', 'Random House', 'Rob Bilbey', 1992, 17, 6);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Third Wheel, The', 'Farrar', 'Constantin MacCrossan', 2010, 18, 4);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('One Lucky Elephant', 'Knopf Doubleday Group', 'Doyle Bonelle', 2007, 19, 18);
insert into BOOK (bookname, bookpublisher, authorname, publishyear, bookid, classid)
values ('Dead Tired (Grosse Fatigue)', 'Brown and Company', 'Sophey Norgan', 1994, 20, 23);
commit;
prompt 20 records loaded
prompt Loading BOOKCOPYINSTOCK...
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (37782507, 'Available', to_date('23-01-2018', 'dd-mm-yyyy'), 1);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (61871964, 'Borrowed', to_date('22-01-2013', 'dd-mm-yyyy'), 1);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (87503114, 'Available', to_date('30-11-2017', 'dd-mm-yyyy'), 1);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (80690605, 'Borrowed', to_date('20-06-2019', 'dd-mm-yyyy'), 3);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96752840, 'Available', to_date('14-08-2016', 'dd-mm-yyyy'), 3);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (34088135, 'Withdrawn', to_date('14-12-2021', 'dd-mm-yyyy'), 3);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (81187236, 'Borrowed', to_date('05-08-2012', 'dd-mm-yyyy'), 20);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71215473, 'Borrowed', to_date('11-05-2019', 'dd-mm-yyyy'), 20);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (98030626, 'On display', to_date('19-02-2016', 'dd-mm-yyyy'), 2);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (31616307, 'Available', to_date('02-04-2011', 'dd-mm-yyyy'), 20);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (78804925, 'Borrowed', to_date('01-05-2012', 'dd-mm-yyyy'), 15);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71544429, 'Reference only', to_date('19-06-2019', 'dd-mm-yyyy'), 15);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42592289, 'Available', to_date('07-12-2016', 'dd-mm-yyyy'), 12);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (69008758, 'Available', to_date('23-09-2022', 'dd-mm-yyyy'), 11);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (49421933, 'Available', to_date('15-01-2015', 'dd-mm-yyyy'), 11);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42894389, 'Available', to_date('21-02-2021', 'dd-mm-yyyy'), 13);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (19817368, 'Withdrawn', to_date('22-05-2011', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55590053, 'Available', to_date('22-10-2016', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (55466799, 'Available', to_date('05-09-2016', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (25471663, null, to_date('13-06-2010', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90898572, 'Available', to_date('02-02-2018', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65485522, 'Reference only', to_date('17-03-2014', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (91015468, 'Available', to_date('18-08-2022', 'dd-mm-yyyy'), 5);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (67885061, 'Available', to_date('16-10-2017', 'dd-mm-yyyy'), 5);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (96429400, 'Borrowed', to_date('17-02-2020', 'dd-mm-yyyy'), 5);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (25510782, 'Available', to_date('29-07-2012', 'dd-mm-yyyy'), 5);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90288238, 'Available', to_date('28-12-2019', 'dd-mm-yyyy'), 9);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (81287063, null, to_date('26-10-2012', 'dd-mm-yyyy'), 16);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (66020135, 'Borrowed', to_date('21-10-2013', 'dd-mm-yyyy'), 16);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (42004806, 'Available', to_date('06-03-2017', 'dd-mm-yyyy'), 13);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (32756895, 'Borrowed', to_date('12-09-2011', 'dd-mm-yyyy'), 11);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17349363, 'Borrowed', to_date('28-06-2015', 'dd-mm-yyyy'), 19);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59620955, 'Available', to_date('19-11-2018', 'dd-mm-yyyy'), 18);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (31211604, 'Available', to_date('09-06-2013', 'dd-mm-yyyy'), 17);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17678634, 'On display', to_date('11-07-2021', 'dd-mm-yyyy'), 16);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (71610914, 'Borrowed', to_date('03-12-2012', 'dd-mm-yyyy'), 15);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (65597753, 'On display', to_date('08-08-2016', 'dd-mm-yyyy'), 14);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (90045566, 'Available', to_date('04-06-2019', 'dd-mm-yyyy'), 13);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (59109754, 'Available', to_date('28-03-2022', 'dd-mm-yyyy'), 12);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (47409439, 'Available', to_date('19-10-2020', 'dd-mm-yyyy'), 11);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (84299819, 'Available', to_date('03-07-2019', 'dd-mm-yyyy'), 10);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (18197288, 'Available', to_date('13-11-2023', 'dd-mm-yyyy'), 9);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (72580844, 'Withdrawn', to_date('27-08-2019', 'dd-mm-yyyy'), 8);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (11994552, 'Available', to_date('02-01-2022', 'dd-mm-yyyy'), 7);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (17800693, 'Available', to_date('12-06-2022', 'dd-mm-yyyy'), 6);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (22422514, 'Available', to_date('03-12-2023', 'dd-mm-yyyy'), 5);
insert into BOOKCOPYINSTOCK (copycode, status, purchasedate, bookid)
values (89170041, 'Borrowed', to_date('07-09-2018', 'dd-mm-yyyy'), 4);
commit;
prompt 47 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (supname, supid, sphone, terms)
values ('f', 111111111, '058-0598940', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('g', 222222222, '056-3151246', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('h', 333333333, '059-7713252', 'Sunday-Friday: between 8:00 and 13:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('i', 444444444, '057-9380611', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('j', 555555555, '050-3557331', 'Sunday-Thursday: between 8:00 and 16:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('k', 666666666, '055-3411586', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('l', 777777777, '055-3411286', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('m', 888888888, '054-3411586', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('o', 101101101, '054-3411586', 'Wednesday: between 10:00 and 12:00');
insert into SUPPLIER (supname, supid, sphone, terms)
values ('n', 999999999, '055-3414286', 'Wednesday: between 10:00 and 12:00');
commit;
prompt 10 records loaded
prompt Loading LIBRARIAN...
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('a', '050-5589584', 'a', '3F8MJhunz9GKf');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('b', '054-2093893', 'b', 'sOgeL1G75l');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('c', '059-8336627', 'c', 'LdYGsoyu');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('d', '055-1127882', 'd', '5sZv4HP7');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('e', '057-2634285', 'e', 'dV8KVKVK');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('f', '050-3821575', 'f', 'eIXmUiKBlbH');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('h', '058-3467554', 'h', 'eIrgegrglu');
insert into LIBRARIAN (librarianname, lphone, lusername, lpassword)
values ('g', '052-4332244', 'g', '65gyy4443');
commit;
prompt 8 records loaded
prompt Loading ORDERING...
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-03-2019', 'dd-mm-yyyy'), 'Delivered', 31, 'h', 111111111);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-03-2020', 'dd-mm-yyyy'), 'Delivered', 1, 'a', 111111111);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 'Delivered', 2, 'b', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('24-01-2021', 'dd-mm-yyyy'), 'Cancelled', 3, 'c', 333333333);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-09-2019', 'dd-mm-yyyy'), 'Delivered', 4, 'd', 444444444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('19-02-2018', 'dd-mm-yyyy'), 'Shipped', 5, 'a', 555555555);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('11-11-2020', 'dd-mm-yyyy'), 'Delivered', 6, 'a', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-04-2022', 'dd-mm-yyyy'), 'Delivered', 7, 'a', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('28-12-2019', 'dd-mm-yyyy'), 'Delivered', 8, 'a', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('13-06-2018', 'dd-mm-yyyy'), 'Delivered', 9, 'a', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('21-07-2021', 'dd-mm-yyyy'), 'Delivered', 10, 'a', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-08-2018', 'dd-mm-yyyy'), 'Shipped', 11, 'a', 333333333);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('22-10-2022', 'dd-mm-yyyy'), 'Delivered', 12, 'b', 333333333);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('16-04-2019', 'dd-mm-yyyy'), 'Delivered', 13, 'b', 444444444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('02-03-2020', 'dd-mm-yyyy'), 'Delivered', 14, 'b', 444444444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 'Delivered', 15, 'b', 444444444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('17-02-2022', 'dd-mm-yyyy'), 'Delivered', 16, 'b', 444444444);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('09-01-2018', 'dd-mm-yyyy'), 'Shipped', 17, 'c', 555555555);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('14-05-2019', 'dd-mm-yyyy'), 'Cancelled', 18, 'c', 555555555);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('27-08-2020', 'dd-mm-yyyy'), 'Delivered', 19, 'c', 555555555);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('10-12-2021', 'dd-mm-yyyy'), 'Delivered', 20, 'c', 555555555);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('18-06-2018', 'dd-mm-yyyy'), 'Delivered', 21, 'c', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('29-09-2019', 'dd-mm-yyyy'), 'Delivered', 22, 'c', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('12-04-2020', 'dd-mm-yyyy'), 'Shipped', 23, 'c', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('23-07-2021', 'dd-mm-yyyy'), 'Delivered', 24, 'c', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('01-02-2022', 'dd-mm-yyyy'), 'Cancelled', 25, 'd', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('08-03-2018', 'dd-mm-yyyy'), 'Delivered', 26, 'd', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-04-2019', 'dd-mm-yyyy'), 'Delivered', 27, 'd', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('20-05-2020', 'dd-mm-yyyy'), 'Delivered', 28, 'd', 111111111);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('30-08-2021', 'dd-mm-yyyy'), 'Shipped', 29, 'f', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-10-2022', 'dd-mm-yyyy'), 'Delivered', 30, 'e', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 'Delivered', 32, 'e', 222222222);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 'Delivered', 33, 'd', 666666666);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 'Completed', 34, 'c', 333333333);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-06-2024', 'dd-mm-yyyy'), 'Delivered', 35, 'h', 777777777);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-06-2024', 'dd-mm-yyyy'), 'Delivered', 36, 'h', 777777777);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 'Delivered', 37, 'h', 888888888);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 'Delivered', 38, 'h', 888888888);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 'Delivered', 39, 'h', 888888888);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('04-05-2024', 'dd-mm-yyyy'), 'Delivered', 43, 'h', 101101101);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 'Delivered', 44, 'h', 101101101);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('07-05-2024', 'dd-mm-yyyy'), 'Delivered', 40, 'h', 999999999);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 'Delivered', 41, 'h', 999999999);
insert into ORDERING (orderdate, status, orderid, lusername, supid)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 'Delivered', 42, 'h', 999999999);
commit;
prompt 44 records loaded
prompt Loading READER...
insert into READER (readername, readernumber, phone)
values ('Shamus Stain', 1, '053-3148753');
insert into READER (readername, readernumber, phone)
values ('Forester Braune', 2, '051-5282424');
insert into READER (readername, readernumber, phone)
values ('Nydia Serot', 3, '053-7590630');
insert into READER (readername, readernumber, phone)
values ('Sharai Plaskett', 4, '052-0468761');
insert into READER (readername, readernumber, phone)
values ('Salomi Lambswood', 5, '050-2450042');
insert into READER (readername, readernumber, phone)
values ('Helene Reed', 6, '055-6907106');
insert into READER (readername, readernumber, phone)
values ('Tabb Hunton', 7, '053-6779373');
insert into READER (readername, readernumber, phone)
values ('Caro Alecock', 8, '052-5091653');
insert into READER (readername, readernumber, phone)
values ('Nels Gallagher', 9, '056-9986168');
insert into READER (readername, readernumber, phone)
values ('Ardyth Tinkler', 10, '054-9017869');
insert into READER (readername, readernumber, phone)
values ('Bertine Monier', 11, '056-2362462');
insert into READER (readername, readernumber, phone)
values ('Hans Maes', 12, '056-7720180');
insert into READER (readername, readernumber, phone)
values ('Aarika Willmore', 13, '055-2544209');
insert into READER (readername, readernumber, phone)
values ('Jo Vittore', 14, '059-4010140');
insert into READER (readername, readernumber, phone)
values ('Georgiana Kaine', 15, '051-7369572');
insert into READER (readername, readernumber, phone)
values ('Elihu Mabb', 16, '052-1046505');
insert into READER (readername, readernumber, phone)
values ('Gavra Lowless', 17, '050-9076889');
insert into READER (readername, readernumber, phone)
values ('Brigid Kerbler', 18, '057-7951788');
insert into READER (readername, readernumber, phone)
values ('Rodina Dallimore', 19, '053-6271008');
insert into READER (readername, readernumber, phone)
values ('Swen Springham', 20, '053-1400481');
insert into READER (readername, readernumber, phone)
values ('Alexandre Koop', 21, '054-0175447');
insert into READER (readername, readernumber, phone)
values ('Rory Baruch', 22, '052-8060466');
insert into READER (readername, readernumber, phone)
values ('Rodney Tollett', 23, '054-2837170');
insert into READER (readername, readernumber, phone)
values ('Walden Boltwood', 24, '055-7728953');
commit;
prompt 24 records loaded
prompt Loading BOOKORDERING...
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-04-2019', 'dd-mm-yyyy'), 1, 2, 3, 3);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-06-2020', 'dd-mm-yyyy'), 2, 1, 6, 5);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-11-2021', 'dd-mm-yyyy'), 3, 3, 5, 10);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-01-2018', 'dd-mm-yyyy'), 4, 4, 2, 15);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('05-09-2022', 'dd-mm-yyyy'), 5, 5, 1, 20);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-07-2019', 'dd-mm-yyyy'), 6, 5, 2, 22);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-08-2021', 'dd-mm-yyyy'), 7, 4, 6, 25);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('14-05-2022', 'dd-mm-yyyy'), 8, 3, 4, 28);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-03-2020', 'dd-mm-yyyy'), 9, 2, 1, 3);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('25-12-2021', 'dd-mm-yyyy'), 10, 1, 3, 5);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('16-02-2022', 'dd-mm-yyyy'), 11, 2, 5, 10);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-11-2019', 'dd-mm-yyyy'), 12, 3, 6, 15);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('01-01-2023', 'dd-mm-yyyy'), 13, 4, 1, 20);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-12-2018', 'dd-mm-yyyy'), 14, 5, 2, 22);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('07-03-2021', 'dd-mm-yyyy'), 15, 1, 4, 25);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('29-04-2022', 'dd-mm-yyyy'), 16, 2, 6, 28);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-02-2020', 'dd-mm-yyyy'), 17, 1, 1, 3);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-08-2019', 'dd-mm-yyyy'), 18, 3, 6, 5);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-10-2022', 'dd-mm-yyyy'), 19, 2, 5, 10);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-05-2021', 'dd-mm-yyyy'), 20, 4, 2, 15);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-03-2018', 'dd-mm-yyyy'), 21, 5, 1, 20);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 22, 1, 3, 22);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-07-2020', 'dd-mm-yyyy'), 23, 2, 6, 25);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('12-09-2021', 'dd-mm-yyyy'), 24, 5, 4, 28);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('15-06-2019', 'dd-mm-yyyy'), 25, 1, 5, 3);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 26, 3, 1, 5);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-08-2022', 'dd-mm-yyyy'), 27, 4, 3, 10);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('09-04-2021', 'dd-mm-yyyy'), 28, 5, 2, 15);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('20-09-2018', 'dd-mm-yyyy'), 29, 2, 6, 20);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('30-10-2019', 'dd-mm-yyyy'), 30, 1, 4, 22);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('19-05-2020', 'dd-mm-yyyy'), 31, 3, 1, 25);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('11-01-2022', 'dd-mm-yyyy'), 32, 4, 3, 28);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('13-06-2021', 'dd-mm-yyyy'), 33, 5, 5, 3);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('24-11-2018', 'dd-mm-yyyy'), 34, 1, 6, 5);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('17-12-2019', 'dd-mm-yyyy'), 35, 2, 1, 10);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('08-08-2020', 'dd-mm-yyyy'), 36, 3, 2, 15);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('18-03-2022', 'dd-mm-yyyy'), 37, 4, 4, 20);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('21-07-2021', 'dd-mm-yyyy'), 38, 5, 3, 22);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2018', 'dd-mm-yyyy'), 39, 1, 1, 25);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 40, 2, 6, 28);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2018', 'dd-mm-yyyy'), 41, 1, 1, 31);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 42, 2, 6, 31);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('22-04-2018', 'dd-mm-yyyy'), 43, 1, 6, null);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 44, 2, 3, null);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 45, 1, 6, null);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 46, 11, 9, null);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 47, 8, 4, null);
insert into BOOKORDERING (readerorderdate, readerorderid, bookid, readernumber, orderid)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 48, 5, 1, null);
commit;
prompt 48 records loaded
prompt Enabling foreign key constraints for BOOK...
alter table BOOK enable constraint SYS_C009550;
prompt Enabling foreign key constraints for BOOKCOPYINSTOCK...
alter table BOOKCOPYINSTOCK enable constraint SYS_C009554;
prompt Enabling foreign key constraints for ORDERING...
alter table ORDERING enable constraint SYS_C009560;
alter table ORDERING enable constraint SYS_C009561;
prompt Enabling foreign key constraints for BOOKORDERING...
alter table BOOKORDERING enable constraint SYS_C009566;
alter table BOOKORDERING enable constraint SYS_C009567;
alter table BOOKORDERING enable constraint SYS_C009568;
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
