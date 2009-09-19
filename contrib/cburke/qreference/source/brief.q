/ brief reference

R:HELP,"briefref/"

brread:{read0 `$":",R,x,".txt"}
brstd:{t:brread x;(label x),(subsec t 0),verbatim 1_t}

label:{enlist "\\label{",x,"}"}
subsec:{enlist "\\subsection{",x,"}"}
newpage:{enlist "\\newpage"}

briefref:{
 r:brread "intro";
 r,:brstd "adverb";
 r,:brstd "define";
 r,:newpage 0;
 r,:brstd "cmdline";
 r,:brstd "data";
 r,:brstd "attributes";
 r,:brstd "errors";
 r,:brstd "save";
 r,:newpage 0;
 r,:brstd "syscmd";
 r,:newpage 0;
 r,:brstd "verbs";
 r,:newpage 0;
 r,:brstd "dotz";
 r}
 
 
 