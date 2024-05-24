
[General]
Version=1

[Preferences]
Username=
Password=2206
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AHUVA
Name=BOOKCOPYINSTOCK
Count=400

[Record]
Name=COPYCODE
Type=NUMBER
Size=
Data=[0(8)]
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=20
Data=List('in stock', 'borrowed')
Master=

[Record]
Name=PURCHASEDATE
Type=DATE
Size=
Data=Random(1/1/1985, 1/1/2025)
Master=

[Record]
Name=BOOKID
Type=NUMBER
Size=
Data=List(select bookid from book)
Master=

