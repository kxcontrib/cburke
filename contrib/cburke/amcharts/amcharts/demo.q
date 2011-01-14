/ run

\l chart/amcharts/amcharts.q

/ hlvwap:date,high,low,vwap
hlvwap:{.am.plot select date,high,low,vwap:price%size from daily where sym=x,date in -100 sublist date}
hlvwap `AAPL

/ hlvwapv:date,high,low,vwap,size
hlvwapv:{.am.plot select date,high,low,vwap:price%size,size from daily where sym=x,date in -100 sublist date}
hlvwapv `AAPL

/ OHLC: date,open,high,low,close
ohlc:{.am.plot select date,open,high,low,close from daily where sym=x,date in -100 sublist date}
ohlc `AAPL

/ OHLCV: date,open,high,low,close,size
ohlcv:{.am.plot select date,open,high,low,close,size from daily where sym=x,date in -100 sublist date}
ohlcv `AAPL

/ price:
price:{.am.plot select date,close from daily where sym=x}
price `AAPL

/ price,size:
prices:{.am.plot select date,close,size from daily where sym=x}
prices `AAPL
prices `IBM
prices `MSFT

/ price,size last 5 days in 10 minute buckets:
prices5:{
 d:-5#exec distinct date from daily;
 t:select last price,sum size by date,10 xbar time.minute from trade where sym=x,date in d;
 .am.plot select date:date+minute,price,size from t}
prices5 `AAPL

/ price multi:
pricem:{.am.plot select date,sym,close from daily where sym in x}
pricem `AAPL`GOOG`IBM
pricem value exec sym from mas

/ price multi ratio:
pricemr:{.am.plot select date,sym,rprice:close from daily where sym in x}
pricemr `AAPL`GOOG`IBM
pricemr value exec sym from mas

/ Volume Profile: minute, volume
volprof:{
 s:select sum size by date,5 xbar time.minute from trade where date in -30 sublist date,sym=x;
 .am.plot select volume:avg size by minute from s}
volprof `AAPL

/ RegNMS: minute, inside, outside
regnms:{
 s:select time,price from trade where date=last date,sym=x;
 t:select time,bid,ask from nbbo where date=last date,sym=x;
 v:aj[`time;s;t];
 w:update inside:price within (bid;ask) from v;
 .am.plot select sum inside,outside:sum not inside by 5 xbar time.minute from w}
regnms `AAPL

/ book depth: side (B/S), price, size
bookdepth:{.am.plot select last size by side,price from depth where sym=x,time <=10:30}
bookdepth `AAPL
bookdepth `IBM
