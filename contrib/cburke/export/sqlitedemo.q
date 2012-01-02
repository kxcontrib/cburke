/ sqlitedemo.q
/ first load the q hdb and the sqlite.q script

/ following should return the same results:
3 # select from trade where date=2010.12.09,sym=`IBM
3 # sqlite3 "select * from trade where date='2010-12-09' and sym='IBM'"

/ if timing sqlite, subtract the cost of a trivial call,
/ in order to remove the call overhead:
\t sqlite3 ".tables"   / trivial call
\t sqlite3 "select * from trade where date='2010-12-09' and sym='IBM'"

/ following tests have small result sets:
select min price,avg price,max price from trade where date=2010.12.09,sym=`IBM
sqlite3 "select min(price),avg(price),max(price) from trade where date='2010-12-09' and sym='IBM'"

/ compare:
\t do[10;select min price,avg price,max price from trade where date=2010.12.09,sym=`IBM]
\t do[10;sqlite3 "select min(price),avg(price),max(price) from trade where date='2010-12-09' and sym='IBM'"]
