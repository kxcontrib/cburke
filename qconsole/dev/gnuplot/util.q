/ util

enlistopen:{$[type x;enlist x;x]}
sep:{x,(not ";"=last x)#";"}

/ defined in q:
/ range:{s:-1 1 x[1]>x[0];x[0]+s*x[2]*til 1+floor(abs x[1]-x[0])%x[2]}
/ steps:{x[0]+(x[1]-x[0])*(til 1+x[2])%x[2]}

/ =========================================================
buf:{
 $[count x;
  [Buffer,::cutcmd x;];
  [r:Buffer;Buffer::0#enlist"";r]]}

buf"";

/ =========================================================
cutcmd:{
 if[0=type x;:x];
 n:where (x=";") > {not x=y} scan x="\"";
 if[0=count n;:enlist x];
 1_'(0,1+n)_";",x}
 
/ =========================================================
fin:{system "gnuplot ",Dir,"gnu.plt";}

/ =========================================================
fixcmd:{$[count x;"set ",/:x;""]}
fh:{$[10h=type x;`$":",x;x]}

