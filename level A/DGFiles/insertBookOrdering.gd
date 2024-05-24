
[General]
Version=1

[Preferences]
Username=
Password=2207
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AHUVA
Name=BOOKORDERING
Count=400

[Record]
Name=READERORDERDATE
Type=DATE
Size=
Data=Random(1/1/1985, 1/1/2025)
Master=

[Record]
Name=READERORDERID
Type=NUMBER
Size=
Data=[0(8)]
Master=

[Record]
Name=BOOKID
Type=NUMBER
Size=
Data=List(select bookid from book) 
Master=

[Record]
Name=READERNUMBER
Type=NUMBER
Size=
Data=List(select readernumber from reader) 
Master=

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=List(select orderid from ordering) 
Master=

