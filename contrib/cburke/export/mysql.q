/ export to mysql

/ configure the following for the local machine:

/ temp directory
T:`:/tmp

/ in mysql, create a user and database:
/ (here, user, password, database are all "hdb")
/ then update these definitions as appropriate:

MySQL:"mysql -u hdb --password=hdb hdb"
MySQLreset:"drop database hdb;create database hdb"

/ end of configs --------------

/ calling mysql:
mysql:{system MySQL," -e \"",x,"\""}
mysql_nocache:{system MySQL," -e \"reset query cache;",x,"\""}


Types:flip 2 cut (
 "b";"int";
 "c";"char(1)";
 "C";"varchar(30)";
 "d";"date";
 "i";"int";
 "f";"double";
 "s";"varchar(4)";
 "t";"time")

create:{
 v:(Types 1)(Types 0)?exec t from meta x;
 r:"," sv (string cols x) ,' " " ,' v;
 mysql "create table ",(string x)," (",r,")"}

export:{export1[x;""]}
exports:{export1[x] each y}

export1:{
 n:string x;
 f:(1_string T),"/",n,".csv";
 t:value x;
 d:$[0=count y;t;select from t where date=y];
 (`$f) 0: 1 _ csv 0: d;
 c:"load data infile '",f,"' into table ",n;
 mysql c," fields terminated by ','"}

runexport:{
 t:`mas`daily`depth;
 create each t;
 export each t;
 d:exec distinct date from daily;
 t:`nbbo`quote`trade;
 create each t;
 exports[;d] each t;}
