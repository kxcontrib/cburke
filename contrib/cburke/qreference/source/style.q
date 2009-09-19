
VerbDel: "!@%&+-*:;?",`char$97+til 26

style:{
  fixlist x}

/ subset of fixtext for headers only
fixheadertext:{
 if[0=count x;:x];
 t:x; 
 t:rplc[t;"{";PAV];
 t:rplc[t;"}";EAV];
 t:fixbackslash t;
 t:fixchars t;
 t:fixquotesingle t;
 sqzrep t}

fixtext:{
 if[0=count x;:x];
 t:x; 
 t:rplc[t;"{";PAV];
 t:rplc[t;"}";EAV];
 t:fixbackslash t;
 t:fixsubscript t;
 t:fixsuperscript t;
 t:fixchars t;
 t:fixwiki t;
 t:fixpi t;
 t:fixbold t;
 t:fixemph t;
 t:fixquotesingle t;
 sqzrep t}

fixanchor:{
 n:(where x="[") inter -1+where x="#";
 if[0=count n;:x];
 r:(n 0)#x;
 x:(n 0)_x;
 x:(1+x?" ")_x;
 n:x?"]";
 r,(n#x),fixanchor (n+1)_x}

fixbold:{
  ndx:sspair[x;"'''"];
  if[(0=count ndx) or 1=(count ndx) mod 2;:x];
  (x ndx):(count ndx)#PEV;
  x:rplc[x;(PAV,"''");"\\textbf{"];
  x:rplc[x;(EAV,"''");"}"]}
  
fixemph:{
  ndx:sspair[x;"''"];
  if[(0=count ndx) or 1=(count ndx) mod 2;:x];
  (x ndx):(count ndx)#PEV;
  x:rplc[x;(PAV,"'");"\\emph{"];
  x:rplc[x;(EAV,"'");"}"]}

fixbackslash:{rplc[x;"\\";"{\\textbackslash}"]}
fixquotesingle:{rplc[x;"'";"{\\textquotesingle}"]}

/ remaining characters:
fixchars:{
 t:rplc[x;"\"";"{\\textquotedbl}"];
 t:rplc[x;"$";"{\\textdollar}"];
 t:rplc[t;"`";"{\\textasciigrave}"];
 t:rplc[t;"<";"{\\textless}"];
 t:rplc[t;">";"{\\textgreater}"];
 t:rplc[t;"|";"\\textbar"];
 t:rplc[t;"#";"\\#"];
 t:rplc[t;"%";"\\%"];
 t:rplc[t;"&";"\\&"];
 t:rplc[t;"~";"\\~{}"];
 t:rplc[t;"^";"\\^{}"];
 t:rplc[t;"_";"\\_"];
 t:rplc[t;NAV;"\\hangindent=13mm "];
 t:rplc[t;PAV;"\\{"];
 t:rplc[t;EAV;"\\}"]}
 
fixpi:{
 n:x ss "PI";
 if[0=count n;:x];
 m:((x n-1) in " -") and (x n+2) in "/.";
 n:n where m;
 if[0=count n;:x];
 h:(n 0)#x;
 x:{"$\\pi$", 2_x} each n _x;
 h,raze x}
  
fixpost:{
 x:rplc[x;"c1...cn";"c\\textsubscript{1}...c\\textsubscript{n}"];
 x}

fixsubscript:{
  x:rplc[x;",,0,,";"\\textsubscript{0}"];
  x:rplc[x;",,1,,";"\\textsubscript{1}"];
  x:rplc[x;",,i,,";"\\textsubscript{i}"];
  x:rplc[x;",,j,,";"\\textsubscript{j}"];
  x:rplc[x;",,j+1,,";"\\textsubscript{j+1}"];
  x:rplc[x;",,n-1,,";"\\textsubscript{n-1}"];
  x:rplc[x;",,n,,";"\\textsubscript{n}"]}

fixsuperscript:{
  x:rplc[x;"^st^";"\\textsuperscript{st}"];
  x:rplc[x;"^th^";"\\textsuperscript{th}"];
  x:rplc[x;"^x^";"\\textsuperscript{x}"]}

/ added space after t, since latex ignores space after \normalsize  
fixverb:{
  t:x 0;
  f:x 1;
  t:" \\small\\texttt{",(fixtext -3_3_t),"}";
  if[f;t,:"\\normalsize{ }"];
  t}

fixverbspace:{
 x:rplc[x;"\\normalsize{ }.";"\\normalsize."];
 rplc[x;"\\normalsize{ },";"\\normalsize,"]}

fixwiki:{
  n:-1+x ss "wiki:";
  n:n where "["=x n;
  if[0=count n;:x];
  r:(n 0)#x;
  x:(n 0)_x;
  n:min x?" ]";
  h:n#x;
  s:x n;
  x:(n+1)_x;  
  b:not ("#" in h) or ("Q"=first h) or ("Reference " ~ 10#h);
  m:(1+last where h="/")_h;
  h:$[b;"page \\pageref{",m,"} - ";""];
  if["]"=s;:r,h,m,fixwiki x];
  n:x?"]";
  r,h,(n#x),fixwiki (n+1)_x}

sqzrep:{
 t:x;
 t:sqzrep1[t;"emph"];
 t:sqzrep1[t;"textbf"];
 t:sqzrep1[t;"verb"];
 trim t}

sqzrep1:{
 t:x;
 t:rplc[t;"\n \\",y;"\n\\",y];
 t:rplc[t;"  \\",y;" \\",y]}
