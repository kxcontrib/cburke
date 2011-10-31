/ base64

tobase64:{
 if[0=n:count x;:x];
 n:0 2 1 n mod 3;
 r:2 sv' 6 cut (raze 0b vs' "x" $ x),(2*n)#0b;
 60 cut (.Q.b6 r),n#"="}

frombase64:{
 x:raze x;
 p:-2 | (x?"=") - count x;
 "c" $ p _ 2 sv' 8 cut raze 2 _' 0b vs' "x"$.Q.b6?x}
