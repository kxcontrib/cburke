
script:{value "\\l dev/q/reference/",(trim x),".q"}
script "util"
script "brief"
script "fixsrc"
script "list"
script "pages"
script "style"
script "text"
script "trac"
script "verb"

run:{
 
 FAIL::0;
 LAST::"";
 d:":/home/chris/tempref/";

 t1:t2:t3:t4:t5:""
 nam:NAM where "a"=first each NAM;

  t1:tracparse INTRO;
/ t2:tracparse QSQL;
/ t3:tracparse SYM;
/ t4:tracparse NUM;
  t5:tracparse nam;

 b1:briefref 0;
 if[FAIL;:0];
 
 fwritenew[d,"t1.tex";t1];
 fwritenew[d,"t2.tex";t2];
 fwritenew[d,"t3.tex";t3];
 fwritenew[d,"t4.tex";t4];
 fwritenew[d,"t5.tex";t5];
 fwritenew[d,"tall.tex";t1,t2,t3,t4,t5];
 
 fwritenew[d,"b1.tex";b1];
 
 fcopynew[d,"f1.tex";":dev/q/reference/front.tex"];
 fcopynew[d,"kxlogo.pdf";":dev/q/reference/kxlogo.pdf"];

 value "\\dev/q/reference/latex.sh"}

run 0
