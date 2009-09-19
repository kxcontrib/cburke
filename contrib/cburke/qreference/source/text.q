
/ HDR:("section";"subsection";"subsubsection";"paragraph";"subparagraph")
HDR:("section";"subsection";"subsubsection";"subsubsection";"subsubsection")

HRULE:"\\hline"

cleantext:{
 t:trimempty x;}

getheader:{
 m:1+headertype x;
/ t:style m _(neg m) _x;
 t:fixheadertext m _(neg m) _x;
 "\\",(HDR m-2),"*{",t,"}"}

ishrule:{"----"~4#x}
 
/ 0=none, else === count
headertype:{
 b:x?" ";
 if[(b=0) or (b=count x) or 0b in "="=b#x;:0];
 e:(reverse x)?" ";
 if[0b in "="=(neg e)#x;:0];
 b*b=e}
 
/ split on sections 
tracfixtext:{
 t:x where not "#" = first each x;
 t:trimempty t;
 if[0=count t;:""];
 m:where 1b,1_0<headertype each t;
 raze tracfixtext1 each m _t}

tracfixtext1:{
 r:"";
 lv:headertype x 0;
 if[lv;r:enlist getheader x 0;x:trimempty 1_x];
 if[0=count x;:r];
 m:where 1b,1_ishrule each x;
 r,raze tracfixtext2 each m _x}
 
tracfixtext2:{
 r:"";
 if[ishrule x;r:enlist HRULE;x:trimempty 1_x];
 t:fromLF style toLF x;
 r,t}
 
