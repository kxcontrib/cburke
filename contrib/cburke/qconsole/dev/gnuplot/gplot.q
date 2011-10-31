/ plot

/ =========================================================
gplot:{
 fdat:Dir,"gnu.dat";
 fplt:Dir,"gnu.plt";
 (fh fdat) 0: " " 0: z; 
 cnt:-1+count z;
 cmd:fixcmd[x];
 def:cnt#enlistopen y;
 hdr:("plot ";"") 0<til cnt;
 hdr:hdr ,\: "'",fdat,"' using 1:";
 hdr:hdr ,' string 2+til cnt;
 tag:("";",\\") reverse 0<til cnt;
 def:hdr ,' " ",' def ,' tag;
 (fh fplt) 0: cmd,def;}

/ =========================================================
gsplot:{
 fdat:Dir,"gnu.dat";
 fplt:Dir,"gnu.plt"; 
 d:flip each (z 0) ,'\: z 1;
 e:d ,' enlist each z 2;
 f:{(enlist "  ")," " 0: x};
 (fh fdat) 0: 1 _ raze f each e; 
 cmd:fixcmd[x];
 def:enlist "splot '",fdat,"' ",y;
 (fh fplt) 0: cmd,def;}
