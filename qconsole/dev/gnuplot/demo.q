/ gpdemo.ijs  - gnuplot examples
/ try:
/    gp1[]
/    gp2[]
/    gp3[]
/    gp4[]

/ default size is 640x400
/ png options: truecolor
/ font \"FreeSans,11\"";

\d .g

gppng:(
 "terminal png size 600,350";
 "grid";
 "output \"",Dir,"gnu.png\"")

gpsvg:(
 "terminal svg size 600,350";
 "object 1 rect from screen 0, 0, 0 to screen 1, 1, 0 behind";
 "object 1 rect fc rgb \"white\" fillstyle solid 1.0";
 "border lw 0.5";
 "grid lw 0.2";
 "output \"",Dir,"gnu.svg\"")

gpout:gpsvg

/ =========================================================
gp1:{
 buf gpout;
 buf "title \"sin(exp) vs cos(exp)\"";
 buf "xlabel \"x-axis\"";
 buf "ylabel \"y-axis\"";
 cmd:buf"";
 px:steps -1 3 200;
 py:exp px;
 dat:(px;sin py;cos py);
 def:("with lines title \"sin(exp)\"";"with lines title \"cos(exp)\"");
 gplot[cmd;def;dat];
 fin[];}

/ =========================================================
gp2:{
 cmd:gpout;
 wiggle:6;
 points:200;
 px:(3 % points-1) * til points;
 a:til wiggle;
 py:sum (0.9 xexp a)*cos (3 xexp a) * a +\: px;
 gplot[cmd;"with lines";(px;py)];
 fin[];}

/ =========================================================
gp3:{
 px:range -3 4 0.2;
 py:range -3 5 0.2;
 pz:sin px +\: sin py;
 sp:(px;py;pz);
 buf "";
 buf gpout;
 buf "title \"sin(x+sin(y))\"";
 buf "parametric";
 cmd:buf"";
 gsplot[cmd;"with lines";sp];
 fin[];}

/ =========================================================
gp4:{
 px:range -3 3 0.1;
 py:range -3 3 0.1;
 sp:(px;py;(sin px) *\: sin py);
 buf "";
 buf gpout;
 buf "title \"sin(x)*sin(y)) contour plot\"";
 buf "parametric;contour;cntrparam levels 20;view 0,0,1;nosurface";
 cmd:buf"";
 gsplot[cmd;"with lines";sp];
 fin[];}
