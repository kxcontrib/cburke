/ ascii85
/ The encoding does not begin with <~, though sometimes 
/ this is allowed. However PDF files do not accept this prefix.
/ Decoding does support the prefix.

/ =========================================================
/ encode to ascii85 representation
/ returns lines of length no more than 75 + LF
toascii85:{
 p:0 3 2 1 (count x) mod 4;
 r:256 sv' 4 cut ("i"$x),p#0;
 n:where (-1_r=0),0b;
 r:"c"$33 + mod[;85] floor r %\: "i" $ 85 xexp reverse til 5;
 (r n):"z";
 ("\n" sv 75 cut (neg p) _ raze r),"~>\n"}

/ =========================================================
/ decode ascii85
fromascii85:{
 r:{x where 32<"i"$x} x;
 r:(2*"<~"~2#x)_r;
 r:(neg 2*"~>"~-2#r)_r;
 r:ssr[r;"z";"!!!!!"];
 p:(count r) mod 5;
 r:(("i"$r)-33),(0 4 3 2 1 p)#84;
 r:2 sv' 8 cut raze 0b vs' 85 sv' 5 cut r;
 (neg 0 0 3 2 1 p)_"c"$r}
