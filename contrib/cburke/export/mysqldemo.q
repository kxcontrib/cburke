/ mysqldemo.q
/ first load the q hdb and the mysql.q script

/ following should return the same results:
3 # select from trade where date=2010.12.09,sym=`IBM
4 # mysql "select * from trade where date='2010-12-09' and sym='IBM'"

/ if timing mysql, subtract the cost of a trivial call,
/ in order to remove the call overhead:
\t mysql "show tables"   / trivial call
\t mysql "select * from trade where date='2010-12-09' and sym='IBM'"

/ note that mysql remembers the last query and will just repeat
/ the result if called again. When repeating a query for timing
/ tests, it is necessary to first clear the mysql cache. Compare:
\t do[10;mysql "select * from trade where date='2010-12-09' and sym='IBM'"]
\t do[10;mysql_nocache "select * from trade where date='2010-12-09' and sym='IBM'"]

/ following tests have small result sets:
select min price,avg price,max price from trade where date=2010.12.09,sym=`IBM
mysql "select min(price),avg(price),max(price) from trade where date='2010-12-09' and sym='IBM'"

/ compare:
\t do[10;select min price,avg price,max price from trade where date=2010.12.09,sym=`IBM]
\t do[10;mysql_nocache "select min(price),avg(price),max(price) from trade where date='2010-12-09' and sym='IBM'"]
