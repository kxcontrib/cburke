/ export to sqlite

/ configure the following for the local machine:

/ sqlite database:
DB:"/dbs/tick.db"

/ temp directory:
T:`:/tmp

/ sqlite3 command:
sqlite3: {system "/usr/bin/sqlite3 ",DB," \"",x,"\""}

/ end of configs --------------

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
 sqlite3 "create table ",(string x)," (",r,")"}

export:{export1[x;""]}
exports:{export1[x] each y}

export1:{
 n:string x;
 f:(1_string T),"/",n,".csv";
 t:value x;
 d:$[0=count y;t;select from t where date=y];
 (`$f) 0: 1 _ "|" 0: d;
 sqlite3 ".import ",f," ",n;}

runexport:{
 t:`mas`daily`depth;
 create each t;
 export each t;
 d:exec distinct date from daily;
 t:`nbbo`quote`trade;
 create each t;
 exports[;d] each t;}

makeindex:{
 sqlite3 "create index inbbo on nbbo (date asc,sym)"
 sqlite3 "create index itrade on trade (date asc,sym)"
 sqlite3 "create index iquote on quote (date asc,sym)"}
