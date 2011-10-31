/ run

script "~Dev/convert/ascii85.q"

t:{x~fromascii85 toascii85 x}

toascii85 "hello there 123"
t "hello there 123"
t "hello ",(10#"c"$0),"there 123"
t""
t enlist "a"
t"ab"
