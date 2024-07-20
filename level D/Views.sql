--dislay details of events that took place in the months of July-August
CREATE OR REPLACE VIEW RECENTEVENTDETAILS AS
SELECT
    e.EID,
    e.EDate,
    e.ETime,
    e.Audience,
    e.ECategory,
    e.ActivityD,
    e.Price,
    e.Duration,
    h.HName AS HallName,
    h.Place AS HallPlace,
    h.Capacity AS HallCapacity,
    p.Pname AS ManagerName,
    m.MRole AS ManagerRole,
    ao.Expertise AS OperatorExpertise,
    ao.Gender AS OperatorGender,
    part.UserName AS ParticipantUserName,
    part.PType AS ParticipantType,
    ep.Review AS ParticipantReview,
    ep.SeatNumber AS ParticipantSeatNumber,
    ep.SignUpDate AS ParticipantSignUpDate
FROM
    Event e
JOIN
    Hall h ON e.HID = h.HID
JOIN
    Manager m ON e.personid = m.personid
JOIN
    Person p ON m.personid = p.personid
JOIN
    Event_Operator eo ON e.EID = eo.EID
JOIN
    ActivityOperator ao ON eo.personid = ao.personid
JOIN
    Event_Participant ep ON e.EID = ep.EID
JOIN
    Participant part ON ep.personid = part.personid
WHERE
    EXTRACT(MONTH FROM e.EDate) IN (7, 8)
ORDER BY
    e.EDate DESC;

--display the Activity operators of the cheapest events  
SELECT
    p.Pname AS OperatorName,
    p.Mail AS OperatorEmail,
    p.MainPhone AS OperatorPhone,
    red.ActivityD AS EventName,
    red.EDate AS EventDate,
    red.Price AS EventPrice
FROM
    RECENTEVENTDETAILS red
JOIN
    Event_Operator eo ON red.EID = eo.EID
JOIN
    Activityoperator ao ON eo.personid = ao.personid
JOIN
    Person p ON ao.personid = p.personid
WHERE
    red.Price < 500 AND red.OperatorExpertise = 'Yoga guide'
ORDER BY
    red.Price ASC;

--dispay the participants in the events        
SELECT
    part.UserName AS ParticipantUserName,
    p.MainPhone AS ParticipantPhone,
    p.Mail AS ParticipantEmail,
    COUNT(red.EID) AS NumberOfEvents
FROM
    RECENTEVENTDETAILS red
JOIN
    Event_Participant ep ON red.EID = ep.EID
JOIN
    Participant part ON ep.personid = part.personid
JOIN
    Person p ON part.personid = p.personid
GROUP BY
    part.UserName,
    p.MainPhone,
    p.Mail
ORDER BY
    NumberOfEvents DESC;


--View to return details for each order: 
--name of the orderer, name of the supplier, number of books ordered and price.
CREATE OR REPLACE VIEW LibrarianOrderDetails AS
SELECT 
    P.Pname AS LibrarianName,
    O.orderId AS OrderNumber,
    O.orderDate AS OrderDate,
    SP.Pname AS SupplierName,
    COUNT(BO.BookID) AS NumberOfBooksOrdered,
    O.totalPrice AS PriceCharged
FROM 
    Librarian L
JOIN 
    Person P ON L.personId = P.personId
JOIN 
    Ordering O ON L.personId = O.personId
JOIN 
    Supplier S ON O.supid = S.supid
JOIN 
    Person SP ON S.supid = SP.personId
JOIN 
    BookOrdering BO ON O.orderId = BO.orderId
GROUP BY 
    P.Pname, O.orderId, O.orderDate, SP.Pname, O.totalPrice;


--Returns the 10 most expensive orders placed
SELECT *
FROM LibrarianOrderDetails
ORDER BY PriceCharged DESC
FETCH FIRST 10 ROWS ONLY;

--Returns how much money the library owes to each supplier
SELECT 
    SupplierName,
    SUM(PriceCharged) AS TotalAmountPaid
FROM 
    LibrarianOrderDetails
GROUP BY 
    SupplierName;


--To update the order prices (if they are still not updated)
UPDATE Ordering O
SET O.TOTALPRICE = (
    SELECT SUM(B.BOOKPRICE)
    FROM BookOrdering BO
    JOIN Book B ON BO.BookID = B.BookID
    WHERE BO.orderId = O.orderId
);
