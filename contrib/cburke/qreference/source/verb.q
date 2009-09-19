
VB:"\\begin{Verbatim}"
VE:"\\end{Verbatim}\n"

trunc:{
 if[x>count y;:y];
 ((x-4)#y),"..."}
  
tracfixverb:{verbatim 1_-1_x}
 
admonition:{
 t:("#"=first x 0)_x;
 r:"\n\\vspace{2 mm}\n{\\textdagger} ";
 r:r,emph style -1 _ toLF t;
 r:r,"\n\n\\vspace{2 mm}\n";
 fromLF r}
 
verbatim:{
 t:x;
 h:t 0;
 if[h~"#!admonition";:admonition 1_t];
 f:"";
 w:68;
 if[h~"#!smallfont";f:"[fontsize=\\footnotesize]";w:75;t:1_t];
 if[h~"#!tinyfont";f:"[fontsize=\\scriptsize]";w:86;t:1_t];
 show w;
 t:(sum h~/:("#!c";"#!q")) _ t;
 if[0=count t;:""];
 (enlist VB,f),(trunc[w] each t),enlist VE}
