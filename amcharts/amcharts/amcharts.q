/ init

\d .am

/ directory for amchart graphics files
/ change this as appropriate
dir:` $ ":",(getenv`HOME),"/q/chart/amcharts/"

stock:` sv dir,`amstock_settings.xml
column:` sv dir,`amcolumn_settings.xml
/ util

DateFormats:14 15 17 18 19 !("YYYY-MM-DD";"YYYY-MM-DD hh:mm:ss.fff";"hh:mm";"hh:mm:ss";"hh:mm:ss.fff")

xml:{"<",x,">",y,"</",x,">"}

columns:{xml["columns";raze .am.xml["column"] each string x]}

fixdate:{
 d:x (cols x) 0;
 t:type d;
 if[t=12;d:"z"$d;:![x;();0b;(enlist x)!enlist d]];
 x}

getdatefmt:{
  c:(cols x) 0;
  r:DateFormats "i" $ type x c;
  $[0=count r;'date;xml["date_format";r]]}

getfill:{xml["fill_alpha";string x]}

/ =========================================================
multidata:{[x;datefmt;cls;pos;sym]
 if[0=count sym;:""];
 x:`date xcol x;
 x:?[x;(enlist (=;`sym;enlist sym));0b;`date`close!`date`close];
 r:"<data_set>\n<title>",(string sym),"</title>\n";
 if[pos=0;r,:"<main_drop_down selected=\"true\">true</main_drop_down>\n"];
 r,:"<compare_list_box selected=\"",(("false";"true")pos=1),"\">true</compare_list_box>\n";
 r,:"<csv>\n<separator>,</separator>\n<skip_first_rows>1</skip_first_rows>\n";
 r,:datefmt,"\n",cls,"\n";
 r,:xml["data";` sv "," 0: x];
 r,"\n</csv>\n</data_set>"}

/ =========================================================
sources:{
 t:string x;
 xml["data_sources";raze t xml' t]}
/ main

/ =========================================================
plot_bookdepth:{
 x:0!x;
 b:"B"=x`side;
 x:select price,size*neg b,size*not b from x; 
 data:xml["data";` sv "," 0: x];
 t:read0 ` sv dir,`amcolumn_bookdepth.xml;
 x:t?(enlist "Data");
 (t x):enlist (data);
 column 0: t;}

/ =========================================================
plot_hlvwap:{
 x:fixdate 0!x;
 c:cols x;
 (c 3):`close;
 v:`size=last c;
 cls:columns c;
 data:xml["data";` sv "," 0: x];
 datefmt:getdatefmt x;
 datasrc:sources 1_c;
 siz0:("<!--";"") v;
 siz1:("-->";"") v;
 t:read0 ` sv dir,`amstock_hlvwap.xml; 
 x:t?"/" vs "Columns/Data/DataSources/DateFormat/Size0/Size1";
 (t x):(cls;data;datasrc;datefmt;siz0;siz1);
 stock 0: t;}

/ =========================================================
plot_multi:{
 x:`date xcol 0!x; 
 c:cols x;
 if[not `sym in c;:plot_price x];
 s:exec distinct sym from x;
 if[not 11h=type s;s:value s];
 if[1=count s;:plot_price flip c!x c:c except `sym;];
 x:fixdate x;
 ratio:01b~`close`rprice in c;
 $[ratio;
   [(c c?`rprice):`close;x:c xcol x];
   if[01b~`close`price in c;(c c?`price):`close;x:c xcol x]];
 datefmt:getdatefmt x;
 cls:columns (c 0),`close;
 recalc:xml["recalculate";("false";"true")ratio];
 d:enlist multidata[x;datefmt;cls;0] s 0;
 d,:multidata[x;datefmt;cls;1] each 1_s;
 data:"\n" sv d;
 datasrc:sources enlist `close;
 t:read0 ` sv dir,`amstock_multi.xml;
 x:t?"/" vs "DataSets/DataSources/Recalculate";
 (t x):(data;datasrc;recalc);
 stock 0: t;}

/ =========================================================
plot_ohlc:{
 x:fixdate 0!x;
 c:cols x;
 v:`size=last c;
 cls:columns c;
 data:xml["data";` sv "," 0: x];
 datefmt:getdatefmt x;
 datasrc:sources 1_c;
 fill:getfill 100;
 siz0:("<!--";"") v;
 siz1:("-->";"") v;
 typ:xml["type";"candlestick"];
 t:read0 ` sv dir,`amstock_price.xml;
 x:t?"/" vs "Columns/Data/DataSources/DateFormat/Fill/Size0/Size1/Type";
 (t x):(cls;data;datasrc;datefmt;fill;siz0;siz1;typ);
 stock 0: t;}

/ =========================================================
plot_price:{
 c:cols x;
 if[`sym in c;:plot_multi x];
 x:fixdate 0!x;
 if[01b~`close`price in c;(c c?`price):`close];
 v:`size=last c;
 cls:columns c;
 data:xml["data";` sv "," 0: x];
 datefmt:getdatefmt x;
 datasrc:sources 1_c;
 fill:getfill 0;
 siz0:("<!--";"") v;
 siz1:("-->";"") v;
 typ:xml["type";"line"];
 t:read0 ` sv dir,`amstock_price.xml;
 x:t?"/" vs "Columns/Data/DataSources/DateFormat/Fill/Size0/Size1/Type";
 (t x):(cls;data;datasrc;datefmt;fill;siz0;siz1;typ);
 stock 0: t;}

/ =========================================================
plot_regnms:{
 x:fixdate 0!x;
 datefmt:getdatefmt x;
 c:sums x (cols x) 1;
 x:update total:inside+outside from x;
 data:xml["data";` sv "," 0: x];
 t:read0 ` sv dir,`amstock_regnms.xml;
 x:t?("Data";"DateFormat");
 (t x):(data;datefmt);
 stock 0: t;}

/ =========================================================
plot_volprof:{
 x:fixdate 0!x;
 datefmt:getdatefmt x;
 c:sums x (cols x) 1;
 x:update cvolume:c from x;
 data:xml["data";` sv "," 0: x];
 t:read0 ` sv dir,`amstock_volprof.xml; 
 x:t?("Data";"DateFormat");
 (t x):(data;datefmt);
 stock 0: t;}
/ main

plot:{
 x:0!x;
 if[`date`time~2#cols x;(x`date):(x`date)+x`time;x:delete time from x];
 c:cols x;
 if[`side`price`size~c;:plot_bookdepth x];
 if[`minute`inside`outside~c;:plot_regnms x];
 if[`minute`volume~c;:plot_volprof x];
 x:`date xcol x;
 if[`high`low`vwap~c 1 2 3;:plot_hlvwap x];
 if[`open`high`low`close~c 1 2 3 4;:plot_ohlc x];
 plot_price x}
