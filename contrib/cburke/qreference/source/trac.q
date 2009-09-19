
STDFTR:("----";
 "For a complete list of functions, see the [wiki:Reference kdb+ Function Reference].")

cleantrac:{
 t:trimright each x;
 t:trimempty t;
 t:(neg 2 * STDFTR ~ -2#t) _ t}

cutverbatims:{
 if[0=count x;:""];
 b:{"{{{"~x}each x;
 e:{"}}}"~x}each x;
 assert["mismatched {{{ }}}";(sum b)=sum e]; 
 m:where 1b,(1_b) or -1_e;
 m _x}

tracfix:{$["{{{"~3#x 0;tracfixverb x;tracfixtext x]}

tracgetinvalid:{
 a:tracgetinvalid1 each x;
 x where not a
 }

tracgetinvalid1:{
 t:x;
 if[not "/" in t;t:"Reference/",t];
 t:cleantrac fixsrc read0 `$P,t,".txt";
 h:trim t 0;
 ("= " ~ 2 # h) and (" =" ~ -2 # h)}

tracheader:{
 s:trim x;
 $["[[refheader"~11#s;r:tracrefheader s;r:tracsecheader s];
 h:style remparens fixanchor r 0;
 d:r 1; 
 "\\sechdr{",h,"}","{",d,"}\n"}

tracparse:{
 if[10=type x;:tracparse1 LAST::x];
 r:tracparse1 each x;
 r:1 _ raze (enlist "\\newpage") ,/: r;
 r}

tracparse1:{
 t:x;
 if[not "/" in t;t:"Reference/",t];
 t:cleantrac fixsrc read0 `$P,t,".txt";

/ for development - cut off after \\
 t:(first t?enlist "\\\\")#t;

 r:"\\label{",x,"}\n";
 n:t 0;
 t:1_t;
 r:enlist r,tracheader[n];
 r,tracparsebody t}

tracparsebody:{
 TEXT::x;
 raze tracfix each cutverbatims x}

tracrefheader:{
 x:(1+x?"(")_x;
 x:(x?")")#x;
 trim each cuton[x;","]}
 
tracsecheader:{
 assert["is header 0 ",LAST;("= " ~ 2 # x) and (" =" ~ -2 # x)];
 (trim 2_-2_x;"")}

