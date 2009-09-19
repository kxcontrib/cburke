
/ testing...
a:("one";"two";"three")
b:1100010001110b

HELP:"/home/chris/uni/help/"

NAV:`char$253
PAV:`char$254
EAV:`char$255
PEV:PAV,EAV
WS:" \n\r\t"

assert:{if[not y;FAIL::1;'`$"assert ",x];}

cuton:{n:x?y;(n#x;(n+1)_x)}

emph:{
 n:x ss "\\verb";
 if[0=count n;:"\\emph{",x,"}"];
 h:"\\emph{",(rtrim (n 0)#x),"} \\verb";
 x:(5+n 0)_x;
 n:1+(where x=first x) 1;
 h,(n#x)," ",emph ltrim n _x}

fcopynew:{[to;fm]
 to:`$to;
 fm:`$fm;
 a:@[read0;to;0];
 if[not a~0;if[a~read0 fm;:0]];
 to 0: read0 fm}
 
fixchars:{
 t:rplc[x;"#";"{\\#}"]}

fixtext:{raze {1 _ 1 rotate x} each (where x="\n") cut x}

fwritenew:{[to;txt]
 to:`$to;
 a:@[read0;to;0];
 if[a~txt;:0];
 to 0: txt}

/ to and from LF-terminated strings
fromLF:{-1 _' (where "\n"=-1 rotate x) _ x}
toLF:{raze x ,' "\n"}

ifspaceneeded:{
 not (first x) in ".,;"}

matchbegend:{
 if[not (count x)=count y;:0b];
 if[not all x<y;:0b];
 all x>-1,-1_y}
 
matchpfx:{x ~/: (count x) #' y}

evens:{2*til floor x%2}
odds:{1+2*til floor x%2}
 
remparens:{
 n:x?"(";
 if[n=count x;:x];
 h:n#x;
 x:(n+1)_x;
 h,(1+x?")")_x}
  
rplc:{
 n:x ss y;
 if[0=count n;:x];
 ((n 0)#x), raze z ,/: (count y) _' n _ x}

sort:{x iasc x}

ssb:{(count x)-(count y)+reverse (reverse x) ss reverse y}

sspair:{
  n:x ss y;
  if[(0=count n) or 1=(count n) mod 2;:0#0];
  m:ssb[x;y];
  x:odds count n;
  (n x):m x;
  n}
  
trimmer:{
 if[0=count y;:y];
 y where b or 1 rotate b > b > 0b,-1_maxs b:not x~/:y}

trimempty:trimmer[""]
trimright:{(neg sum(and\)reverse x in WS)_x}
