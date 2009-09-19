/ list.q

fixlist:{
 if[0=count x;:x];
 a:fromLF x;
 b:{" * "~3#x} each a;
 if[not any b;:fixlisttext x];
 n:b?1b;
 h:$[n>0;fixlisttext toLF n#a;""];
 a:n _a;
 n:({"* "~2#ltrim x} each a)?0b;
 m:fixlist2[0;n#a];
 h,m,fixlist toLF n _a}
  
/ style non verbatim text
fixlisttext:{
  b:x ss "{{{";
  if[0=count b;:fixtext x];
  e:3+ssb[x;"}}}"];
  assert["non matching braces";matchbegend[b;e]];
  hdr:fixtext (b 0)#x;
  x:(sort b,e)_x;
  m:odds count x;  
  (x m):t:fixtext each x m;
  m:evens count x;
  t:(count m)#(ifspaceneeded each t),0;
  (x m):fixverb each (enlist each x m) ,' t;
  hdr,fixpost raze x}

fixlist2:{[lvl;txt]
 txt:{fixlisttext 3 _x} each txt;
 r:enlist "\\begin{itemize}";
 r,:"\\item ",/:txt;
 r,:enlist "\\end{itemize}";
 toLF r}

