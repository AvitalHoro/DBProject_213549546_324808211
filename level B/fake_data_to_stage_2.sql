--supllier
insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('f', 111111111, '058-0598940', 'Sunday-Thursday: between 8:00 and 16:00');

insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('g', 222222222, '056-3151246', 'Sunday-Thursday: between 8:00 and 16:00');

insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('h', 333333333, '059-7713252', 'Sunday-Friday: between 8:00 and 13:00');

insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('i', 444444444, '057-9380611', 'Sunday-Thursday: between 8:00 and 16:00');

insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('j', 555555555, '050-3557331', 'Sunday-Thursday: between 8:00 and 16:00');

insert into SUPPLIER (SUPNAME, SUPID, sphone, TERMS)
values ('k', 666666666, '055-3411586', 'Wednesday: between 10:00 and 12:00');

--librarian
insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('a', '050-5589584', 'a', '3F8MJhunz9GKf');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('b', '054-2093893', 'b', 'sOgeL1G75l');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('c', '059-8336627', 'c', 'LdYGsoyu');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('d', '055-1127882', 'd', '5sZv4HP7');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('e', '057-2634285', 'e', 'dV8KVKVK');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('f', '050-3821575', 'f', 'eIXmUiKBlbH');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('h', '058-3467554', 'h', 'eIrgegrglu');

insert into LIBRARIAN (LIBRARIANNAME, LPHONE, LUSERNAME, Lpassword)
values ('g', '052-4332244', 'g', '65gyy4443');


--ordering
insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('15-03-2019', 'dd-mm-yyyy'), 'Delivered', 31, 'h', 111111111);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('15-03-2020', 'dd-mm-yyyy'), 'Delivered', 1, 'a', 111111111);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 'Delivered', 2, 'b', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('24-01-2021', 'dd-mm-yyyy'), 'Cancelled', 3, 'c', 333333333);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('06-09-2019', 'dd-mm-yyyy'), 'Delivered', 4, 'd', 444444444);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('19-02-2018', 'dd-mm-yyyy'), 'Shipped', 5, 'a', 555555555);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('11-11-2020', 'dd-mm-yyyy'), 'Delivered', 6, 'a', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('03-04-2022', 'dd-mm-yyyy'), 'Delivered', 7, 'a', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('28-12-2019', 'dd-mm-yyyy'), 'Delivered', 8, 'a', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('13-06-2018', 'dd-mm-yyyy'), 'Delivered', 9, 'a', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('21-07-2021', 'dd-mm-yyyy'), 'Delivered', 10, 'a', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('05-08-2018', 'dd-mm-yyyy'), 'Shipped', 11, 'a', 333333333);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('22-10-2022', 'dd-mm-yyyy'), 'Delivered', 12, 'b', 333333333);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('16-04-2019', 'dd-mm-yyyy'), 'Delivered', 13, 'b', 444444444);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('02-03-2020', 'dd-mm-yyyy'), 'Delivered', 14, 'b', 444444444);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('25-07-2021', 'dd-mm-yyyy'), 'Delivered', 15, 'b', 444444444);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('17-02-2022', 'dd-mm-yyyy'), 'Delivered', 16, 'b', 444444444);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('09-01-2018', 'dd-mm-yyyy'), 'Shipped', 17, 'c', 555555555);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('14-05-2019', 'dd-mm-yyyy'), 'Cancelled', 18, 'c', 555555555);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('27-08-2020', 'dd-mm-yyyy'), 'Delivered', 19, 'c', 555555555);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('10-12-2021', 'dd-mm-yyyy'), 'Delivered', 20, 'c', 555555555);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('18-06-2018', 'dd-mm-yyyy'), 'Delivered', 21, 'c', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('29-09-2019', 'dd-mm-yyyy'), 'Delivered', 22, 'c', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('12-04-2020', 'dd-mm-yyyy'), 'Shipped', 23, 'c', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('23-07-2021', 'dd-mm-yyyy'), 'Delivered', 24, 'c', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('01-02-2022', 'dd-mm-yyyy'), 'Cancelled', 25, 'd', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('08-03-2018', 'dd-mm-yyyy'), 'Delivered', 26, 'd', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('15-04-2019', 'dd-mm-yyyy'), 'Delivered', 27, 'd', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('20-05-2020', 'dd-mm-yyyy'), 'Delivered', 28, 'd', 111111111);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('30-08-2021', 'dd-mm-yyyy'), 'Shipped', 29, 'f', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('04-10-2022', 'dd-mm-yyyy'), 'Delivered', 30, 'e', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 'Delivered', 32, 'e', 222222222);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 'Delivered', 33, 'd', 666666666);

insert into ORDERING (ORDERDATE, STATUS, ORDERID, LUSERNAME, SUPID) values (to_date('05-06-2024', 'dd-mm-yyyy'), 'Completed', 34, 'c', 333333333);


--bookcalss
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (1, 'Children', 'Floor 1 Column 2', 'Maroon');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (2, 'Beautiful literature', 'Floor 2 Column 9', 'Purple');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (3, 'Science fiction', 'Floor 2 Column 4', 'Magenta');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (4, 'Game', 'Floor 1 Column 6', 'Yellow');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (5, 'Fantasies', 'Floor 2 Column 5', 'Orange');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (6, 'Youth', 'Floor 2 Column 3', 'Green');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (7, 'Adults', 'Floor 1 Column 11', 'Teal');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (8, 'Russian', 'Floor 3 Column 4', 'Blue');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (9, 'Audiobook', 'Floor 1 Column 7', 'Brown');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (11, 'Childrens English', 'Floor 2 Column 7', 'Pink');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (12, 'Adult English', 'Floor 2 Column 8', 'Gray');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (13, 'Poetry', 'Floor 3 Column 3', 'Black');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (14, 'Digital book', 'Floor 1 Column 8', 'White');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (15, 'French', 'Floor 3 Column 3', 'Silver');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (16, 'Voltage', 'Floor 2 Column 2', 'Gold');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (17, 'Comics', 'Floor 1 Column 4', 'Cyan');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (18, 'Holocaust', 'Floor 3 Column 4', 'Lime');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (19, 'Legacy', 'Floor 1 Column 10', 'Olive');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (20, 'Biography', 'Floor 1 Column 9', 'Chocolate');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (21, 'Judaism', 'Floor 1 Column 5', 'Coral');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (22, 'Nonfiction', 'Floor 1 Column 10', 'Aqua');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (23, 'Studies', 'Floor 3 Column 1', 'Violet');
INSERT INTO BOOKCLASS (ClassId, ClassName, Locationc, Color) VALUES (24, 'Toddler', 'Floor 1 Column 3', 'Red');



--reader
insert into Reader (readerNumber, readerName, phone) values (1, 'Shamus Stain', '053-3148753');
insert into Reader (readerNumber, readerName, phone) values (2, 'Forester Braune', '051-5282424');
insert into Reader (readerNumber, readerName, phone) values (3, 'Nydia Serot', '053-7590630');
insert into Reader (readerNumber, readerName, phone) values (4, 'Sharai Plaskett', '052-0468761');
insert into Reader (readerNumber, readerName, phone) values (5, 'Salomi Lambswood', '050-2450042');
insert into Reader (readerNumber, readerName, phone) values (6, 'Helene Reed', '055-6907106');
insert into Reader (readerNumber, readerName, phone) values (7, 'Tabb Hunton', '053-6779373');
insert into Reader (readerNumber, readerName, phone) values (8, 'Caro Alecock', '052-5091653');
insert into Reader (readerNumber, readerName, phone) values (9, 'Nels Gallagher', '056-9986168');
insert into Reader (readerNumber, readerName, phone) values (10, 'Ardyth Tinkler', '054-9017869');
insert into Reader (readerNumber, readerName, phone) values (11, 'Bertine Monier', '056-2362462');
insert into Reader (readerNumber, readerName, phone) values (12, 'Hans Maes', '056-7720180');
insert into Reader (readerNumber, readerName, phone) values (13, 'Aarika Willmore', '055-2544209');
insert into Reader (readerNumber, readerName, phone) values (14, 'Jo Vittore', '059-4010140');
insert into Reader (readerNumber, readerName, phone) values (15, 'Georgiana Kaine', '051-7369572');
insert into Reader (readerNumber, readerName, phone) values (16, 'Elihu Mabb', '052-1046505');
insert into Reader (readerNumber, readerName, phone) values (17, 'Gavra Lowless', '050-9076889');
insert into Reader (readerNumber, readerName, phone) values (18, 'Brigid Kerbler', '057-7951788');
insert into Reader (readerNumber, readerName, phone) values (19, 'Rodina Dallimore', '053-6271008');
insert into Reader (readerNumber, readerName, phone) values (20, 'Swen Springham', '053-1400481');
insert into Reader (readerNumber, readerName, phone) values (21, 'Alexandre Koop', '054-0175447');
insert into Reader (readerNumber, readerName, phone) values (22, 'Rory Baruch', '052-8060466');
insert into Reader (readerNumber, readerName, phone) values (23, 'Rodney Tollett', '054-2837170');
insert into Reader (readerNumber, readerName, phone) values (24, 'Walden Boltwood', '055-7728953');


INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (1, 'Ordet (Word, The)', 'HarperCollins', 'Reggi Waller', 1996, 22);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (2, 'Landscape in the Mist', 'Scholastic Corporation', 'Charis Verheijden', 2004, 6);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (3, 'Sound of Redemption', 'Puffin book', 'Timofei Cholwell', 2005, 20);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (4, 'Doomsday', 'Straus and Giroux', 'Ursula Bushe', 2007, 19);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (5, 'Emma', 'Penguin Random House', 'Bill Warbys', 1996, 24);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (6, 'Talking Picture', 'Farrar', 'Fernando Milson', 1994, 7);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (7, 'Donald Glover: Weirdo', 'Farrar', 'Charlena Batters', 2006, 2);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (8, 'Legends of the Canyon', 'Penguin book', 'Gualterio Molland', 1985, 23);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (9, 'On the Outs', 'Knopf Doubleday Group', 'Vladimir Chaplain', 2000, 12);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (10, 'Snow White (Blancanieves)', 'Vintage book', 'Pietra O Gara', 2007, 11);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (11, 'Man on the Trapeze', 'Knopf Doubleday Group', 'Katy Le Barre', 1993, 14);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (12, 'Numbskull Emptybrook', 'Houghton Mifflin', 'August Caplan', 2007, 18);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (13, 'Rhino Season (Fasle kargadan)', 'Bloomsbury Publishing', 'Jacques Rhymer', 2000, 19);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (14, 'Other Son', 'Bloomsbury Publishing', 'Kameko Kobpac', 2002, 21);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (15, 'Tombstone', 'Vintage book', 'Lesley Corrao', 2001, 21);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (16, 'Circle of Eight', 'Bloomsbury Publishing', 'Martainn Tyne', 1994, 22);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (17, 'Splendor in the Grass', 'Random House', 'Rob Bilbey', 1992, 6);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (18, 'Third Wheel, The', 'Farrar', 'Constantin MacCrossan', 2010, 4);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (19, 'One Lucky Elephant', 'Knopf Doubleday Group', 'Doyle Bonelle', 2007, 18);
INSERT INTO BOOK (BookID, BookName, bookPublisher, authorName, publishYear, classID) VALUES (20, 'Dead Tired (Grosse Fatigue)', 'Brown and Company', 'Sophey Norgan', 1994, 23);

INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (37782507, 'Available', 1, TO_DATE('23-01-2018', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (61871964, 'Borrowed', 1, TO_DATE('22-01-2013', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (87503114, 'Available', 1, TO_DATE('30-11-2017', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (80690605, 'Borrowed', 3, TO_DATE('20-06-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (96752840, 'Available', 3, TO_DATE('14-08-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (34088135, 'Withdrawn', 3, TO_DATE('14-12-2021', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (81187236, 'Borrowed', 20, TO_DATE('05-08-2012', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (71215473, 'Borrowed', 20, TO_DATE('11-05-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (98030626, 'On display', 2, TO_DATE('19-02-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (31616307, 'Available', 20, TO_DATE('02-04-2011', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (78804925, 'Borrowed', 15, TO_DATE('01-05-2012', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (71544429, 'Reference only', 15, TO_DATE('19-06-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (42592289, 'Available', 12, TO_DATE('07-12-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (69008758, 'Available', 11, TO_DATE('23-09-2022', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (49421933, 'Available', 11, TO_DATE('15-01-2015', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (42894389, 'Available', 13, TO_DATE('21-02-2021', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (19817368, 'Withdrawn', 8, TO_DATE('22-05-2011', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (55590053, 'Available', 8, TO_DATE('22-10-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (55466799, 'Available', 8, TO_DATE('05-09-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (25471663, NULL, 8, TO_DATE('13-06-2010', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (90898572, 'Available', 8, TO_DATE('02-02-2018', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (65485522, 'Reference only', 8, TO_DATE('17-03-2014', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (91015468, 'Available', 5, TO_DATE('18-08-2022', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (67885061, 'Available', 5, TO_DATE('16-10-2017', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (96429400, 'Borrowed', 5, TO_DATE('17-02-2020', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (25510782, 'Available', 5, TO_DATE('29-07-2012', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (90288238, 'Available', 9, TO_DATE('28-12-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (81287063, NULL, 16, TO_DATE('26-10-2012', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (66020135, 'Borrowed', 16, TO_DATE('21-10-2013', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (42004806, 'Available', 13, TO_DATE('06-03-2017', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (32756895, 'Borrowed', 11, TO_DATE('12-09-2011', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (17349363, 'Borrowed', 19, TO_DATE('28-06-2015', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (59620955, 'Available', 18, TO_DATE('19-11-2018', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (31211604, 'Available', 17, TO_DATE('09-06-2013', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (17678634, 'On display', 16, TO_DATE('11-07-2021', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (71610914, 'Borrowed', 15, TO_DATE('03-12-2012', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (65597753, 'On display', 14, TO_DATE('08-08-2016', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (90045566, 'Available', 13, TO_DATE('04-06-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (59109754, 'Available', 12, TO_DATE('28-03-2022', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (47409439, 'Available', 11, TO_DATE('19-10-2020', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (84299819, 'Available', 10, TO_DATE('03-07-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (18197288, 'Available', 9, TO_DATE('13-11-2023', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (72580844, 'Withdrawn', 8, TO_DATE('27-08-2019', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (11994552, 'Available', 7, TO_DATE('02-01-2022', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (17800693, 'Available', 6, TO_DATE('12-06-2022', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (22422514, 'Available', 5, TO_DATE('03-12-2023', 'dd-mm-yyyy'));
INSERT INTO bookCopyInStock (copyCode, status, BookID, purchaseDate) VALUES (89170041, 'Borrowed', 4, TO_DATE('07-09-2018', 'dd-mm-yyyy'));



INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('12-04-2019', 'dd-mm-yyyy'), 1, 2, 3, 3);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('15-06-2020', 'dd-mm-yyyy'), 2, 1, 6, 5);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('20-11-2021', 'dd-mm-yyyy'), 3, 3, 5, 10);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('22-01-2018', 'dd-mm-yyyy'), 4, 4, 2, 15);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('05-09-2022', 'dd-mm-yyyy'), 5, 5, 1, 20);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('11-07-2019', 'dd-mm-yyyy'), 6, 5, 2, 22);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('30-08-2021', 'dd-mm-yyyy'), 7, 4, 6, 25);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('14-05-2022', 'dd-mm-yyyy'), 8, 3, 4, 28);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('18-03-2020', 'dd-mm-yyyy'), 9, 2, 1, 3);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('25-12-2021', 'dd-mm-yyyy'), 10, 1, 3, 5);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('16-02-2022', 'dd-mm-yyyy'), 11, 2, 5, 10);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('08-11-2019', 'dd-mm-yyyy'), 12, 3, 6, 15);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('01-01-2023', 'dd-mm-yyyy'), 13, 4, 1, 20);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('12-12-2018', 'dd-mm-yyyy'), 14, 5, 2, 22);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('07-03-2021', 'dd-mm-yyyy'), 15, 1, 4, 25);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('29-04-2022', 'dd-mm-yyyy'), 16, 2, 6, 28);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('17-02-2020', 'dd-mm-yyyy'), 17, 1, 1, 3);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('09-08-2019', 'dd-mm-yyyy'), 18, 3, 6, 5);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('22-10-2022', 'dd-mm-yyyy'), 19, 2, 5, 10);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('18-05-2021', 'dd-mm-yyyy'), 20, 4, 2, 15);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('21-03-2018', 'dd-mm-yyyy'), 21, 5, 1, 20);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('27-01-2019', 'dd-mm-yyyy'), 22, 1, 3, 22);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('30-07-2020', 'dd-mm-yyyy'), 23, 2, 6, 25);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('12-09-2021', 'dd-mm-yyyy'), 24, 5, 4, 28);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('15-06-2019', 'dd-mm-yyyy'), 25, 1, 5, 3);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('11-12-2020', 'dd-mm-yyyy'), 26, 3, 1, 5);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('08-08-2022', 'dd-mm-yyyy'), 27, 4, 3, 10);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('09-04-2021', 'dd-mm-yyyy'), 28, 5, 2, 15);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('20-09-2018', 'dd-mm-yyyy'), 29, 2, 6, 20);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('30-10-2019', 'dd-mm-yyyy'), 30, 1, 4, 22);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('19-05-2020', 'dd-mm-yyyy'), 31, 3, 1, 25);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('11-01-2022', 'dd-mm-yyyy'), 32, 4, 3, 28);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('13-06-2021', 'dd-mm-yyyy'), 33, 5, 5, 3);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('24-11-2018', 'dd-mm-yyyy'), 34, 1, 6, 5);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('17-12-2019', 'dd-mm-yyyy'), 35, 2, 1, 10);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('08-08-2020', 'dd-mm-yyyy'), 36, 3, 2, 15);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('18-03-2022', 'dd-mm-yyyy'), 37, 4, 4, 20);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('21-07-2021', 'dd-mm-yyyy'), 38, 5, 3, 22);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('22-04-2018', 'dd-mm-yyyy'), 39, 1, 1, 25);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 40, 2, 6, 28);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('22-04-2018', 'dd-mm-yyyy'), 41, 1, 1, 31);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 42, 2, 6, 31);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('22-04-2018', 'dd-mm-yyyy'), 43, 1, 6, null);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 44, 2, 3, null);



INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 45, 1, 6, NULL);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 46, 11, 9, NULL);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 47, 8, 4, NULL);
INSERT INTO bookOrdering (readerOrderDate, readerOrderId, bookid, readerNumber, orderId) VALUES (TO_DATE('23-05-2019', 'dd-mm-yyyy'), 48, 5, 1, NULL);



commit;
