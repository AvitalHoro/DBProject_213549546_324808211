
[General]
Version=1

[Preferences]
Username=
Password=2145
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AHUVA
Name=ORDERING
Count=400

[Record]
Name=ORDERDATE
Type=DATE
Size=
Data=Random(1/1/1985, 1/1/2025)
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=20
Data=List('Confirmed', 'Shipped','Delivered', 'Cancelled')
Master=

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=[0(8)]
Master=

[Record]
Name=LUSERNAME
Type=VARCHAR2
Size=20
Data=List(select lusername from librarian) 
Master=

[Record]
Name=SUPID
Type=NUMBER
Size=
Data=List(select supid from supplier) 
Master=

