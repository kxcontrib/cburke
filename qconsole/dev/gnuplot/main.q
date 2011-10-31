/main

svg:(
 "terminal svg size 600,350";
 "object 1 rect from screen 0, 0, 0 to screen 1, 1, 0 behind";
 "object 1 rect fc rgb 'white' fillstyle solid 1.0";
 "border lw 0.5";
 "grid lw 0.2")

/ =========================================================
plot:{
 buf svg;
 buf "output '",Dir,"gnu.svg'";
 cmd:buf"";
 def:"with lines notitle";
 if[not 0=type x;x:(til count x;x)];
 dat:enlistopen x;
 gplot[cmd;def;dat];
 fin[];}

