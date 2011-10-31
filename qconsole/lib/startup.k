/ qconsole startup

\d .qx

home:getenv`HOME
if[0=#qhome:getenv`QHOME;qhome:home,"/q"]

v:{c:" "/:$."\\c";."\\c 2000 2000";b:.Q.s x;."\\c ",c;b}
r:{$[101=@a:. .qx.y::x;a;(@a;.qx.v a)]}
x:{$[101=@a:. .qx.y::x;$["::"~a:$a;"";a];.Q.s a]}
p:{@[-4!;x;0]}
fh:{$[10h=@x;`$":",x;x]}

/ path from [default directory;string]
pathd:{[x;y]
 if[~"~"=*y;:$["/"=*y;y;x,"/",y]];
 n:y?"/";
 d:"."=*f:1_n#y;
 p:.qx.folderss`$d _f;
 if[d;p:(*|&p="/")#p];
 p,n _y}

paths:pathd[qhome]
path:{`$":",paths x}

savenew:{$[y~@[0:;x;0];::;x 0: y]}
reads:{
 d:.qx.path x;
 t:0: `/:d,`$(*|"/"\:x),".qproj";
 t:t[&~"#"=*:'t];
 t:t[&0<#:'t];
 t:,/{0:`$x}'.qx.pathd[$:d]'t}

writes:{savenew[path y;reads x]}
