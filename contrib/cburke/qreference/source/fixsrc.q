/ fixes to wiki source

fixsrc:{
 if[0=count x;:x];
 
 t:trimright each x;
 
 h:trim t 0;
 if[("== "~3#h) and " =="~-3#h;(t 0):1_-1_h];

 t:fixprintcomments t;
 t:fixothercomments t;
 t:fixdefs t;
 t:toLF t; 
 t:rplc[t;"`q))`";"{{{q))}}}"];
 t:rplc[t;"`f\\`";"{{{f\\}}}"];
 t:rplc[t;"`\\`";"{{{\\}}}"];
 t:rplc[t;"= !^ ";"= ^ "];
 t:rplc[t;" !^ ";" {{{^}}} "];
 t:rplc[t;" !`:sym? ";" {{{`:sym?}}} "];
 t:rplc[t;" See Also: ";" See also "];
 fromLF t}

fixothercomments:{
 n:where (matchpfx["{{{";x]) and 1 rotate matchpfx["#!comment";x];
 if[0=count n;:x];
 h:(n 0)#x;
 x:2 _' n _x;
 f:{(1+first x?enlist "}}}")_x};
 h,raze f each x} 

fixprintcomments:{
 n:where (matchpfx["{{{";x]) and 1 rotate matchpfx["#!comment print";x];
 if[0=count n;:x];
 h:(n 0)#x;
 x:2 _' n _x;
 f:{n:first x?enlist "}}}";(n#x),(n+1)_x};
 h,raze f each x} 

fixdefs:{
 n:where (" "=first each x) and "::" ~/: -2 #' x;
 if[0=count n;:x];
 h:(n 0)#x;
 x:(n 0)_x;
 def:trim -2_x 0;
 if["{{{"~3#def;def:3_-3_def];
 def:enlist NAV,"{{{ ",(trim def),"  }}} ",(x 1),"\n";
 h,def,fixdefs 2_x} 