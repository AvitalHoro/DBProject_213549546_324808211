CREATE TABLE reader
(
  readerName varchar2(20) NOT NULL,
  readerNumber INT NOT NULL,
  phone varchar2(11),
  PRIMARY KEY (readerNumber)
);

CREATE TABLE librarian
(
  LibrarianName varchar2(20) NOT NULL,
  Lphone varchar2(11),
  LuserName varchar2(20) NOT NULL,
  Lpassword varchar2(20) NOT NULL,
  PRIMARY KEY (LuserName)
);

CREATE TABLE supplier
(
  supName varchar2(20) NOT NULL,
  supId INT NOT NULL,
  Sphone varchar2(11),
  terms varchar2(80),
  PRIMARY KEY (supId)
);

CREATE TABLE bookClass
(
  classID INT NOT NULL,
  className varchar2(20),
  locationC varchar2(30),
  color varchar2(10),
  PRIMARY KEY (classID)
);

CREATE TABLE book
(
  BookName varchar2(30) NOT NULL,
  bookPublisher varchar2(30),
  authorName varchar2(30),
  publishYear INT,
  BookID INT NOT NULL,
  classID INT,
  PRIMARY KEY (BookID),
  FOREIGN KEY (classID) REFERENCES bookClass(classID)
);

CREATE TABLE bookCopyInStock
(
  copyCode INT NOT NULL,
  status varchar2(20),
  purchaseDate Date,
  BookID INT NOT NULL,
  PRIMARY KEY (copyCode),
  FOREIGN KEY (BookID) REFERENCES book(BookID)
);

CREATE TABLE ordering
(
  orderDate Date NOT NULL,
  status varchar2(20) NOT NULL,
  orderId INT NOT NULL,
  LuserName varchar(20) NOT NULL,
  supId INT,
  PRIMARY KEY (orderId),
  FOREIGN KEY (LuserName) REFERENCES librarian(LuserName),
  FOREIGN KEY (supId) REFERENCES supplier(supId)
);

CREATE TABLE bookOrdering
(
  readerOrderDate Date NOT NULL,
  readerOrderId INT NOT NULL,
  BookID INT NOT NULL,
  readerNumber INT,
  orderId INT,
  Primary KEY (readerOrderId),
  FOREIGN KEY (BookID) REFERENCES book(BookID),
  FOREIGN KEY (readerNumber) REFERENCES reader(readerNumber),
  FOREIGN KEY (orderId) REFERENCES ordering(orderId)
);
