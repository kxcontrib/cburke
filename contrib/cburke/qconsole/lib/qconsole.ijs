18!:4 <'z'
3 : 0 ''

notdef=. 0: ~: 4!:0 @ <
jpathsep=: '/'&(('\' I.@:= ])})
winpathsep=: '\'&(('/' I.@:= ])})
PATHJSEP_j_=: '/'                 
IF64=: 16={:$3!:3[2
'IFUNIX IFWIN IFWINCE'=: 5 6 7 = 9!:12''
IFGTK=: IFJHS=: IFBROADWAY=: 0
IFJ6=: 0     
IFWINE=: IFWIN > 0-:2!:5'_'   
if. IF64 do.
  IFWOW64=: 0
else.
  if. IFUNIX do.
    IFWOW64=: '64'-:_2{.(2!:0 'uname -m')-.10{a.
  else.
    IFWOW64=: 'AMD64'-:2!:5'PROCESSOR_ARCHITEW6432'
  end.
end.
if. IFUNIX do.
  UNAME=: (2!:0 'uname')-.10{a.
else.
  UNAME=: 'Win'
end.
)
jcwdpath=: (1!:43@(0&$),])@jpathsep@((*@# # '/'"_),])
jsystemdefs=: 3 : 0
0!:0 <jpath '~system/defs/',y,'_',(tolower UNAME),(IF64#'_64'),'.ijs'
)
18!:4 <'z'
'TAB LF FF CR DEL EAV'=: 9 10 12 13 127 255{a.
LF2=: LF,LF
CRLF=: CR,LF
EMPTY=: i.0 0
Debug=: 0
'noun adverb conjunction verb monad dyad'=: 0 1 2 3 3 4
apply=: 128!:2
def=: :
define=: : 0
do=: ".
drop=: }.
each=: &.>
echo=: 0 0&$ @ (1!:2&2)
exit=: 2!:55
every=: &>
getenv=: 2!:5
inv=: inverse=: ^:_1
items=: "_1
fetch=: {::
leaf=: L:0
nameclass=: nc=: 4!:0
namelist=: 4!:1
on=: @:
pick=: >@{
rows=: "1
stdout=: 1!:2&4
stderr=: 1!:2&5
stdin=: 1!:1@3: :. stdout
sign=: *
sort=: /:~ : /:
take=: {.
assert=: 0 0 $ 13!:8^:((0 e. ])`(12"_))
bind=: 2 : 'x@(y"_)'
boxopen=: <^:(L.=0:)
boxxopen=: <^:(L.<*@#)
clear=: 3 : 0
". 'do_',(' '-.~y),'_ '' (#~ -.@(4!:55)) (4!:1) 0 1 2 3'''
)
cutLF=: 3 : 'if. L. y do. y else. a: -.~ <;._2 y,LF end.'
cutopen=: 3 : 0
y cutopen~ (' ',LF) {~ LF e. ,y
:
if. L. y do. y return. end.
if. 1 < #$y do. <"_1 y return. end.
(<'') -.~ (y e.x) <;._2 y=. y,1{.x
)
datatype=: 3 : 0
n=. 1 2 4 8 16 32 64 128 1024 2048 4096 8192 16384 32768 65536 131072
t=. '/boolean/literal/integer/floating/complex/boxed/extended/rational'
t=. t,'/sparse boolean/sparse literal/sparse integer/sparse floating'
t=. t,'/sparse complex/sparse boxed/symbol/unicode'
(n i. 3!:0 y) pick <;._1 t
)
empty=: EMPTY"_
erase=: [: 4!:55 ;: ::]
expand=: # inverse
H=. '0123456789ABCDEF'
h=. '0123456789abcdef'
dfh=: 16 #. 16 | (H,h) i. ]
hfd=: h {~ 16 #.^:_1 ]
isutf8=: 1:@(7&u:) :: 0:
list=: 3 : 0
w=. {.wcsize''
w list y
:
if. 0=#y do. i.0 0 return. end.
if. 2>#$y=. >y do.
  d=. (' ',LF) {~ LF e. y=. toJ ": y
  y=. [;._2 y, d #~ d ~: {: y
end.
y=. y-. ' '{.~ c=. {:$ y=. (": y),.' '
(- 1>. <. x % c) ;\ <"1 y
)
nl=: 3 : 0
'' nl y
:
if. 0 e. #y do. y=. 0 1 2 3 end.

if. 1 4 8 e.~ 3!:0 y do.
  nms=. (4!:1 y) -. ;: 'x y x. y.'
else.
  nms=. cutopen_z_ y
end.

if. 0 e. #nms do. return. end.

if. #t=. x -. ' ' do.
  'n s'=. '~*' e. t
  t=. t -. '~*'
  b=. t&E. &> nms
  if. s do. b=. +./"1 b
  else. b=. {."1 b end.
  nms=. nms #~ n ~: b
end.
)
names=: list_z_ @ nl
Note=: 3 : '0 0 $ 0 : 0' : [
script=: [: 3 : '0!:0 y [ 4!:55<''y''' jpath_z_ &.: >
scriptd=: [: 3 : '0!:1 y [ 4!:55<''y''' jpath_z_ &.: >
sminfo=: 3 : 0
if. IFGTK do. mbinfo_jgtk_ y else. smoutput >_1{.boxopen y end.
)
smoutput=: 0 0 $ 1!:2&2
tmoutput=: 0 0 $ 1!:2&4
split=: {. ,&< }.
table=: 1 : 0~
:
(((#~LF-.@e.])5!:5<'u');,.y),.({.;}.)":x,y u/x
)
timex=: 6!:2
timespacex=: 6!:2 , 7!:2@]
tolower=: 3 : 0
x=. I. 26 > n=. ((65+i.26){a.) i. t=. ,y
($y) $ ((x{n) { (97+i.26){a.) x}t
)

toupper=: 3 : 0
x=. I. 26 > n=. ((97+i.26){a.) i. t=. ,y
($y) $ ((x{n) { (65+i.26){a.) x}t
)
t=. <;._1 '/invalid name/not defined/noun/adverb/conjunction/verb/unknown'
type=: {&t@(2&+)@(4!:0)&boxopen
ucp=: 7&u:
ucpcount=: # @ (7&u:)
utf8=: 8&u:
uucp=: u:@(7&u:)
3 : 0''
h=. 9!:12''
subs=. 2 : 'x I. @(e.&y)@]} ]'
toJ=: (LF subs CR) @: (#~ -.@(CRLF&E.@,))
toCRLF=: 2&}. @: ; @: (((CR&,)&.>)@<;.1@(LF&,)@toJ)
if. h=5 do.
  toHOST=: ]
else.
  toHOST=: toCRLF
end.
1
)
18!:4 <'z'

coclass=: 18!:4 @ boxxopen
cocreate=: 18!:3
cocurrent=: 18!:4 @ boxxopen
codestroy=: coerase @ coname
coerase=: 18!:55
cofullname=: 3 : 0
y=. ,> y
if. #y do.
  if. ('_' = {: y) +: 1 e. '__' E. y do.
    y,'_',(>18!:5''),'_'
  end.
end.
)
coinsert=: 3 : 0
n=. ;: :: ] y
p=. ; (, 18!:2) @ < each n
p=. ~. (18!:2 coname''), p
(p /: p = <,'z') 18!:2 coname''
)
coname=: 18!:5
conames=: list_z_ @ conl
conew=: 3 : 0
c=. <y
obj=. cocreate''
coinsert__obj c
COCREATOR__obj=: coname''
obj
:
w=. conew y
create__w x
w
)
conl=: 18!:1 @ (, 0 1"_ #~ # = 0:)
copath=: 18!:2 & boxxopen
coreset=: 3 : 0
if. IFGTK do.
  exc=. gtklocs_jgtkide_''
else.
  exc=. ''
end.
0 0$coerase (conl 1) -. exc
)
cocurrent 'z'
cofind=: 3 : 0
r=. (<,>y) (4 : 'try. x e. nl__y $0 catch. 0 end.'"0 # ]) 18!:1]0 1
if. 0=#r do. i.0 2 end.
)
cofindv=: 3 : 0
lcs=. cofind y
if. #lcs do.
  lcs ,. ". each (<y,'_') ,each lcs ,each '_'
end.
)
coinfo=: 3 : 0
ref=. boxxopen y
if. 0 e. $ref do. i.0 4 return. end.
if. 0=4!:0 <'COCREATOR__ref'
do. c=. COCREATOR__ref else. c=. a: end.
(conouns ref),ref,c,< ;:inverse copath ref
)
conouns=: 3 : 0 "0
n=. nl 0
t=. n#~ (<y)-:&> ".each n
< ;: inverse t
)
conounsx=: 3 : 0
r=. ''
if. #y do.
  s=. #y=. boxxopen y
  loc=. conl 0
  for_i. loc do. r=. r,conouns__i y end.
  r=. (r~:a:) # (y$~#r),.r,.s#loc
end.
/:~~.r
)
copathnl=: 3 : 0
'' copathnl y
:
r=. ''
t=. (coname''),copath coname''
for_i. t -. <,'z' do.
  r=. r,x nl__i y
end.
/:~~.r
)
copathnlx=: 3 : 0
'' copathnlx y
:
r=. ''
t=. (coname''),copath coname''
for_i. t=. t -. <,'z' do.
  r=. r,<x nl__i y
end.
n=. ~.;r
n,.|:( n&e. &> r) #each t
)
coselect_result=: 3 : 0
'r x s'=. y
if. r do.
  runimmx0_jijs_ '18!:4 <''',s,''''
end.
empty''
)
costate=: 3 : 0
r=. ,: ;:'refs id creator path'
if. #n=. conl 1 do. r,coinfo &> n /: 0 ".&> n end.
)
cocurrent 'z'
cd=: 15!:0
memr=: 15!:1
memw=: 15!:2
mema=: 15!:3
memf=: 15!:4
cdf=: 15!:5
cder=: 15!:10
cderx=: 15!:11
gh=. 15!:8
fh=. 15!:9
symget=: 15!:6
symset=: 15!:7
cdcb=: 15!:13
JB01=: 1
JCHAR=: 2
JSTR=: _1,JCHAR
JINT=: 4
JPTR=: JINT
JFL=: 8
JCMPX=: 16
JBOXED=: 32
JTYPES=: JB01,JCHAR,JINT,JPTR,JFL,JCMPX,JBOXED
JSIZES=: >IF64{1 1 4 4 8 16 4;1 1 8 8 8 16 8
ic=: 3!:4
fc=: 3!:5
endian=: |.^:('a'={.2 ic a.i.'a')
Endian=: |.^:('a'~:{.2 ic a.i.'a')
AND=: $:/ : (17 b.)
OR=: $:/ : (23 b.)
XOR=: $:/ : (22 b.)
cocurrent 'z'
3 : 0 ''
if. -. (UNAME-:'Darwin')+.(UNAME-:'SunOS') do. DLL_PATH=: '' return. end.
llp=. 2!:5 'LD_LIBRARY_PATH',~'DY'#~UNAME-:'Darwin'
if. 0 -: llp do. llp=. '' end.
def_path=. ':/usr/local/lib:/usr/lib:/usr/lib/ccs/lib:/etc/lib:/lib'
DLL_PATH=: a: -.~ <;._1 ':',llp,def_path
)
find_dll=: 3 : 0
DLL_PATH find_dll y
:
if. UNAME-:'Linux' do. ('find_dll decommitted') 13!:8 ] 24 end.  
if. -.IFUNIX do. y return. end.
y=. ,y
if. (UNAME-:'Darwin') do. ext=. '.dylib*' else. ext=. '.so*' end.
for_dir. x do.
  l=. (>dir), '/lib', y, ext
  if. # fns=. \:~ 1!: 0 l do.
    (>dir), '/', > (<0 0) { fns
    return.
  end.
end.
('could not locate dll ',y) 13!:8 ] 24
)
break=: 3 : 0
class=. >(0=#y){y;'default'
p=. 9!:46''
q=. (>:p i: '/'){.p
fs=. (<q),each {."1[1!:0<q,'*.',class
fs=. fs-.<p 
for_f. fs do.
  v=. 2<.>:a.i.1!:11 f,<0 1
  (v{a.) 1!:12 f,<0 
end.
i.0 0
)
setbreak=: 3 : 0
p=. jpath '~break/'
1!:5 ::] <p
f=. p,(":2!:6''),'.',y
({.a.) 1!:12 f;0 
9!:47 f
f
)
cocurrent 'z'
calendar=: 3 : 0
0 calendar y
:
a=. ((j<100)*(-100&|){.6!:0'')+j=. {.y
b=. (a-x)+-/<.4 100 400%~<:a
r=. 28+3,(~:/0=4 100 400|a),10$5$3 2
r=. (-7|b+0,+/\}:r)|."0 1 r(]&:>:*"1>/)i.42
m=. (<:}.y),i.12*1=#y
h=. 'JanFebMarAprMayJunJulAugSepOctNovDec'
h=. ((x*3)|.' Su Mo Tu We Th Fr Sa'),:"1~_3(_12&{.)\h
<"2 m{h,"2[12 6 21 ($,) r{' ',3":1+i.31 1
)
getdate=: 3 : 0
0 getdate y
:
r=. ''
opt=. x
chr=. [: -. [: *./ e.&'0123456789 '
dat=. ' ' (I. y e.',-/:') } y

if. chr dat do.
  opt=. 0
  dat=. a: -.~ <;._1 ' ',dat
  if. 1=#dat do. r return. end.
  typ=. chr &> dat
  dat=. (2{.typ{dat),{:dat
  mth=. 3{.>1{dat
  uc=. 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  lc=. 'abcdefghijklmnopqrstuvwxyz'
  mth=. (lc,a.) {~ mth i.~ uc,a.
  mos=. _3[\'janfebmaraprmayjunjulaugsepoctnovdec'
  mth=. <": >:mos i. mth
  dat=. ;' ',each mth 1 } dat
end.

dat=. ". :: (''"_) dat
if. 0 e. #dat do. return. end.

if. 3 ~: #dat do. r return. end.

if. 31 < {.dat do. 'y m d'=. dat
else. ((opt|.'d m '),' y')=. dat
end.

if. y<100 do.
  y=. y + (-100&|) {. 6!:0''
end.

(#~ valdate) y,m,d
)
isotimestamp=: 3 : 0
r=. }: $y
t=. _6 [\ , 6 {."1 y
d=. '--b::' 4 7 10 13 16 }"1 [ 4 3 3 3 3 3 ": <.t
d=. d ,. }."1 [ 0j3 ": ,. 1 | {:"1 t
c=. {: $d
d=. ,d
d=. '0' (I. d=' ')} d
d=. ' ' (I. d='b')} d
(r,c) $ d
)
todate=: 3 : 0
0 todate y
:
s=. $y
a=. 657377.75 +, y
d=. <. a - 36524.25 * c=. <. a % 36524.25
d=. <.1.75 + d - 365.25 * y=. <. (d+0.75) % 365.25
r=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
r=. s $ |: ((c*100)+y+m >: 10) ,r
if. x do. r=. 100 #. r end.
r
)
todayno=: 3 : 0
0 todayno y
:
a=. y
if. x do. a=. 0 100 100 #: a end.
a=. ((*/r=. }: $a) , {:$a) $,a
'y m d'=. <"_1 |: a
y=. 0 100 #: y - m <: 2
n=. +/ |: <. 36524.25 365.25 *"1 y
n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
0 >. r $ n - 657378
)
tsdiff=: 4 : 0
r=. -/"2 d=. _6 (_3&([\)) \ ,x,"1 y
if. #i=. i#i.#i=. 0 > 2{"1 r do.
  j=. (-/0=4 100 400 |/ (<i;1;0){d)* 2=m=. (<i;1;1){d
  j=. _1,.j + m{0 31 28 31 30 31 30 31 31 30 31 30 31
  n=. <i;1 2
  r=. (j + n{r) n } r
end.
r +/ . % 1 12 365
)
tsrep=: 3 : 0
0 tsrep y
:
if. x do.
  r=. $y
  'w n t'=. |: 0 86400 1000 #: ,y
  w=. w + 657377.75
  d=. <. w - 36524.25 * c=. <. w % 36524.25
  d=. <.1.75 + d - 365.25 * w=. <. (d+0.75) % 365.25
  s=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
  s=. |: ((c*100)+w+m >: 10) ,s
  r $ s,. (_3{. &> t%1000) +"1 [ 0 60 60 #: n
else.
  a=. ((*/r=. }: $y) , {:$y) $, y
  'w m d'=. <"_1 |: 3{."1 a
  w=. 0 100 #: w - m <: 2
  n=. +/ |: <. 36524.25 365.25 *"1 w
  n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
  s=. 3600000 60000 1000 +/ .*"1 [ 3}."1 a
  r $ s+86400000 * n - 657378
end.
)
timestamp=: 3 : 0
if. 0 = #y do. w=. 6!:0'' else. w=. y end.
r=. }: $ w
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. w
d=. '+++::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='+') } d
(r,20) $ d
)

tstamp=: timestamp
valdate=: 3 : 0
s=. }:$y
'w m d'=. t=. |:((*/s),3)$,y
b=. *./(t=<.t),(_1 0 0<t),12>:m
day=. (13|m){0 31 28 31 30 31 30 31 31 30 31 30 31
day=. day+(m=2)*-/0=4 100 400|/w
s$b*d<:day
)
weekday=: 7 | 3 + todayno
weeknumber=: 3 : 0
yr=. {.y
sd=. 1 ((i.~weekday){]) ((<:yr),.12,.29+i.3),yr,.1,.1+i.4
wk=. >.7%~>: y -&todayno sd
if. wk >weeksinyear yr do.
  (>:yr),1
elseif. wk=0 do.
  (,weeksinyear)<:yr
elseif. do.
  yr,wk
end.
)
weeksinyear=: 3 : '52+ +./"1 [ 4=weekday(1 1,:12 31),"0 1/~ y'
cocurrent 'z'
dbr=: 13!:0
dbs=: 13!:1
dbsq=: 13!:2
dbss=: 13!:3
dbrun=: 13!:4
dbnxt=: 13!:5
dbret=: 13!:6
dbjmp=: 13!:7
dbsig=: 13!:8
dbrr=: 13!:9
dbrrx=: 13!:10
dberr=: 13!:11
dberm=: 13!:12
dbstk=: 13!:13
dblxq=: 13!:14
dblxs=: 13!:15
dbtrace=: 13!:16
dbq=: 13!:17
dbst=: 13!:18
dbctx=: 3 3&$: : (4 : 0)
if. -.13!:17'' do. 0 0$'' return. end.
try.
  'before after'=. 2{. <. , x, 3 3
catch.
  'before after'=. 3 3
end.
if. 0= #d=. 13!:13'' do. 0 0$'' return. end.
if. '*' -.@e. sus=. >{:"1 d do. 0 0$'' return. end.
'name ln nc def src'=. 0 2 3 4 5{(sus i. '*'){d
dyad=. {: ':'&e.;._2 ] 13!:12''
if. (_2{.def) -: LF,')' do.
  def=. }.def [ def0=. {.def=. }:<;._2 def,LF
else.
  def=. ,<def [ def0=: ''
end.
if. def e.~ <,':' do.
  if. dyad do.
    def=. def}.~ >: def i. <,':'
  else.
    def=. def{.~ def i. <,':'
  end.
end.
min=. 0>.ln-before [ max=. (<:#def)<.ln+after
ctx=. '[',"1 (":,.range) ,"1 ('] ') ,"1 >def{~range=. min + i. >:max-min
> (<'@@ ', name, '[', (dyad#':'), (":ln) ,'] *', (nc{' acv'),' @@ ', src), def0, <"1 ctx
)
dbg=: 13!:0
dblocals=: _1&$: : (4 : 0)
stk=. }. 13!:13''
if. 0=#y do. y=. a: else. y=. (y e. i.#stk) # y end.
loc=. (<y ; 0 7) { stk
if. -. x-:_1 do.
  t=. ;: ::] x
  f=. ({."1 e. t"_) # ]
  ({."1 loc) ,. f &.> {:"1 loc
end.
)
dbstack=: 3 : 0
hdr=. ;:'name en ln nc args locals susp'
stk=. }. 13!:13''
if. #y do.
  if. 2=3!:0 y do.
    stk=. stk #~ (<y)={."1 stk
  else.
    stk=. ((#stk)<.,y){.stk
  end.
end.
stk=. 1 1 1 1 0 0 1 1 1 #"1 stk
stk=. hdr, ": &.> stk
wds=. ({:@$@":@,.)"1 |: stk
len=. 20 >.<.-:({.wcsize'') - +/8, 4 {. wds
tc=. (len+1)&<.@$ {.!.'.' ({.~ len&<.@$)
tc@": each stk
)
dbstop=: 3 : 0
if. 0 e. #y -. ' ' do. 13!:3'' return. end.
t=. 13!:2''
if. #t do. t=. <;._2 t, ';' -. {:t end.
t=. ~. t, (;: ^: (L.=0:) y) ,&.> <' *:*'
13!:3 ; t ,&.> ';'
)
dbstops=: 3 : 0
13!:3 ; (;: ^: (L.=0:) y) ,&.> <' *:*;'
)
dbstopme=: 3 : 0
if. y do.
  if. 0 e. $c=. }. 13!:13'' do. return. end.
  c=. (> {. {. c), ' *:*'
  t=. 13!:2''
  if. #t do. t=. <;._2 t, ';' -. {:t end.
  t=. ~. t, <c
  13!:3 }: ; t ,&.> ';'
end.
)
dbstopnext=: 3 : 0
if. y do.
  if. 0 e. $c=. }. 13!:13'' do. return. end.
  'd n a'=. 0 2 6 { {. c
  c=. d,' ',(':'#~2=#a),":n+1
  t=. 13!:2''
  if. #t do. t=. <;._2 t, ';' -. {:t end.
  t=. ~. t, <c
  13!:3 }: ; t ,&.> ';'
end.
)
dbview=: 3 : 0
if. _1 = 4!:0 <'jdbview_jdbview_' do.
  'require'~'~system/util/dbview.ijs'
end.
jdbview_jdbview_ }. 13!:13''
)
cocurrent 'z'
dir=: 3 : 0
'n' dir y
:
ps=. '/'
y=. jpath y,(0=#y)#'*'
y=. y,((':',ps) e.~ {:y)#'*'
if. 0=#dr=. 1!:0 y do. empty'' return. end.
fls=. 'd' ~: 4{"1>4{"1 dr
if. (1=#dr) *. 0={.fls do.
  r=. x dir y,ps,'*'
  if. #r do. r return. end.
end.
if. fmt=. 2=3!:0 x do. opt=. 2 1
else. opt=. 2{.x end.
if. 0={:opt do. fls=. 1#~#dr=. fls#dr end.
if. 0=#dr do. empty'' return. end.
nms=. {."1 dr
nms=. nms ,&.> fls{ps;''
if. IFWIN do.
  nms=. tolower &.> nms
end.
ndx=. /: (":,.fls),.>nms
if. 0=opt do.
  list >ndx{nms
elseif. 1=opt do.
  path=. (+./\.y=ps)#y
  path&,&.>ndx{nms
elseif. fmt<2=opt do.
  ndx{nms,.}."1 dr
elseif. fmt do.
  'nms ts size'=. |:3{."1 dr
  if. IFWIN do.
    nms=. tolower L:0 nms
  end.
  ds=. '   <dir>    ' ((-.fls)#i.#fls) } 12 ":,.size
  mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
  f=. > @ ([: _2&{. [: '0'&, ": )&.>
  'y m d h n s'=. f&> ,<"1 |: 100|ts
  m=. (1{"1 ts){mth
  time=. d,.'-',.m,.'-',.y,.' ',.h,.':',.n,.':',.s
  dat=. (>nms),.ds,.' ',.time
  dat /: fls,. /:/: >(3|'dns'i.x){ts;nms;size
elseif. 1 do.
  'invalid left argument'
end.
)
dircompare=: 3 : 0
0 dircompare y
:
if. 0=#y do.
  '''long dirtree timestamps'' dircompare dir1;dir2'
  return.
end.

opt=. 3 {. x
res=. opt dircompares y
if. 0 = L. res do. return. end.

ps=. '/'
'a b c'=. res

'x y'=. jpath each cutopen y
x=. x, ps #~ (*#x) *. ps~:_1{.x
y=. y, ps #~ (*#y) *. ps~:_1{.y

r=. 'comparing  ',x,'  and  ',y,LF

if. #a do.
  r=. r,LF,'not in  ',y,':',LF,,(list a),.LF
end.

if. #b do.
  r=. r,LF,'not in  ',x,':',LF,,(list b),.LF
end.

if. +/ # &> c do.
  'cf cd'=. c
  r=. r,LF,'not same in both:',LF,,(list cf),.LF
  if. {.opt do.
    r=. r,LF,;(,&(LF2)) &.> cd
  end.
  
end.

if. 0=#;res do. r=. r,'no difference',LF end.

}:r
)
dircompares=: 3 : 0
0 dircompares y
:
ps=. '/'
opt=. 3{. x
'x y'=. jpath each cutopen y
x=. x, ps #~ (*#x) *. ps~:_1{.x
y=. y, ps #~ (*#y) *. ps~:_1{.y

if. 1{opt do.
  dx=. dirtree x [ dy=. dirtree y
else.
  dx=. 2 0 dir x [ dy=. 2 0 dir y
end.

if. dx -: dy do. 'no difference' return. end.
if. 0 e. #dx do. 'first directory is empty' return. end.
if. 0 e. #dy do. 'second directory is empty' return. end.

f=. #~ [: +./\. =&ps
sx=. f x
sy=. f y
fx=. {."1 dx
fy=. {."1 dy

if. 1{opt do.
  fx=. (#sx)}.&.>fx
  fy=. (#sy)}.&.>fy
  dx=. fx 0 }"0 1 dx
  dy=. fy 0 }"0 1 dy
end.

r=. <fx -. fy
r=. r , <fy -. fx

dx=. (fx e. fy)#dx
dy=. (fy e. fx)#dy

if. #j=. dx -. dy do.
  j=. {."1 j
  cmp=. <@fcompare"1 (sx&,&.>j),.sy&,&.>j
  
  if. 0=2{opt do.
    f=. 'no difference'&-: @ (_13&{.)
    msk=. -. f &> cmp
    j=. msk#j
    cmp=. msk#cmp
  end.
  
  r=. r,< j;<cmp
else.
  r=. r,a:
end.

r
)
dirfind=: 4 : 0
f=. [: 1&e. x&E.
g=. #~ [: -. [: +./\. =&'/'
d=. {."1 dirtree y
m=. f@g &> d
if. 1 e. m do. ; (m # d) ,each LF else. 0 0$'' end.
)
dirpath=: 3 : 0
0 dirpath y
:
r=. ''
t=. jpath y
ps=. '/'
if. #t do. t=. t, ps -. {:t end.
dirs=. <t
ifdir=. 'd'&= @ (4&{"1) @ > @ (4&{"1)
subdir=. ifdir # ]
while. #dirs do.
  fpath=. (>{.dirs) &,
  dirs=. }.dirs
  dat=. 1!:0 fpath '*'
  if. #dat do.
    dat=. subdir dat
    if. #dat do.
      r=. r, fpath each /:~ {."1 dat
      dirs=. (fpath @ (,&ps) each {."1 dat),dirs
    end.
  end.
end.
if. x do.
  f=. 1!:0 @ (,&(ps,'*'))
  g=. 0:`(0: e. ifdir)
  h=. g @. (*@#) @ f
  r=. r #~ h &> r
end.
if. #t do. r=. r,<}:t end.
if. IFWIN do.
  r=. tolower each r
end.
/:~ r
)
dirss=: 4 : 0
if. (2=#x) *. 1=L. x do.
  x dirssrplc y return.
end.
sub=. ' '&(I.@(e.&(TAB,CRLF))@]})
fls=. {."1 dirtree y
if. 0 e. #fls do. 'not found: ',x return. end.
fnd=. ''
while. #fls do.
  dat=. 1!:1 <fl=. >{.fls
  fls=. }.fls
  ndx=. I. x E. dat
  if. rws=. #ndx do.
    dat=. (20$' '),dat,30$' '
    dat=. (rws,50)$sub(,ndx+/i.50){dat
    fnd=. fnd,LF2,fl,' (',(":#ndx),')'
    fnd=. fnd,,LF,.dat
  end.
end.
if. #fnd do. 2}.fnd else. 'not found: ',x end.
)
dirssrplc=: 4 : 0
fls=. {."1 dirtree y
if. 0 e. #fls do.
  'no files found' return.
end.
r=. (x&fssrplc) each fls
b=. r ~: <'no match found'
j=. >b # fls , each ': '&, each r
}: , j ,. LF
)
dirtree=: 3 : 0
0 dirtree y
:
if. 0=4!:0 <'DirTreeX_j_' do.
  ex=. boxxopen DirTreeX_j_
else.
  ex=. ''
end.
r=. i.0 3
ps=. '/'
y=. jpath y
y=. y #~ (+./\ *. +./\.) y~:' '
y=. y,(0=#y)#'*'
if. ps={:y do. y=. y,'*' end.
if. -. '*' e. y do.
  if. 1 = #j=. 1!:0 y do.
    select. 'hd' = 1 4 { >4{,j
    case. 0 1 do. x dirtree y,ps,'*' return.
    case. 1 1 do. i.0 3 return.
    end.
  end.
end.
ts=. 100"_ #. 6: {. 0: >. <. - # {. 1980"_
'path ext'=. (b#y);(-.b=. +./\.y=ps)#y
if. #dl=. 1!:0 y do.
  att=. > 4{"1 dl
  fl=. (('h' ~: 1{"1 att) *. 'd' ~: 4{"1 att)#dl
  if. #fl do.
    r=. r,(path&,&.>{."1 fl),.1 2{"1 fl
  end.
end.
if. #dl=. 1!:0 path,'*' do.
  att=. > 4{"1 dl
  dr=. {."1 (('h' ~: 1{"1 att) *. 'd' = 4{"1 att) # dl
  dr=. dr -. ex
  if. #dr do.
    r=. r,;x&dirtree@(path&,@,&(ps,ext)) &.> dr
  end.
end.
r=. r #~ (ts x) <: ts &> 1{"1 r
if. IFWIN *. #r do.
  (tolower L:0 {."1 r) 0 }"0 1 r
end.
)
dirused=: [: (# , +/ @ ; @ (2: {"1 ])) 0&dirtree
cocurrent 'z'

fboxname=: <@jpath_j_@(8 u: >) ::]
fexists=: #~ fexist
f2utf8=: ]
fappend=: 4 : 0
(,x) (#@[ [ 1!:3) :: _1: fboxname y
)
fappends=: 4 : 0
(fputs x) (#@[ [ 1!:3) :: _1: fboxname y
)
fapplylines=: 1 : 0
0 u fapplylines y
:
y=. > fboxname y
s=. 1!:4 <y
if. s = _1 do. return. end.
p=. 0
dat=. ''
while. p < s do.
  b=. 1e6 <. s-p
  dat=. dat, 1!:11 y;p,b
  p=. p + b
  if. p = s do.
    len=. #dat=. dat, LF -. {:dat
  elseif. (#dat) < len=. 1 + dat i:LF do.
    'file not in LF-delimited lines' 13!:8[3
  end.
  if. x do.
    u ;.2 len {. dat
  else.
    u ;._2 CR -.~ len {. dat
  end.
  dat=. len }. dat
end.
)
fcopynew=: 4 : 0
dat=. fread each boxopen y
if. (<_1) e. dat do. _1 return. end.
dat=. ; dat
if. dat -: fread :: 0: x do. 0,#dat else.
  if. _1=dat fwrite x do. _1 else. 1,#dat end.
end.
)
fdir=: 1!:0@fboxname
ferase=: (1!:55 :: _1:) @ (fboxname &>) @ boxopen
fexist=: (1:@(1!:4) :: 0:) @ (fboxname &>) @ boxopen
fgets=: 3 : 0
y=. (-(26{a.)={:y) }. y
if. 0=#y do. '' return. end.
y,LF -. {:y=. toJ y
)
fmakex=: (] 1!:7~ 'x' 2 5 8} 1!:7) @ fboxname
fpathcreate=: 3 : 0
if. 0=#y do. 1 return. end.
p=. (,'/'-.{:) jpathsep y
if. # 1!:0 }: p do. 1 return. end.
for_n. I. p='/' do.  1!:5 :: 0: < n{.p end.
)
fpathname=: +./\.@:=&'/' (# ; -.@[ # ]) ]
fread=: 3 : 0
if. 1 = #y=. boxopen y do.
  1!:1 :: _1: fboxname y
else.
  1!:11 :: _1: (fboxname {.y),{:y
end.
:
x freads y
)
freadblock=: 3 : 0
'f p'=. y
f=. > fboxname f
s=. 1!:4 <f
if. s = _1 do. return. end.
if. (s = 0) +. p >: s do. '';p return. end.
if. 1e6 < s-p do.
  dat=. 1!:11 f;p,1e6
  len=. 1 + dat i: LF
  if. len > #dat do.
    'file not in LF-delimited lines' 13!:8[3
  end.
  p=. p + len
  dat=. len {. dat
else.
  dat=. 1!:11 f;p,s-p
  dat=. dat, LF -. {: dat
  p=. s
end.
(toJ dat);p
)
freadr=: 3 : 0
'f s'=. 2{.boxopen y
f=. fboxname f
max=. 1!:4 :: _1: f
if. max -: _1 do. return. end.
pos=. 0
step=. 10000
whilst. blk = cls
do.
  blk=. step<.max-pos
  if. 0=blk do. 'file not organized in records' return. end.
  dat=. 1!:11 f,<pos,blk
  cls=. <./dat i.CRLF
  pos=. pos+step
end.
len=. cls+pos-step
dat=. 1!:11 f,<len,2<.max-len
dlm=. +/CRLF e. dat
wid=. len+dlm
s=. wid*s,0 #~ 0=#s
dat=. 1!:11 f,<s
dat=. (-wid)[\dat
(-dlm)}."1 dat
)
freads=: 3 : 0
'' freads y
:
dat=. fread y
if. (dat -: _1) +. 0=#dat do. return. end.
dat=. fgets dat
if. 'b'e.x do. dat=. <;._2 dat
elseif. 'm'e.x do. dat=. ];._2 dat
end.
)
frename=: 4 : 0
x=. > fboxname x
y=. > fboxname y
if. x -: y do. return. end.
if. IFUNIX do.
  2!:0 'mv "',y,'" "',x,'"'
else.
  'kernel32 MoveFileW i *w *w' 15!:0 (uucp y);uucp x
end.
)
freplace=: 4 : 0
y=. boxopen y
dat=. ,x
f=. #@[ [ 1!:12
dat f :: _1: (fboxname {.y),{:y
)
fsize=: (1!:4 :: _1:) @ (fboxname &>) @ boxopen
fss=: 4 : 0
y=. fboxname y
size=. 1!:4 :: _1: y
if. size -: _1 do. return. end.
blk=. (#x) >. 100000 <. size
r=. i.pos=. 0
while. pos < size do.
  dat=. 1!:11 y,<pos,blk <. size-pos
  r=. r,pos+I. x E. dat
  pos=. pos+blk+1-#x
end.
r
)
fssrplc=: fstringreplace
fstamp=: (1: >@{ , @ (1!:0) @ fboxname) :: _1:
fputs=: 3 : 0
dat=. ":y
if. 0 e. $dat do.
  ''
else.
  if. 1>:#$dat do.
    toHOST dat,(-.({:dat) e. CRLF) # LF
  else.
    ,dat,"1 toHOST LF
  end.
end.
)
ftype=: 3 : 0
d=. (}: ^: ('/'={:)) ucp y
d=. 1!:0 fboxname d
if. #d do.
  >: 'd' = 4 { > 4 { ,d
else.
  0
end.
)
fview=: 3 : 0
if. 3 ~: nc <'textview_z_' do.
  sminfo 'textview not available.' return.
end.
txt=. freads y
if. txt -: _1 do.
  sminfo 'file not found: ',,>y return.
end.
textview txt
)
fwrite=: 4 : 0
(,x) (#@[ [ 1!:2) :: _1: fboxname y
)
fwritenew=: 4 : 0
dat=. ,x
if. dat -: fread y do. 0 return. end.
dat fwrite y
)
fwrites=: 4 : 0
(fputs x) (#@[ [ 1!:2) :: _1: fboxname y
)
ftostring=: fputs
fstring=: fgets
cocurrent 'z'
install=: 3 : 0
require 'pacman'
if. -. checkaccess_jpacman_ '' do. return. end.
'update' jpkg ''
select. y
case. 'gtkide' do.
  getgtkbin 0
  'install' jpkg 'base library ide/gtk gui/gtk'
case. 'all' do.
  getgtkbin 0
  'install' jpkg 'all'
end.
)
getgtkbin=: 3 : 0
if. UNAME -: 'Linux' do. return. end.
if. (0={.y,0) *. 0 < #1!:0 jpath '~install/gtk/lib' do. return. end.
require 'pacman'
smoutput 'Installing gtk binaries...'
z=. (IFWIN pick 'mac';'win'),(IF64 pick '32';'64'),'.zip'
z=. 'http://www.jsoftware.com/download/gtk',z
'rc p'=. httpget_jpacman_ z
if. rc do.
  smoutput 'unable to download: ',z return.
end.
d=. jpath '~install'
if. IFWIN do.
  unzip_jpacman_ p;d
else.
  hostcmd_jpacman_ 'unzip ',(dquote p),' -d ',dquote d
  ('INSTALLPATH';jpath '~install/gtk') dirss jpath '~install/gtk/etc'
end.
if. #1!:0 jpath '~install/gtk/lib' do.
  m=. 'Finished install of gtk binaries.'
else.
  m=. 'Unable to install gtk binaries.',LF
  m=. m,'check that you have write permission for: ',LF,jpath '~install/gtk'
end.
smoutput m
)
cocurrent 'z'
cuts=: 2 : 0
if. n=1 do. [: u (#@[ + E. i. 1:) {. ]
elseif. n=_1 do. [: u (E. i. 1:) {. ]
elseif. n= 2 do. [: u (E. i. 1:) }. ]
elseif. 1 do. [: u (#@[ + E. i. 1:) }. ]
end.
)
cut=: ' '&$: :([: -.&a: <;._2@,~)
deb=: #~ (+. 1: |. (> </\))@(' '&~:)
debc=: #~"1 [: (+. (1: |. (> </\))) ' '&(+./ .~:)
delstring=: 4 : ';(x E.r) <@((#x)&}.) ;.1 r=. x,y'
detab=: ' ' I.@(=&TAB@])} ]
dlb=: }.~ =&' ' i. 0:
dltb=: #~ [: (+./\ *. +./\.) ' '&~:
dtb=: #~ [: +./\. ' '&~:
joinstring=: ''&$: : (#@[ }. <@[ ;@,. ])
ljust=: (|.~ +/@(*./\)@(' '&=))"1
rjust=: (|.~ -@(+/)@(*./\.)@(' '&=))"1
splitstring=: #@[ }.each [ (E. <;.1 ]) ,
ss=: I. @ E.
dropto=: ] cuts 2
dropafter=: ] cuts 1
taketo=: ] cuts _1
takeafter=: ] cuts _2
charsub=: 4 : 0
'f t'=. |: _2 ]\ x
l=. f i."1 0 y
x=. l { t,'?'
c=. l = #f
c } x ,: y
)
chopstring=: 3 : 0
(' ';'""') chopstring y
:
dat=. y
'fd sd'=. 2{. boxopen x
assert. 1 = #fd
if. =/sd do. sd=. (-<:#sd)}.sd   
else. 
  s=. {.('|'=fd){ '|`'  
  dat=. dat rplc ({.sd);s;({:sd);s
  sd=. s
end.
dat=. dat,fd
b=. dat e. fd
c=. dat e. sd
d=. ~:/\ c                       
fmsk=. b > d                     
smsk=. (> (0 , }:)) c            
smsk=. -. smsk +. c *. 1|.fmsk   
y=. smsk#y,fd   
fmsk=. 0:^:(,@1: -: ]) smsk#fmsk
fmsk <;._2 y  
)
dltbs=: LF&$: : (4 : 0)
txt=. ({.x), y
a=. txt ~: ' '
b=. (a # txt) e. x
c=. b +. }. b, 1
d=. ~: /\ a #^:_1 c ~: }: 0, c
}. (a >: d) # txt
)
dquote=: ('"'&,@(,&'"'))@ (#~ >:@(=&'"'))
dtbs=: 3 : 0
CRLF dtbs y
:
txt=. y , {.x
blk=. txt ~: ' '
ndx=. +/\ blk
b=. blk < }. (txt e. x), 0
msk=. blk >: ndx e. b # ndx
}: msk # txt
)
rplc=: stringreplace~
fstringreplace=: 4 : 0
nf=. 'no match found'
y=. boxopen y
try. size=. 1!:4 y catch. nf return. end.
if. size=0 do. nf return. end.
old=. freads y
new=. x stringreplace old
if. old -: new do. nf return. end.
new fwrites y
cnt=. +/ (0 pick x) E. old
(":cnt),' replacement',((1~:cnt)#'s'),' made'
)
quote=: (''''&,@(,&''''))@ (#~ >:@(=&''''))
nos=. i.@#@] e. #@[ ({~^:a:&0@(,&_1)@(]I.+) { _1,~]) I.@E.
splitnostring=: #@[ }.each [ (nos f. <;.1 ]) ,
stringreplace=: 4 : 0

txt=. ,y
t=. _2 [\ ,x
old=. {."1 t
new=. {:"1 t
oldlen=. # &> old
newlen=. # &> new

if. *./ 1 = oldlen do.
  
  hit=. (;old) i. txt
  ndx=. I. hit < #old
  
  if. 0 e. $ndx do. txt return. end.
  
  cnt=. 1
  exp=. hit { newlen,1
  hnx=. ndx { hit
  bgn=. ndx + +/\ 0, (}: hnx) { newlen - 1
  
else.
  
  
  hit=. old I. @ E. each <txt
  cnt=. # &> hit
  
  if. 0 = +/ cnt do. txt return. end.
  
  bgn=. set=. ''
  
  pick=. > @ {
  diff=. }. - }:
  
  for_i. I. 0 < cnt do.
    ln=. i pick oldlen
    cx=. (i pick hit) -. set, ,bgn -/ i.ln
    while. 0 e. b=. 1, <:/\ ln <: diff cx do. cx=. b#cx end.
    hit=. (<cx) i} hit
    bgn=. bgn, cx
    set=. set, ,cx +/ i.ln
  end.
  
  cnt=. # &> hit
  msk=. 0 < cnt
  exp=. (#txt) $ 1
  del=. newlen - oldlen
  
  if. #add=. I. msk *. del > 0 do.
    exp=. (>: (add{cnt) # add{del) (;add{hit) } exp
  end.
  
  if. #sub=. I. msk *. del < 0 do.
    sbx=. ; (;sub{hit) + each (sub{cnt) # i. each sub{del
    exp=. 0 sbx } exp
  end.
  
  hit=. ; hit
  ind=. /: (#hit) $ 1 2 3
  hnx=. (/: ind { hit) { ind    
  bgn=. (hnx { hit) + +/\ 0, }: hnx { cnt # del
  
end.

ind=. ; bgn + each hnx { cnt # i.each newlen
rep=. ; hnx { cnt # new
rep ind} exp # txt
)
cutpara=: 3 : 0
txt=. topara y
txt=. txt,LF -. {:txt
b=. (}.b,0) < b=. txt=LF
b <;._2 txt
)
foldtext=: 4 : 0
if. 0 e. $y do. '' return. end.
y=. ; x&foldpara each cutpara y
y }.~ - (LF ~: |.y) i. 1
)
foldpara=: 4 : 0
if. 0=#y do. LF return. end.
r=. ''
x1=. >: x
txt=. y
while.
  ind=. ' ' i.~ |. x1{.txt
  s=. txt {.~ ndx=. x1 - >: x1 | ind
  s=. (+./\.s ~: ' ') # s
  r=. r, s, LF
  #txt=. (ndx + ind<x1) }. txt
do. end.
r
)
topara=: 3 : 0
if. 0=#y do. '' return. end.
b=. y=LF
c=. b +. y=' '
b=. b > (1,}:b) +. }.c,0
' ' (I. b) } y
)

cocurrent <'j'
Alpha=: a. {~ , (a.i.'Aa') +/ i.26
Num=: a. {~ (a.i.'0') + i.10
AlphaNum=: Alpha,Num
Boxes=: ((16+i.11) { a.),:'+++++++++|-'
ScriptExt=: '.ijs'
ProjExt=: '.jproj'

extnone=: {.~ i:&'.'
extproj=: , (ProjExt #~ '.'&e. < 0 < #)
extsrc=: , ('.ijs' #~ '.'&e. < 0 < #)

addfname=: , (e.&'/\' i: 1:) }. ]
boxdraw=: 3 : '9!:7 y { Boxes'
hostcmd=: [: 2!:0 '(' , ,&' || true)'
fpath=: [: }: +./\.@:=&'/' # ]
maxrecent=: 3 : '(RecentMax <. #r) {. r=. ~.y'
pack=: [: (,. ".&.>) ;: ::]
pdef=: 3 : '0 0$({."1 y)=: {:"1 y'
seldir=: #~ '-d'&-:"1 @ (1 4&{"1) @ > @ (4&{"1)
spath=: #~ [: *./\. '/'&~:
termLF=: , (0 < #) # LF -. {:
termsep=: , (0 < #) # '/' -. {:
tolist=: }.@;@:(LF&,each)
remsep=: }.~ [: - '/' = {:

path2proj=: ,'/',ProjExt ,~ spath
3 : 0''
if. IFUNIX do.
  filecase=: ]
  isroot=: '/' = {.
else.
  filecase=: tolower
  isroot=: ':' = {.@}.
end.
0
)
dirtreex=: 3 : 0
'' dirtreex y
:
y=. jpath y
p=. (+./\. y = '/') # y
d=. 1!:0 y,('/' = {:y) # '*'
if. 0 = #d do. '' return. end.
a=. > 4 {"1 d
m=. 'd' = 4 {"1 a
f=. (<p) ,each {."1 d
if. 1 e. m do.
  f=. f, ; dirtreex each (m#f) ,each <'/','*'
end.
if. #x do.
  f #~ (1 e. x E. ])&> f
end.
)
getfolderdefs=: 3 : 0
p=. (, '/' , ProjExt ,~ spath) each subdirtree y
t=. p #~ #@(1!:0)&> p
t;<fpath each (1+#y) }. each (-#ProjExt) }. each t
)
isconfigfile=: 3 : 0
'p f'=. fpathname y
x=. f i: '.'
(p -: jpath '~config/') *. '.cfg'-:x}.f
)
isdir=: 3 : 0
d=. 1!:0 y
if. 1 ~: #d do. 0 return. end.
'd' = 4 { 4 pick ,d
)
istempname=: 3 : 0
x=. y i: '.'
*./ ('.ijs'-:x}.y),(x{.y) e. Num
)
istempscript=: 3 : 0
'p f'=. fpathname y
(p -: jpath '~temp/') *. istempname f
)
jshowconsole=: 3 : 0
if. -.IFWIN do. 'only supported in windows' return. end.
t=. {.>'kernel32.dll GetConsoleWindow x'cd''
'user32.dll ShowWindow n x i'cd t;(0-:y){5 0
i.0 0
)
mkdir=: 3 : 0
a=. termsep y
if. #1!:0 }:a do. 1 return. end.
for_n. I. a='/' do.
  1!:5 :: 0: < n{.a
end.
)
newtempscript=: 3 : 0
x=. ScriptExt
p=. jpath '~temp/'
d=. 1!:0 p,'*',x
a=. (-#x) }. each {."1 d
a=. a #~ (*./ .e.&'0123456789') &> a
a=. 0, {.@:(0&".) &> a
p, x ,~ ": {. (i. >: #a) -. a
)
nounrep=: 2 }. [: ; [: nounrep1 each ;:
nounrep1=: LF2 , ] , '=: ' , [: nounrep2 ".
nounrep2=: 3 : 0
if. 0 = #y do. '''''' return. end.
select. 3!:0 y
fcase. 32 do.
  y=. ; y ,each LF
case. 2 do.
  if. LF e. y do.
    y=. y, LF -. {:y
    '0 : 0', LF, ; <;.2 y,')'
  else.
    quote y
  end.
case. do.
  ": y
end.
)
octal=: 3 : 0
t=. ,y
x=. a. i. t
n=. x e. 9 10 13
m=. n < 32 > x
if. (isutf8 t) > 1 e. m do. t return. end.
r=. t ,"0 1 [ 3 # EAV
if. #m=. I. m +. x>126 do.
  s=. '\',.}.1 ": 8 (#.^:_1) 255,m{x
  r=. s m} r
end.
EAV -.~ ,r
)
rmdir=: 3 : 0
r=. 1;'not a directory: ',":y
if. 0=#y do. r return. end.
d=. 1!:0 y
if. 1 ~: #d do. r return. end.
if. 'd' ~: 4 { 4 pick {. d do. r return. end.
if. IFWIN do.
  shell_jtask_ 'rmdir ',y,' /S /Q'
else.
  hostcmd_j_ 'rm -rf --preserve-root ',y
end.
(#1!:0 y);''
)
scripts=: 3 : 0
if. 0=#y do.
  list 0{"1 Public
elseif. 'v'e.y do.
  dir=. Public
  a=. >0{"1 dir
  b=. >1{"1 dir
  a /:~ a,.' ',.b
elseif. 1 do.
  'invalid argument to scripts: ',,":y
end.
)
setfolder=: 3 : 0
if. 0=#y do.
  Folder=: FolderTree=: FolderIds=: '' return.
end.
assert. (<y) e. {."1 UserFolders
Folder=: y
'FolderTree FolderIds'=: getfolderdefs jpath '~',y
if. 3=nc <'snapshot_tree_jp_' do.
  snapshot_tree_jp_ FolderTree
end.
EMPTY
)
subdirtree=: 3 : 0
if. 0=#1!:0 y do. '' return. end.
r=. ''
dir=. <y,'/'
while. #dir do.
  fpath=. (>{.dir) &,
  dir=. }.dir
  dat=. seldir 1!:0 fpath '*'
  if. #dat do.
    dat=. fpath each {."1 dat
    r=. r,dat
    dir=. (dat ,each '/'),dir
  end.
end.
sort filecase each r
)
unixshell=: 3 : 0
f=. jpath '~temp/shell.sh'
t=. jpath '~temp/shell.txt'
e=. jpath '~temp/shell.err'
('#!/bin/sh',LF,y,LF) fwrite f
'rwx------' 1!:7 <f
hostcmd '"',f,'" > "',t,'" 2> "',e,'"'
r=. (fread t);fread e
ferase f;t;e
r
)
unixshellx=: 3 : 0
'res err'=. unixshell y
if. #err do.
  smoutput 'Shell command error: ',LF,LF,err
end.
res
)
htmlhelp=: 3 : 0
f=. jpath '~addons/docs/help/',y
if. fexist ({.~ i:&'#') f do.
  browse 'file://',f
else.
  f=. 'http://www.jsoftware.com/docs/help',}.(i.&'/'{.]) 9!:14''
  browse f,'/',y
end.
)
browseref=: 3 : 0
htmlhelp 'dictionary/',y
)
dquote=: 3 : 0
if. '"' = {.y do. y else. '"',y,'"' end.
)
browse=: 3 : 0
cmd=. dlb@dtb y
isURL=. 1 e. '://'&E.
if. IFBROADWAY do.
  sminfo 'browse error: not yet implemented'
  EMPTY return.
end.
if. IFJHS do.
  cmd=. '/' (I. cmd='\') } cmd
  if. -. isURL cmd do.
    if. -.fexist cmd do. EMPTY return. end.
    cmd=. 'file://',cmd
  end.
  redirecturl_jijxm_=: (' ';'%20') stringreplace cmd
  EMPTY return.
end.
browser=. Browser_j_
if. IFWIN do.
  ShellExecute=. 'shell32 ShellExecuteW > i x *w *w *w *w i'&cd
  SW_SHOWNORMAL=. 1
  NULL=. <0
  cmd=. '/' (I. cmd='\') } cmd
  if. -. isURL cmd do.
    if. -.fexist cmd do. EMPTY return. end.
    cmd=. 'file://',cmd
  end.
  if. 0 = #browser do.
    r=. ShellExecute 0;(uucp 'open');(uucp cmd);NULL;NULL;SW_SHOWNORMAL
  else.
    r=. ShellExecute 0;(uucp 'open');(uucp browser);(uucp dquote cmd);NULL;SW_SHOWNORMAL
  end.
  if. r<33 do. sminfo 'browse error:',browser,' ',cmd,LF2,1{::cderx'' end.
  EMPTY return.
end.
if. 0 = #browser do.
  browser=. dfltbrowser''
end.
browser=. dquote (browser;Browser_nox_j_){::~ nox=. IFUNIX *. (0;'') e.~ <2!:5 'DISPLAY'
cmd=. '/' (I. cmd='\') } cmd
if. -. isURL cmd do.
  cmd=. 'file://',cmd
end.
cmd=. browser,' ',dquote cmd
try.
  2!:1 cmd, (0=nox)#' >/dev/null 2>&1 &'
catch.
  msg=. 'Could not run the browser with the command:',LF2
  msg=. msg, cmd,LF2
  if. IFGTK do.
    msg=. msg, 'You can change the browser definition in Edit|Configure|Base',LF2
  end.
  sminfo 'Run Browser';msg
end.
EMPTY
)
dfltbrowser=: verb define
select. UNAME
case. 'Win' do. ''
case. 'Darwin' do. 'open'
case. do.
  try.
    2!:0'which google-chrome'
    'google-chrome' return. catch. end.
  try.
    2!:0'which chromium-browser'
    'chromium-browser' return. catch. end.
  try.
    2!:0'which firefox'
    'firefox' return. catch. end.
  try.
    2!:0'which konqueror'
    'konqueror' return. catch. end.
  try.
    2!:0'which netscape'
    'netscape' return. catch. end.
  '' return.
end.
)
viewpdf=: 3 : 0
cmd=. dlb@dtb y
if. IFBROADWAY do.
  sminfo 'viewpdf error: not yet implemented'
  EMPTY return.
end.
if. IFJHS do.
  cmd=. '/' (I. cmd='\') } cmd
  if. -.fexist cmd do. EMPTY return. end.
  redirecturl_jijxm_=: (' ';'%20') stringreplace cmd
  EMPTY return.
end.
PDFReader=. PDFReader_j_
if. IFWIN do.
  ShellExecute=. 'shell32 ShellExecuteW > i x *w *w *w *w i'&cd
  SW_SHOWNORMAL=. 1
  NULL=. <0
  cmd=. '/' (I. cmd='\') } cmd
  if. -.fexist cmd do. EMPTY return. end.
  if. 0 = #PDFReader do.
    r=. ShellExecute 0;(uucp 'open');(uucp cmd);NULL;NULL;SW_SHOWNORMAL
  else.
    r=. ShellExecute 0;(uucp 'open');(uucp PDFReader);(uucp dquote cmd);NULL;SW_SHOWNORMAL
  end.
  if. r<33 do. sminfo 'view pdf error:',PDFReader,' ',cmd,LF2,1{::cderx'' end.
  EMPTY return.
end.
if. 0 = #PDFReader do.
  PDFReader=. dfltpdfreader''
end.
PDFReader=. dquote PDFReader
cmd=. '/' (I. cmd='\') } cmd
cmd=. PDFReader,' ',dquote cmd
try.
  2!:1 cmd
catch.
  msg=. 'Could not run the PDFReader with the command:',LF2
  msg=. msg, cmd,LF2
  if. IFGTK do.
    msg=. msg, 'You can change the PDFReader definition in Edit|Configure|Base',LF2
  end.
  sminfo 'Run PDFReader';msg
end.
EMPTY
)
dfltpdfreader=: verb define
select. UNAME
case. 'Win' do. ''
case. 'Darwin' do. 'open'
case. do.
  try.
    2!:0'which evince'
    'evince' return. catch. end.
  try.
    2!:0'which kpdf'
    'kpdf' return. catch. end.
  try.
    2!:0'which xpdf'
    'xpdf' return. catch. end.
  try.
    2!:0'which okular'
    'okular' return. catch. end.
  try.
    2!:0'which acroread'
    'acroread' return. catch. end.
  '' return.
end.
)
Folder=: ''
FolderTree=: FolderIds=: 0

Cwh=: 79 24
jpath=: 3 : 0
nam=. jpathsep y
if. '~' ~: {. nam do. return. end.
fld=. SystemFolders, UserFolders
ind=. nam i. '/'
tag=. }. ind {. nam
if. 0=#tag do.       
  tag=. 'home'
  nam=. '~home',}.nam
  ind=. nam i. '/'
end.
if. tag -: 'addons' do.
  bal=. 8 }. nam
end.
par=. '.' = {. tag
if. par do.
  len=. ('.' = tag) i. 0
  tag=. len }. tag
end.
ndx=. ({."1 fld) i. <tag
if. ndx < # fld do.
  bal=. ind }. nam
  pfx=. 1 pick ndx { fld
  if. '~' = {.pfx do.
    pfx=. jpath pfx
  end.
  if. par do.
    pfx=. ((#pfx) | (+/\. pfx='/') i: len) {. pfx
  end.
  nam=. pfx,bal
end.
nam
)
tofoldername=: 3 : 0
if. 0=#y do. '' return. end.
folders=. UserFolders,SystemFolders
pds=. {."1 folders
pps=. termsep each {:"1 folders
ndx=. \: # &> pps
pds=. ndx{pds
pps=. ndx{pps
res=. filecase each boxxopen y
len=. # &> pps
for_i. i.#res do.
  nam=. i pick res
  if. '~' = {. nam,'~' do. continue. end.
  msk=. pps = len {. each <nam,'/'
  if. 1 e. msk do.
    ndx=. ((i. >./) msk # len) { I. msk
    nam=. ('~', > ndx { pds),(<: ndx { len) }. nam
    res=. (<nam) i } res
  end.
end.
pps=. }: each pps
ndx=. 1 + pps i: &> '/'
msk=. ndx < len
pps=. msk # ndx {.each pps
pds=. msk # pds
len=. # &> pps
for_i. i.#res do.
  nam=. i pick res
  if. '~' = {. nam,'~' do. continue. end.
  if. '/' = {. nam do. continue. end.
  msk=. pps = len {. each <nam
  if. 1 e. msk do.
    ndx=. ((i. >./) msk # len) { I. msk
    nam=. ('~.', > ndx { pds),(<: ndx { len) }. nam
    res=. (<nam) i } res
  end.
end.
if. L. y do. res else. >res end.
)
Loaded=: ''
Public=: i. 0 2
UserFolders=: i. 0 2
Ignore=: ;: 'colib convert coutil dates debug dir dll files libpath strings text'
buildpublic=: 3 : 0
dat=. deb toJ y
dat=. a: -.~ <;._2 dat, LF
ndx=. dat i. &> ' '
short=. ndx {.each dat
long=. ndx }. each dat
long=. extsrc@jpathsep@deb each long
msk=. (<'system','/') = 7 {. each long
long=. (msk{'';'~') ,each long
Public=: sort ~. Public,~ short,.long
empty''
)
cutnames=: 3 : 0
if. LF e. y do.
  txt=. y, LF
  nms=. (txt = LF) <;._2 txt
else.
  txt=. y, ' '
  msk=. txt = '"'
  com=. (txt = ' ') > ~: /\ msk
  msk=. (msk *. ~:/\msk) < msk <: 1 |. msk
  nms=. (msk # com) <;._2 msk # txt
end.
nms -. a:
)
3 : 0''
if. 0=9!:24'' do.
  exist=: fexist
else.
  exist=: 0:
end.
1
)
fullname=: 3 : 0
p=. '/'
d=. jpath y
if. </ d i. ':',p do.
elseif. (2{.d) -: 2#p do.
elseif. p ~: 1{.d do.
  jcwdpath d
elseif. IFWIN do.
  (2{.jcwdpath''),d
end.
)
getscripts=: 3 : 0
if. 0=#y do. '' return. end.
if. 0=L.y do.
  if. fexist y do.
    y=. <y
  else.
    y=. cutnames y
  end.
end.
y=. y -. Ignore, IFJHS#;:'plot viewmat'   
if. 0=#y do. '' return. end.
ndx=. ({."1 Public) i. y
ind=. I. ndx < # Public
y=. ((ind { ndx) { 1 {"1 Public) ind } y
ind=. (i.#y) -. ind
if. #ind do.
  sel=. ind { y
  msk=. -. '.' e. &> sel
  cnt=. +/ &> sel e. each <'/\'
  ndx=. ind #~ msk *. cnt=1
  y=. (addfname each ndx { y) ndx } y
  ndx=. ind #~ msk *. cnt > 0
  sel=. (<'~addons/') ,each (ndx{y) ,each <'.ijs'
  smsk=. (1:@(1!:4) ::0:)@<@jpath &> sel
  y=. (smsk#sel) (smsk#ndx) } y
end.
fullname each jpath each y
)
getpath=: ([: +./\. =&'/') # ]
recentmax=: 3 : '({.~ RecentMax <. #) ~.y'
recentfiles_add_j_=: 3 : 0
RecentFiles_j_=: recentmax (<jpath y),RecentFiles_j_
recentsave''
)
recentproj_add=: 3 : 0
RecentProjects_j_=: recentmax (<jpath y),RecentProjects_j_
recentsave''
)
recentsave=: 3 : 0
n=. 'Folder RecentDirmatch RecentFif RecentFiles RecentProjects'
r=. 'NB. gtkide recent',LF2,nounrep n
r fwritenew jpath '~config/recent.dat'
)
xedit=: 0&$: : (4 : 0)
'file row'=. 2{.(boxopen y),<0
if. IFBROADWAY do.
  msg=. '|Could not run the editor:',cmd,LF
  msg=. msg,'|Not yet implemented'
  smoutput msg
  EMPTY return.
end.
if. IFJHS do.         
  xmr ::0: file
  EMPTY return.
end.
editor=. (Editor_j_;Editor_nox_j_){::~ nox=. IFUNIX *. (0;'') e.~ <2!:5 'DISPLAY'
if. 0=#editor do. EMPTY return. end.
cmd=. editor stringreplace~ '%f';(dquote >@fboxname file);'%l';(":>:row)
try.
  if. IFUNIX do.
    if. x do.
      2!:1 cmd
    else.
      2!:1 cmd, (0=nox+.(1 -.@e. 'term' E. editor)*.(1 e. '/vi' E. editor)+.'vi'-:2{.editor)#' &'
    end.
  else.
    (x{0 _1) fork_jtask_ cmd
  end.
catch.
  msg=. '|Could not run the editor:',cmd,LF
  msg=. msg,'|You can change the Editor definition in Edit|Configure|Base'
  smoutput msg
end.
EMPTY
)
cocurrent 'z'
jpath=: jpath_j_
load=: 3 : 0
0 load y
:
fls=. getscripts_j_ y
fn=. ('script',x#'d')~
for_fl. fls do.
  if. Displayload_j_ do. smoutput > fl end.
  if. -. fexist fl do.
    smoutput 'not found: ',>fl
  end.
  fn fl
  Loaded_j_=: ~. Loaded_j_,fl
end.
empty''
)

loadd=: 1&load
require=: 3 : 0
fls=. Loaded_j_ -.~ getscripts_j_ y
if. # fls do. load fls else. empty'' end.
)
scripts=: scripts_j_
show=: 3 : 0
y=. y,(0=#y)#0 1 2 3
if. (3!:0 y) e. 2 32 do. y=. cutopen y
else. y=. (4!:1 y) -. (,'y');,'y.' end.
wid=. {.wcsize''
sub=. '.'&(I. @(e.&(9 10 12 13 127 254 255{a.))@]})
j=. '((1<#$t)#(":$t),''$''),":,t'
j=. 'if. L. t=. ".y do. 5!:5 <y return. end.';j
j=. 'if. 0~:4!:0 <y do. 5!:5 <y return. end.';j
a=. (,&'=: ',sub @ (3 : j)) each y
; ((wid <. #&> a) {.each a) ,each LF
)
xedit=: xedit_j_
wcsize=: 3 : 0
if. (-.IFGTK+.IFJHS) *. UNAME-:'Linux' do.
  |.@".@(-.&LF)@(2!:0) :: (Cwh_j_"_) '/bin/stty size 2>/dev/null'
else.
  Cwh_j_
end.
)
coclass 'jcompare'

MAXPFX=: 100        
MAXLCS=: *: MAXPFX  
cin=: e. ,
fmt0=: 'p<0 [>q<] >' & (8!:0)
fmt1=: 'p<1 [>q<] >' & (8!:0)
lcs=: * * 1 + >./\@:(_1&|.)@:(>./\"1@:(_1&|."1))
mindx=: }.@{.@/:~@(+/"1 ,. ])
remltws=: 3 : 0
y=. y, LF
dat=. <;._2 y
msk=. CR = {: &> dat
dat=. (-msk) }. each dat
fn=. #~ ([: (+./\ *. +./\.) -.@(e.&(' ',TAB)))
dat=. fn each dat
dat=. dat ,each msk{'';CR
}: ; dat ,each LF
)
comp=: 4 : 0

sep=. ((LF cin x) +. LF cin y) { CRLF
if. 2=#$x do. x=. <@dtb"1 x
else. x=. <;._2 x,sep -. {:x end.
if. 2=#$y do. y=. <@dtb"1 y
else. y=. <;._2 y,sep -. {:y end.
if. x -: y do. 'no difference' return. end.
XY=: x,y
AX=: X=: XY i. x
AY=: Y=: XY i. y
NX=: i.#x
NY=: i.#y
SX=: SY=: ''
while. compend'' do. complcs'' end.
sx=. /:~ SX
sy=. /:~ SY
x=. (fmt0 sx) ,each (sx { AX) { XY
y=. (fmt1 sy) ,each (sy { AY) { XY
r=. (x,y) /: (sx,.0),sy,.1
}: ; r ,each LF
)
fcomp=: 4 : 0
'p j n'=. 3 {. x
'ifws ifsep'=. 2 2 #: j
'x y'=. _2 {. ,&p each cutopen y
if. L. n do.
  'nx ny'=. n
else.
  nx=. x [ ny=. y
end.
f=. 1!:1 :: _1:
tx=. f x=. fboxname x
if. tx -: _1 do. 'unable to read ',nx return. end.
ty=. f y=. fboxname y
if. ty -: _1 do. 'unable to read ',ny return. end.
tx=. f2utf8 tx
ty=. f2utf8 ty
if. ifsep do.
  tx=. toJ tx
  ty=. toJ ty
end.
if. ifws do.
  tx=. remltws tx
  ty=. remltws ty
end.
f=. _3&{.@('0'&,@(":@]))
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
'a m d h n s'=. 6{.1 pick dx=. ,1!:0 x
fx=. (4":d),' ',(m{mth),'  ::' 0 3 6 9};f &.> 100|a,h,n,s
'a m d h n s'=. 6{.1 pick dy=. ,1!:0 y
fy=. (4":d),' ',(m{mth),'  ::' 0 3 6 9};f &.> 100|a,h,n,s
'nx ny'=. <"1>nx;ny
r=. 'comparing:',LF
r=. r,nx,fx,'  ',(":2 pick dx),LF
r=. r,ny,fy,'  ',(":2 pick dy),LF
r,tx compare ty
)

compend=: 3 : 0
old=. 0 0
len=. (#X),#Y

while. -. len -: old do.
  old=. len
  t=. <./len
  m=. 0 i.~ (t {. X) = t {. Y
  X=: m }. X
  Y=: m }. Y
  t=. m - t
  n=. - +/ *./\. (t {. X) = t {. Y
  X=: n }. X
  Y=: n }. Y
  NX=: m }. n }. NX
  NY=: m }. n }. NY
  m=. X e. Y
  if. 0 e. m do.
    SX=: SX,(-.m)#NX
    X=: m # X
    NX=: m # NX
  end.
  m=. Y e. X
  if. 0 e. m do.
    SY=: SY,(-.m)#NY
    Y=: m # Y
    NY=: m # NY
  end.
  len=. (#X),#Y
end.
if. -. 0 e. len do. 1 return. end.
SX=: SX,NX
SY=: SY,NY
0
)
complcs=: 3 : 0
lx=. #X
ly=. #Y
if. MAXLCS < lx * ly do.
  select. MAXPFX < lx,ly
  case. 0 1 do.
    ly=. <. MAXLCS % lx
  case. 1 0 do.
    lx=. <. MAXLCS % ly
  case. do.
    lx=. ly=. MAXPFX
  end.
end.
a=. lx {. X
b=. ly {. Y
m=. ((b =/ a),.0),0
cm=. lcs ^:_ m
len=. >./ ,cm
rc=. 1 + mindx ($cm) #: I. len = ,cm
cm=. , rc {. cm
msk=. (1+i.len) =/ cm
ndx=. <@I."1 msk
pos=. ; (<rc) #: each ndx
pos=. (+/"1 pos),.pos
pos=. ((# &> ndx) # i.len),.pos
pos=. /:~ pos
'ib ia'=. |: 2 }."1 (~:{."1 pos)#pos
n=. 1 + {: ia
SX=: SX,(<<<ia) { n {. NX
X=: n }. X
NX=: n }. NX
n=. 1 + {: ib
SY=: SY,(<<<ib) { n {. NY
Y=: n }. Y
NY=: n }. NY
0
)
compare=: 4 : 0
if. x -: y do. 'no difference' return. end.
if. 0=#x do. 'empty left argument' return. end.
if. 0=#y do. 'empty right argument' return. end.
a=. conew 'jcompare'
r=. x comp__a y
coerase a
r
)
fcompare=: 3 : 0
('';0) fcomp y
:
(x;0) fcomp y
)
fcompares=: 3 : 0
('';1) fcomp y
:
(x;1) fcomp y
)
compare_z_=: compare_jcompare_
fcompare_z_=: fcompare_jcompare_
fcompares_z_=: fcompares_jcompare_

NB. profile for qconsole

jpathsep_z_=: '/'&(('\' I.@:= ])})
BINPATH_z_=: jpathsep BINPATH_z_

NB. =========================================================
md=: 3 : 0
a=. y,'/'
if. -.#1!:0 }:a do.
  for_n. I. a='/' do. 1!:5 :: [ <n{.a end.
end.
)

NB. =========================================================
3 : 0 ''
systype=. 9!:12''
bin=. BINPATH
install=. (bin i: '/') {. bin
system=. install,'/system'
tools=. install,'/tools'
qconsole=. 1!:43''
break=. qconsole,'/break'
config=. qconsole,'/config'
help=. qconsole,'/help'
home=. >(systype-5){(2!:5'HOME');2!:5'USERPROFILE'
lib=. qconsole,'/lib'
snap=. qconsole,'/snap'
temp=. qconsole,'/temp'
user=. qconsole,'/user'
ids=. ;:'bin break config help home install lib qconsole snap system temp tools user'
SystemFolders_j_=: ids,.jpathsep@".&.>ids
md break
md snap
md temp
md user
EMPTY
)



cocurrent 'j'
NB. configure

cocurrent 'jcfg'
coinsert 'j'

jdefs=: 0 : 0
Browser
Browser_nox
DirTreeX
Format
EPSReader
PDFReader
RecentMax
XDiff
Tags
UserDict
Editor
Editor_nox
GL2Backend
GL2ExtGlcmds
GTKVER
)

cbname=: {.~ i.&' ' <. i.&'='
foldernub=: #~ [: ~:&.|. {."1

NB. =========================================================
cpath=: 3 : 0
if. -. '~' e. {.&> {:"1 y do. y return. end.
({."1 y),.jpath each {:"1 y
)

NB. =========================================================
cbread=: 3 : 0
dat=. 'b' freads y
if. dat -: _1 do. return. end.
dat=. dat #~ (<'NB.') ~: 3 {. each dat
dat=. dat #~ '#' ~: {.&> dat
dat=. deb each dat
dat #~ 0 < #&> dat
)

NB. =========================================================
cbread1=: 3 : 0
r=. cbread jpath '~config/',y
if. r -: _1 do. cbread jpath '~system/config/',y end.
)

NB. =========================================================
cbread2=: 3 : 0
r0=. cbread jpath '~system/config/',y
if. r0 -: _1 do. r0=. <'' end.   NB. avoid domain error
r1=. cbread jpath '~config/',y
if. (0=#r1) +. r1 -: _1 do. r0 return. end.
n0=. cbname each r0
n1=. cbname each r1
if. 0 = #n0 -. n1 do. r1 return. end.
new=. (-.n0 e. n1) # r0
r=. LF2,'NB. ',(50#'='),LF,'NB. new configs',LF,;new,each LF
r fappends jpath '~config/',y
r1,new
)

NB. =========================================================
configbase=: 3 : 0
Snapshots_j_=: 0
0!:100 ;LF ,each cbread2 'base.cfg'
9!:3 DisplayForm
9!:7 BoxForm { Boxes
9!:17 BoxPos
9!:21 (2&^ ^: (<&_)) MemoryLimit
9!:37 Output
0!:100 ;(}:,'_j_=:',]) each <;.2 jdefs
EMPTY
)

NB. =========================================================
configfolders=: 3 : 0
UserFolders_j_=: i.0 2
if. IFWIN do.
  BINPATH_z_=: filecase BINPATH_z_
  sf=. filecase each {:"1 SystemFolders_j_
  SystemFolders_j_=: ({."1 SystemFolders_j_),.sf
end.
dat=. cbread1 'folders.cfg'
if. (0=#dat) +. dat -: _1 do. return. end.
ndx=. dat i.&> ' '
ids=. ndx {.each dat
pts=. jpath each filecase each (ndx+1) }. each dat
uf=. ids,.pts
msk=. (=tolower) {.&>ids
SystemFolders_j_=: foldernub SystemFolders,msk#uf
UserFolders_j_=: foldernub (-.msk)#uf
SystemFolders_j_=: cpath SystemFolders_j_
UserFolders_j_=: cpath UserFolders_j_
EMPTY
)

NB. =========================================================
configrecent=: 3 : 0
Folder=: RecentDirmatch=: RecentFif=: RecentFiles=: RecentProjects=: ''
0!:0 ::] < jpath '~config/recent.dat'
Folder_j_=: Folder #~ (<Folder) e. {."1 UserFolders
RecentDirmatch_j_=: ~. fexists cutLF RecentDirmatch
RecentFif_j_=: ~. cutLF RecentFif
RecentFiles_j_=: ~. fexists cutLF RecentFiles
RecentProjects_j_=: ~. fexists cutLF RecentProjects
RecentProjects_j_=: RecentProjects_j_ #~ '~' = {.&> tofoldername each RecentProjects_j_
EMPTY
)

NB. =========================================================
configrun=: 3 : 0
configbase''
configfolders''
configrecent''
coerase <'jcfg'
18!:4<'z'
)
NB. conf

cocurrent 'jgtkide'

jdefs=: 0 : 0
Snapshots
SnapshotX
)

jgtkidedefs=: 0 : 0
AutoCompletion
CodeCompletionBox
CodeCompletionKeyword
CodeCompletionOption
CodeCompletionScroll
ConfirmClose
ConfirmSave
ContextHelp
EditIcon
EditPos
EditScheme
EscClose
FifTypes
FixFont
KeepInputLog
SideBar
TermIcon
TermPos
TermScheme
Terminal
)

cbname=: {.~ i.&' ' <. i.&'='

NB. =========================================================
cbread=: 3 : 0
dat=. 'b' freads y
if. dat -: _1 do. return. end.
dat=. dat #~ (<'NB.') ~: 3 {. each dat
dat=. dat #~ '#' ~: {.&> dat
dat=. deb each dat
cbflatten dat #~ 0 < #&> dat
)

NB. =========================================================
cbflatten=: 3 : 0
msk=. (<'0 : 0') = _5 {.each y
if. -. 1 e. msk do. y return. end.
n=. msk i. 1
(n {. y),;(n }. msk) cbflatten1;.1 n }. y
)

NB. =========================================================
cbflatten1=: 3 : 0
ndx=. 1 + y i. <,')'
<(<;(ndx{.y) ,each LF),ndx}.y
)

NB. =========================================================
cbread1=: 3 : 0
r=. cbread jpath '~config/',y
if. r -: _1 do. cbread GtkConfig,y end.
)

NB. =========================================================
cbread2=: 3 : 0
r0=. cbread GtkConfig,y
if. r0 -: _1 do. r0=. <'' end.   NB. avoid domain error
r1=. cbread jpath '~config/',y
if. (0=#r1) +. r1 -: _1 do. r0 return. end.
n0=. cbname each r0
n1=. cbname each r1
if. 0 = #n0 -. n1 do. r1 return. end.
new=. (-.n0 e. n1) # r0
r=. LF2,'NB. ',(50#'='),LF,'NB. new configs',LF,;new,each LF
r fappends jpath '~config/',y
r1,new
)

NB. =========================================================
cutcommas=: 3 : 0
f=. (]`".@.('''' = {.)) @ deb
dat=. ',' , y
msk=. (dat=',') > ~:/\dat=''''
f each msk <;._1 dat
)

NB. =========================================================
conf_fini=: 3 : 0
Pathp=: jpath '~temp'
)

NB. =========================================================
NB. conf_fkeys
NB. keys not available (used by session manager):
NB.   1,c1,5,9,c9
conf_fkeys=: 3 : 0
conf_fkeys1 cbread1 'fkeys.cfg'
)

NB. =========================================================
conf_fkeys1=: 3 : 0
na=. 1 201 5 9 209
FKeys_jgtkide_=: ''
FKeyx_jgtkide_=: i.0 3
dat=. y
if. (0=#dat) +. dat -: _1 do. return. end.
dat=. 4 {."1 cutcommas &> dat
key=. {."1 dat
cs=. 100 * (2 #. 'cs' e. ]) &> key
msk=. -. cs e. na
FKeys_jgtkide_=: msk # cs + 0 ({.@".) &> key -.each <'cs'
out=. 0 ({.@".) each 1{"1 dat
FKeyx_jgtkide_=: msk # out,.2 3{"1 dat
EMPTY
)

NB. =========================================================
conf_fmt=: 3 : 0
v=. ": each ". each ;: y
n=. ;: tolower y
n=. LF ,each n ,each '='
; n,.v
)

NB. =========================================================
conf_fmts=: 3 : 0
n=. (<LF,'r'), each '=' ,~ each ": each i.#y
; n,.y
)

NB. =========================================================
conf_gtkide=: 3 : 0
cocurrent 'jcfgx'
coinsert 'jgtkide'
0!:100 ;LF ,each cbread2 'gtkide.cfg'
0!:100 ;(}:,'_j_=:',]) each <;.2 jdefs
0!:100 ;(}:,'_jgtkide_=:',]) each <;.2 jgtkidedefs
boxdraw_j_ BoxForm
cocurrent 'jgtkide'
FixFontDef=: FixFont
EditIcon=: (#~ fexist) jpath EditIcon
TermIcon=: (#~ fexist) jpath TermIcon
EditPos=: conf_pos EditPos
TermPos=: conf_pos TermPos
coerase <'jcfgx'
)

NB. =========================================================
conf_init=: 3 : 0
conf_fkeys''
conf_gtkide''
conf_menu''
conf_winpos''
conf_fini''
0
)

NB. =========================================================
conf_launch=: 3 : 0
t=. 'b' freads '~config/launch.cfg'
if. t-:_1 do.
  t=. 'b' freads GtkConfig,'launch.cfg'
end.
if. t-:_1 do.
  i. 0 2
else.
  t=. a: -.~ t #~ ('#' = {.&> t) +: (<'NB.') = 3 {.each t
  x=. t i.&> ';'
  deb each (x {.each t),.(x+1) }.each t
end.
)

NB. =========================================================
conf_studio=: 3 : 0
t=. 'b' freads GtkConfig,'studio.cfg'
if. t-:_1 do.
  i. 0 2
else.
  t=. a: -.~ t #~ (<'NB.') ~: 3 {.each t
  x=. t i.&> ';'
  deb each (x {.each t),.(x+1) }.each t
end.
)

NB. =========================================================
conf_menu=: 3 : 0
Launch_jgtkide_=: conf_launch''
Studio_jgtkide_=: conf_studio''
)

NB. =========================================================
conf_pos=: 3 : 0
if. 1 e. y>1 do. y return. end.
<.y * 4$Swh
)

NB. =========================================================
conf_winpos=: 3 : 0
0!:0 <GtkConfig,'winpos.dat'
0!:0 ::] <WinPosFile
)

NB. =========================================================
conf_save=: 3 : 0
recentsave_j_ ''
)

NB. =========================================================
snapwrite=: ]

NB. =========================================================
winpos_save=: 3 : 0
cocurrent 'jgtkide'
n=. ;: 'DirmPos DlogPos FifPos FiwPos PselPos CtagPos ViewPos'
r=. 'NB. gtkide sticky window positions',LF2
r=. r, ; n ,each ('=: ',LF,~":@".) each n
r fwritenew WinPosFile
)
NB. configure
NB.
NB. in addition to existing configure script

NB. not in base.cfg

cocurrent 'j'
Browser_nox=: ''

NB. =========================================================
cocurrent 'jgtkide'
SideBar=: 0
AutoCompletion=: 6
CodeCompletionBox=: 300 300
CodeCompletionKeyword=: ''
CodeCompletionOption=: ''
CodeCompletionScroll=: 12

# icons are in the lib subdirectory
EditIcon=: jpath '~qconsole/lib/edit.png'
TermIcon=: jpath '~qconsole/lib/term.png'
EditScheme=: 'edit'
TermScheme=: 'term'

NB. =========================================================
cocurrent 'jcfg'
Output=: 0 256 0 222

jgtkidedefs=: <;._2 (0 : 0)
ConfirmClose
ConfirmSave
EditPos
FifTypes
FixFont
KeepInputLog
LocalWiki
Host
Pass
Port
QServer
Terminal
TermPos
User
)

jdefs=: <;._2 (0 : 0)
Browser
DirTreeX
EPSReader
Format
PDFReader
RecentMax
SnapshotX
Snapshots
XDiff
)

zdefs=: <;._2 (0 : 0)
FileEncoding
)

(jgtkidedefs)=: (jdefs)=: <''

NB. =========================================================
numlistdefs=: <;._2 (0 : 0)
EditPos
Format
Output
TermPos
)

NB. =========================================================
numscalardefs=: <;._2 (0 : 0)
ConfirmClose
ConfirmSave
KeepInputLog
LocalWiki
RecentMax
Snapshots
Port
)

NB. =========================================================
configbase=: 3 : 0
p=. jpath '~config/base.cfg'
dat=. qbread p
if. dat -: _1 do.
  dat=. fread '~config/base_default.cfg'
  if. -. dat -: _1 do.
    dat fwrite p
  end.
  dat=. qbread p
  if. dat -: _1 do.
    smoutput 'Config file not found: ',p
    assert. 0
  end.
end.
if. (#ARGV) > ndx=. ARGV i. <'-c' do.
  dat=. dat, qbread '~config/', (ndx+1) pick ARGV
end.
ndx=. dat i.&> '='
nms=. deb each ndx {.each dat
val=. deb each (ndx+1) }.each dat
lx=. I. nms e. numlistdefs
sx=. I. nms e. numscalardefs
val=. (0 ". each lx{val) lx} val
val=. (0 {.@". each sx{val) sx} val
(nms)=: val
9!:37 Output
0!:100 ;(],'_jgtkide_=:',LF,~]) each jgtkidedefs
0!:100 ;(],'_j_=:',LF,~]) each jdefs
0!:100 ;(],'_z_=:',LF,~]) each zdefs
EMPTY
)

NB. =========================================================
configlaunch=: 3 : 0
Launch_jgtkide_=: conf_launch_jgtkide_''
)

NB. =========================================================
configrun=: 3 : 0
configbase''
configfolders''
configrecent''
coerase <'jcfg'
boxdraw_j_ 1
setbreak 'default'
18!:4<'z'
)

NB. =========================================================
cocurrent 'z'
NB. boot

18!:4 <'z' NB. start in z

Displayload_j_=: 0
FileEncoding_z_=: 'utf8'

NB. =========================================================
NB. usually not distributed
startupide=: 3 : 0
startup=. jpath '~config/startup.ijs'
if. 1!:4 :: 0: <startup do.
  18!:4 <'base'
  try.
    load startup
  catch.
    smoutput 'An error occurred when loading startup script: ',startup
  end.
  18!:4 <'z'
end.
)

NB. =========================================================
startupide''

cocurrent <'base'
coclass <'jp'
coinsert 'j'
defaultvalue=: 4 : 'if. _1 = 4!:0 <x do. (x)=: y end.'
index=: #@[ (| - =) i.
intersect=: e. # [
matchhead=: [ -: #@[ {. ]
towords=: ;:^:(_1 * 1 = L.)
decomment=: 3 : 0
dat=. <;._2 termLF toJ y
if. 2 > #dat do. y return. end.

com=. ('NB.'&-:)@(3&{.)&> dat
ncm=. com < (1|.0,}.com) +. (0,}._1|.com)
msk=. com +: ncm *. dat=a:
dat=. msk # dat

f=. 'NB.'&E. <: ~:/\@(e.&'''')
g=. #~ *./\@f
; (g each dat) ,each LF
)
ffoldername=: 3 : 0
p=. tofoldername_j_ y
if. '~' ~: {.p do. '';p return. end.
x=. ('/' e. p) + p i. '/'
(x{.p);x}.p
)
fixNB=: 3 : 0
x=. I. 'nb.' E. y
'NB' (0 1 +/~ x) } y
)
getprojfile=: 3 : 0
if. 0=#y do. '' return. end.
p=. remsep projname2path y
if. -. ProjExt -: (-#ProjExt) {. p do.
  p=. remsep p
  'f n'=. fpathname p
  p,'/',n,ProjExt
end.
)
getprojname=: 3 : 0
ProjectName,(0=#ProjectName)#ProjectPath
)
projname2path=: 3 : 0
if. '~'={. y do.
  jpath y
elseif. ('/'={.y) +: </ y i. ':/' do.
  jpath '~',y
elseif. do.
  y
end.
)
projfname=: 3 : 0
if. 0=#y do. '' return. end.
s=. jpathsep y
if. -. '/' e. s do.
  ProjectPath,'/',s
else.
  jpath s
end.
)
projsname=: 3 : 0
if. 0=#ProjectPath do. y return. end.
if. ProjectPath matchhead y do.
  (1+#ProjectPath) }. y
else.
  toprojectfolder y
end.
)
projssource=: 3 : 0
projread''
Source;<projsname each Source
)
PPScript=: jpath '~system/util/pp.ijs'
Project=: ProjectPath=: ProjectName=: ''
direrase=: 3 : 0
if. 0=#y do. return. end.
if. 0=#1!:0 y do. return. end.
if. 0=#d=. dirtreex y do. return. end.
d=. d \: # &> d
m=. ferase d
if. _1 e. m do.
  'Unable to delete: ',towords (m=_1)#d
end.
)
dirsubdirs=: 3 : 0
r=. 1!:0 (termsep jpathsep y),'*'
if. 0=#r do. '' return. end.
{."1 r #~ '-d' -:("1) 1 4{"1 > 4{"1 r
)
dirtreex=: 3 : 0
y=. jpathsep y
p=. (+./\. y = '/') # y
d=. 1!:0 y,('/' = {:y) # '*'
if. 0 = #d do. '' return. end.
a=. > 4 {"1 d
m=. 'd' = 4 {"1 a
f=. (<p) ,each {."1 d
if. 1 e. m do.
  f, ; dirtreex each (m#f) ,each <'/','*'
end.
)
fwritenew=: 4 : 0
dat=. ,x
if. dat -: fread y do. 0 return. end.
dat fwrite y
)
isdir=: 3 : 0
d=. 1!:0 y
if. 1 ~: #d do. 0 return. end.
'd' = 4 { 4 pick ,d
)
projread=: 3 : 0
projclear''
if. 0=#Project do. return. end.
projread1 Project
)
projread1_jp_=: 3 : 0
projclear''
Build=: 'build.ijs'
Run=: 'run.ijs'
Source=: ''
dat=. 'b' freads y
if. dat-:_1 do.
  Build=: projfname Build
  Run=: projfname Run return.
end.
dat=. dat #~ (<'NB.') ~: 3 {.each dat
if. 1 e. '=:' E. ;dat do.
  0!:100 ; dat ,each LF
  Source=: cutLF Source
else.
  Source=: dat
end.
Build=: projfname Build
Run=: projfname Run
Source=: projfname each extsrc each deb each Source -. a:
EMPTY
)
ProjHdr=: fixNB_jp_ 0 : 0
nb.
nb. defines list of source files.
nb. path defaults to project directory.
)
projwritenew=: 3 : 0
r=. 'NB. project: ',(getprojname''),LF,ProjHdr,LF
r fwrites y
)
toprojectfolder=: 3 : 0
if. 0=#y do. '' return. end.
r=. toprojectfolder1 y
if. L. y do. r else. >r end.
)
toprojectfolder1=: 3 : 0
res=. filecase@jpathsep each boxxopen y
rex=. I. '~' ~: {.&> res
if. 0=#rex do. res return. end.
if. #Folder do.
  pid=. termsep jpath '~',Folder
  for_i. rex do.
    nax=. termsep nam=. i pick res
    if. pid matchhead nax do.
      res=. (<'~',Folder,(<:#pid) }. nam) i} res
      rex=. rex -. i
    end.
  end.
end.
if. 0=#rex do. res return. end.
pus=. UserFolders,SystemFolders
pds=. {."1 pus
pps=. termsep each {:"1 pus
ndx=. \: # &> pps
pds=. ndx{pds
pps=. ndx{pps
len=. # &> pps
for_i. rex do.
  nam=. i pick res
  msk=. pps = len {. each <nam,'/'
  if. 1 e. msk do.
    ndx=. ((i. >./) msk # len) { I. msk
    nam=. ('~', > ndx { pds),(<: ndx { len) }. nam
    res=. (<nam) i } res
  end.
end.
res
)
touserfolder=: 3 : 0
p=. toprojectfolder y
if. '~' ~: {.p do. '' return. end.
f=. }. (p i.'/'){.p
p #~ (<f) e. {."1 UserFolders
)
gitcheck=: 3 : 0
0 < # 0 pick gitreadstatus''
)
gitgui=: 3 : 0
if. 0 = #ProjectPath do. 0 return. end.
0 0$gitshell 'git gui &'
)
gitreadstatus=: 3 : 0
if. IFUNIX *: 0 < #ProjectName do. '';'' return. end.
gitshell 'git status'
)
gitshell=: 3 : 0
p=. dquote remsep ProjectPath
if. IFWIN do.
  shell_jtask_ 'cd "',p,'"',LF,y
else.
  unixshell 'cd "',p,'"',LF,y
end.
)
gitstatus=: 3 : 0
if. 3=nc <'textview_z_' do.
  textview 0 pick gitreadstatus ''
end.
EMPTY
)
projclear=: 3 : 0
Build=: Run=: Source=: ''
)
projclose=: 3 : 0
projreset''
)
projinit=: 3 : 0
if. 0-:FolderTree do. setfolder_j_ Folder end.
projopen y,(0=#y) # >{.RecentProjects
)
projopen=: 3 : 0
projreset''
if. 0=#y do. return. end.
Project=: getprojfile y
ProjectPath=: }: 0 pick fpathname Project
projpathfolder ProjectPath
if. #Folder do.
  p=. (#jpath '~',Folder,'/') }. ProjectPath
  ProjectName=: Folder,'/',p
else.
  ProjectName=: ''
end.
projread''
recentproj_add_j_ Project
)
projpathfolder=: 3 : 0
p=. touserfolder y
f=. (p i. '/') {. p
if. ('~'={.f) *: (<}.f) e. {."1 UserFolders do.
  setfolder_j_ ''
else.
  setfolder_j_ }.f
end.
)
projreset=: 3 : 0
projclear''
Project=: ProjectPath=: ProjectName=: ''
)
projrun=: 3 : 0
if. #y do.
  p=. 0 pick fpathname getprojfile y
else.
  p=. ProjectPath,'/'
end.
load ::] p,Run
)
pp_today=: 2 }. [: ": [: <. 100 #. 3 {. 6!:0
pp_stamp=: [: ":@, 'r<0>2.0' (8!:2) _3 {. 6!:0
pp_unstamp=: ':' (2 5}"1) 1 1 0 1 1 0 1 1 (#^:_1"1) _6 {.&> ]
pic=: 4 : 0
'f p'=. fpathname y
path=. remsep f
d=. snapgetpath path
if. d -: 0 do. return. end.
d=. d,'/p',pp_today''
t=. d,'/',p
dat=. x,(pp_stamp''),EAV
if. _1 -: fread t do.
  if. -. pic_inidir d do. 0 return. end.
  old=. fread y
  if. -. _1 -: old do.
    dat=. old,(6#'0'),EAV,dat
  end.
end.
dat fappend t
)
pic_files=: 3 : 0
{."1 [1!:0 (snappath remsep y),'/p','/*',~pp_today''
)
pic_inidir=: 3 : 0
if. #1!:0 y do. 1 return. end.
h=. (y i: 'p') {. y
n=. {."1 [ 1!:0 h,'p*'
if. #n do.
  direrase h,'plast'
  n=. \:~ n -. <'plast'
  if. #n do.
    if. 1<#n do.
      direrase &> (<h) ,each }.n
    end.
    (h,'plast') frename h,0 pick n
  end.
end.
ss_mkdir y
)
pic_list=: 3 : 0
t=. y,(0=#y)#pp_today''
p=. (snappath each fpath each FolderTree) ,each <'/p*'
d=. 1!:0 each p
m=. I. 0 < # &> d
if. 0 = #m do. EMPTY return. end.
p=. ;t&pic_list1 each m
s=. >}."1 p
p=. ({."1 p),<'total'
(>p),.' ',.":s,+/s
)
pic_list1=: 4 : 0
fp=. (snappath fpath y pick FolderTree),'/p',x,'/'
d=. 1!:0 fp,'*'
if. 0=#d do. i. 0 3 return. end.
f=. {."1 d
c=. (EAV+/ .=fread) each (<fp) ,each f
s=. 2{"1 d
m=. (<'/',~y pick FolderIds),each f
m,.c,.s
)
pic_read=: 3 : 0
'f p'=. fpathname y
r=. fread (snappath remsep f),'/p',(pp_today''),'/',p
if. r -: _1 do. '' else. <;._2 r end.
)
pic_readx=: 3 : 0
'f n'=. y
_6 }. n pick pic_read f
)
ss_today=: 's' , 2 }. [: ": [: <. 100 #. 3 {. 6!:0
SnapTrees=: ''
snapfcopy=: 3 : 0
'source dest'=. y
if. IFWIN do.
  0 pick 'kernel32 CopyFileW i *w *w i' cd (uucp source);(uucp dest);0
else.
  if. 0 = fpathcreate fpath dest do. 0 return. end.
  if. _1 -: dat=. fread source do. 0 return. end.
  -. _1 -: dat fwrite dest
end.
)
snapgetpath=: 3 : 0
p=. snappath y
if. 0 = #1!:0 p do.
  if. -. ss_mkdir p do. 0 return. end.
  y fwrite p,'/dir.txt'
end.
p
)
snappath=: 3 : 0
jpath '~snap/.snp/',getsha1_jgtk_ y
)
snapshot=: 3 : 0
if. Snapshots=0 do. return. end.
snapshot1 y;(ss_today'');ProjectPath
)
snapshot_tree=: 3 : 0
if. Snapshots=0 do. return. end.
if. (<Folder_j_) e. SnapTrees do. return. end.
snapshot1 &> (<0;ss_today'') (,<@fpath) each y
empty SnapTrees_jp_=: SnapTrees,<Folder_j_
)
snapshot1=: 3 : 0
'force today path'=. y
p=. snapgetpath path
if. p = 0 do. return. end.
p=. p,'/'
d=. 1!:0 p,'s*'
pfx=. p,today
if. 0=#d do. path ss_make pfx,'001' return. end.
d=. \:~ {."1 d #~ 'd' = 4{"1 > 4{"1 d
last=. 0 pick d
iftoday=. today -: 7 {. last
if. force do.
  if. (p,last) ss_match ProjectPath do.
    ss_info 'Last snapshot matches current project.'
    0 return.
  end.
  if. iftoday do.
    f=. pfx,_3 {. '00',": 1 + 0 ". _3 {. last
  else.
    f=. pfx,'001'
  end.
  path ss_make f
  ss_info 'New snapshot: ',1 pick fpathname f
  
else.
  if. iftoday do. 0 return. end.
  if. (p,last) ss_match path do. 0 return. end.
  path ss_make pfx,'001'
end.
d=. (Snapshots-1) }. d
for_s. d do.
  f=. p,(>s),'/'
  1!:55 f&, each {."1 [ 1!:0 f,'*'
  1!:55 <f
end.

1
)
ss_cleanup=: 3 : 0
if. 1~:#y do.
  r=. ''
  r=. r,'0 = list invalid snapshot directories',LF
  r=. r,'1 = list non-existent projects with snapshots',LF
  r=. r,'100 = remove invalid snapshot directories',LF
  r=. r,'101 = remove snapshots for non-existent projects'
  smoutput r return.
end.
'd r n'=. ss_dirs''
select. y
case. 0 do.
  d #~ n=2
case. 1 do.
  r #~ n=1
case. 100 do.
  ; {. &> rmdir_j_ each d #~ n=2
case. 101 do.
  ; {. &> rmdir_j_ each d #~ n=1
end.
)
ss_dir=: 3 : 0
p=. jpath '~snap/.snp/'
d=. 1!:0 p,'*'
d=. ('d' = 4 {"1 > 4 {"1 d) # {."1 d
d=. (<p) ,each d
d;<(1!:1 :: (''"_))@< each d ,each <'/dir.txt'
)
ss_dirs=: 3 : 0
'd r'=. ss_dir''
s=. /:r
r=. s{r
d=. s{d
m=. 0 < #&> r
n=. 2 * -. m
r=. m#r
p=. (*./\.@:~:&'/' # ]) each r
p=. r ,each '/' ,each p ,each <ProjExt
n=. (-. fexist &> p) (I.m) } n
r=. (tofoldername_j_ each r) (I.m) } (#d) # <''
d;r;n
)
ss_files=: 3 : 0
t=. 1!:0 y,'*'
if. 0=#t do. return. end.
att=. > 4{"1 t
msk=. ('h' = 1{"1 att) +: 'd' = 4{"1 att
t=. /:~ msk # t
if. _1 = 4!:0 <'ss_exclude' do.
  exs=. '.' ,each SnapshotX_j_
  ss_exclude_jp_=: [: +./ exs & ((1 e. E.) &>/)
end.
t #~ -. ss_exclude {."1 t
)
ss_find=: 3 : 0
y=. y,(0=#y)#ProjectPath
'd r'=. ss_dir''
ndx=. r i. <jpath remsep_j_ y
ndx pick d,<'not found: ',y
)
ss_info=: 3 : 0
sminfo 'Snapshot';y
)
ss_list=: 3 : 0
if. 0=#y do. '' return. end.
p=. snappath projname2path y
d=. 1!:0 p,'/s*'
if. #d do.
  d=. d #~ 'd' = 4 {"1 > 4 {"1 d
  \:~ {."1 d
else.
  ''
end.
)
ss_make=: 4 : 0
fm=. x,'/'
to=. y,'/'
if. 0 = ss_mkdir to do. 0 return. end.
f=. {."1 ss_files fm
fm=. (<fm) ,each f
to=. (<to) ,each f
res=. snapfcopy"1 fm ,. to
if. 0 e. res do.
  txt=. 'Unable to copy:',LF2,tolist (res=0)#fm
  ss_info txt
end.
*./ res
)
ss_mkdir=: 3 : 0
if. 0 -: fpathcreate y do.
  if. 1 = # 1!:0 y do. 1 return. end.
  ss_info 'Unable to create snapshot directory: ',y
  0 return.
end.
arw=. 'rw' 0 1 } 1!:7 <y
if. 0 -: arw 1!:7 :: 0: <y do.
  ss_info 'Unable to set read/write attributes for snapshot directory.'
  0 return.
end.
if. -.IFUNIX do.
  ph=. 'h' 1 } 1!:6 <y
  if. 0 -: ph 1!:6 :: 0: <y do.
    ss_info 'Unable to set hidden attribute for snapshot directory.'
  end.
end.

1
)
ss_match=: 4 : 0
x=. termsep x
y=. termsep y
a=. ss_files x
b=. ss_files y
ra=. #a
rb=. #b
if. 0 e. ra,rb do.
  ra = rb return.
end.
fa=. {."1 a
fb=. {."1 b
if. -. fa -: fb do. 0 return. end.
if. -. (2 {"1 a) -: (2 {"1 b) do. 0 return. end.
fx=. x&, each fa
fy=. y&, each fa
(<@(1!:1) fy) -: <@(1!:1) fx
)
ss_removesnaps=: 3 : 0
direrase each snappath each fpath each FolderTree
)
ss_state=: 3 : 0
'd r n'=. ss_dirs''
r=. 'valid existent, valid nonexistent, invalid:',LF
r=. r,":+/ n =/ 0 1 2
)
readprojectsource=: 3 : 0
pn=. ('~'={.y) }. y
f=. getprojfile y
cocurrent 'jptemp'
coinsert 'jp'
ProjectPath=: fpath f
ProjectName=: ''
projread1 f
r=. Source
cocurrent 'jp'
coerase <'jptemp'
r
)
readsource1=: 4 : 0
s=. readprojectsource y
dat=. freads each s
if. (<_1) e. dat do.
  fls=. ; ' ' ,each toprojectfolder each s #~ (<_1) = dat
  sminfo 'Project Manager';'Unable to read:',fls
  _1 return.
end.
dat=. ;dat
if. x do. decomment_jp_ dat end.
)
writesource1=: 4 : 0
'p t'=. y
dat=. x readsource1 p
if. _1 -: dat do. return. end.
dat fwritenew jpath t
EMPTY
)

readsource=: 0&readsource1
readsourcex=: 1&readsource1
writesource=: 0&writesource1
writesourcex=: 1&writesource1
cocurrent 'jp'
fixNB=: 3 : 0
x=. I. 'nb.' E. y
(<<<x+/1 2) { '/' x} y
)
projread1=: 3 : 0
projclear''
Build=: projfname 'build.q'
Run=: projfname 'run.q'
dat=. 'b' freads y
if. dat-:_1 do.
  Source=: ''
else.
  dat=. dat #~ '#' ~: {.&> dat
  dat=. dat -. a:
  Source=: projfname each extsrc each dat
end.
EMPTY
)
ProjHdr=: 0 : 0
#
# defines list of source files.
# path defaults to project directory.
)
projwritenew=: 3 : 0
r=. '# project: ',ProjectName,LF,ProjHdr,LF
r fwrites y
)
projfix=: 3 : 0
projopen y
projread''
projwrite''
)
NB. Regular expression pattern matching
NB.
NB. PCRE: Perl-compatible regular expression library
NB. with POSIX interface
NB.
NB. =========================================================
NB. main definitions:
NB.   rxmatch          single match
NB.   rxmatches        all matches
NB.
NB.   rxcomp           compile pattern
NB.   rxfree           free pattern handles
NB.   rxhandles        list pattern handles
NB.   rxinfo           info on pattern handles
NB.
NB. regex utilities:
NB.   rxeq             -:
NB.   rxin             e.
NB.   rxindex          i.
NB.   rxE              E.
NB.   rxfirst          {.@{    (first match)
NB.   rxall            {       (all matches)
NB.   rxrplc           search and replace
NB.   rxapply          apply verb to pattern
NB.
NB.   rxerror          last regex error message
NB.
NB. other utilities:
NB.   rxcut            cut string into nomatch/match list
NB.   rxfrom           matches from string
NB.   rxmerge          replace matches in string
NB.
NB. =========================================================
NB. Form:
NB.   here:  pat      = pattern, or pattern handle
NB.          phnd     = pattern handle
NB.          patndx   = pattern;index  or  phnd;index
NB.          str      = character string
NB.          bstr     = boxed list of str
NB.          mat      = result of regex search
NB.          nsub     = #subexpressions in pattern
NB.
NB.  mat=.  pat or patndx   rxmatch   str
NB.  mat=.  pat or patndx   rxmatches str
NB.
NB.  phnd=.                 rxcomp    pat
NB.  empty=.                rxfree    phnd
NB.  phnds=.                rxhandles ''
NB.  'nsub pat'=.           rxinfo    phnd
NB.
NB.  boolean=.        pat   rxeq      str
NB.  index=.          pat   rxindex   str
NB.  mask=.           pat   rxE       str
NB.  bstr=.           pat   rxfirst   str
NB.  bstr=.           pat   rxall     str
NB.  str=.     (patndx;new) rxrplc    str
NB.  str=.     patndx (verb rxapply)  str
NB.
NB.  errormsg=.             rxerror   ''
NB.
NB.  bstr             mat   rxcut     str
NB.  bstr=.           mat   rxfrom    str
NB.  str=.         new (mat rxmerge)  str

NB. =========================================================
NB. following defined in z:
NB.*rxmatch v single match
NB.*rxmatches v all matches
NB.*rxcomp v compile pattern
NB.*rxfree v free pattern handles
NB.*rxhandles v list pattern handles
NB.*rxinfo v info on pattern handles
NB.*rxeq v regex equivalent of -:
NB.*rxin v regex equivalent of e.
NB.*rxindex v regex equivalent of i.
NB.*rxE v regex equivalent of E.
NB.*rxfirst v regex equivalent of {.@{ (first match)
NB.*rxall v regex equivalent of { (all matches)
NB.*rxrplc v search and replace
NB.*rxapply v apply verb to pattern
NB.*rxerror v last regex error message
NB.*rxcut v cut string into nomatch/match list
NB.*rxfrom v matches from string
NB.*rxmerge v replace matches in string
NB.*rxutf8 v set UTF-8 support 1=on(default), 0=off

coclass <'jregex'

NB. =========================================================
NB. flag to enable UTF-8 support
RX_OPTIONS_UTF8=: 1

Rxnna=: '(^|[^[:alnum:]_])'
Rxnnz=: '($|[^[:alnum:]_.:])'
Rxass=: '[[:space:]]*=[.:]'
NB. defs

NB. =========================================================
NB. rxdll is in bin or tools/regex
3 : 0''
select. UNAME
case. 'Win' do. t=. 'jpcre.dll'
case. 'Darwin' do. t=. 'libjpcre.dylib'
case. do. t=. 'libjpcre.so'
end.
f=. BINPATH,'/',t
if. 0 = 1!:4 :: 0: <f do.
  f=. jpath '~tools/regex/',t
end.
rxdll=: '"',f,'" '
)

rxcdm=: 1 : '(rxdll,x)&(15!:0)'

NB. =========================================================
NB. J DLL calls corresponding to the four extended regular expression
NB. functions defined in The Single Unix Specification, Version 2
jregcomp=: 'regcomp + i *x *c i' rxcdm
jregexec=: 'regexec + i *x *c x *i i' rxcdm
jregerror=: 'regerror + x i * *c x' rxcdm
jregfree=: 'regfree + n *x' rxcdm

NB. regex

NB. =========================================================
NB. Global definitions used by the regex script functions
rxmp=: 50 NB. Allocation granule size for compiled patterns.
rxms=: 50 NB. Maximum number of sub-expressions per pattern.
rxszi=: IF64{4 8
rxregxsz=: 3 NB. J ints for pcre regex_t
re_nsub_off=: 1
rxlastrc=: 0
rxlastxrp=: rxregxsz$2-2
NB. rxpatterns defined only if not already defined
rxpatterns_jregex_=: (3 0 $ _1 ; rxlastxrp ; '') [^:(0:=#@]) ". 'rxpatterns_jregex_'

NB. =========================================================
NB. rxmatch
rxmatch=: 4 : 0
if. lb=. 32 = 3!:0 x do. ph=. >0{x else. ph=. x end.
if. cx=. 2 = 3!:0 ph do. hx=. rxcomp ph
else. rxlastxrp=: > 1{((hx=. ph) - 1) ({"1) rxpatterns end.
nsub=. rxnsub rxlastxrp
rxlastrc=: >0{rv=. jregexec rxlastxrp ; (,y) ; rxms ; ((2*rxms)$_1 0) ; 0
if. cx do. rxfree hx end.
m=. (nsub,2)$>4{rv
t=. (0{"1 m)
m=. t,.-~/"1 m
m=. _1 0 ((t=_1)#i.#t)} m
if. lb do. (>1{x){ m else. m end.
)

NB. =========================================================
NB. rxmatches
rxmatches=: 4 : 0
if. lb=. 32 = 3!:0 x do.
  ph=. >0{x else. ph=. x end.
if. cx=. 2 = 3!:0 ph do.
  hx=. rxcomp ph else.	NB. rxcomp sets rxlastxrp
  rxlastxrp=: > 1{((hx=. ph) - 1) ({"1) rxpatterns end.
nsub=. rxnsub rxlastxrp
o=. 0
rxm=. (0, nsub, 2)$0
while. 1 do.
  m=. hx rxmatch o}.y
  if. 0 e. $m do. break. end.
  if. _1 = 0{0{m do. break. end.
  m=. m+ ($m)$o,0
  rxm=. rxm , m
NB. Advance the offset o beyond this match.
NB. The match length can be zero (with the *? operators),
NB. so take special care to advance at least to the next
NB. position.  If that reaches beyond the end, exit the loop.
  o=. (>:o) >. +/0{m
  if. o >: #y do. break. end.
end.
if. cx do. rxfree hx end.
if. lb do. (>1{x){"2 rxm else. rxm end.
)

NB. =========================================================
NB. rxcomp
NB.
NB. options rxcomp pattern
rxcomp=: 3 : 0
'rxlastrc rxlastxrp'=: 2 {. jregcomp (rxregxsz$2-2); (,y); 2 + RX_OPTIONS_UTF8*16b40
if. rxlastrc do. (rxerror'') 13!:8 [12 end.
if. ({:$rxpatterns) = hx=. (<_1) i.~ 0 { rxpatterns do.
  rxpatterns=: rxpatterns ,. (rxmp$<_1),(rxmp$<rxregxsz$2-2), ,:rxmp$<''
end.
rxpatterns=: ((hx+1);rxlastxrp;y) (<a:;hx)} rxpatterns
hx + 1
)

NB. =========================================================
rxnsub=: [: >: 1&{   NB. Number of main+sub-expressions from Perl regex_t

NB. =========================================================
NB. rxerror
rxerror=: 3 : 0
r=. >3{jregerror rxlastrc;rxlastxrp;(80#' ');80
({.~ i.&(0{a.)) r
)

NB. =========================================================
rxfree=: 3 : 0
hx=. ,y - 1
while. 0<#hx do.
  ix=. 0{hx
  jregfree 1{ix ({"_1) rxpatterns
  rxpatterns=: ((<_1),(<rxregxsz$2-2),<'') (<(<$0);ix)} rxpatterns
  hx=. }.hx
end.
i.0 0
)

NB. =========================================================
NB. rxhandles
rxhandles=: 3 : 0
h=. >0{rxpatterns
(h~:_1)#h
)

NB. =========================================================
NB. rxinfo
rxinfo=: 3 : 0
i=. (y-1){"1 rxpatterns
|:(<"_1 rxnsub >1{i) ,: 2{i
)

NB. =========================================================
NB. rxfrom=: <@({~ (+ i.)/)"1~
rxfrom=: ,."1@[ <;.0 ]
rxeq=: {.@rxmatch -: 0: , #@]
rxin=: _1: ~: {.@{.@rxmatch
rxindex=: #@] [^:(<&0@]) {.@{.@rxmatch
rxE=: i.@#@] e. {.@{."2 @ rxmatches
rxfirst=: {.@rxmatch >@rxfrom ]
rxall=: {."2@rxmatches rxfrom ]

NB. =========================================================
rxapply=: 1 : 0
:
if. L. x do. 'pat ndx'=. x else. pat=. x [ ndx=. ,0 end.
if. 1 ~: #$ ndx do. 13!:8[3 end.
mat=. ({.ndx) {"2 pat rxmatches y
r=. u&.> mat rxfrom y
r mat rxmerge y
)

NB. =========================================================
rxcut=: 4 : 0
if. 0 e. #x do. <y return. end.
'beg len'=. |: ,. x
if. 1<#beg do.
  whilst. 0 e. d do.
    d=. 1,<:/\ (}:len) <: 2 -~/\ beg
    beg=. d#beg
    len=. d#len
  end.
end.
a=. 0, , beg ,. beg+len
b=. 2 -~/\ a, #y
f=. < @ (({. + i.@{:)@[ { ] )
(}: , {: -. a:"_) (a,.b) f"1 y
)

NB. =========================================================
rxmerge=: 1 : 0
:
p=. _2 ]\ m rxcut y
;, ({."1 p),.(#p){.(#m)$x
)

NB. =========================================================
rxrplc=: 4 : 0
pat=. >{.x
new=. {:x
if. L. pat do. 'pat ndx'=. pat else. ndx=. ,0 end.
if. 1 ~: #$ ndx do. 13!:8[3 end.
mat=. ({.ndx) {"2 pat rxmatches y
new mat rxmerge y
)

NB. =========================================================
NB. set UTF-8 support on/off
NB. result is previous setting
rxutf8=: 3 : 0
(RX_OPTIONS_UTF8=: y) ] RX_OPTIONS_UTF8
)
NB. zdefs

NB. =========================================================
NB. define z locale names:
nms=. 0 : 0
rxmatch rxmatches rxcomp rxfree rxhandles rxinfo rxeq
rxin rxindex rxE rxfirst rxall rxrplc rxapply rxerror
rxcut rxfrom rxmerge rxutf8
)

nms=. (nms e.' ',LF) <;._2 nms
". > nms ,each (<'_z_=:') ,each nms ,each <'_jregex_'
coclass <'jsocket'
coinsert 'jsocket jdefs'

jsystemdefs 'hostdefs'
jsystemdefs 'netdefs'
3 : 0''
assert. INADDR_ANY=0
assert. sockaddr_sz=16
if. IFUNIX do.
  assert. fds_bits_off=0
end.
)
3 : 0''
select. UNAME
case. 'Win' do.
  c=. >IFWINCE{'wsock32';'winsock'
  ccdm=: 1 : ('(''"',c,,'" '',x)&(15!:0)')
  ncdm=: ccdm
  scdm=: ccdm
  wcdm=: ccdm
  LIB=: ''
  closesocketJ=: 'closesocket i i' scdm
  ioctlsocketJ=: 'ioctlsocket i i i *i' scdm
case. 'Linux' do.
  c=. 'libc.so.6'
  ccdm=: 1 : ('(''"',c,'" '',x)&(15!:0)')
  ncdm=: ccdm
  scdm=: ccdm
  wcdm=: 1 : ']'
  LIB=: c
  closesocketJ=: 'close i i' scdm
  ioctlsocketJ=: 'ioctl i i i *i' scdm
case. 'Darwin' do.
  c=. 'libc.dylib'
  ccdm=: 1 : ('(''"',c,'" '',x)&(15!:0)')
  ncdm=: ccdm
  scdm=: ccdm
  wcdm=: 1 : ']'
  LIB=: c
  closesocketJ=: 'close i i' scdm
  ioctlsocketJ=: 'ioctl i i i *i' scdm
case. 'SunOS' do.
  c=. find_dll 'c'
  ccdm=: 1 : ('(''"',c,'" '',x)&(15!:0)')
  n=. find_dll 'nsl'
  ncdm=: 1 : ('(''"',n,'" '',x)&(15!:0)')
  s=. find_dll 'socket'
  scdm=: 1 : ('(''"',s,'" '',x)&(15!:0)')
  wcdm=: 1 : ']'
  LIB=: c
  closesocketJ=: 'close i i' scdm
  ioctlsocketJ=: 'ioctl i i i *i' scdm
end.
empty''
)
gethostbyaddrJ=: 'gethostbyaddr * * i i' ncdm
gethostbynameJ=: 'gethostbyname * *c' ncdm
gethostnameJ=: 'gethostname i *c i' ncdm
inet_addrJ=: 'inet_addr i *c' ncdm
inet_ntoaJ=: 'inet_ntoa i i' ncdm
acceptJ=: 'accept i i * *i' scdm
acceptNullJ=: 'acceptNull i i *c *c' scdm
bindJ=: 'bind i i * i' scdm
connectJ=: 'connect i i * i' scdm
FD_ISSETJ=: 'FD_ISSET i i ' scdm
getpeernameJ=: 'getpeername i i * *i' scdm
getprotobynameJ=: 'getprotobyname i *c' scdm
getprotobynumberJ=: 'getprotobynumber i i' scdm
getservbynameJ=: 'getservbyname i i i' scdm
getservbyportJ=: 'getservbyport i i i' scdm
getsocknameJ=: 'getsockname i i * *i' scdm
getsockoptJ=: 'getsockopt i i i i * *i' scdm
htonlJ=: 'htonl i i' scdm
htonsJ=: 'htons s s' scdm
listenJ=: 'listen i i i' scdm
ntohlJ=: 'ntohl i i' scdm
ntohsJ=: 'ntohs s s' scdm
recvJ=: 'recv i i * i i' scdm
recvfromJ=: 'recvfrom i i *c i i * *i' scdm
selectJ=: 'select i i * * * *' ccdm
sendJ=: 'send i i *c i i' scdm
sendtoJ=: 'sendto i i *c i i * i' scdm
setsockoptJ=: 'setsockopt i i i i * i' scdm
shutdownJ=: 'shutdown i i i' scdm
socketJ=: 'socket i i i i' scdm

WSAAsyncGetHostByAddrJ=: 'WSAAsyncGetHostByAddr i i i i i i i i' wcdm
WSAAsyncGetHostByNameJ=: 'WSAAsyncGetHostByName i i i *c i i' wcdm
WSAAsyncGetProtoByNameJ=: 'WSAAsyncGetProtoByName i i i *c i i' wcdm
WSAAsyncGetProtoByNumberJ=: 'WSAAsyncGetProtoByNumber i i i i i i' wcdm
WSAAsyncGetServByNameJ=: 'WSAAsyncGetServByName i i i *c *c i i' wcdm
WSAAsyncGetServByPortJ=: 'WSAAsyncGetServByPort i i i i *c i i' wcdm
WSAAsyncSelectJ=: 'WSAAsyncSelect i i i i i' wcdm
WSACancelAsyncRequestJ=: 'WSACancelAsyncRequest i i' wcdm
WSACancelBlockingCallJ=: 'WSACancelBlockingCall i ' wcdm
WSACleanupJ=: 'WSACleanup i ' wcdm
WSAGetLastErrorJ=: 'WSAGetLastError i ' wcdm
WSAIsBlockingJ=: 'WSAIsBlocking i ' wcdm
WSASetBlockingHookJ=: 'WSASetBlockingHook i i' wcdm
WSASetLastErrorJ=: 'WSASetLastError i i' wcdm
WSAStartupJ=: 'WSAStartup i i *' wcdm
WSAStringToAddressJ=: 'WSAStringToAddress i c i i i i' wcdm
WSAUnhookBlockingHookJ=: 'WSAUnhookBlockingHook i ' wcdm
x_WSAFDIsSetJ=: 'x_WSAFDIsSet i i i' wcdm

sderror=: 3 : 0
'num msg'=. SDERRORS
> (num i. >{.y) { msg, <'unknown error'
)
j=. <;._2 (0 : 0)
    0 no error
10004 EINTR
10009 EBADF
10011 EAGAIN
10013 EACCES
10014 EFAULT
10022 EINVAL
10024 EMFILE
10035 EWOULDBLOCK
10036 EINPROGRESS
10037 EALREADY
10038 ENOTSOCK
10039 EDESTADDRREQ
10040 EMSGSIZE
10041 EPROTOTYPE
10042 ENOPROTOOPT
10043 EPROTONOSUPPORT
10044 ESOCKTNOSUPPORT
10045 EOPNOTSUPP
10046 EPFNOSUPPORT
10047 EAFNOSUPPORT
10048 EADDRINUSE
10049 EADDRNOTAVAIL
10050 ENETDOWN
10051 ENETUNREACH
10052 ENETRESET
10053 ECONNABORTED
10054 ECONNRESET
10055 ENOBUFS
10056 EISCONN
10057 ENOTCONN
10058 ESHUTDOWN
10059 ETOOMANYREFS
10060 ETIMEDOUT
10061 ECONNREFUSED
10062 ELOOP
10063 ENAMETOOLONG
10064 EHOSTDOWN
10065 EHOSTUNREACH
10066 ENOTEMPTY
10067 EPROCLIM
10068 EUSERS
10069 EDQUOT
10070 ESTALE
10071 EREMOTE
10091 SYSNOTREADY
10092 VERNOTSUPPORTED
10093 NOTINITIALISED
10098 EADDRINUSE
10101 EDISCON
11001 HOST_NOT_FOUND
11002 TRY_AGAIN
11003 NO_RECOVERY
11004 NO_DATA
)

SDERRORS=: (0 ". 5 {. &> j) ; < 6 }.each j
SDERRORS=: ((10000*IFUNIX) | >{.SDERRORS);{:SDERRORS 

tostring=: 3 : 0
}: ;'.',~each ":each a.i.y
)

data2string=: 3 : 0
tostring 4{.4}.2{::y
)

namesub=: 3 : 0
if. 0~:res y do. (sdsockerror'');0;'';0 return. end.
0;AF_INET;(data2string y);256#.a.i.2 3{2{::y
)

flip=: 'a'={.2 ic a.i.'a'
bigendian=: |.^:flip 
hns=: 3 : 'a.{~256 256#:y'          
hs=: 3 : 'bigendian a.{~256 256#:y' 
res=: >@:{.

sockaddr_in=: 3 : 0
's fam host port'=. y
assert. fam=AF_INET
if. 0=#host do. host=. '0.0.0.0' end.
(hs AF_INET),(hns port),(afroms host),8#{.a.
)

sockaddr_split=: 3 : 0
'fam port host'=. 1 0 1 0 1 0 0 0 <;.1 (8){.y
assert. AF_INET = 256 256 #. a. i. bigendian fam
port=. 256 256 #. a. i. port
host=. }. , sfroma "0 host
host;port
)

sfroma=: 3 : 0
'.',": a. i. y
)
afroms=: 3 : 0
a.{~4{.".each '.' cutopen y
)
rc0=: 3 : 0
if. 0=>{.y do. 0 else. sdsockerror'' end.
)

sdsockaddress=: 3 : 0"0
r=. getsocknameJ y;(sockaddr_in_sz#{.a.);,sockaddr_in_sz
(rc0 r);data2string r
)
sdsend=: 4 : 0"1
r=. >{.sendJ (>0{y);x;(#x);>1{y
if. _1=r do. 0;~sdsockerror'' else. 0;r end.
)
sdsendto=: 4 : 0"1
if. 3 = #y do.
  's flags saddr'=. y
  r=. >{.sendtoJ s;x;(#x);flags;saddr;sockaddr_in_sz
else.
  's flags family address port'=. y
  r=. >{.sendtoJ s;x;(#x);flags;(sockaddr_in 0 2 3 4{y);sockaddr_in_sz
end.
if. _1=r do. 0;~sdsockerror'' else. 0;r end.
)

sdcleanup=: 3 : '0[sdclose SOCKETS_jsocket_'
sdinit=: 3 : 0
if. 0=nc<'SOCKETS_jsocket_' do. 0 return. end.
SOCKETS_jsocket_=: ''
if. IFUNIX do. 0 return. end.
if. 0~:res WSAStartupJ 257;1000$' ' do. _1[mbinfo'Socket Error' else. 0 end.
)
sdrecv=: 3 : 0"1
's size'=. 2{.y
r=. recvJ s;(size#' ');size;2{3{.y
if. 0>c=. res r do. '';~sdsockerror'' return. end.
0;c{.>2{r
)
sdrecvfrom=: 3 : 0"1
's size flags'=. 3 {. y ,<0
s=. {.s
r=. recvfromJ s;(size#' ');size;flags;(sockaddr_in_sz#{.a.);,sockaddr_in_sz
'unexpected size of peer address' assert sockaddr_in_sz = 6 pick r
if. 0>c=. res r do. (sdsockerror '');'';'' return. end.
0;(c{.>2{r); 5{r
)
sdconnect=: 3 : 0"1
rc0 connectJ (>{.y);(sockaddr_in y);sockaddr_in_sz
)
sdsocket=: 3 : 0"1
s=. res socketJ <"0 [3{.y,(0=#y)#PF_INET,SOCK_STREAM,IPPROTO_TCP
if. s=_1 do. 0;~sdsockerror'' return. end.
SOCKETS_jsocket_=: SOCKETS_jsocket_,s
0;s
)
sdbind=: 3 : 0"1
rc0 bindJ (>{.y);(sockaddr_in y);sockaddr_in_sz
)
sdasync=: 3 : 0"0
if. IFUNIX do. 'not implemented under Unix - please use sdselect' assert 0 end.
flags=. OR/ FD_READ,FD_WRITE,FD_OOB,FD_ACCEPT,FD_CONNECT,FD_CLOSE
hwnd=. ".wd'qhwndx'
if. >{.WSAAsyncSelectJ ({.y);hwnd;1026;flags do. sdsockerror '' else. 0 end.
)
sdlisten=: 3 : 0"1
rc0 listenJ ;/2 {. y,<^:(L.y) SOMAXCONN
)
sdaccept=: 3 : 0"0
if. _1~:s=. res r=. acceptJ y;(sockaddr_in_sz$' ');,sockaddr_in_sz do.
  SOCKETS_jsocket_=: SOCKETS_jsocket_,s
  0;s
else. 0;~sdsockerror '' end.
)
sdgethostbyname=: 3 : 0
if. 0~:hostent=. res gethostbynameJ <y do.
  addr_list=. memr hostent, h_addr_list_off, 1, JPTR
  first_addr=. memr addr_list, 0, 1, JPTR
  'name did not resolve to address' assert first_addr ~: 0
  addr=. tostring memr first_addr,0,4
else.
  addr=. '255.255.255.255'
end.
0;PF_INET;addr
)
sdgethostbyaddr=: 3 : 0"1
'fam addr'=. y
phe=. res gethostbyaddrJ (afroms addr);4;fam
if. phe=0 do. _1;'unknown host' return. end.
a=. memr phe,h_name_off,1,JPTR
0;memr a,0,JSTR
)
sdclose=: 3 : 0"0
if. 0=res closesocketJ <y do.
  0[SOCKETS_jsocket_=: SOCKETS_jsocket_-.y
else.
  sdsockerror ''
end.
)
fdset_bytes=: 4 : 0
bitvector=. 1 y} (x*8)#0
bytes=. a. {~ _8 #.@|.\ bitvector
if. -.flip do. bytes=. , _4 |.\ bytes end. 
bytes
)
fdset_fds=: 3 : 0
bytes=. y
if. -.flip do. bytes=. , _4 |.\ bytes end.
bitvec=. , _8 |.\ , (8#2)&#: a. i. bytes
I. bitvec
)
sdselect=: 3 : 0
if. 0=#y do. y=. SOCKETS_jsocket_;SOCKETS_jsocket_;SOCKETS_jsocket_;0 end.
'r w e t'=. y
time=. <<.1000000 1000000#:1000*t
if. IFUNIX do.
  max1=. >:>./r,w,e,0
  m=. 4  
  n=. 32 
  bytes=. m*>:<.n%~max1
  r=. bytes fdset_bytes r
  w=. bytes fdset_bytes w
  e=. bytes fdset_bytes e
  rwe=. r;w;e
else.
  max1=. 0
  rwe=. (] ,~ #) each r;w;e
end.
if. _1=res q=. selectJ (<max1),rwe,time do.
  (sdsockerror '');($0);($0);($0)
else.
  if. IFUNIX do. rwe=. fdset_fds each 2 3 4{q else. rwe=. ({.{.}.)each 2 3 4{q end.
  (<0),rwe
end.
)
sdgetsockopt=: 3 : 0
's lev name'=. y
r=. getsockoptJ s;lev;name;(,0);,4
if. 0~:res r do. 0;~sdsockerror'' return. end.
d=. ''$>4{r
if. name-:SO_LINGER do. 0;65536 65536#:d else. 0;d end.
)
sdsetsockopt=: 3 : 0
's lev name val'=. y
if. name -: SO_LINGER do. val=. 65536 65536#.val end.
rc0 setsockoptJ s;lev;name;(,val);4
)
sdsockerror=: 3 : 0
> {. cderx ''
)
sdioctl=: 3 : 0
's option value'=. y
r=. ioctlsocketJ s;option;,value
if. 0~:res r do. 0;~sdsockerror'' else. 0;''$>3{r end.
)
sdionread=: 3 : 0
''$>{.sdcheck sdioctl y,FIONREAD,0
)
sdgethostname=: 3 : 0
if. 0=res r=. gethostnameJ (256#' ');256 do.
  0;>{.1 take (0{a.)cutopen ;1{r
else.
  0;'unknown host'
end.
)
sdgetpeername=: 3 : 0"0
namesub getpeernameJ y;(sockaddr_in_sz#{.a.);,sockaddr_in_sz
)
sdgetsockname=: 3 : 0"0
namesub getsocknameJ y;(sockaddr_in_sz#{.a.);,sockaddr_in_sz
)

sdgetsockets=: 3 : '0;SOCKETS_jsocket_'
sdcheck=: }. ` (sderror 13!:8 3:) @. (0 ~: >@{.)
INVALID_SOCKET=: 1
SOCKET_ERROR=: _1
sdinit'' 
NB. task
NB.
NB. executing tasks with optional timeout or I/O
NB.
NB. TASKS WITHOUT I/O
NB.
NB.   fork 'notepad.exe'           NB. run notepad, no wait, no I/O
NB.   5000 fork 'notepad.exe'      NB. run notepad, wait 5 sec, no I/O
NB.   _1 fork 'notepad.exe'        NB. run notepad, until closed, no I/O
NB.
NB.   5000 fork 'cmd /k dir'  NB. show dir in cmd window for 5 sec and close
NB.   _1 fork 'cmd /k dir'    NB. show dir in cmd window until user closes it
NB.
NB.   launch jpath'~system'        NB. run default application, no wait
NB.
NB. TASKS WITH I/O
NB.
NB.   spawn 'net users'                    NB. get stdout from process
NB.   '+/i.3 4'spawn'jconsole'             NB. call process with I/O
NB.   12 15 18 21
NB.
NB. SHELL COMMANDS (WITH I/O)
NB.
NB.   shell'echo.|time'                    NB. get result of shell command
NB. The current time is:  8:04:13.09
NB. Enter the new time:
NB.
NB.   (shell'dir /b')shell'find ".dll"'    NB. get all DDL names by piping
NB. j.dll
NB. jregexp.dll
NB.
NB. NOTE: the implementation uses C-type structures
NB.       by the original Method of Named Fields
NB.
NB. Script developed by Oleg Kobchenko.

coclass <'jtask'
NB. task util

int=: {.@:(_2&ic)
sint=: 2&ic

i64=: {.@:(_3&ic)
si64=: 3&ic

ptr=: int`i64@.IF64
sptr=: sint`si64@.IF64

NB. =========================================================
NB. METHOD OF NAMED FIELDS
sndx=: i.@#@[ + {.@I.@E.

NB. struct=. 'valu' 'memb' sset structdef struct
sset=: 2 : '(m sndx n)}'

NB. value=. 'memb' sget structdef struct
sget=: 2 : '(m sndx n)&{'

szero=: # # (0{a.)"_

st64=: -.&'.'^:(-.IF64)

t=. 'Cbyt....Resv....Desk....Titl....XposYposXsizYsizXcntYcnt'
STARTUPINFO=:  st64 t,'FillFlagSwRs....Resv....Inph....Outh....Errh....'
PROCESSINFO=:  st64 'Proh....Thrh....PridThid'
SECURITYATTR=: st64 'Cbyt....Secd....Inhe'

'Outh Errh Inph Proh Thrh'=: ,"1&'....'^:IF64>;:'Outh Errh Inph Proh Thrh'

STARTF_USESTDHANDLES=: 16b100
STARTF_USESHOWWINDOW=: 1
WAIT_TIMEOUT=: 258
CREATE_NEW_CONSOLE=: 16b10
DUPLICATE_SAME_ACCESS=: 2

cdk=: 1 : '(''kernel32 '',m)&cd'

WaitForSingleObject=: 'WaitForSingleObject > i x i' cdk
CloseHandle=:         'CloseHandle         > i x' cdk"0
TerminateProcess=:    'TerminateProcess    > i x i' cdk
ReadFile=:            'ReadFile            > i x *c i *i x' cdk
WriteFile=:           'WriteFile           > i x *c i *i x' cdk
GetCurrentProcess=:   'GetCurrentProcess   > x' cdk

DuplicateHandleF=:    'DuplicateHandle     > i  x x  x *x  i i i' cdk
CreatePipeF=:         'CreatePipe          > i *x *x *c i' cdk
CreateProcessF=:      'CreateProcessW      > i x *w x x i  i x x *c *c' cdk

DuplicateHandle=: 3 : 0
p=. GetCurrentProcess ''
r=. DuplicateHandleF p;y;p;(h=.,_1);0;0;DUPLICATE_SAME_ACCESS
CloseHandle y
{.h
)

NB. =========================================================
NB. 'hRead hWrite'=. CreatePipe Inheritable=0
NB.    ... FileRead/FileWrite ...
NB. CloseHandle hRead,hWrite
NB.
NB. Inheritable: 0 none, 1 for read, 2 for write
CreatePipe=: 3 : 0
'inh size'=. 2{.y,0
sa=. szero SECURITYATTR
sa=. (sint #SECURITYATTR) 'Cbyt' sset SECURITYATTR sa
sa=. (sint *inh) 'Inhe' sset SECURITYATTR sa
r=. CreatePipeF (hRead=.,_1);(hWrite=.,_1);sa;size
hRead=. {. hRead
hWrite=. {. hWrite
if. 1=inh do. hRead=. DuplicateHandle hRead end.
if. 2=inh do. hWrite=. DuplicateHandle hWrite end.
hRead,hWrite
)

NB. =========================================================
NB. hProcess=. [hWriteOut[,hReadIn]] CreateProcess 'program agr1 agr2 ...'
NB.    ...
NB. CloseHandle hProcess
CreateProcess=: 3 : 0
'' CreateProcess y
:
'ow ir'=. 2{.x,0
si=. szero STARTUPINFO
si=. (sint #STARTUPINFO) 'Cbyt' sset STARTUPINFO si
f=. inh=. 0
if. +/ir,ow do.
  inh=. 1
  f=. CREATE_NEW_CONSOLE
  si=. (sint STARTF_USESTDHANDLES+STARTF_USESHOWWINDOW) 'Flag' sset STARTUPINFO si
  if. ow do.
    si=. (sptr ow) Outh sset STARTUPINFO si
    si=. (sptr ow) Errh sset STARTUPINFO si
  end.
  if. ir do. si=. (sptr ir) Inph sset STARTUPINFO si end.
end.
pi=. szero PROCESSINFO
r=. CreateProcessF 0;(uucp y);0;0;inh; f;0;0;si;pi
if. 0=r do. 0 return. end.
ph=. ptr Proh sget PROCESSINFO pi
th=. ptr Thrh sget PROCESSINFO pi
CloseHandle th
ph
)

NB. =========================================================
NB. ph=. h CreateProcess 'program agr1 agr2 ...'
NB.    ...
NB. Wait ph;5000
NB. CloseHandle ph
Wait=: 3 : 0
r=. WaitForSingleObject y
if. WAIT_TIMEOUT=r do. TerminateProcess (0 pick y);_1 end.
)

NB. =========================================================
NB. ph=. h CreateProcess 'program agr1 agr2 ...'
NB.    ...
NB. r=. ReadAll h
NB. CloseHandle h,ph
ReadAll=: 3 : 0
ret=. ''
str=. 4096#'z'
while. 1 do.
  r=. ReadFile y;str;(#str);(len=.,_1);0
  len=. {.len
  if. (0=r)+.0=len do.
    'ec es'=: cderx''
    if. -.ec e.0 109 do. ret=. _1 end.
    break.
  end.
  ret=. ret,len{.str
end.
ret
)

NB. =========================================================
NB. ph=. hr,hw CreateProcess 'program agr1 agr2 ...'
NB. r=. WriteAll hw
NB. CloseHandle hw
NB. r=. ReadAll hr
NB. CloseHandle hr,ph
WriteAll=: 3 : 0
:
while. #x do.
  r=. WriteFile y;x;(#x);(len=.,_1);0
  len=. {. len
  if. (0=r)+.0=len do.
    'ec es'=: cderx''
    if. -.ec e.0 109 do. ret=. _1 end.
    break.
  end.
  x=. len}.x
end.
1
)
NB. task main

NB. =========================================================
NB.*fork v run task and optionally wait for completion
NB.
NB. form: [timeout=0] fork cmdline
NB.
NB.   timeout: 0 no wait, _1 infinite, >0 timeout
NB.   cmdline: 'shortcmd arg1 arg2 ...'
NB.   cmdline: '"command with space" arg1 ...'
NB.
NB. e.g. fork 'notepad.exe'
fork=: (3 : 0)`([: 2!:1 '(' , ')&' ,~ ])@.IFUNIX
0 fork y
:
ph=. CreateProcess y
if. x do. Wait ph;x end.
CloseHandle ph
empty''
)

NB. =========================================================
NB.*spawn v [monad] get stdout of executed task
NB.
NB. form:  stdout=. spawn cmdline
NB.
NB.   stdout: _1 fail, '' or stdout stream value if success
NB.   cmdline: 'shortcmd arg1 arg2 ...'
NB.   cmdline: '"command with space" arg1 ...'
NB.
NB. e.g. spawn 'net users'

NB.*spawn v [dyad] send stdin and get stdout of task
NB.
NB. form: stdout=. [stdin=''] spawn cmdline
NB.
NB.   stdin: input to stream as stdin, '' no input
NB.
NB. e.g. 'i.3 4'spawn'jconsole'
spawn=: (3 : 0)`(2!:0@])@.IFUNIX
'' spawn y
:
'or ow'=. CreatePipe 1
'ir iw'=. CreatePipe 2,#x
ph=. (ow,ir) CreateProcess y
CloseHandle ir
if. #x do. x WriteAll iw end.
CloseHandle iw
CloseHandle ow
r=. ReadAll or
CloseHandle or
CloseHandle ph
r
)

NB. =========================================================
NB.*shell v [monad] get stdout of shell command
NB.
NB.   e.g. shell 'dir /b/s'

NB.*shell v [dyad] send stdin and get stdout of shell command
NB.
NB.   e.g. (shell 'dir /b/s') shell 'find ".dll"'
SHELL=: IFUNIX{::'cmd /c ';''

shell=: ''&$: : (spawn SHELL,])

NB. =========================================================
NB.*launch v [monad] launch default application for parameter
NB.
NB.    launch jpath'~system'              NB. file manager
NB.    launch jpath'~bin/installer.txt'   NB. text editor
NB.    launch 'http://jsoftware.com'      NB. web browser

3 : 0''
LAUNCH=: ('gnome-open';'open';'start') {::~ ('Linux';'Darwin')i.<UNAME
if. 0=nc<'LAUNCH_j_'do.if. 0<#LAUNCH_j_ do.LAUNCH=: LAUNCH_j_ end.end.
)
launch=: 3 : 'shell LAUNCH,'' '',y'
NB. task zdefs

fork_z_=: fork_jtask_
spawn_z_=: spawn_jtask_
shell_z_=: shell_jtask_
launch_z_=: launch_jtask_
coclass 'cqclient'
coinsert 'jsocket'
create=: 3 : 0
if. 1 = {.y do.
  makezfns''
end.
EMPTY
)
destroy=: 3 : 0
disconnect''
codestroy''
)
EMPTY=: i.0 0
col=: ,.@:>L:0
firstones=: > 0 , }:
ischar=: 2 = 3!:0
issymbol=: 65536 = 3!:0
round=: [ * [: <. 0.5 + %~
roundint=: <. @ +&0.5
roundtime=: (%86400000) & round
commasep=: 3 : 0
if. L. y do.
  }. ; (','&, @ ":) each y
else.
  , ": y
end.
)
cutnames=: 3 : 0
if. L.y do. y return. end.
y=. ' ',y
a: -.~ (y e. ' ,') <;._1 y
)
qread=: 3 : 'y qtoJ 8 }. read'''''
qreads=: 3 : 'y qtoJs 8 }. read'''''
sizetype=: 3 : 'DATASIZES {~ DATANUMS i. y'
sizevarchar=: 3 : 0
ndx=. POS
txt=. {.a.
len=. 20 * y
whilst. ndx < #DAT do.
  blk=. len <. (#DAT) - ndx
  txt=. txt, (ndx,:blk) [;.0 DAT
  ind=. I. txt = {.a.
  if. y < #ind do. y { ind return. end.
  ndx=. ndx+len
end.
_
)
throw=: 3 : 0
msg=. y
if. ischar msg do. msg=. 1;msg end.
thrown=: msg
throw.
)
wrapcmd=: 3 : 0
if. ischar y do.
  len=. #y
  tot=. 2 ic len + 14
  typ=. 1 ic iCHAR
  len=. 2 ic len
  tot,typ,len,y
else.
  throw 'data'
end.
)
fix_date=: 3 : 0
if. 0 (e.,) '.' = 4 7 {"1 y do. 10;y return. end.
msk=. y -:"1 JDATENULL
val=. (-.msk) # dat=. _1 ". ' ' 4 7 }"1 y
if. _1 (e.,) val do. 10;y return. end.
if. 0 e. valdate val do. 10;y return. end.
14;JINTNULL (I.msk) } (todayno dat) - 73048
)
fix_datetime=: 3 : 0
if. 0 e. 'T' = 10 {"1 y do. 10;y return. end.
msk=. y -:"1 JDATETIMENULL
'rc dat'=. fix_date 10 {."1 y
if. rc=10 do. 10;y return. end.
'rc tim'=. fix_time 11 }."1 y
if. rc=10 do. 10;y return. end.
15;JFLOATNULL (I.msk) } dat + tim % 86400000
)
fix_minute=: 3 : 0
if. 0 e. ':' = 2 {"1 y do. 10;y return. end.
msk=. y -:"1 JMINUTENULL
val=. (-.msk) # dat=. _1 ". ' ' 2 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 60 #. dat
if. (val -: 0 60 #:cnt) *. (cnt >: 0) *. cnt < 1440 do.
  17;JINTNULL (I.msk) } dat
else.
  10;y
end.
)
fix_month=: 3 : 0
if. 0 e. '.m' -:"1 [ 4 7 {"1 y do. 10;y return. end.
msk=. y -:"1 JMONTHNULL
val=. (-.msk) # dat=. _1 ". ' ' 4 7 }"1 y
if. _1 (e.,) val do. 10;y return. end.
if. 0 e. valdate val,.1 do. 10;y return. end.
13;JINTNULL (I.msk) } 12 #. dat -"1[ 2000 1
)
fix_second=: 3 : 0
if. 0 (e.,) ':' = 2 5 {"1 y do. 10;y return. end.
msk=. y -:"1 JSECONDNULL
val=. (-.msk) # dat=. _1 ". ' ' 2 5 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 60 #. dat
if. (val -: 0 60 60 #:cnt) *. (cnt >: 0) *. cnt < 86400 do.
  18;JINTNULL (I.msk) } dat
else.
  10;y
end.
)
fix_time=: 3 : 0
if. 0 (e.,) '::.' -:"1 [ 2 5 8 {"1 y do. 10;y return. end.
msk=. y -:"1 JTIMENULL
val=. (-.msk) # dat=. _1 ". ' ' 2 5 8 }"1 y
if. _1 (e.,) val do. 10;y return. end.
cnt=. (-.msk) # dat=. 0 60 60 1000 #. dat
if. (val -: 0 60 60 1000 #:cnt) *. (cnt >: 0) *. cnt < 86400000 do.
  19;JINTNULL (I.msk) } dat
else.
  10;y
end.
)
fix_timespan=: 3 : 0
x=. y i."1 'D'
if. ({:$y) e. x do. 10;y return. end.
n=. x {."0 1 y
y=. (x-1) }."0 1 y
if. 0 (e.,) 'D::.' -:"1 [ 1 4 7 10 {"1 y do. 10;y return. end.
msk=. -. JTIMESPANNULL -: "1 (#JTIMESPANNULL) {."1 y
n=. TSDAY * 0 ". msk # n
val=. dat=. _1 ". ' ' 0 1 4 7 10 }"1 msk # y
if. _1 (e.,) val do. 10;y return. end.
cnt=. 0 60 60 1000000000x #. dat
if. (val -: 0 60 60 1000000000 #:cnt) *: (cnt >: 0) *. cnt < TSDAY do.
  10;y return.
end.
t=. n + cnt
if. 0 e. msk do.
  t=. JLONGNULL (I.-. msk) } msk expand t
end.
16;t
)
fix_timestamp=: 3 : 0
if. 0 e. 'D' = 10 {"1 y do. 10;y return. end.
msk=. -.y -:"1 JTIMESTAMPNULL
t=. msk # y
'rc dat'=. fix_date 10 {."1 t
if. rc=10 do. 10;y return. end.
'rc tim'=. fix_timespan '0',.10 }."1 t
if. rc=10 do. 10;y return. end.
t=. tim + dat * TSDAY
if. 0 e. msk do.
  t=. JLONGNULL (I.-. msk) } msk expand t
end.
12;t
)
fmt_date=: 3 : 0
res=. '.' 4 7 }"1 [ 4 3 3 ": 0 100 100 +"1 todate 73048 + ,y
JDATENULL (I. y= JINTNULL) } res
)
fmt_datetime=: 3 : 0
y=. y * msk=. y ~: JFLOATNULL
res=. (fmt_date <. y),.'T',.fmt_time roundint 86400000 * 1 | y
JDATETIMENULL (I. -.msk) } res
)
fmt_minute=: 3 : 0
res=. ':' 2 }"1 }."1 [ 6j2 ": ,.100 ++/ 1 0.01 * |: 0 60 #: ,y
JMINUTENULL (I. y= JINTNULL) } res
)
fmt_month=: 3 : 0
res=. 'm' ,.~ 7j2 ":,.2000 + +/1 0.01 * 0 1 + |: 0 12 #: ,y
JMONTHNULL (I. y= JINTNULL) } res
)
fmt_second=: 3 : 0
res=. ':' 2 5 }"1 }."1 [ 3 ": 100 + 0 60 60 #: ,y
JSECONDNULL (I. y= JINTNULL) } res
)
fmt_time=: 3 : 0
res=. '::.' 2 5 8 }"1 }."1 [ 3 3 3 4 ": 100 100 100 1000 +"1 [ 0 60 60 1000 #: ,y
JTIMENULL (I. y= JINTNULL) } res
)
fmt_timespan=: 3 : 0
y=. y * msk=. y ~: JLONGNULL
'd t n'=. |: 0 86400 1000000000x #: y
d=. ":,.d
t=. 'D::'0 3 6 }"1 'r(0)3.0' fmt 0 60 60 #: ,t
n=. 'r(0)9.0' 8!:2 ,.n
res=. d,.t,.'.',.n
if. 0 e. msk do.
  wid=. -{:$res
  (wid{.JDATETIMENULL) (I. -.msk) } res
end.
)
fmt_timestamp=: 3 : 0
y=. y * msk=. y ~: JLONGNULL
'n t'=. |: (0,TSDAY) #: y
res=. (fmt_date n),.}."1 fmt_timespan t
if. 0 e. msk do.
  JTIMESTAMPNULL (I. -.msk) } res
end.
)
ALPH0=: {.a.
OK=: 0;EMPTY
THROW=: ''
TSDAY=: 864 * 10^11x

KSHORTNULL=: <.-2^15
KFLOATNULL=: 0 0 0 0 0 0 248 255 { a.
KREALNULL=: 0 0 192 255 { a.

JINTNULL=: <.-2^31
JFLOATNULL=: __
JLONGNULL=: -2^63x
JDATENULL=: 'nnnn.nn.nn'
JDATETIMENULL=: 'nnnn.nn.nnTnn:nn:nn.nnn'
JMINUTENULL=: 'nn:nn'
JMONTHNULL=: 'nnnn.nnm'
JSECONDNULL=: 'nn:nn:nn'
JTIMENULL=: 'nn:nn:nn.nnn'
JTIMESPANNULL=: 'nDnn:nn:nn.nnnnnnnnn'
JTIMESTAMPNULL=: 'nnnn.nn.nnDnn:nn:nn.nnnnnnnnn'

JFLOATNULL8=: 2 fc JFLOATNULL
JREALNULL4=: 1 fc JFLOATNULL
MAXREAD=: 5000
MAXREADF=: 4000
endian=. a. i. {. 1 ic 1
ASYNC=: (endian,0 0 0) { a.
SYNC=: (endian,1 0 0) { a.
RESPONSE=: (endian,2 0 0) { a.
j=. ];._2 (0 : 0)
boolean   1b                     b     1     1
byte      0xff                   x     4     1
short     23h                    h     5     2     0Nh
int       23                     i     6     4     0N
long      23j                    j     7     8     0Nj
real      2.3e                   e     8     4     0Ne
float     2.3                    f     9     8     0n
char      "a"                    c     10    1     " "
varchar   `ab                    s     11    *     `
timestamp 2003.03.23D08:31:53.x9 p     12    8     0Np
month     2003.03m               m     13    4     0Nm
date      2003.03.23             d     14    4     0Nd
datetime  2003.03.23T08:31:53    z     15    8     0Nz
timespan  5D08:31:53.x9          n     16    8     0Nn
minute    08:31                  u     17    4     0Nu
second    08:31:53               v     18    4     0Nv
time      09:10:35.000           t     19    4     0Nt
enum      `s$`b, where s:`a`b    *     20..  4     `s$..
)

't j c n s z'=. j <;.1~ '';firstones +./j~:' '

DATATYPES=: (<"1 toupper t) -.each ' '
DATANUMS=: 0 ". n
DATASIZES=: _ ". s
('i',each toupper each DATATYPES)=: DATANUMS
close=: 3 : 0
destroy''
OK
)
connect=: 3 : 0
try.
  'HOST PORT USER'=: 3 {. boxxopen y
  HOSTIP=: gethostip HOST
  SK=: sd_socket''
  sd_connect SK;HOSTIP,<PORT
  send USER,1 0{a.  
  res=. read''
  if. #res do.
    OK
  else.
    1;res
  end.
catcht. thrown end.
)
cmd=: 3 : 0
try. send ASYNC,wrapcmd y
  OK
catcht. thrown end.
)
cmdr=: 3 : 0
try. send SYNC,wrapcmd y
  qread 0
catcht. thrown end.
)
cmdrf=: 3 : 0
try. send SYNC,wrapcmd y
  qread 1
catcht. thrown end.
)
cmdrx=: 3 : 0
try. send SYNC,wrapcmd y
  qread 2
catcht. thrown end.
)
cmdraw=: 3 : 0
try. send SYNC,wrapcmd y
  0;read ''
catcht. thrown end.
)
disconnect=: 3 : 0
if. #SK do.
  sd_close :: ] SK
end.
)
exec=: 3 : 0
try. send ASYNC,ftoQ y
  OK
catcht. thrown end.
)
execr=: 3 : 0
try. send SYNC,ftoQ y
  qread 0
catcht. thrown end.
)
execrf=: 3 : 0
try. send SYNC,ftoQ y
  qread 1
catcht. thrown end.
)
execrx=: 3 : 0
try. send SYNC,ftoQ y
  qread 2
catcht. thrown end.
)
get=: cmdr
getf=: cmdrf
getx=: cmdrx
qxs=: 3 : 0
try. send SYNC,ftoQs y
  qreads 0
catcht. 1 pick thrown end.
)
set=: 4 : 0
try. sym=. s:<x
  'rc res'=. execr 'set';sym;<y
  if. (rc=0) *. res -: sym do.
    res=. EMPTY
  end.
  rc;res
catcht. thrown end.
)
sub=: 3 : 0
if. #y do.
  'tab sym'=. 2 {. boxxopen y
  sym=. ; '`' ,each ;: sym
  u=. '.u sub[`',tab,';',sym,']'
else.
  u=. '.u sub["";""]'
end.
smoutput u
cmd u
)
qtype=: 3 : 0
if. (L.y) *. 1 2 -: $y do. ,y
elseif. 2 = 3!:0 y do.
  select. #$y
  case. 0 do. 10;y
  case. 1 do.
    qtypechar1 y
  case. 2 do.
    qtypechar2 y
  end.
elseif. do.
  (qtype1 y);<y
end.
)
qtypechar1=: 3 : 0
'typ dat'=. qtypechar2 ,:y
if. typ=10 do. dat=. ,dat else. dat=. {.dat end.
typ;dat
)
qtypechar2=: 3 : 0
select. {:$y
case. 5 do. fix_minute y
case. 8 do.
  if. 'm' (e.,) y do.
    fix_month y
  else.
    fix_second y
  end.
case. 10 do. fix_date y
case. 12 do. fix_time y
case. 23 do. fix_datetime y
case. 29 do. fix_timestamp y
case. do. fix_timespan y
end.
)
qtype1=: 3 : 0
typ=. 3!:0 y
if. 32 ~: typ do.
  (1 4 8 65536 i. typ) { 1 6 9 11 return.
end.
select. #$y
case. 0 do. 0
case. 1 do.
  99 * *./ 2 = (#y),{.@}:@$ &> y
case. do.
  select. 2 = $y
  case. 0 1 do. 99 
  case. 1 0 do. 98 
  case. 1 1 do.
    r=. #@$ &> y
    if. 0 = *./{."1 r do. 99
    elseif. 0 = *./{. r do. 98
    elseif. do. 99 - =/ {: #&> y
    end.
  case. do. throw 'type'
  end.
end.
)
SK=: ''
MAX=: 50000
WAIT=: 60000 
SKACCEPT=: SKLISTEN=: '' 
sd_accept=: 3 : '0 pick sd_check sdaccept y'
sd_bind=: 3 : 'sd_check sdbind y'
sd_reset=: 3 : 'sdcleanup $0'
sd_gethostbyname=: 3 : 'sd_check sdgethostbyname y'
sd_listen=: 3 : 'sd_check sdlisten y'
sd_recv=: 3 : '0 pick sd_check sdrecv y'
sd_select=: 3 : 'sd_check sdselect y'
sd_send=: 4 : 'sd_check x sdsend y'
sd_socket=: 3 : '0 pick sd_check sdsocket $0'
sd_connect=: 3 : 0
res=. sdconnect y
if. 0 pick res do.
  throw 'Unable to connect: ',sderror res
else.
  EMPTY
end.
)
gethostip=: 3 : 0
if. 3 = +/ '.' = y do.
  txt=. ' ' (bx '.' = y) } y
  if. 4 = # (0 ". txt) -. 0 do. 2;y return. end.
end.
sd_gethostbyname y
)
readsk=: 3 : 0
r=. read1 y
if. 8 > #r do. return. end.
len=. _2 ic 4 5 6 7 { r
while. len > #r do.
  txt=. read1 y
  if. 0=#txt do.
    throw 'read'
  else.
    r=. r, txt
  end.
end.
r
)
read1=: 3 : 0
if. y e. 0 pick sd_select y;'';'';WAIT do.
  sd_recv y,MAX
else.
  ''
end.
)
sd_check=: 3 : 0
if. 0 = 0 pick y do. }. y return. end.
throw 'socket ',sderror y
)
sendsk=: 4 : 0
dat=. x
whilst. #dat do.
  blk=. (MAX <. #dat) {. dat
  blk sd_send y,0
  dat=. MAX }. dat
end.
EMPTY
)
read=: 3 : 'readsk SK'
send=: 3 : 'y sendsk SK'
dread=: 3 : 0
if. y=1 do.
  res=. POS { DAT
else.
  res=. (POS,:y) [;.0 DAT
end.
POS=: POS + y
res
)
qtoJ=: 4 : 0
if. 0 = #y do.
  throw 1;'no data'
end.
select. a.i.{.y
case. 101 do.
  if. 2=#y do.
    0;i.0 0 return.
  else.
    throw 1;'unexpected 101 return type'
  end.
case. 128 do.
  msg=. }. (y i. ALPH0) {. y
  throw 2;msg
end.
POS=: 0
DAT=: y
FMT=: x 
res=. toJ ''
rc=. POS ~: #DAT
DAT=: ''
rc;<res
)
qtoJs=: 4 : 0
POS=: 0
DAT=: y
FMT=: x
select. a.i.{.y
case. 10 do.
  toJ ''
case. 0 do.
  'network error',LF
case. 101 do.
  ''
case. 128 do.
  LF ,~ '''', }. (y i. ALPH0) {. y
case. do.
  LF ,~ 'unexpected return type: ',":a.i.{.y
end.
)
toJ=: 3 : 0
typ=. a. i. dread 1
select. typ
case. 0 do.
  res=. toJ_object ''
case. 98 do.
  res=. toJ_flip ''
case. 99 do.
  res=. toJ_dict ''
case. do.
  if. typ > 128 do.
    if. typ = 245 do.
      size=. sizevarchar 1
    else.
      size=. sizetype 256 - typ
    end.
    res=. {. (256 - typ) toJ_base dread size
  else.
    len=. {. _2 ic }. dread 5
    if. typ = 11 do.
      size=. sizevarchar len
    else.
      size=. len * sizetype typ
    end.
    res=. typ toJ_base dread size
  end.
end.
if. FMT=2 do.
  ,:typ;<res
end.
)
toJ_base=: 4 : 0
res=. x toJ_raw y
if. FMT=1 do.
  x toJ_fmt res
end.
)
toJ_raw=: 4 : 0
if. 0=#y do. y return. end.
select. x
case. 1 do. y ~: ALPH0
case. 4 do. y
case. 5 do. toJ_short y
case. 6 do. _2 ic y
case. 7 do. toJ_long y
case. 8 do. toJ_real y
case. 9 do. toJ_float y
case. 10 do. y
case. 11 do. s: <;._2 y
case. 12 do. toJ_long y
case. 13 do. _2 ic y
case. 14 do. _2 ic y
case. 15 do. roundtime toJ_float y
case. 16 do. toJ_long y
case. 17 do. _2 ic y
case. 18 do. _2 ic y
case. 19 do. _2 ic y
case. do. throw 'type: ',":x
end.
)
toJ_fmt=: 4 : 0
select. x
case. 12 do. fmt_timestamp y
case. 13 do. fmt_month y
case. 14 do. fmt_date y
case. 15 do. fmt_datetime y
case. 16 do. fmt_timespan y
case. 17 do. fmt_minute y
case. 18 do. fmt_second y
case. 19 do. fmt_time y
case. do. y
end.
)
toJ_float=: 3 : 0
t=. _8 [\ y
_2 fc , JFLOATNULL8 (I. KFLOATNULL -:"1 t) } t
)

toJ_real=: 3 : 0
t=. _4 [\ y
_1 fc , JREALNULL4 (I. KREALNULL -:"1 t) } t
)
toJ_short=: 3 : 'JINTNULL (I. KSHORTNULL=y) } y=. _1 ic y'
toJ_dict=: 3 : 0
key=. toJ''
val=. toJ''
if. FMT=2 do.
  key;<val
elseif. 2 2 -: (#$key),#$val do.
  key;<val
elseif. do.
  (<&>key),.<&>val
end.
)
toJ_object=: 3 : 0
len=. _2 ic }. dread 5
res=. ''
for_i. i.len do.
  res=. res, <toJ ''
end.
)
toJ_long=: 3 : 0
dat=. _8 [\ a.i.y
dat=. |."1 dat
neg=. 127 < {."1 dat
(256x #. dat) - neg * 2^64x
)
toJ_flip=: 3 : 0
POS=: >: POS
res=. toJ ''
if. FMT~:2 do. |: res end.
)
ftoQ=: 3 : 0
msg=. toQ boxxopen y
(2 ic 8 + #msg), msg
)
toQ=: 3 : 0
'typ dat'=. qtype y
select. typ
case. 0 do.
  r=. (ALPH0,ALPH0),(2 ic #y),; toQ each dat
case. 98 do.
  r=. toQ_flip dat
case. 99 do.
  r=. toQ_dict dat
case. do.
  len=. $dat
  select. #len
  case. 0 do. hdr=. (256 - typ) { a.
  case. 1 do. hdr=. ((typ,0) { a.),2 ic len
  case. do. throw 'rank: ',":len
  end.
  hdr,typ toQ_base dat
end.
)
toQs=: 3 : '(10 0 { a.),(2 ic #y),y'
toQss=: 3 : '(0 0 { a.),(2 ic #y),;toQs each y'
ftoQs=: 3 : '(2 ic 8 + #m),m=. toQss y'
toQ_base=: 4 : 0
select. | x - 256 * 128 < x
case. 1 do. y { a.
case. 4 do. y
case. 5 do. 1 ic y
case. 6 do. 2 ic y
case. 7 do. toQ_long y
case. 8 do. 1 fc y
case. 9 do. 2 fc y
case. 10 do. y
case. 11 do. toQ_varchar y
case. 12 do. toQ_long y
case. 13 do. 2 ic y
case. 14 do. 2 ic y
case. 15 do. 2 fc y
case. 16 do. toQ_longx y
case. 17 do. 2 ic y
case. 18 do. 2 ic y
case. 19 do. 2 ic y
case. do. throw 'type: ',":x
end.
)
toQ_dict=: 3 : 0
if. 2=#$y do.
  key=. {."1 y
  typ=. ~. 3!:0 &> key
  if. *./ (1 = #typ), typ ~: 2 do.
    key=. toQ ; key
  else.
    key=. toQ key
  end.
  dat=. key,toQ {:"1 y
else.
  dat=. ; toQ each y
end.
(99{a.),dat
)
toQ_long=: 3 : 0
neg=. y < 0
dat=. y + neg * 2^64x
dat=. (8#256) #: dat
,|."1 dat { a.
)
toQ_flip=: 3 : '(98 0{a.),toQ_dict |:y'
toQ_varchar=: 3 : 0
if. issymbol y do.
  2 s: y
else.
  ; (boxxopen y) ,each ALPH0
end.
)
view_z_=: 3 : 'view__locQ y'
ZFNS1=: 0 : 0
connect
close
cmd
cmdr
cmdrf
cmdrx
exec
execr
execrf
execrx
get
getf
getx
sub
)
ZFNS2=: 0 : 0
set
)
float_z_=: + & (1.1-1.1)
integer_z_=: <. @ +&0.5
makemonad=: 4 : 0
t=. '''rc res''=. ',(y),'_',(x),'_ y'
(y,'_z_')=: 3 : (t;'if. rc do. rc;res else. res end.')
EMPTY
)
makedyad=: 4 : 0
t=. '''rc res''=. x ',(y),'_',(x),'_ y'
(y,'_z_')=: 4 : (t;'if. rc do. rc;res else. res end.')
EMPTY
)
makezfns=: 3 : 0
loc=. > coname''
loc&makemonad ;._2 ZFNS1
loc&makedyad ;._2 ZFNS2
EMPTY
)
coclass 'jgtk'

3 : 0''
if. IFJ6 do.
  'require'~'dll strings unicode'
end.
''
)

NoEvents=: 0

ic=: 3!:4
fc=: 3!:5
char4toint=: _2 & ic
inttochar4=: 2 & ic
debb=: #~ [: (+. (1 |. (> </\))) (0 e. ' '&=)&>
extsrc=: , ('.ijs' #~ '.'&e. < 0 < #)
getenv=: 2!:5
index=: #@[ (| - =) i.
intersect=: e. # [
memri4=: _2 ic [: memr ,&0 4
readerror=: 3 : 'readstring memr y,8 1 4'
termLF=: , (0 < #) # LF -. {:
remsep=: }.~ [: - '/' = {:
setenable=: gtk_widget_set_sensitive
setwindowfocus=: gtk_window_present
setchildfocus=: gtk_widget_grab_focus
addpattern=: 3 : 0
'w p n'=. y
ff=. gtk_file_filter_new''
gtk_file_filter_add_pattern ff;p
gtk_file_filter_set_name ff;n
gtk_file_chooser_add_filter w,ff
)
coextend=: 3 : 0
n=. ;: :: ] y
p=. ; (, 18!:2) @ < each n
p=. ~. ((18!:2 coname'')-.p) , p
(p /: p = <,'z') 18!:2 coname''
)
direxist=: 3 : 0
d=. (- ({:y) e. '/\') }. y
if. #d=. 1!:0 d do.
  'd' = 4 { > 4 { ,d
else.
  0
end.
)
gconvert=: 3 : 0
'to from dat'=. y
m=. memaz 12
r=. g_convert (,dat);(#dat);to;from;m (<@+)each 8 4 0
err=. memri4 m
if. err do.
  r=. 1;readstring memr err,8 1 4
else.
  r=. 0;readstringfree 0 pick r
end.
r[memf m
)
getallwindows=: 3 : 'get_glist gtk_window_list_toplevels$0'
get_glist=: 3 : 0
p=. y
r=. ''
whilst. p do.
  'd p v'=. memr p,0 3,JPTR
  r=. r,d
end.
)
getlist=: 3 : 0
ad=. y
n=. (JTYPES i. JINT){JSIZES 
r=. ''
while. 1 do.
  a=. memr ad,0,1,JINT
  if. 0=a do. r return. end.
  ad=. ad+n
  r=. r,<memr a,0,_1
end.
r
)
getmodifiers=: 3 : 0
p=. memaz 4
w=. getGtkWidgetWindow window
gdk_window_get_pointer w;<each 0 0,p
r=. 0 2 { 2 2 2 #: a.i.{.memr p,0 1
memf p
r
)
getscreenwh=: 3 : 0
s=. gdk_screen_get_default''
(gdk_screen_get_width s),gdk_screen_get_height s
)
getwinpos=: 3 : 0
win=. y
px=. memaz 4
py=. memaz 4
gtk_window_get_position win;(<px);<<py
x=. memri4 px
y=. memri4 py
gtk_window_get_size win;(<px);<<py
w=. memri4 px
h=. memri4 py
m=. * 4 AND gdk_window_get_state getGtkWidgetWindow win
memf px
memf py
x,y,w,h,m
)
gtkeventkey=: 3 : '_2 ic memr y,GdkEventKey,8'
gtkfixf10=: 3 : 0
a=. gtk_settings_get_default''
gtk_settings_set_string_property a;'gtk-menu-bar-accel';'';''
)
isdir=: 3 : 0
d=. 1!:0 y
if. 1 ~: #d do. 0 return. end.
'd' = 4 { 4 pick ,d
)
isesckey=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key~:GDK_Escape do. 0 return. end.
+:/ 0 2 { 2 2 2 #: state
)
log=: '/tmp/tracegtk.log' fappends~ ":
memaz=: 3 : 0
r=. mema y
(y${.a.) memw r,0,y
r
)
noevents=: 3 : 0
NoEvents_jgtk_=: {. 0 >. NoEvents + y{_1 1
)
readstring=: 3 : 0
if. y do. memr y,0 _1 else. '' end.
)
readstringfree=: 3 : 0
if. y do.
  d=. memr y,0 _1
  g_free y
  d
else.
  ''
end.
)
rgb2gtk=: 3 : 0
(0 0 0 0{a.), 1 (3!:4) (256 * y) + 255 * 127 < y
)
setfont=: 3 : 0
'w f'=. y
font=. pango_font_description_from_string <f
gtk_widget_modify_font w,font
pango_font_description_free font
)
setlist=: 3 : 0
len=. 1 + # &> y
t=. ; y ,each {.a.
p=. mema #t
t memw p,0,#t
n=. (JTYPES i. JINT){JSIZES 
s=. mema n * 1 + #y
d=. 0 ,~ p + +/\0,}:len
d memw s,0,(#d),JINT
s
)
setwinpos=: 4 : 0
win=. y
if. (win=0) +. 0=#x do. return. end.
'x y w h m'=. 5 {. x
gtk_window_move win,x,y
gtk_window_set_default_size win,w,h
if. m do.
  gtk_window_maximize win
end.
)
showconsole=: 3 : 0
if. IFWIN do.
  hwnd=. 'kernel32 GetConsoleWindow >x'cd''
  'user32.dll ShowWindow > x x x'cd hwnd,y
end.
)
widgetshow=: 3 : 0
'w v'=. y
if. v do.
  gtk_widget_show &> w
else.
  gtk_widget_hide &> w
end.
)
window_destroy=: 3 : 0
if. window do. gtk_widget_destroy window end.
window=: 0
)
writestrings=: 3 : 0
len=. 1 + # &> y
t=. ; y ,each {.a.
p=. mema #t
t memw p,0,#t
p + +/\ 0,}:len
)
settimer=: 3 : 0
g_timeout_add_full 200;y;cb1;(cbreg 'sys_timer__');0
)
3 : 0''
decodecesc_z_=: ('\\';'\';'\n';LF;'\r';CR;'\t';TAB;'\0';({.a.)) & stringreplace   
if. UNAME-:'Linux' do.
  bindtextdomain_z_=: 'libc.so.6 bindtextdomain > x *c *c'&cd         
  bind_textdomain_codeset_z_=: 'libc.so.6 bind_textdomain_codeset > x *c *c'&cd         
  textdomain_z_=: 'libc.so.6 textdomain > x *c'&cd                    
  gettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libc.so.6 gettext > x *c''&cd <y'                 
  dgettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libc.so.6 dgettext > x *c *c''&cd |.@y'          
  ngettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libc.so.6 ngettext > x *c *c x''&cd y'           
  dngettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libc.so.6 dngettext > x *c *c *c x''&cd _1 |.y' 
  gettext_noop_z_=: decodecesc
elseif. UNAME-:'Win' do.
  if. 1 [ IF64 do.
    bindtextdomain_z_=: 'libintl-8.dll bindtextdomain > + x *c *c'&cd
    bind_textdomain_codeset_z_=: 'libintl-8.dll bind_textdomain_codeset > + x *c *c'&cd
    textdomain_z_=: 'libintl-8.dll textdomain > + x *c'&cd
    gettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libintl-8.dll gettext > + x *c''&cd <y'
    dgettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libintl-8.dll dgettext > + x *c *c''&cd |.@y'
    ngettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libintl-8.dll ngettext > + x *c *c x''&cd y'
    dngettext_z_=: 3 : 'decodecesc memr 0 _1 2,~ ''libintl-8.dll dngettext > + x *c *c *c x''&cd _1 |.y'
    gettext_noop_z_=: decodecesc
  else.
    bindtextdomain_z_=: 'intl.dll bindtextdomain > + x *c *c'&cd
    bind_textdomain_codeset_z_=: 'intl.dll bind_textdomain_codeset > + x *c *c'&cd
    textdomain_z_=: 'intl.dll textdomain > + x *c'&cd
    gettext_z_=: 3 : 'decodecesc helper_g_locale_to_utf8_jgtk_ < ''intl.dll gettext > + x *c''&cd <y'
    dgettext_z_=: 3 : 'decodecesc helper_g_locale_to_utf8_jgtk_ < ''intl.dll dgettext > + x *c *c''&cd |.@y'
    ngettext_z_=: 3 : 'decodecesc helper_g_locale_to_utf8_jgtk_ < ''intl.dll ngettext > + x *c *c x''&cd y'
    dngettext_z_=: 3 : 'decodecesc helper_g_locale_to_utf8_jgtk_ < ''intl.dll dngettext > + x *c *c *c x''&cd _1 |.y'
    gettext_noop_z_=: decodecesc
  end.
elseif. UNAME-:'Darwin' do.
  bindtextdomain_z_=: bind_textdomain_codeset_z_=: textdomain_z_=: 0:
  gettext_z_=: decodecesc
  dgettext_z_=: decodecesc@>@{.
  ngettext_z_=: 3 : 'decodecesc (1<2{::y){::2{.y'
  dngettext_z_=: 3 : 'decodecesc (1<2{::y){::2{.y [[ y=. _1 |.y'
  gettext_noop_z_=: decodecesc
end.
''
)

3 : 0''
if. 0~:nc<'GTKVER_j_' do. GTKVER_j_=: 2 end.
if. 3=GTKVER_j_ do.
  select. UNAME
  case. 'Darwin' do.
    libdir=. jpath '~install/gtk/lib/'
    libcairo=: <dquote libdir,'libcairo.2.dylib'
    libgdk=: <dquote libdir,'libgdk-3.0.dylib'
    libgio=: <dquote libdir,'libgio-2.0.0.dylib'
    libglib=: <dquote libdir,'libglib-2.0.0.dylib'
    libgobject=: <dquote libdir,'libgobject-2.0.0.dylib'
    libgthread=: <dquote libdir,'libgthread-2.0.0.dylib'
    libgtk=: <dquote libdir,'libgtk-3.0.dylib'
    libgtksourceview=: <dquote libdir,'libgtksourceview-3.0.0.dylib'
    libigemac=: <dquote libdir,'libigemacintegration.0.dylib'
    libpango=: <dquote libdir,'libpango-1.0.0.dylib'
    libpangocairo=: <dquote libdir,'libpangocairo-1.0.0.dylib'
    libpixbuf=: <dquote libdir,'libgdk_pixbuf-2.0.0.dylib'
    libxml=: <dquote libdir,'libxml2.2.dylib'
    if. -.fexist '"'-.~>libigemac do. libigemac=: '' end.   
  case. 'Linux' do.
    libglib=: <'libglib-2.0.so.0'
    libcairo=: <'libcairo.so.2'
    libgdk=: <'libgdk-3.so.0'
    libgio=: <'libgio-2.0.so.0'
    libgobject=: <'libgobject-2.0.so.0'
    libgthread=: <'libgthread-2.0.so.0'
    libgtk=: <'libgtk-3.so.0'
    libgtksourceview=: <'libgtksourceview-3.0.so.0'
    libpango=: <'libpango-1.0.so.0'
    libpangocairo=: <'libpangocairo-1.0.so.0'
    libpixbuf=: <'libgdk_pixbuf-2.0.so.0'
    libxml=: <'libxml2.so.2'
  case. 'Win' do.
    'kernel32.dll SetDllDirectoryW x *w'cd <uucp jpath'~install/gtk/bin'
    libcairo=: <'libcairo-2.dll'
    libgdk=: <'libgdk-3-0.dll'
    libgio=: <'libgio-2.0-0.dll'
    libglib=: <'libglib-2.0-0.dll'
    libgobject=: <'libgobject-2.0-0.dll'
    libgthread=: <'libgthread-2.0-0.dll'
    libgtk=: <'libgtk-3-0.dll'
    libgtksourceview=: <'libgtksourceview-3.0-0.dll'
    libpango=: <'libpango-1.0-0.dll'
    libpangocairo=: <'libpangocairo-1.0-0.dll'
    libpixbuf=: <'libgdk_pixbuf-2.0-0.dll'
    libxml=: <'libxml2.dll'
  end.
else.
  select. UNAME
  case. 'Darwin' do.
    libdir=. jpath '~install/gtk/lib/'
    libcairo=: <dquote libdir,'libcairo.2.dylib'
    libgdk=: <dquote libdir,'libgdk-quartz-2.0.0.dylib'
    libgio=: <dquote libdir,'libgio-2.0.0.dylib'
    libglib=: <dquote libdir,'libglib-2.0.0.dylib'
    libgobject=: <dquote libdir,'libgobject-2.0.0.dylib'
    libgthread=: <dquote libdir,'libgthread-2.0.0.dylib'
    libgtk=: <dquote libdir,'libgtk-quartz-2.0.0.dylib'
    libgtksourceview=: <dquote libdir,'libgtksourceview-2.0.0.dylib'
    libigemac=: <dquote libdir,'libigemacintegration.0.dylib'
    libpango=: <dquote libdir,'libpango-1.0.0.dylib'
    libpangocairo=: <dquote libdir,'libpangocairo-1.0.0.dylib'
    libpixbuf=: <dquote libdir,'libgdk_pixbuf-2.0.0.dylib'
    libxml=: <dquote libdir,'libxml2.2.dylib'
    if. -.fexist '"'-.~>libigemac do. libigemac=: '' end.   
    if. -.fexist '"'-.~>libgtk do.
      libgdk=: <dquote libdir,'libgdk-x11-2.0.0.dylib'
      libgtk=: <dquote libdir,'libgtk-x11-2.0.0.dylib'
    end.
  case. 'Linux' do.
    libcairo=: <'libcairo.so.2'
    libgdk=: <'libgdk-x11-2.0.so.0'
    libgio=: <'libgio-2.0.so.0'
    libglib=: <'libglib-2.0.so.0'
    libgobject=: <'libgobject-2.0.so.0'
    libgthread=: <'libgthread-2.0.so.0'
    libgtk=: <'libgtk-x11-2.0.so.0'
    libgtksourceview=: <'libgtksourceview-2.0.so.0'
    libpango=: <'libpango-1.0.so.0'
    libpangocairo=: <'libpangocairo-1.0.so.0'
    libpixbuf=: <'libgdk_pixbuf-2.0.so.0'
    libxml=: <'libxml2.so.2'
  case. 'Win' do.
    'kernel32.dll SetDllDirectoryW x *w'cd <uucp jpath'~install/gtk/bin'
    libcairo=: <'libcairo-2.dll'
    libgdk=: <'libgdk-win32-2.0-0.dll'
    libgio=: <'libgio-2.0-0.dll'
    libglib=: <'libglib-2.0-0.dll'
    libgobject=: <'libgobject-2.0-0.dll'
    libgthread=: <'libgthread-2.0-0.dll'
    libgtk=: <'libgtk-win32-2.0-0.dll'
    libgtksourceview=: <'libgtksourceview-2.0-0.dll'
    libpango=: <'libpango-1.0-0.dll'
    libpangocairo=: <'libpangocairo-1.0-0.dll'
    libpixbuf=: <'libgdk_pixbuf-2.0-0.dll'
    libxml=: <'libxml2.dll'
  end.
end.
)
3 : 0''
if. IF64 do.
  sizeofGdkEventConfigure=: 40
  GdkEventConfigure_xywh=: 20

  sizeofGdkEventKey=: 56
  GdkEventKey=: 24

  GdkEventButton_state=: 48
  GdkEventButton_button=: 52
  GdkEventScroll_direction=: 44

  sizeofGdkEventMotion=: 80
  GdkEventMotion_xy=: 24

  sizeofGtkStyle=: 984
  GtkStyle_fg_gc=: 544
  GtkStyle_black_gc=: 864
  GtkStyle_white_gc=: 872

  sizeofGtkWidget=: 96
  GtkWidget_state=: 34
  GtkWidget_style=: 48
  GtkWidget_requisition=: 56
  GtkWidget_allocation=: 64
  GtkWidget_window=: 80

else.
  sizeofGdkEventConfigure=: 28
  GdkEventConfigure_xywh=: 12

  sizeofGdkEventKey=: 36
  GdkEventKey=: 16

  GdkEventButton_state=: 36
  GdkEventButton_button=: 40
  GdkEventScroll_direction=: 32

  sizeofGdkEventMotion=: 64
  GdkEventMotion_xy=: 16

  sizeofGtkStyle=: 752
  GtkStyle_fg_gc=: 528
  GtkStyle_black_gc=: 688
  GtkStyle_white_gc=: 692

  sizeofGtkWidget=: 60
  GtkWidget_state=: 18
  GtkWidget_style=: 24
  GtkWidget_requisition=: 28
  GtkWidget_allocation=: 36
  GtkWidget_window=: 52
end.
)

ITERSIZE=: IF64{14 10 
G_CHECKSUM_MD5=: 0
G_CHECKSUM_SHA1=: 1
G_CHECKSUM_SHA256=: 2
G_IO_IN=: 1
G_IO_PRI=: 2
G_IO_OUT=: 4
G_IO_ERR=: 8
G_IO_HUP=: 16
G_IO_NVAL=: 32

G_PRIORITY_DEFAULT=: 0
G_PRIORITY_DEFAULT_IDLE=: 200
G_PRIORITY_HIGH=: _100
G_PRIORITY_HIGH_IDLE=: 100

G_TYPE_BOOLEAN=: 20
G_TYPE_INT=: 24
G_TYPE_STRING=: 64
((<'GDK_') ,each n{a.)=: n=. ,65 97 +/ i.26
GDK_F1=: 16bffbe
GDK_FKeys=: GDK_F1 + i.12

GDK_BackSpace=: 16bff08
GDK_Tab=: 16bff09
GDK_Linefeed=: 16bff0a
GDK_Clear=: 16bff0b
GDK_Return=: 16bff0d
GDK_Pause=: 16bff13
GDK_Scroll_Lock=: 16bff14
GDK_Sys_Req=: 16bff15
GDK_Escape=: 16bff1b
GDK_Delete=: 16bffff
GDK_Home=: 16bff50
GDK_Left=: 16bff51
GDK_Up=: 16bff52
GDK_Right=: 16bff53
GDK_Down=: 16bff54
GDK_Prior=: 16bff55
GDK_Page_Up=: 16bff55
GDK_Next=: 16bff56
GDK_Page_Down=: 16bff56
GDK_End=: 16bff57
GDK_Begin=: 16bff58
GDK_Insert=: 16bff63
GDK_Menu=: 16bff67
GDK_Num_Lock=: 16bff7f
GDK_KP_Enter=: 16bff8d
GDK_Shift_L=: 16bffe1
GDK_Shift_R=: 16bffe2
GDK_Control_L=: 16bffe3
GDK_Control_R=: 16bffe4
GDK_Caps_Lock=: 16bffe5
GDK_Shift_Lock=: 16bffe6
GDK_Meta_L=: 16bffe7
GDK_Meta_R=: 16bffe8
GDK_Alt_L=: 16bffe9
GDK_Alt_R=: 16bffea
GDK_Super_L=: 16bffeb
GDK_Super_R=: 16bffec
GDK_Hyper_L=: 16bffed
GDK_Hyper_R=: 16bffee
GDK_EXPOSURE_MASK=: 1 (33 b.)~ 1          
GDK_POINTER_MOTION_MASK=: 1 (33 b.)~ 2
GDK_POINTER_MOTION_HINT_MASK=: 1 (33 b.)~ 3
GDK_BUTTON_MOTION_MASK=: 1 (33 b.)~ 4
GDK_BUTTON1_MOTION_MASK=: 1 (33 b.)~ 5
GDK_BUTTON2_MOTION_MASK=: 1 (33 b.)~ 6
GDK_BUTTON3_MOTION_MASK=: 1 (33 b.)~ 7
GDK_BUTTON_PRESS_MASK=: 1 (33 b.)~ 8
GDK_BUTTON_RELEASE_MASK=: 1 (33 b.)~ 9
GDK_KEY_PRESS_MASK=: 1 (33 b.)~ 10
GDK_KEY_RELEASE_MASK=: 1 (33 b.)~ 11
GDK_ENTER_NOTIFY_MASK=: 1 (33 b.)~ 12
GDK_LEAVE_NOTIFY_MASK=: 1 (33 b.)~ 13
GDK_FOCUS_CHANGE_MASK=: 1 (33 b.)~ 14
GDK_STRUCTURE_MASK=: 1 (33 b.)~ 15
GDK_PROPERTY_CHANGE_MASK=: 1 (33 b.)~ 16
GDK_VISIBILITY_NOTIFY_MASK=: 1 (33 b.)~ 17
GDK_PROXIMITY_IN_MASK=: 1 (33 b.)~ 18
GDK_PROXIMITY_OUT_MASK=: 1 (33 b.)~ 19
GDK_SUBSTRUCTURE_MASK=: 1 (33 b.)~ 20
GDK_SCROLL_MASK=: 1 (33 b.)~ 21
GDK_ALL_EVENTS_MASK=: 16b3ffffe
GDK_SHIFT_MASK=: 1 (33 b.)~ 0
GDK_LOCK_MASK=: 1 (33 b.)~ 1
GDK_CONTROL_MASK=: 1 (33 b.)~ 2
GDK_MOD1_MASK=: 1 (33 b.)~ 3
GDK_MOD2_MASK=: 1 (33 b.)~ 4
GDK_MOD3_MASK=: 1 (33 b.)~ 5
GDK_MOD4_MASK=: 1 (33 b.)~ 6
GDK_MOD5_MASK=: 1 (33 b.)~ 7
GDK_BUTTON1_MASK=: 1 (33 b.)~ 8
GDK_BUTTON2_MASK=: 1 (33 b.)~ 9
GDK_BUTTON3_MASK=: 1 (33 b.)~ 10
GDK_BUTTON4_MASK=: 1 (33 b.)~ 11
GDK_BUTTON5_MASK=: 1 (33 b.)~ 12
GDK_SUPER_MASK=: 1 (33 b.)~ 26     
GDK_HYPER_MASK=: 1 (33 b.)~ 27
GDK_META_MASK=: 1 (33 b.)~ 28
GDK_MODIFIER_MASK=: 16b5c001fff

GDK_COLORSPACE_RGB=: 0

GDK_WINDOW_TYPE_HINT_NORMAL=: 0
GDK_WINDOW_TYPE_HINT_DIALOG=: 1
GDK_WINDOW_TYPE_HINT_MENU=: 2              
GDK_WINDOW_TYPE_HINT_TOOLBAR=: 3
GDK_WINDOW_TYPE_HINT_SPLASHSCREEN=: 4
gdk_WINDOW_TYPE_HINT_UTILITY=: 5
GDK_WINDOW_TYPE_HINT_DOCK=: 6
GDK_WINDOW_TYPE_HINT_DESKTOP=: 7
GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU=: 8     
GDK_WINDOW_TYPE_HINT_POPUP_MENU=: 9        
GDK_WINDOW_TYPE_HINT_TOOLTIP=: 10
GDK_WINDOW_TYPE_HINT_NOTIFICATION=: 11
GDK_WINDOW_TYPE_HINT_COMBO=: 12
GDK_WINDOW_TYPE_HINT_DND=: 13

GTK_ACCEL_VISIBLE=: 1

GTK_DIALOG_MODAL=: 1
GTK_DIALOG_DESTROY_WITH_PARENT=: 2
GTK_DIALOG_NO_SEPARATOR=: 4
GTK_RESPONSE_NONE=: _1

GTK_RESPONSE_NONE=: -1
GTK_RESPONSE_REJECT=: -2
GTK_RESPONSE_ACCEPT=: -3
GTK_RESPONSE_DELETE_EVENT=: -4
GTK_RESPONSE_OK=: -5
GTK_RESPONSE_CANCEL=: -6
GTK_RESPONSE_CLOSE=: -7
GTK_RESPONSE_YES=: -8
GTK_RESPONSE_NO=: -9
GTK_RESPONSE_APPLY=: -10
GTK_RESPONSE_HELP=: -11

GTK_STOCK_OK=: 'gtk-ok'
GTK_STOCK_CANCEL=: 'gtk-cancel'
GTK_STOCK_OPEN=: 'gtk-open'
GTK_STOCK_SAVE=: 'gtk-save'
GTK_MESSAGE_INFO=: 0
GTK_MESSAGE_WARNING=: 1
GTK_MESSAGE_QUESTION=: 2
GTK_MESSAGE_ERROR=: 3
GTK_MESSAGE_OTHER=: 4
GTK_BUTTONS_NONE=: 0
GTK_BUTTONS_OK=: 1
GTK_BUTTONS_CLOSE=: 2
GTK_BUTTONS_CANCEL=: 3
GTK_BUTTONS_YES_NO=: 4
GTK_BUTTONS_OK_CANCEL=: 5
GTK_FILE_CHOOSER_ACTION_OPEN=: 0
GTK_FILE_CHOOSER_ACTION_SAVE=: 1
GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER=: 2
GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER=: 3
GTK_POS_LEFT=: 0
GTK_POS_RIGHT=: 1
GTK_POS_TOP=: 2
GTK_POS_BOTTOM=: 3

GDK_NONE=: 0
GDK_BUTTON_PRESS=: 4
GDK_2BUTTON_PRESS=: 5

GTK_EXPAND=: 1
GTK_FILL=: 4

GTK_RELIEF_NONE=: 2
GTK_POLICY_ALWAYS=: 0
GTK_POLICY_AUTOMATIC=: 1
GTK_POLICY_NEVER=: 2

GTK_ICON_SIZE_MENU=: 1
GTK_ICON_SIZE_SMALL_TOOLBAR=: 2
GTK_ICON_SIZE_LARGE_TOOLBAR=: 3
GTK_ICON_SIZE_BUTTON=: 4
GTK_ICON_SIZE_DIALOG=: 6

GTK_SELECTION_NONE=: 0
GTK_SELECTION_SINGLE=: 1
GTK_SELECTION_BROWSE=: 2
GTK_SELECTION_MULTIPLE=: 3

GTK_SHADOW_NONE=: 0
GTK_SHADOW_IN=: 1
GTK_SHADOW_OUT=: 2
GTK_SHADOW_ETCHED_IN=: 3
GTK_SHADOW_ETCHED_OUT=: 4

GTK_STOCK_CLOSE=: 'gtk-close'
GTK_STOCK_OK=: 'gtk-ok'
GTK_STOCK_CANCEL=: 'gtk-cancel'
GTK_STOCK_EDIT=: 'gtk-edit'
GTK_STOCK_OPEN=: 'gtk-open'
GTK_STOCK_SAVE=: 'gtk-save'

GTK_TOOLBAR_ICONS=: 0

GTK_WIN_POS_CENTER=: 1
GTK_WIN_POS_CENTER_ON_PARENT=: 4
GTK_WINDOW_TOPLEVEL=: 0
GDK_SELECTION_PRIMARY=: 1
GDK_SELECTION_SECONDARY=: 2
GDK_SELECTION_CLIPBOARD=: 69
CAIRO_STATUS_SUCCESS=: 0
CAIRO_FORMAT_ARGB32=: 0
CAIRO_FORMAT_RGB24=: 1
CAIRO_OPERATOR_SOURCE=: 1
CAIRO_OPERATOR_OVER=: 2
GTK_PRINT_STATUS_INITIAL=: 0
GTK_PRINT_STATUS_PREPARING=: 1
GTK_PRINT_STATUS_GENERATING_DATA=: 2
GTK_PRINT_STATUS_SENDING_DATA=: 3
GTK_PRINT_STATUS_PENDING=: 4
GTK_PRINT_STATUS_PENDING_ISSUE=: 5
GTK_PRINT_STATUS_PRINTING=: 6
GTK_PRINT_STATUS_FINISHED=: 7
GTK_PRINT_STATUS_FINISHED_ABORTED=: 8

GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG=: 0
GTK_PRINT_OPERATION_ACTION_PRINT=: 1
GTK_PRINT_OPERATION_ACTION_PREVIEW=: 2
GTK_PRINT_OPERATION_ACTION_EXPORT=: 3

GTK_PRINT_OPERATION_RESULT_ERROR=: 0
GTK_PRINT_OPERATION_RESULT_APPLY=: 1
GTK_PRINT_OPERATION_RESULT_CANCEL=: 2
GTK_PRINT_OPERATION_RESULT_IN_PROGRESS=: 3

GTK_PRINT_PAGES_ALL=: 0
GTK_PRINT_PAGES_CURRENT=: 1
GTK_PRINT_PAGES_RANGES=: 2
GTK_PRINT_PAGES_SELECTION=: 3

GTK_PAGE_SET_ALL=: 0
GTK_PAGE_SET_EVEN=: 1
GTK_PAGE_SET_ODD=: 2

GTK_PAGE_ORIENTATION_PORTRAIT=: 0
GTK_PAGE_ORIENTATION_LANDSCAPE=: 1
GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT=: 2
GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE=: 3

GTK_PRINT_QUALITY_LOW=: 0
GTK_PRINT_QUALITY_NORMAL=: 1
GTK_PRINT_QUALITY_HIGH=: 2
GTK_PRINT_QUALITY_DRAFT=: 3

GTK_PRINT_DUPLEX_SIMPLEX=: 0
GTK_PRINT_DUPLEX_HORIZONTAL=: 1
GTK_PRINT_DUPLEX_VERTICAL=: 2

GTK_UNIT_PIXEL=: 0
GTK_UNIT_POINTS=: 1
GTK_UNIT_INCH=: 2
GTK_UNIT_MM=: 3
GDK_X_CURSOR=: 0
GDK_ARROW=: 2
GDK_BASED_ARROW_DOWN=: 4
GDK_BASED_ARROW_UP=: 6
GDK_BOAT=: 8
GDK_BOGOSITY=: 10
GDK_BOTTOM_LEFT_CORNER=: 12
GDK_BOTTOM_RIGHT_CORNER=: 14
GDK_BOTTOM_SIDE=: 16
GDK_BOTTOM_TEE=: 18
GDK_BOX_SPIRAL=: 20
GDK_CENTER_PTR=: 22
GDK_CIRCLE=: 24
GDK_CLOCK=: 26
GDK_COFFEE_MUG=: 28
GDK_CROSS=: 30
GDK_CROSS_REVERSE=: 32
GDK_CROSSHAIR=: 34
GDK_DIAMOND_CROSS=: 36
GDK_DOT=: 38
GDK_DOTBOX=: 40
GDK_DOUBLE_ARROW=: 42
GDK_DRAFT_LARGE=: 44
GDK_DRAFT_SMALL=: 46
GDK_DRAPED_BOX=: 48
GDK_EXCHANGE=: 50
GDK_FLEUR=: 52
GDK_GOBBLER=: 54
GDK_GUMBY=: 56
GDK_HAND1=: 58
GDK_HAND2=: 60
GDK_HEART=: 62
GDK_ICON=: 64
GDK_IRON_CROSS=: 66
GDK_LEFT_PTR=: 68
GDK_LEFT_SIDE=: 70
GDK_LEFT_TEE=: 72
GDK_LEFTBUTTON=: 74
GDK_LL_ANGLE=: 76
GDK_LR_ANGLE=: 78
GDK_MAN=: 80
GDK_MIDDLEBUTTON=: 82
GDK_MOUSE=: 84
GDK_PENCIL=: 86
GDK_PIRATE=: 88
GDK_PLUS=: 90
GDK_QUESTION_ARROW=: 92
GDK_RIGHT_PTR=: 94
GDK_RIGHT_SIDE=: 96
GDK_RIGHT_TEE=: 98
GDK_RIGHTBUTTON=: 100
GDK_RTL_LOGO=: 102
GDK_SAILBOAT=: 104
GDK_SB_DOWN_ARROW=: 106
GDK_SB_H_DOUBLE_ARROW=: 108
GDK_SB_LEFT_ARROW=: 110
GDK_SB_RIGHT_ARROW=: 112
GDK_SB_UP_ARROW=: 114
GDK_SB_V_DOUBLE_ARROW=: 116
GDK_SHUTTLE=: 118
GDK_SIZING=: 120
GDK_SPIDER=: 122
GDK_SPRAYCAN=: 124
GDK_STAR=: 126
GDK_TARGET=: 128
GDK_TCROSS=: 130
GDK_TOP_LEFT_ARROW=: 132
GDK_TOP_LEFT_CORNER=: 134
GDK_TOP_RIGHT_CORNER=: 136
GDK_TOP_SIDE=: 138
GDK_TOP_TEE=: 140
GDK_TREK=: 142
GDK_UL_ANGLE=: 144
GDK_UMBRELLA=: 146
GDK_UR_ANGLE=: 148
GDK_WATCH=: 150
GDK_XTERM=: 152
GDK_LAST_CURSOR=: 153
GDK_BLANK_CURSOR=: _2
GDK_CURSOR_IS_PIXMAP=: _1
G_LOG_FLAG_RECURSION=: 0 (33 b.) 1
G_LOG_FLAG_FATAL=: 1 (33 b.) 1
G_LOG_LEVEL_ERROR=: 2 (33 b.) 1       
G_LOG_LEVEL_CRITICAL=: 3 (33 b.) 1
G_LOG_LEVEL_WARNING=: 4 (33 b.) 1
G_LOG_LEVEL_MESSAGE=: 5 (33 b.) 1
G_LOG_LEVEL_INFO=: 6 (33 b.) 1
G_LOG_LEVEL_DEBUG=: 7 (33 b.) 1
G_LOG_LEVEL_MASK=: 0 (22 b.) G_LOG_FLAG_RECURSION (23 b.) G_LOG_FLAG_FATAL
GDK_CURRENT_TIME=: 0
PANGO_SCALE=: 1024
PANGO_STYLE_NORMAL=: 0
PANGO_STYLE_OBLIQUE=: 1
PANGO_STYLE_ITALIC=: 2
PANGO_WEIGHT_THIN=: 100
PANGO_WEIGHT_ULTRALIGHT=: 200
PANGO_WEIGHT_LIGHT=: 300
PANGO_WEIGHT_BOOK=: 380
PANGO_WEIGHT_NORMAL=: 400
PANGO_WEIGHT_MEDIUM=: 500
PANGO_WEIGHT_SEMIBOLD=: 600
PANGO_WEIGHT_BOLD=: 700
PANGO_WEIGHT_ULTRABOLD=: 800
PANGO_WEIGHT_HEAVY=: 900
PANGO_WEIGHT_ULTRAHEAVY=: 1000
cddef=: 4 : 0
y=. dtb (y i. ':'){.y
if. 0=#y do. '' return. end.
n=. y i. ' '
f=. n {. y
d=. (_2 * (<_2{.f) e. '_1';'_2';'_3') }. f
if. IFUNIX do.
  p=. n }. y
else.
  p=. (n+1) }. y
  if. '>' = {.p do.
    p=. ' >+', }.p
  else.
    p=. ' +', p
  end.
end.
(f)=: (x,' ',d,p)&(15!:0)
''
)
cddeflog=: 1 : 0
'f p'=. x
if. (<f) e. <;._1 ' gtk_events_pending gtk_main_iteration' do.
  p & (15!:0)
else.  
  fl=. > IFWIN{'/tmp/tracegtk.log';'c:\tracegtk.log'
  3 : ('if. Debug do. (''',p,''',LF) 1!:3 <''',fl,''' end.',LF,'''',p,''' 15!:0 y')
end.
)
libgio cddef each <;._2 [ 0 : 0
g_input_stream_close > i x x x
g_memory_input_stream_new_from_data > x *c x x
)
libglib cddef each <;._2 [ 0 : 0
g_compute_checksum_for_string > x x *c x
g_convert *c *c x *c *c * * *
g_free > n x
g_idle_add > x x x
g_idle_add_full >x x x x x
g_io_add_watch > x x x x x : quint GIOChannel GIOCondition GioFunc gpointer
g_io_channel_unix_new > x x : here, not in libgio
g_io_channel_win32_new_socket > x x : here, not in libgio
g_key_file_free > n x
g_key_file_get_string > x x *c *c x
g_key_file_load_from_file > i x *c x *x
g_key_file_new > x
g_list_length > i x
g_list_nth_data > x x x
g_list_free  n x
g_locale_from_utf8 > x *c x *x *x x
g_locale_to_utf8 > x *c x *x *x x
g_log0 > n *c i *c : doamin, loglevel, format with 0 optional arg
g_pattern_match_simple > i *c *c
g_source_remove > i i
g_timeout_add_full > x x x x x x
g_utf8_validate > i *c x x
)
libgthread cddef each <;._2 [ 0 : 0
g_thread_init > n x
)
libgdk cddef each <;._2 [ 0 : 0
gdk_atom_intern > x *c i
gdk_cursor_new > x i
gdk_display_get_default > x
gdk_draw_arc > n x x i x x x x x x
gdk_draw_drawable > n x x x x x x x x x
gdk_draw_layout > n x x x x x
gdk_draw_line > n x x x x x x   : pixamp gc a b c d
gdk_draw_lines > n x x *x x     : pixmap gc pts cnt
gdk_draw_rgb_image > n x x i i i i i *c i
gdk_draw_pixbuf > n x x x x x x x x x x x x
: gtkpx,0,gtkbuf,0,0,0,0,_1,_1,0,0,0 : pixbuf pixbuf_dest,drawable_src,colormap,src_x,src_y,dest_x,dest_y,w,h
gdk_draw_point > n x x x x
gdk_draw_polygon > n x x i *x x
gdk_draw_rectangle > n x x i x x x x
gdk_drawable_get_colormap > x x
gdk_event_get_coords x x *d *d
gdk_event_get_state x x *x
gdk_gc_new > x x
gdk_gc_set_clip_rectangle > n x *c : xwyh in char (2(3!:4)xywh)
gdk_gc_set_line_attributes > n x x x x x
gdk_gc_set_rgb_fg_color > n x *c
gdk_pixbuf_get_from_drawable > x x x x i i i i i i
gdk_pixbuf_get_from_surface > x x i i i i : gtk3
gdk_pixbuf_get_from_window > x x i i i i : gtk3
gdk_pixbuf_new_from_stream > x x x x    : 2.14
gdk_pixmap_new > x x i i i
gdk_screen_get_default > x
gdk_screen_get_display > x x
gdk_screen_get_height > i x
gdk_screen_get_width > i x
gdk_window_get_parent > x x
gdk_window_get_pointer > x x *x *x *i
gdk_window_get_state > x x
gdk_window_set_cursor > n x x
: threads
gdk_threads_init > n
gdk_threads_enter > n
gdk_threads_leave > n
: x11
gdk_x11_colormap_foreign_new > x x x
gdk_x11_colormap_get_xcolormap > x x
gdk_x11_display_get_xdisplay > x x
gdk_x11_drawable_get_xdisplay > x x
gdk_x11_drawable_get_xid > x x
gdk_x11_get_default_xdisplay > x
gdk_x11_screen_lookup_visual > x x x
gdk_x11_screen_get_xscreen > x x
gdk_x11_window_get_xid > x x
gdk_x11_visual_get_xvisual > x x
: win32
gdk_win32_drawable_get_handle > x x
: colormap
gdk_colormap_get_visual > x x
: gdk_window_invalidate_rect > n x x i
: cairo
gdk_cairo_create > x x
gdk_cairo_reset_clip > n x x
gdk_cairo_set_source_color > n x x
gdk_cairo_set_source_pixbuf > n x x d d
gdk_cairo_set_source_pixmap > n x x d d
gdk_cairo_rectangle > n x x
gdk_cairo_region > n x x
)
libgtk cddef each <;._2 [ 0 : 0

: glade
: isigraph

gtk_about_dialog_new > x
gtk_about_dialog_set_comments  n x *c
gtk_about_dialog_set_copyright > n x *c
gtk_about_dialog_set_logo_icon_name > n x *c
gtk_about_dialog_set_name > n x *c              : decommited in 3.0
gtk_about_dialog_set_program_name > n x *c      : 2.12
gtk_about_dialog_set_version > n x *c
gtk_about_dialog_set_website > n x *c

gtk_accel_group_new > x

gtk_adjustment_get_value > d x
gtk_adjustment_new > x d d d d d d

gtk_alignment_new > x f f f f
gtk_alignment_set_padding > n x x x x x

gtk_bin_get_child > x x
gtk_box_pack_start > n x x x x x
gtk_box_pack_end > n x x i i x
: gtk_box_set_spacing > n x x

gtk_builder_add_from_file > i x *c *x      : 2.12
gtk_builder_add_from_string > i x *c x *x  : 2.12
gtk_builder_connect_signals_full > n x x x
gtk_builder_get_object > x x *c
gtk_builder_new > x

gtk_button_new > x
gtk_button_new_from_stock > x *c
gtk_button_new_with_label > x *c
gtk_button_new_with_mnemonic > x *c
gtk_button_set_focus_on_click > n x i
gtk_button_set_image > n x x
gtk_button_set_label > n x *c
gtk_button_set_relief > n x x

gtk_cell_renderer_combo_new > x
gtk_cell_renderer_pixbuf_new > x
gtk_cell_renderer_set_alignment > n x f f
gtk_cell_renderer_spin_new > x
gtk_cell_renderer_text_new > x
gtk_cell_renderer_toggle_new > x
gtk_cell_renderer_toggle_get_active > i x
gtk_cell_renderer_toggle_set_active > n x i

gtk_check_button_new_with_label > x *c
gtk_check_button_new_with_mnemonic > x *c
gtk_check_menu_item_get_active > i x
gtk_check_menu_item_new_with_mnemonic > x *c
gtk_check_menu_item_set_active > n x i

gtk_check_version > x i i i

gtk_clipboard_get > x x
gtk_clipboard_set_image > n x x
gtk_clipboard_set_text > n x *c x
gtk_clipboard_store > n x
gtk_clipboard_wait_for_text > x x

: color selection dialog
gtk_color_selection_dialog_get_color_selection > x x
gtk_color_selection_dialog_new > x *c
gtk_color_selection_get_current_color n x *x

gtk_combo_box_append_text > x x *c
gtk_combo_box_entry_new > x                     : decommited in 3.0
gtk_combo_box_entry_new_text > x                : decommited in 3.0
gtk_combo_box_entry_new_with_model > x x i      : decommited in 3.0
gtk_combo_box_entry_set_text_column > n x i     : decommited in 3.0
gtk_combo_box_get_active > i x
gtk_combo_box_get_active_text > x x
gtk_combo_box_get_model > x x
gtk_combo_box_new > x
gtk_combo_box_new_text > x
gtk_combo_box_new_with_entry > x                : since 2.24
gtk_combo_box_new_with_model > x x
gtk_combo_box_new_with_model_and_entry > x x    : since 2.24
gtk_combo_box_remove_text > n x i               : decommited in 3.0
gtk_combo_box_set_active > n x i
gtk_combo_box_set_entry_text_column > n x i     : since 2.24
gtk_combo_box_set_model > n x x
gtk_combo_box_get_has_entry > i x               : since 2.24
gtk_combo_box_text_new > x                      : since 2.24
gtk_combo_box_text_get_active_text > x x        : since 2.24

gtk_container_add n x x
gtk_container_get_children > x x
gtk_container_remove > n x x
gtk_container_set_border_width n x x

gtk_dialog_add_action_widget > n x x x
gtk_dialog_add_button > x x *c i
gtk_dialog_get_content_area > x x
gtk_dialog_new > x
gtk_dialog_new_with_buttons > x *c x x *c x x : ! varargs
gtk_dialog_response > n x x
gtk_dialog_run > i x
gtk_dialog_set_default_response > n x x

gtk_drawing_area_new > x
gtk_drawing_area_size > n x x

gtk_editable_set_position > n x x     : void widget position
gtk_editable_select_region > n x x x

gtk_entry_get_text > x x
gtk_entry_new > x
gtk_entry_set_editable > n x x
gtk_entry_set_max_length > n x x
gtk_entry_set_text n x *c

gtk_event_box_new > x
gtk_events_pending > x

gtk_expander_new_with_mnemonic > x *c

: file selection dialog
gtk_file_chooser_add_filter > n x x
gtk_file_chooser_dialog_new > x *c x x *c x *c x x
gtk_file_chooser_get_filename > x x
gtk_file_chooser_get_filename_utf8 > x x          : win64 version
gtk_file_chooser_set_current_folder > x x *c
gtk_file_chooser_set_current_folder_utf8 > x x *c : win64 version
gtk_file_chooser_set_do_overwrite_confirmation > n x x
gtk_file_chooser_set_current_name > n x *c
gtk_file_chooser_set_filename > i x *c
gtk_file_chooser_set_filename_utf8 > i x *c : win64 version

gtk_file_filter_add_pattern > n x *c
gtk_file_filter_new > x
gtk_file_filter_set_name > n x *c

gtk_fixed_new > x
gtk_fixed_put > n x x x x

gtk_font_button_get_font_name > x x   : gchar* font_button
gtk_font_button_new > x
gtk_font_button_new_with_font > x *c

: font selection dialog
gtk_font_selection_dialog_get_cancel_button > x x
gtk_font_selection_dialog_get_font_name > x x
gtk_font_selection_dialog_get_ok_button > x x
gtk_font_selection_dialog_new > x *c
gtk_font_selection_dialog_set_font_name > n x *c

gtk_frame_new > x *c
gtk_frame_set_label > n x *c
gtk_frame_set_shadow_type > n x x

gtk_get_current_event_time > x

gtk_hbox_new > x i x
gtk_hpaned_new > x
gtk_hseparator_new > x
gtk_vpaned_new > x

gtk_hscrollbar_new > x x
gtk_vscrollbar_new > x x

gtk_image_clear > n x
gtk_image_menu_item_new_from_stock > x *c x
gtk_image_menu_item_new_with_label > x *c
gtk_image_menu_item_new_with_mnemonic > x *c
gtk_image_menu_item_set_image > n x x
gtk_image_new_from_file_utf8 > x *c : win64 version
gtk_image_new_from_file > x *c
gtk_image_new_from_stock > x *c x
gtk_image_new > x
gtk_image_set_from_file > n x *c
gtk_image_set_from_file_utf8 > n x *c : win64 version
gtk_image_set_from_pixbuf > n x x

gtk_init  n *x x

gtk_label_get_label > x x
gtk_label_new > x *c
gtk_label_new_with_mnemonic > x *c
gtk_label_set_justify > n x x
gtk_label_set_line_wrap > n x i
gtk_label_set_markup > n x *c
gtk_label_set_mnemonic_widget > n x x
gtk_label_set_text > n x *c
gtk_label_set_text_with_mnemonic > n x *c

gtk_layout_new > x x x
gtk_layout_put > n x x x x
gtk_layout_set_size > n x x x

gtk_list_store_append > n x *x
gtk_list_store_clear > n x
gtk_list_store_insert > n x *x x
gtk_list_store_new_1 > x x s
gtk_list_store_new_2 > x x s s
gtk_list_store_newv > x i *x
gtk_list_store_remove > i x *x

gtk_list_store_set_1 > n x *x i *c i
gtk_list_store_set_2 > n x *x i i i
gtk_list_store_set_3 > n x *x i * i *c i

gtk_main > n
gtk_main_iteration > x
gtk_main_level > x
gtk_main_quit > n

: menu;'activate';accel_group;letter;modifier;GTK_ACCEL_VISIBLE
gtk_menu_attach_to_widget > n x x *x
gtk_menu_bar_new > x                  : menu_bar
: gtk_menu_item_get_label > x x
gtk_menu_item_new_with_label > x *c
gtk_menu_item_new_with_label > x *c   : menu lable
gtk_menu_item_new_with_mnemonic > x *c
gtk_menu_item_set_submenu > n x x     : void menu menu
gtk_menu_new > x
gtk_menu_popup > n x *x *x *x *x x x
gtk_menu_shell_append > n x x         : void menu menu_item
gtk_menu_shell_append > n x x         : void menu_bar menu
gtk_menu_shell_prepend > n x x

gtk_message_dialog_new > x x x x x *c *c

gtk_misc_set_alignment > n x f f
gtk_misc_set_padding > n x i i

: notebook
gtk_notebook_append_page > i x x x
gtk_notebook_get_current_page > i x
gtk_notebook_get_n_pages > i x
gtk_notebook_get_nth_page > x x s : widget notebook,page
gtk_notebook_get_tab_label > x x x
gtk_notebook_insert_page_menu > i x x x x x
gtk_notebook_new > x
gtk_notebook_page_num > i x x
gtk_notebook_popup_enable > n x
gtk_notebook_prepend_page_menu > i x x x x
gtk_notebook_remove_page > n x x
gtk_notebook_reorder_child > n x x x
gtk_notebook_set_current_page > n x x
gtk_notebook_set_group > n x *x              : since 2.12, but unavailable in gtk3
gtk_notebook_set_group_name > n x *c         : since 2.24
gtk_notebook_set_menu_label_text > n x x *c
gtk_notebook_set_scrollable > n x i
gtk_notebook_set_show_tabs > n x i
gtk_notebook_set_tab_detachable > n x x x
gtk_notebook_set_tab_label_text > n x x *c
gtk_notebook_set_tab_pos > n x x
gtk_notebook_set_tab_reorderable > n x x x

gtk_object_destroy > n x

gtk_paned_pack1 > n x x i i
gtk_paned_pack2 > n x x i i
gtk_paned_set_position > n x x
gtk_paned_get_position > x x

gtk_radio_button_new_with_mnemonic_from_widget > x x *c

gtk_rc_parse_string > n *c

gtk_settings_get_default > x
gtk_settings_set_string_property > n x *c *c *c

gtk_scrolled_window_add_with_viewport > n x x
gtk_scrolled_window_get_hscrollbar > x x
gtk_scrolled_window_get_vadjustment > x x
gtk_scrolled_window_new > x x x       : widget hadjustment vadjustment
gtk_scrolled_window_set_policy > n x x x
gtk_scrolled_window_set_shadow_type > n x x
gtk_scrolled_window_set_vadjustment > n x x

gtk_separator_menu_item_new > x
gtk_separator_tool_item_new > x

gtk_spin_button_get_value > d x
gtk_spin_button_new_with_range > x d d d
gtk_spin_button_set_value > n x d

gtk_statusbar_get_context_id > x x *c
gtk_statusbar_get_has_resize_grip > i x
gtk_statusbar_get_type > x
gtk_statusbar_new > x
gtk_statusbar_pop > n x x
gtk_statusbar_push > x x x *c
gtk_statusbar_remove > n x x x
gtk_statusbar_set_has_resize_grip > n x i

gtk_table_attach > n x x x x x x x x x x
gtk_table_new > x x x i
gtk_table_set_col_spacings > n x x
gtk_table_set_row_spacings > n x x

gtk_text_buffer_add_mark > n x x *x        : n, buffer,mark,iter
gtk_text_buffer_begin_user_action > n x
gtk_text_buffer_copy_clipboard > n x x
gtk_text_buffer_create_mark > x x *c *x i
gtk_text_buffer_cut_clipboard > n x x i
gtk_text_buffer_delete > n x *x *x         : n, buffer,iter,iter
gtk_text_buffer_delete_mark > n x x
gtk_text_buffer_delete_selection > i x i i
gtk_text_buffer_end_user_action > n x
gtk_text_buffer_get_bounds > n x *x *x
gtk_text_buffer_get_end_iter x x *x
gtk_text_buffer_get_insert > x x           : mark,buffer
gtk_text_buffer_get_iter_at_line > n x *x i
gtk_text_buffer_get_iter_at_mark > n x *x x : n, buffer,iter,mark
gtk_text_buffer_get_iter_at_offset > n x *x i
gtk_text_buffer_get_line_count > i x
gtk_text_buffer_get_mark > x x *c
gtk_text_buffer_get_selection_bound > x x
gtk_text_buffer_get_selection_bounds > i x *x *x
gtk_text_buffer_get_start_iter x x *x
gtk_text_buffer_get_text > x x *x *x x
gtk_text_buffer_insert > n x *x *c x       : n, buffer,iter,text,len
gtk_text_buffer_insert_at_cursor > n x *c i : n, buffer,text,len
gtk_text_buffer_insert_pixbuf > n x *x x
gtk_text_buffer_move_mark > n x x *x
gtk_text_buffer_move_mark_by_name > n x *c *x
gtk_text_buffer_new > x x
gtk_text_buffer_paste_clipboard > n x x x i
gtk_text_buffer_place_cursor > n x *x
gtk_text_buffer_select_range > n x *x *x
gtk_text_buffer_set_text > n x *c x

gtk_text_iter_backward_chars > i *x i
gtk_text_iter_backward_word_start > i *x
gtk_text_iter_ends_line > i *x
gtk_text_iter_ends_word > i *x
gtk_text_iter_forward_chars > i *x i
gtk_text_iter_forward_to_line_end > i *x
gtk_text_iter_forward_word_end > i *x
gtk_text_iter_get_char > x *x
gtk_text_iter_get_char i *x
gtk_text_iter_get_line > x *x
gtk_text_iter_get_line_offset > i *x
gtk_text_iter_get_offset > i *x
gtk_text_iter_get_text > x *x *x
gtk_text_iter_set_line > n *x x
gtk_text_iter_set_offset > n *x i
gtk_text_iter_starts_line > i *x

gtk_text_mark_new > x *c x                 : mark,name,gravity

gtk_text_view_buffer_to_window_coords > n x i i i *i *i
gtk_text_view_get_buffer > x x
gtk_text_view_get_iter_at_position > n x *x *i i i
gtk_text_view_get_iter_location > n x *x *c : xwyh in char (_2(3!:4)xywh)
gtk_text_view_new > x
gtk_text_view_new_with_buffer > x x
gtk_text_view_place_cursor_onscreen > n x
gtk_text_view_scroll_mark_onscreen > n x x
gtk_text_view_scroll_to_iter > i x *x d i d d
gtk_text_view_scroll_to_mark > n x x d x d d : n,view,mark,d within_margin,use_align,d xalign,d yalign
gtk_text_view_set_editable > n x i
gtk_text_view_set_wrap_mode > n x x
gtk_text_view_window_to_buffer_coords > n x x x x *x *x

gtk_toggle_button_get_active > i x
gtk_toggle_button_set_active > n x i

gtk_tool_item_new > x

gtk_toolbar_insert > n x x i
gtk_toolbar_new > x
gtk_toolbar_set_icon_size > n x x
gtk_toolbar_set_style > n x x

gtk_tool_button_new_from_stock > x *c
: gtk_tool_button_set_label > n x *c
gtk_tool_button_set_stock_id > n x *c

gtk_tooltips_new > x
gtk_tooltips_set_tip > n x x *c *c

gtk_tree_model_get_1 > n x *x x *x x
gtk_tree_model_get_iter > i x *x x
gtk_tree_model_get_iter_from_string > i x *x *c
gtk_tree_model_get_n_columns > x x
gtk_tree_model_get_path > x x *x
gtk_tree_model_get_string_from_iter > x x *x
gtk_tree_model_iter_n_children > x x *x
gtk_tree_path_free > n x
gtk_tree_path_get_indices * *
gtk_tree_path_new_from_string > x *c
gtk_tree_path_to_string > x x
gtk_tree_selection_get_selected > i x *x *x
gtk_tree_selection_select_path > n x x
gtk_tree_selection_set_mode > n x x
gtk_tree_selection_unselect_all > n x
gtk_tree_view_append_column > x x x

gtk_tree_view_column_add_attribute > n x x *c x
gtk_tree_view_column_get_alignment > f x
gtk_tree_view_column_get_cell_renderers > x x
gtk_tree_view_column_get_clickable > i x
gtk_tree_view_column_get_expand > i x
gtk_tree_view_column_get_max_width > x x
gtk_tree_view_column_get_min_width > x x
gtk_tree_view_column_get_reorderable > i x
gtk_tree_view_column_get_resizable > i x
gtk_tree_view_column_get_sort_indicator > i x
gtk_tree_view_column_get_sort_order > i x
gtk_tree_view_column_get_title > x x
gtk_tree_view_column_get_visible > i x
gtk_tree_view_column_get_widget > x x
gtk_tree_view_column_new > x
gtk_tree_view_column_new_with_attributes > x *c x x
gtk_tree_view_column_pack_start > n x x i
gtk_tree_view_column_set_alignment > n x f
gtk_tree_view_column_set_attributes > n x x x
gtk_tree_view_column_set_clickable > n x i
gtk_tree_view_column_set_expand > n x i
gtk_tree_view_column_set_max_width > n x x
gtk_tree_view_column_set_min_width > n x x
gtk_tree_view_column_set_reorderable > n x i
gtk_tree_view_column_set_resizable > n x i
gtk_tree_view_column_set_sizing > n x x
gtk_tree_view_column_set_sort_indicator > n x i
gtk_tree_view_column_set_sort_order > n x i
gtk_tree_view_column_set_title > n x *c
gtk_tree_view_column_set_visible > n x i
gtk_tree_view_column_set_widget > n x x
gtk_tree_view_get_column > x x x
gtk_tree_view_get_columns > x x
gtk_tree_view_get_cursor > n x x x
gtk_tree_view_get_grid_lines > x x
gtk_tree_view_get_headers_visible > i x
gtk_tree_view_get_iter_from_string > x x *c
gtk_tree_view_get_model > x x
gtk_tree_view_get_reorderable > i x
gtk_tree_view_get_selection > x x
gtk_tree_view_get_tooltip_column > x x
gtk_tree_view_get_visible_range > i x x x
gtk_tree_view_insert_column > x x x i
gtk_tree_view_insert_column_with_attributes > x x x *c x *c x *c
gtk_tree_view_insert_column_with_attributes_1 > x x x *c x *c
gtk_tree_view_new > x
gtk_tree_view_new_with_model > x x
gtk_tree_view_row_activated > n x x x
gtk_tree_view_scroll_to_cell > n x x x i d d
gtk_tree_view_set_cursor > n x x x i
gtk_tree_view_set_enable_search > n x i
gtk_tree_view_set_fixed_height_mode > n x i
gtk_tree_view_set_grid_lines > n x x
gtk_tree_view_set_headers_visible > n x i
gtk_tree_view_set_model > n x x
gtk_tree_view_set_reorderable > n x i
gtk_tree_view_set_rules_hint > n x i
gtk_tree_view_set_tooltip_column > n x x

gtk_ui_manager_add_ui_from_file > i x *c *x
gtk_ui_manager_add_ui_from_file_utf8 > i x *c *x : win64 version
gtk_ui_manager_new > x

gtk_vbox_new > x x x
gtk_vseparator_new > x

: widget,title,parent,action,stock_cancel,response_cancel,stock_ok,response_ok,null
gtk_widget_add_accelerator > n x *c x c x x
gtk_widget_add_accelerator > n x *c x i x x
gtk_widget_add_events > n x x
gtk_widget_create_pango_context > x x
gtk_widget_create_pango_layout > x x *c
gtk_widget_destroy > n x
gtk_widget_get_allocation > n x *i
gtk_widget_get_allocated_height > i x
gtk_widget_get_allocated_width > i x
gtk_widget_get_name > x x
gtk_widget_get_pango_context > x x
gtk_widget_get_parent > x x
gtk_widget_get_parent_window > x x
gtk_widget_get_toplevel > x x
gtk_widget_get_window > x x
gtk_widget_grab_focus > n x
gtk_widget_hide > n x
gtk_widget_hide_all > n x
gtk_widget_hide > i x
gtk_widget_modify_base > n x i *c
gtk_widget_modify_font > n x x        : void view font_desc
gtk_widget_modify_text > n x i *c
gtk_widget_queue_draw > n x
gtk_widget_queue_draw_area > n x x x x x
gtk_widget_set_can_focus > n x i
gtk_widget_set_colormap > n x x
gtk_widget_set_double_buffered > n x i
gtk_widget_set_events > n x x
gtk_widget_set_name > n x *c
gtk_widget_set_sensitive > n x i
gtk_widget_set_size_request > n x x x
gtk_widget_set_tooltip_markup > n x *c
gtk_widget_set_tooltip_text > n x *c
gtk_widget_show > n x
gtk_widget_show_all > n x
gtk_widget_show_now > n x

gtk_window_activate_focus > i x
gtk_window_add_accel_group > n x x
gtk_window_get_gravity > i x
gtk_window_get_position > n x *i *i
gtk_window_get_screen > x x
gtk_window_get_size > n x *i *i
gtk_window_get_title > x x
gtk_window_is_active > i x
gtk_window_list_toplevels > x
gtk_window_maximize > n x
gtk_window_move > n x i i
gtk_window_new > x x
gtk_window_present > n x
gtk_window_present_with_time > n x i
gtk_window_resize > n x i i
gtk_window_set_decorated > n x i
gtk_window_set_default_size > n x x x : void window width height
gtk_window_set_destroy_with_parent > n x i
gtk_window_set_gravity > n x i
gtk_window_set_icon > n x x
gtk_window_set_icon_from_file > i x *c x
gtk_window_set_icon_from_file_utf8 > i x *c x : win64 version
gtk_window_set_keep_above > n x i
gtk_window_set_modal > n x x
gtk_window_set_position > n x x
gtk_window_set_resizable > n x i
gtk_window_set_title > n x *c         : void window title
gtk_window_set_transient_for > n x x
gtk_window_set_type_hint > n x i      : void window GdkWindowTypeHint

: printing
gtk_page_setup_copy > x x
gtk_page_setup_get_bottom_margin > d x i
gtk_page_setup_get_left_margin > d x i
gtk_page_setup_get_orientation > i x
gtk_page_setup_get_page_height > d x i
gtk_page_setup_get_page_width > d x i
gtk_page_setup_get_paper_height > d x i
gtk_page_setup_get_paper_size > x x
gtk_page_setup_get_paper_width > d x i
gtk_page_setup_get_right_margin > d x i
gtk_page_setup_get_top_margin > d x i
gtk_page_setup_get_type > x
gtk_page_setup_load_file > i x *c x
gtk_page_setup_load_key_file > i x x *c x
gtk_page_setup_new > x
gtk_page_setup_new_from_file > x *c x
gtk_page_setup_new_from_key_file > x x *c x
gtk_page_setup_set_bottom_margin > n x d i
gtk_page_setup_set_left_margin > n x d i
gtk_page_setup_set_orientation > n x i
gtk_page_setup_set_paper_size > n x x
gtk_page_setup_set_paper_size_and_default_margins > n x x
gtk_page_setup_set_right_margin > n x d i
gtk_page_setup_set_top_margin > n x d i
gtk_page_setup_to_file > i x *c x
gtk_page_setup_to_key_file > n x x *c
gtk_paper_size_copy > x x
gtk_paper_size_free > n x
gtk_paper_size_get_default > x
gtk_paper_size_get_default_bottom_margin > d x i
gtk_paper_size_get_default_left_margin > d x i
gtk_paper_size_get_default_right_margin > d x i
gtk_paper_size_get_default_top_margin > d x i
gtk_paper_size_get_display_name > x x
gtk_paper_size_get_height > d x i
gtk_paper_size_get_name > x x
gtk_paper_size_get_paper_sizes > x i
gtk_paper_size_get_ppd_name > x x
gtk_paper_size_get_type > x
gtk_paper_size_get_width > d x i
gtk_paper_size_is_custom > i x
gtk_paper_size_is_equal > i x x
gtk_paper_size_new > x *c
gtk_paper_size_new_custom > x *c *c d d i
gtk_paper_size_new_from_key_file > x x *c x
gtk_paper_size_new_from_ppd > x *c *c d d
gtk_paper_size_set_size > n x d d i
gtk_paper_size_to_key_file > n x x *c
gtk_print_context_create_pango_context > x x
gtk_print_context_create_pango_layout > x x
gtk_print_context_get_cairo_context > x x
gtk_print_context_get_dpi_x > d x
gtk_print_context_get_dpi_y > d x
gtk_print_context_get_hard_margins > i x *d *d *d *d
gtk_print_context_get_height > d x
gtk_print_context_get_page_setup > x x
gtk_print_context_get_pango_fontmap > x x
gtk_print_context_get_type > x
gtk_print_context_get_width > d x
gtk_print_context_set_cairo_context > n x x d d
gtk_print_error_quark > i
gtk_print_operation_cancel > n x
gtk_print_operation_draw_page_finish > n x
gtk_print_operation_get_default_page_setup > x x
gtk_print_operation_get_embed_page_setup > i x
gtk_print_operation_get_error > n x x
gtk_print_operation_get_has_selection > i x
gtk_print_operation_get_n_pages_to_print > i x
gtk_print_operation_get_print_settings > x x
gtk_print_operation_get_status > i x
gtk_print_operation_get_status_string > x x
gtk_print_operation_get_support_selection > i x
gtk_print_operation_get_type > x
gtk_print_operation_is_finished > i x
gtk_print_operation_new > x
gtk_print_operation_preview_end_preview > n x
gtk_print_operation_preview_get_type > x
gtk_print_operation_preview_is_selected > i x i
gtk_print_operation_preview_render_page > n x i
gtk_print_operation_run > i x i x x
gtk_print_operation_set_allow_async > n x i
gtk_print_operation_set_current_page > n x i
gtk_print_operation_set_custom_tab_label > n x *c
gtk_print_operation_set_default_page_setup > n x x
gtk_print_operation_set_defer_drawing > n x
gtk_print_operation_set_embed_page_setup > n x i
gtk_print_operation_set_export_filename > n x *c
gtk_print_operation_set_has_selection > n x i
gtk_print_operation_set_job_name > n x *c
gtk_print_operation_set_n_pages > n x i
gtk_print_operation_set_print_settings > n x x
gtk_print_operation_set_show_progress > n x i
gtk_print_operation_set_support_selection > n x i
gtk_print_operation_set_track_print_status > n x i
gtk_print_operation_set_unit > n x i
gtk_print_operation_set_use_full_page > n x i
gtk_print_run_page_setup_dialog > x x x x
gtk_print_run_page_setup_dialog_async > n x x x x x
gtk_print_settings_copy > x x
gtk_print_settings_foreach > n x x x
gtk_print_settings_get > x x *c
gtk_print_settings_get_bool > i x *c
gtk_print_settings_get_collate > i x
gtk_print_settings_get_default_source > x x
gtk_print_settings_get_dither > x x
gtk_print_settings_get_double > d x *c
gtk_print_settings_get_double_with_default > d x *c d
gtk_print_settings_get_duplex > i x
gtk_print_settings_get_finishings > x x
gtk_print_settings_get_int > i x *c
gtk_print_settings_get_int_with_default > i x *c i
gtk_print_settings_get_length > d x *c i
gtk_print_settings_get_media_type > x x
gtk_print_settings_get_n_copies > i x
gtk_print_settings_get_number_up > i x
gtk_print_settings_get_number_up_layout > i x
gtk_print_settings_get_orientation > i x
gtk_print_settings_get_output_bin > x x
gtk_print_settings_get_page_ranges > x x *i
gtk_print_settings_get_page_set > i x
gtk_print_settings_get_paper_height > d x i
gtk_print_settings_get_paper_size > x x
gtk_print_settings_get_paper_width > d x i
gtk_print_settings_get_print_pages > i x
gtk_print_settings_get_printer > x x
gtk_print_settings_get_printer_lpi > d x
gtk_print_settings_get_quality > i x
gtk_print_settings_get_resolution > i x
gtk_print_settings_get_resolution_x > i x
gtk_print_settings_get_resolution_y > i x
gtk_print_settings_get_reverse > i x
gtk_print_settings_get_scale > d x
gtk_print_settings_get_type > x
gtk_print_settings_get_use_color > i x
gtk_print_settings_has_key > i x *c
gtk_print_settings_load_file > i x *c x
gtk_print_settings_load_key_file > i x x *c x
gtk_print_settings_new > x
gtk_print_settings_new_from_file > x *c x
gtk_print_settings_new_from_key_file > x x *c x
gtk_print_settings_set > n x *c *c
gtk_print_settings_set_bool > n x *c i
gtk_print_settings_set_collate > n x i
gtk_print_settings_set_default_source > n x *c
gtk_print_settings_set_dither > n x *c
gtk_print_settings_set_double > n x *c d
gtk_print_settings_set_duplex > n x i
gtk_print_settings_set_finishings > n x *c
gtk_print_settings_set_int > n x *c i
gtk_print_settings_set_length > n x *c d i
gtk_print_settings_set_media_type > n x *c
gtk_print_settings_set_n_copies > n x i
gtk_print_settings_set_number_up > n x i
gtk_print_settings_set_number_up_layout > n x i
gtk_print_settings_set_orientation > n x i
gtk_print_settings_set_output_bin > n x *c
gtk_print_settings_set_page_ranges > n x x i
gtk_print_settings_set_page_set > n x i
gtk_print_settings_set_paper_height > n x d i
gtk_print_settings_set_paper_size > n x x
gtk_print_settings_set_paper_width > n x d i
gtk_print_settings_set_print_pages > n x i
gtk_print_settings_set_printer > n x *c
gtk_print_settings_set_printer_lpi > n x d
gtk_print_settings_set_quality > n x i
gtk_print_settings_set_resolution > n x i
gtk_print_settings_set_resolution_xy > n x i i
gtk_print_settings_set_reverse > n x i
gtk_print_settings_set_scale > n x d
gtk_print_settings_set_use_color > n x i
gtk_print_settings_to_file > i x *c x
gtk_print_settings_to_key_file > n x x *c
gtk_print_settings_unset > n x *c
)
libpixbuf cddef each <;._2 [ 0 : 0
gdk_pixbuf_add_alpha > x x i x x x : buf,use_substitute_color?,r,g,b
gdk_pixbuf_new > x x x x x x : GDK_COLORSPACE_RGB,alpha,bits,w,h
gdk_pixbuf_new_from_data > x x x x x x x x x x : ad,cmap,alpha,bits,w,h,rowstride,destroyfn,fndata
gdk_pixbuf_new_from_file > x *c x : filename,errorloc
gdk_pixbuf_new_from_file_utf8 > x *c x : win64 version
gdk_pixbuf_new_from_file_at_size > x *c x x x
gdk_pixbuf_new_from_file_at_size_utf8 > x *c x x x : win64 version
gdk_pixbuf_new_from_file_at_scale > x *c x x i x
gdk_pixbuf_new_from_file_at_scale_utf8 > x *c x x i x : win64 version
gdk_pixbuf_get_width > x x
gdk_pixbuf_get_height > x x
gdk_pixbuf_get_pixels > x x
gdk_pixbuf_get_rowstride > x x
gdk_pixbuf_get_n_channels > x x
gdk_pixbuf_get_has_alpha > x x
gdk_pixbuf_get_bits_per_sample > x x
gdk_pixbuf_save > i x *c *c x x
gdk_pixbuf_save_utf8 > i x *c *c x x
)
libgobject cddef each <;._2 [ 0 : 0
g_object_get n x *c *x x : get int property - last arg 0 ends vararg
g_object_get_data > x x *c
g_object_set n x *c x x : set int property - last arg 0 ends vararg
g_object_set_data > n x *c x
g_object_ref > x x
g_object_unref > n x
g_signal_connect_data x x *c x x x x
g_type_init > n
g_type_name > x x
g_value_init > x *x s
g_value_set_static_string > n * *
g_value_take_string > n x *c
g_object_ref_sink > x x
)


libpango cddef each <;._2 [ 0 : 0
pango_font_description_from_string > x *c : font_desc font_string
pango_font_description_free > n x         : font_desc
pango_font_description_set_size > n x i
pango_font_description_set_weight > n x i : bold=700
pango_layout_new > x x
pango_layout_get_context > x x
pango_layout_set_attributes > n x x
pango_layout_set_spacing > n x x
pango_layout_set_text > n x *c x
pango_layout_set_font_description > n x x
pango_layout_get_pixel_extents > n x x *x
pango_layout_get_pixel_size n x *x *x
pango_matrix_rotate > n *d d
pango_context_set_matrix > n x *d
pango_layout_context_changed > n x

:pango attribute
pango_attr_list_change > n x x
pango_attr_list_insert > n x x
pango_attr_list_new > x
pango_attr_list_unref > n x
pango_attr_underline_new > x i
pango_attribute_destroy > n x
)
libgtksourceview cddef each <;._2 [ 0 : 0
gtk_source_buffer_new > x x
gtk_source_buffer_new_with_language > x x
gtk_source_buffer_redo > n x
gtk_source_buffer_set_highlight_matching_brackets > n x i
gtk_source_buffer_set_highlight_syntax > n x i
gtk_source_buffer_set_language > n x x
gtk_source_buffer_set_style_scheme > n x x
gtk_source_buffer_undo > n x
gtk_source_buffer_begin_not_undoable_action > n x
gtk_source_buffer_end_not_undoable_action > n x
gtk_source_language_manager_get_default > x
gtk_source_language_manager_get_language > x x *c
gtk_source_language_manager_get_language_ids > x x
gtk_source_language_manager_get_search_path > x x
gtk_source_language_manager_guess_language > x x *c *x
gtk_source_language_manager_set_search_path > n x x
gtk_source_print_compositor_draw_page > n x x i
gtk_source_print_compositor_get_n_pages > i x
gtk_source_print_compositor_new > x x
gtk_source_print_compositor_new_from_view > x x
gtk_source_print_compositor_paginate > i x x
gtk_source_style_scheme_get_id > x x
gtk_source_style_scheme_manager_get_default > x
gtk_source_style_scheme_manager_get_scheme > x x *c
gtk_source_style_scheme_manager_get_scheme_ids > x x
gtk_source_style_scheme_manager_get_search_path > x x
gtk_source_style_scheme_manager_new > x
gtk_source_style_scheme_manager_set_search_path > n x x
gtk_source_view_get_show_line_numbers > i x
gtk_source_view_new > x
gtk_source_view_new_with_buffer > x x
gtk_source_view_set_auto_indent > n x i
gtk_source_view_set_highlight_current_line > n x i
gtk_source_view_set_show_line_numbers > n x i
gtk_source_view_set_tab_width > n x i
)
libcairo cddef each <;._2 [ 0 : 0
cairo_version > i
cairo_version_string > x
cairo_create > x x
cairo_reference > x x
cairo_destroy > n x
cairo_get_reference_count > i x
cairo_get_user_data > x x x
cairo_set_user_data > i x x * x
cairo_save > n x
cairo_restore > n x
cairo_push_group > n x
cairo_push_group_with_content > n x i
cairo_pop_group > x x
cairo_pop_group_to_source > n x
cairo_set_operator > n x i
cairo_set_source > n x x
cairo_set_source_rgb > n x d d d
cairo_set_source_rgba > n x d d d d
cairo_set_source_surface > n x x d d
cairo_set_tolerance > n x d
cairo_set_antialias > n x i
cairo_set_fill_rule > n x i
cairo_set_line_width > n x d
cairo_set_line_cap > n x i
cairo_set_line_join > n x i
cairo_set_dash > n x *d i d
cairo_set_miter_limit > n x d
cairo_translate > n x d d
cairo_scale > n x d d
cairo_rotate > n x d
cairo_transform > n x x
cairo_set_matrix > n x x
cairo_identity_matrix > n x
cairo_user_to_device > n x *d *d
cairo_user_to_device_distance > n x *d *d
cairo_device_to_user > n x *d *d
cairo_device_to_user_distance > n x *d *d
cairo_new_path > n x
cairo_move_to > n x d d
cairo_new_sub_path > n x
cairo_line_to > n x d d
cairo_curve_to > n x d d d d d d
cairo_arc > n x d d d d d
cairo_arc_negative > n x d d d d d
cairo_rel_move_to > n x d d
cairo_rel_line_to > n x d d
cairo_rel_curve_to > n x d d d d d d
cairo_rectangle > n x d d d d
cairo_close_path > n x
cairo_path_extents > n x *d *d *d *d
cairo_paint > n x
cairo_paint_with_alpha > n x d
cairo_mask > n x x
cairo_mask_surface > n x x d d
cairo_stroke > n x
cairo_stroke_preserve > n x
cairo_fill > n x
cairo_fill_preserve > n x
cairo_copy_page > n x
cairo_show_page > n x
cairo_in_stroke > i x d d
cairo_in_fill > i x d d
cairo_stroke_extents > n x *d *d *d *d
cairo_fill_extents > n x *d *d *d *d
cairo_reset_clip > n x
cairo_clip > n x
cairo_clip_preserve > n x
cairo_clip_extents > n x *d *d *d *d
cairo_copy_clip_rectangle_list > x x
cairo_rectangle_list_destroy > n x
cairo_glyph_allocate > x i
cairo_glyph_free > n x
cairo_text_cluster_allocate > x i
cairo_text_cluster_free > n x
cairo_font_options_create > x
cairo_font_options_copy > x x
cairo_font_options_destroy > n x
cairo_font_options_status > i x
cairo_font_options_merge > n x x
cairo_font_options_equal > i x x
cairo_font_options_hash > x x
cairo_font_options_set_antialias > n x i
cairo_font_options_get_antialias > i x
cairo_font_options_set_subpixel_order > n x i
cairo_font_options_get_subpixel_order > i x
cairo_font_options_set_hint_style > n x i
cairo_font_options_get_hint_style > i x
cairo_font_options_set_hint_metrics > n x i
cairo_font_options_get_hint_metrics > i x
cairo_select_font_face > n x *c i i
cairo_set_font_size > n x d
cairo_set_font_matrix > n x x
cairo_get_font_matrix > n x x
cairo_set_font_options > n x x
cairo_get_font_options > n x x
cairo_set_font_face > n x x
cairo_get_font_face > x x
cairo_set_scaled_font > n x x
cairo_get_scaled_font > x x
cairo_show_text > n x *c
cairo_show_glyphs > n x x i
cairo_show_text_glyphs > n x *c i x i x i i
cairo_text_path > n x *c
cairo_glyph_path > n x x i
cairo_text_extents > n x *c x
cairo_glyph_extents > n x x i x
cairo_font_extents > n x x
cairo_font_face_reference > x x
cairo_font_face_destroy > n x
cairo_font_face_get_reference_count > i x
cairo_font_face_status > i x
cairo_font_face_get_type > i x
cairo_font_face_get_user_data > x x x
cairo_font_face_set_user_data > i x x * x
cairo_scaled_font_create > x x x x x
cairo_scaled_font_reference > x x
cairo_scaled_font_destroy > n x
cairo_scaled_font_get_reference_count > i x
cairo_scaled_font_status > i x
cairo_scaled_font_get_type > i x
cairo_scaled_font_get_user_data > x x x
cairo_scaled_font_set_user_data > i x x * x
cairo_scaled_font_extents > n x x
cairo_scaled_font_text_extents > n x *c x
cairo_scaled_font_glyph_extents > n x x i x
cairo_scaled_font_text_to_glyphs > i x d d *c i *x i * *x i * x
cairo_scaled_font_get_font_face > x x
cairo_scaled_font_get_font_matrix > n x x
cairo_scaled_font_get_ctm > n x x
cairo_scaled_font_get_scale_matrix > n x x
cairo_scaled_font_get_font_options > n x x
cairo_toy_font_face_create > x *c i i
cairo_toy_font_face_get_family > x x
cairo_toy_font_face_get_slant > i x
cairo_toy_font_face_get_weight > i x
cairo_user_font_face_create > x
cairo_user_font_face_set_init_func > n x x
cairo_user_font_face_set_render_glyph_func > n x x
cairo_user_font_face_set_text_to_glyphs_func > n x x
cairo_user_font_face_set_unicode_to_glyph_func > n x x
cairo_user_font_face_get_init_func >x x
cairo_user_font_face_get_render_glyph_func >x x
cairo_user_font_face_get_text_to_glyphs_func >x x
cairo_user_font_face_get_unicode_to_glyph_func >x x
cairo_get_operator > i x
cairo_get_source > x x
cairo_get_tolerance > d x
cairo_get_antialias > i x
cairo_has_current_point > i x
cairo_get_current_point > n x *d *d
cairo_get_fill_rule > i x
cairo_get_line_width > d x
cairo_get_line_cap > i x
cairo_get_line_join > i x
cairo_get_miter_limit > d x
cairo_get_dash_count > i x
cairo_get_dash > n x *d *d
cairo_get_matrix > n x x
cairo_get_target > x x
cairo_get_group_target > x x
cairo_copy_path > x x
cairo_copy_path_flat > x x
cairo_append_path > n x x
cairo_path_destroy > n x
cairo_status > i x
cairo_status_to_string > x i
cairo_surface_create_similar > x x i i i
cairo_surface_reference > x x
cairo_surface_finish > n x
cairo_surface_destroy > n x
cairo_surface_get_reference_count > i x
cairo_surface_status > i x
cairo_surface_get_type > i x
cairo_surface_get_content > i x
cairo_surface_write_to_png > i x *c
cairo_surface_write_to_png_stream > i x x *
cairo_surface_get_user_data > x x x
cairo_surface_set_user_data > i x x * x
cairo_surface_get_font_options > n x x
cairo_surface_flush > n x
cairo_surface_mark_dirty > n x
cairo_surface_mark_dirty_rectangle > n x i i i i
cairo_surface_set_device_offset > n x d d
cairo_surface_get_device_offset > n x *d *d
cairo_surface_set_fallback_resolution > n x d d
cairo_surface_get_fallback_resolution > n x *d *d
cairo_surface_copy_page > n x
cairo_surface_show_page > n x
cairo_surface_has_show_text_glyphs > i x
cairo_image_surface_create > x i i i
cairo_format_stride_for_width > i i i
cairo_image_surface_create_for_data > x *c i i i i
cairo_image_surface_get_data > x x
cairo_image_surface_get_format > i x
cairo_image_surface_get_width > i x
cairo_image_surface_get_height > i x
cairo_image_surface_get_stride > i x
cairo_image_surface_create_from_png > x *c
cairo_image_surface_create_from_png_stream > x x *
cairo_pattern_create_rgb > x d d d
cairo_pattern_create_rgba > x d d d d
cairo_pattern_create_for_surface > x x
cairo_pattern_create_linear > x d d d d
cairo_pattern_create_radial > x d d d d d d
cairo_pattern_reference > x x
cairo_pattern_destroy > n x
cairo_pattern_get_reference_count > i x
cairo_pattern_status > i x
cairo_pattern_get_user_data > x x x
cairo_pattern_set_user_data > i x x * x
cairo_pattern_get_type > i x
cairo_pattern_add_color_stop_rgb > n x d d d d
cairo_pattern_add_color_stop_rgba > n x d d d d d
cairo_pattern_set_matrix > n x x
cairo_pattern_get_matrix > n x x
cairo_pattern_set_extend > n x i
cairo_pattern_get_extend > i x
cairo_pattern_set_filter > n x i
cairo_pattern_get_filter > i x
cairo_pattern_get_rgba > i x *d *d *d *d
cairo_pattern_get_surface > i x *x
cairo_pattern_get_color_stop_rgba > i x i *d *d *d *d *d
cairo_pattern_get_color_stop_count > i x i *
cairo_pattern_get_linear_points > i x *d *d *d *d
cairo_pattern_get_radial_circles > i x *d *d *d *d *d *d
cairo_matrix_init > n x d d d d d d
cairo_matrix_init_identity > n x
cairo_matrix_init_translate > n x d d
cairo_matrix_init_scale > n x d d
cairo_matrix_init_rotate > n x d
cairo_matrix_translate > n x d d
cairo_matrix_scale > n x d d
cairo_matrix_rotate > n x d
cairo_matrix_invert > i x
cairo_matrix_multiply > n x x x
cairo_matrix_transform_distance > n x *d *d
cairo_matrix_transform_point > n x *d *d
cairo_debug_reset_static_data > n
)
libpangocairo cddef each <;._2 [ 0 : 0
pango_cairo_font_map_get_type > x
pango_cairo_font_map_new > x
pango_cairo_font_map_new_for_font_type > x i
pango_cairo_font_map_get_default > x
pango_cairo_font_map_set_default > n x
pango_cairo_font_map_get_font_type > i x
pango_cairo_font_map_set_resolution > n x d
pango_cairo_font_map_get_resolution > d x
pango_cairo_font_map_create_context > x x
pango_cairo_font_get_type > x
pango_cairo_font_get_scaled_font > x x
pango_cairo_update_context > n x x
pango_cairo_context_set_font_options > n x x
pango_cairo_context_get_font_options > x x
pango_cairo_context_set_resolution > n x d
pango_cairo_context_get_resolution > d x
pango_cairo_context_set_shape_renderer > n x x x x
pango_cairo_context_get_shape_renderer > x x *x
pango_cairo_create_context > x x
pango_cairo_create_layout > x x
pango_cairo_update_layout > n x x
pango_cairo_show_glyph_string > n x x x
pango_cairo_show_glyph_item > n x *c x
pango_cairo_show_layout_line > n x x
pango_cairo_show_layout > n x x
pango_cairo_show_error_underline > n x d d d d
pango_cairo_glyph_string_path > n x x x
pango_cairo_layout_line_path > n x x
pango_cairo_layout_path > n x x
pango_cairo_error_underline_path > n x d d d d
)
gdk_pixbuf_save_2=: ((>libpixbuf),' gdk_pixbuf_save >',(IFWIN#'+'),' i x *c *c x *c *c x')&(15!:0)
gdk_pixbuf_save_2_utf8=: ((>libpixbuf),' gdk_pixbuf_save_utf8 >',(IFWIN#'+'),' i x *c *c x *c *c x')&(15!:0)
3 : 0''
if. (2=GTKVER_j_) *. IFWIN *. IF64 do.
  gdk_pixbuf_animation_new_from_file=: gdk_pixbuf_animation_new_from_file_utf8
  gdk_pixbuf_new_from_file=: gdk_pixbuf_new_from_file_utf8
  gdk_pixbuf_new_from_file_at_scale=: gdk_pixbuf_new_from_file_at_scale_utf8
  gdk_pixbuf_new_from_file_at_size=: gdk_pixbuf_new_from_file_at_size_utf8
  gdk_pixbuf_save=: gdk_pixbuf_save_utf8
  gdk_pixbuf_save_2=: gdk_pixbuf_save_2_utf8
  gdk_pixbuf_savev=: gdk_pixbuf_savev_utf8
  gtk_accel_map_load=: gtk_accel_map_load_utf8
  gtk_accel_map_save=: gtk_accel_map_save_utf8
  gtk_file_chooser_add_shortcut_folder=: gtk_file_chooser_add_shortcut_folder_utf8
  gtk_file_chooser_get_current_folder=: gtk_file_chooser_get_current_folder_utf8
  gtk_file_chooser_get_filename=: gtk_file_chooser_get_filename_utf8
  gtk_file_chooser_get_filenames=: gtk_file_chooser_get_filenames_utf8
  gtk_file_chooser_get_preview_filename=: gtk_file_chooser_get_preview_filename_utf8
  gtk_file_chooser_list_shortcut_folders=: gtk_file_chooser_list_shortcut_folders_utf8
  gtk_file_chooser_remove_shortcut_folder=: gtk_file_chooser_remove_shortcut_folder_utf8
  gtk_file_chooser_select_filename=: gtk_file_chooser_select_filename_utf8
  gtk_file_chooser_set_current_folder=: gtk_file_chooser_set_current_folder_utf8
  gtk_file_chooser_set_filename=: gtk_file_chooser_set_filename_utf8
  gtk_file_chooser_unselect_filename=: gtk_file_chooser_unselect_filename_utf8
  gtk_file_selection_get_filename=: gtk_file_selection_get_filename_utf8
  gtk_file_selection_get_selections=: gtk_file_selection_get_selections_utf8
  gtk_file_selection_set_filename=: gtk_file_selection_set_filename_utf8
  gtk_icon_info_get_filename=: gtk_icon_info_get_filename_utf8
  gtk_icon_source_get_filename=: gtk_icon_source_get_filename_utf8
  gtk_icon_source_set_filename=: gtk_icon_source_set_filename_utf8
  gtk_icon_theme_append_search_path=: gtk_icon_theme_append_search_path_utf8
  gtk_icon_theme_get_search_path=: gtk_icon_theme_get_search_path_utf8
  gtk_icon_theme_prepend_search_path=: gtk_icon_theme_prepend_search_path_utf8
  gtk_icon_theme_set_search_path=: gtk_icon_theme_set_search_path_utf8
  gtk_image_new_from_file=: gtk_image_new_from_file_utf8
  gtk_image_set_from_file=: gtk_image_set_from_file_utf8
  gtk_rc_add_default_file=: gtk_rc_add_default_file_utf8
  gtk_rc_parse=: gtk_rc_parse_utf8
  gtk_rc_set_default_files=: gtk_rc_set_default_files_utf8
  gtk_ui_manager_add_ui_from_file=: gtk_ui_manager_add_ui_from_file_utf8
  gtk_window_set_default_icon_from_file=: gtk_window_set_default_icon_from_file_utf8
  gtk_window_set_icon_from_file=: gtk_window_set_icon_from_file_utf8
end.
''
)
getGdkEventConfigure_xywh=: 3 : '_2 ic memr y, GdkEventConfigure_xywh, 16, JCHAR'
getGdkEventExposewindow=: 3 : '_2 ic memr y, GdkEventExpose_window, 4 ,JCHAR'
getGdkEventKey=: 3 : '_2 ic memr y, GdkEventKey, 8 ,JCHAR'
getGdkEventMotion_xy=: 3 : 'memr y, GdkEventMotion_xy, 2, JFL'
getGtkAdjustment=: 3 : 'memr y, 0, 6, JFL'

getGtkStylefg_gc=: 3 : '{. memr y, GtkStyle_fg_gc, 5, JPTR'
getGtkStyleblack_gc=: 3 : '{. memr y, GtkStyle_black_gc, 1, JPTR'
getGtkStylewhite_gc=: 3 : '{. memr y, GtkStyle_white_gc, 1, JPTR'

getGtkWidgetWindow=: 3 : 0
if. 3=GTKVER_j_ do.
  gtk_widget_get_window_jgtk_ y
else.
  {. memr y, GtkWidget_window, 1, JPTR
end.
)

getGtkWidgetRequisition=: 3 : '_2 ic memr y, GtkWidget_requisition, 8, JCHAR'
getGtkWidgetAllocation=: 3 : 0
if. 3=GTKVER_j_ do.
  gtk_widget_get_allocation y;alloc=. ,4#_1
  alloc
else.
  _2 ic memr y, GtkWidget_allocation, 16, JCHAR
end.
)

getGtkWidgetstyle=: 3 : '{. memr y, GtkWidget_style, 1, JPTR'
getGtkWidgetstate=: 3 : 'a.&i. {. memr y, GtkWidget_state, 1, JCHAR'

getdagc=: 3 :'getGtkStylefg_gc getGtkWidgetstyle y'
getsha1=: 3 : 'readstringfree g_compute_checksum_for_string 1;(,y);#y'

G_OBJECT_TYPE=: 3 : '{.memr 0 1 4,~ memr y,0 1 4'
helper_g_locale_to_utf8=: 3 : 's [ g_free p [ s=. memr 0 _1 2,~ p=. g_locale_to_utf8 y;_1;(<0);(<0);0'
helper_g_locale_from_utf8=: 3 : 's [ g_free p [ s=. memr 0 _1 2,~ p=. g_locale_from_utf8 y;_1;(<0);(<0);0'
getGtkToplevelWindows=: 3 : 0
z=. 0$0
if. 0~:list=. gtk_window_list_toplevels '' do.
  for_i. i. g_list_length list do.
    if. 'GtkWindow' -: memr 0 _1 2,~ g_type_name G_OBJECT_TYPE r=. g_list_nth_data list,i do.
      z=. z, g_list_nth_data list,i
    end.
  end.
  g_list_free list
end.
z
)
wdfit=: 0:
wdmove=: 3 : 0
'widget x y'=. y
'w h'=. _2{. getGtkWidgetAllocation widget
if. (_1=x) *. _1=y do.
  gtk_window_move widget, getscreenwh''-w,h
elseif. _1=x do.
  gtk_window_move widget,(w-~{.getscreenwh''), y
elseif. _1=y do.
  gtk_window_move widget,x,(h-~{:getscreenwh'')
elseif. do.
  gtk_window_move widget,x,y
end.
EMPTY
)
wdisparent=: 3 : 0
y=. ,>y
z=. 0$0
for_a. getGtkToplevelWindows'' do.
  if. 0~:r=. gtk_widget_get_name a do.
    if. 'GtkWindow' -: memr 0 _1 2,~ r do.
      if. 0~:s=. gtk_widget_get_name a do.
        if. y -: memr 0 _1 2,~ s do.
          z=. z, a
        end.
      end.
    end.
  end.
end.
if. 0=#z do. z=. 0 end.
z
)
gtk_gettypes=: 3 : 0
t=. [;._2 GTKTYPES
t=. ((>libgtk),' ') ,"1 t ,"1 ' >',"1 (2*IFUNIX) }. ' + x'
t (15!:0 ::0:)"1 ''   
EMPTY
)
GTKTYPES=: 0 : 0
gtk_about_dialog_get_type
gtk_accel_flags_get_type
gtk_accel_group_get_type
gtk_accel_label_get_type
gtk_accel_map_get_type
gtk_accessible_get_type
gtk_action_get_type
gtk_action_group_get_type
gtk_activatable_get_type
gtk_adjustment_get_type
gtk_alignment_get_type
gtk_anchor_type_get_type
gtk_arg_flags_get_type
gtk_arrow_get_type
gtk_arrow_placement_get_type
gtk_arrow_type_get_type
gtk_aspect_frame_get_type
gtk_assistant_get_type
gtk_assistant_page_type_get_type
gtk_attach_options_get_type
gtk_bin_get_type
gtk_border_get_type
gtk_box_get_type
gtk_buildable_get_type
gtk_builder_error_get_type
gtk_builder_get_type
gtk_button_action_get_type
gtk_button_box_get_type
gtk_button_box_style_get_type
gtk_button_get_type
gtk_buttons_type_get_type
gtk_calendar_display_options_get_type
gtk_calendar_get_type
gtk_cell_editable_get_type
gtk_cell_layout_get_type
gtk_cell_renderer_accel_get_type
gtk_cell_renderer_accel_mode_get_type
gtk_cell_renderer_combo_get_type
gtk_cell_renderer_get_type
gtk_cell_renderer_mode_get_type
gtk_cell_renderer_pixbuf_get_type
gtk_cell_renderer_progress_get_type
gtk_cell_renderer_spin_get_type
gtk_cell_renderer_spinner_get_type
gtk_cell_renderer_state_get_type
gtk_cell_renderer_text_get_type
gtk_cell_renderer_toggle_get_type
gtk_cell_type_get_type
gtk_cell_view_get_type
gtk_check_button_get_type
gtk_check_menu_item_get_type
gtk_clipboard_get_type
gtk_clist_drag_pos_get_type
gtk_color_button_get_type
gtk_color_selection_dialog_get_type
gtk_color_selection_get_type
gtk_combo_box_entry_get_type
gtk_combo_box_get_type
gtk_container_get_type
gtk_corner_type_get_type
gtk_ctree_expander_style_get_type
gtk_ctree_expansion_type_get_type
gtk_ctree_line_style_get_type
gtk_ctree_pos_get_type
gtk_curve_type_get_type
gtk_debug_flag_get_type
gtk_delete_type_get_type
gtk_dest_defaults_get_type
gtk_dialog_flags_get_type
gtk_dialog_get_type
gtk_direction_type_get_type
gtk_drag_result_get_type
gtk_drawing_area_get_type
gtk_editable_get_type
gtk_entry_buffer_get_type
gtk_entry_completion_get_type
gtk_entry_get_type
gtk_entry_icon_position_get_type
gtk_event_box_get_type
gtk_expander_get_type
gtk_expander_style_get_type
gtk_file_chooser_action_get_type
gtk_file_chooser_button_get_type
gtk_file_chooser_confirmation_get_type
gtk_file_chooser_dialog_get_type
gtk_file_chooser_error_get_type
gtk_file_chooser_get_type
gtk_file_chooser_widget_get_type
gtk_file_filter_flags_get_type
gtk_file_filter_get_type
gtk_fixed_get_type
gtk_font_button_get_type
gtk_font_selection_dialog_get_type
gtk_font_selection_get_type
gtk_frame_get_type
gtk_handle_box_get_type
gtk_hbox_get_type
gtk_hbutton_box_get_type
gtk_hpaned_get_type
gtk_hruler_get_type
gtk_hscale_get_type
gtk_hscrollbar_get_type
gtk_hseparator_get_type
gtk_hsv_get_type
gtk_icon_factory_get_type
gtk_icon_info_get_type
gtk_icon_lookup_flags_get_type
gtk_icon_set_get_type
gtk_icon_size_get_type
gtk_icon_source_get_type
gtk_icon_theme_error_get_type
gtk_icon_theme_get_type
gtk_icon_view_drop_position_get_type
gtk_icon_view_get_type
gtk_identifier_get_type
gtk_im_context_get_type
gtk_im_context_simple_get_type
gtk_im_multicontext_get_type
gtk_im_preedit_style_get_type
gtk_im_status_style_get_type
gtk_image_get_type
gtk_image_menu_item_get_type
gtk_image_type_get_type
gtk_info_bar_get_type
gtk_invisible_get_type
gtk_item_get_type
gtk_justification_get_type
gtk_label_get_type
gtk_layout_get_type
gtk_link_button_get_type
gtk_list_store_get_type
gtk_match_type_get_type
gtk_menu_bar_get_type
gtk_menu_direction_type_get_type
gtk_menu_get_type
gtk_menu_item_get_type
gtk_menu_shell_get_type
gtk_menu_tool_button_get_type
gtk_message_dialog_get_type
gtk_message_type_get_type
gtk_metric_type_get_type
gtk_misc_get_type
gtk_mount_operation_get_type
gtk_movement_step_get_type
gtk_notebook_get_type
gtk_notebook_tab_get_type
gtk_number_up_layout_get_type
gtk_object_flags_get_type
gtk_object_get_type
gtk_offscreen_window_get_type
gtk_orientable_get_type
gtk_orientation_get_type
gtk_pack_direction_get_type
gtk_pack_type_get_type
gtk_page_orientation_get_type
gtk_page_set_get_type
gtk_page_setup_get_type
gtk_paned_get_type
gtk_paper_size_get_type
gtk_path_priority_type_get_type
gtk_path_type_get_type
gtk_plug_get_type
gtk_policy_type_get_type
gtk_position_type_get_type
gtk_preview_type_get_type
gtk_print_context_get_type
gtk_print_duplex_get_type
gtk_print_error_get_type
gtk_print_operation_action_get_type
gtk_print_operation_get_type
gtk_print_operation_preview_get_type
gtk_print_operation_result_get_type
gtk_print_pages_get_type
gtk_print_quality_get_type
gtk_print_settings_get_type
gtk_print_status_get_type
gtk_private_flags_get_type
gtk_progress_bar_get_type
gtk_progress_bar_orientation_get_type
gtk_progress_bar_style_get_type
gtk_radio_action_get_type
gtk_radio_button_get_type
gtk_radio_menu_item_get_type
gtk_radio_tool_button_get_type
gtk_range_get_type
gtk_rc_flags_get_type
gtk_rc_style_get_type
gtk_rc_token_type_get_type
gtk_recent_action_get_type
gtk_recent_chooser_dialog_get_type
gtk_recent_chooser_error_get_type
gtk_recent_chooser_get_type
gtk_recent_chooser_menu_get_type
gtk_recent_chooser_widget_get_type
gtk_recent_filter_flags_get_type
gtk_recent_filter_get_type
gtk_recent_info_get_type
gtk_recent_manager_error_get_type
gtk_recent_manager_get_type
gtk_recent_sort_type_get_type
gtk_relief_style_get_type
gtk_requisition_get_type
gtk_resize_mode_get_type
gtk_response_type_get_type
gtk_ruler_get_type
gtk_scale_button_get_type
gtk_scale_get_type
gtk_scroll_step_get_type
gtk_scroll_type_get_type
gtk_scrollbar_get_type
gtk_scrolled_window_get_type
gtk_selection_data_get_type
gtk_selection_mode_get_type
gtk_sensitivity_type_get_type
gtk_separator_get_type
gtk_separator_menu_item_get_type
gtk_separator_tool_item_get_type
gtk_settings_get_type
gtk_shadow_type_get_type
gtk_side_type_get_type
gtk_signal_run_type_get_type
gtk_size_group_get_type
gtk_size_group_mode_get_type
gtk_socket_get_type
gtk_sort_type_get_type
gtk_spin_button_get_type
gtk_spin_button_update_policy_get_type
gtk_spin_type_get_type
gtk_spinner_get_type
gtk_state_type_get_type
gtk_status_icon_get_type
gtk_statusbar_get_type
gtk_style_get_type
gtk_submenu_direction_get_type
gtk_submenu_placement_get_type
gtk_table_get_type
gtk_target_flags_get_type
gtk_target_list_get_type
gtk_tearoff_menu_item_get_type
gtk_text_attributes_get_type
gtk_text_buffer_get_type
gtk_text_buffer_target_info_get_type
gtk_text_child_anchor_get_type
gtk_text_direction_get_type
gtk_text_iter_get_type
gtk_text_mark_get_type
gtk_text_search_flags_get_type
gtk_text_tag_get_type
gtk_text_tag_table_get_type
gtk_text_view_get_type
gtk_text_window_type_get_type
gtk_toggle_action_get_type
gtk_toggle_button_get_type
gtk_toggle_tool_button_get_type
gtk_tool_button_get_type
gtk_tool_item_get_type
gtk_tool_item_group_get_type
gtk_tool_palette_drag_targets_get_type
gtk_tool_palette_get_type
gtk_tool_shell_get_type
gtk_toolbar_child_type_get_type
gtk_toolbar_get_type
gtk_toolbar_space_style_get_type
gtk_toolbar_style_get_type
gtk_tooltip_get_type
gtk_tree_drag_dest_get_type
gtk_tree_drag_source_get_type
gtk_tree_iter_get_type
gtk_tree_model_filter_get_type
gtk_tree_model_flags_get_type
gtk_tree_model_get_type
gtk_tree_model_sort_get_type
gtk_tree_path_get_type
gtk_tree_row_reference_get_type
gtk_tree_selection_get_type
gtk_tree_sortable_get_type
gtk_tree_store_get_type
gtk_tree_view_column_get_type
gtk_tree_view_column_sizing_get_type
gtk_tree_view_drop_position_get_type
gtk_tree_view_get_type
gtk_tree_view_grid_lines_get_type
gtk_tree_view_mode_get_type
gtk_ui_manager_get_type
gtk_ui_manager_item_type_get_type
gtk_unit_get_type
gtk_update_type_get_type
gtk_vbox_get_type
gtk_vbutton_box_get_type
gtk_viewport_get_type
gtk_visibility_get_type
gtk_volume_button_get_type
gtk_vpaned_get_type
gtk_vruler_get_type
gtk_vscale_get_type
gtk_vscrollbar_get_type
gtk_vseparator_get_type
gtk_widget_flags_get_type
gtk_widget_get_type
gtk_widget_help_type_get_type
gtk_window_get_type
gtk_window_group_get_type
gtk_window_position_get_type
gtk_window_type_get_type
gtk_wrap_mode_get_type
)
gtkInitDone=: 0
ifMatchBrackets=: 0
DefCmt=: 'NB. '
DefLang=: 'j'
ValExt=: ;: 'ijs'

Debug=: 0

IFSV=: 1
GtkSetEnv=: 0
f=. [: 15!:13 (IFWIN#'+') , ' x' $~ +:
cb1=: f 2
cb2=: f 3
cb3=: f 4
cb4=: f 5
cb5=: f 6
cb6=: f 7
cb7=: f 8
consigs=: 4 : 0
'widget signal handler locale'=. 4{.y
if. 0=#locale do. locale=. >coname'' else. locale=. ,>locale end.
h=. cbreg handler,'_',locale,'_'
g_signal_connect_data widget;signal;x;h;0;0
)

consig=: cb2 & consigs
consig3=: cb3 & consigs
consig4=: cb4 & consigs
consig5=: cb5 & consigs
consig6=: cb6 & consigs
consig7=: cb7 & consigs
cbreg=: 3 : 0
i=. cbregs_jgtk_ i. <y
if. i<#cbregs_jgtk_ do. i return. end.
i=. cbregs_jgtk_ i. a:
if. i=#cbregs_jgtk_ do.
  cbregs_jgtk_=: cbregs_jgtk_,<y
else.
  cbregs_jgtk_=: (<y) i} cbregs_jgtk_
end.
i
)
cdcallback=: 3 : 0
q=. {:w=. 15!:17''
if. q>:#cbregs_jgtk_ do.
  smoutput 'callback invalid pointer: ',":w return.
end.
h=. >q{cbregs_jgtk_
if. 3~:4!:0 <h do.
  smoutput 'callback undefined handler: ',h return.
end.
try.
  h~w
catchd.
  smoutput 'callback run error: ',h,LF,13!:12''
end.
)
cbfree=: 3 : 0
if. 0=#y do. l=. coname'' else. l=. boxxopen y end.
for_n. l do.
  t=. (-2+#>n){.each cbregs_jgtk_
  a=. <'_',~,'_',>n
  cbregs_jgtk_=: a: ((a=t)#i.#t)} cbregs_jgtk_
end.
EMPTY
)
newiterend=: 3 : 0
i[gtk_text_buffer_get_end_iter y;i=. i.ITERSIZE
)
newitercursor=: 3 : 0
i[gtk_text_buffer_get_iter_at_mark y;(i=. i.ITERSIZE);gtk_text_buffer_get_insert y
)
newiterline=: 3 : 0
i[gtk_text_buffer_get_iter_at_line ({.y);(i=. i.ITERSIZE);{:y
)
newiterlastline=: 3 : 0
newiterline y,gtk_text_buffer_get_line_count y
)
newiterpos=: 3 : 0
i[gtk_text_buffer_get_iter_at_offset ({.y);(i=. i.ITERSIZE);{:y
)
newiterselectionbound=: 3 : 0
i[gtk_text_buffer_get_iter_at_mark y;(i=. i.ITERSIZE);gtk_text_buffer_get_selection_bound y
)
newiterstart=: 3 : 0
i[gtk_text_buffer_get_start_iter y;i=. i.ITERSIZE
)
gtkinit=: 3 : 0
if. gtkInitDone_jgtk_ do. i.0 0 return. end. 
try.
  checkpoint=. 'gtksetenv'
  gtksetenv''
  checkpoint=. 'g_type_init'
  g_type_init''
  checkpoint=. 'g_thread_init'
  if. UNAME-:'Darwin' do.
    if. 1 e. 'libgtk-x11-2.0.0.dylib' E. >libgtk do.
      g_thread_init ::0: 0        
    else.
      g_thread_init 0
    end.
  else.
    g_thread_init 0
  end.
  checkpoint=. 'gtk_init'
  gtk_init (,0);0 
  checkpoint=. 'setlocale'
  if. UNAME-:'Linux' do.
    Lc_Numeric_jgtk_=: memr 0 _1 2,~ 'libc.so.6 setlocale > x i *c'&cd 1;<<0
    'libc.so.6 setlocale > x i *c'&cd 1;,'C'
  elseif. UNAME-:'Darwin' do.
    Lc_Numeric_jgtk_=: memr 0 _1 2,~ 'libc.dylib setlocale > x i *c'&cd 4;<<0
    'libc.dylib setlocale > x i *c'&cd 4;,'C'
  elseif. UNAME-:'Win' do.
    Lc_Numeric_jgtk_=: memr 0 _1 2,~ 'msvcrt.dll setlocale > + x i *c'&cd 4;<<0
    'msvcrt.dll setlocale > + x i *c'&cd 4;,'C'
  end.
catch.
  erm=. 13!:12'' [ ern=. 13!:11''
  cderr=. cder''
  select. UNAME
  case. 'Win' do. smoutput win_init_failed
  case. 'Linux' do. smoutput linux_init_failed
  case. 'Darwin' do. smoutput mac_init_failed
  end.
  smoutput 'last cder'''': ', ":cderr
  smoutput 'last check point: ', checkpoint
  erm 13!:8 ern
end.
gtk_gettypes''
cbregs_jgtk_=: 'bad0';'bad1'
gtkInitDone_jgtk_=: 1
i.0 0
)
gtksetenv=: 3 : 0
if. UNAME-:'Darwin' do.
  1!:44 jpath '~install'
  f=. 'libc.dylib setenv x *c *c x'&cd
  p=. jpath '~install/gtk'
  f 'XDG_CONFIG_DIRS';(p,'/etc/xdg');1
  f 'XDG_DATA_DIRS';(p,'/share');1
  f 'GTK_DATA_PREFIX';p;1
  f 'GTK_EXE_PREFIX';p;1
  f 'GTK_PATH';p;1
  f 'GTK2_RC_FILES';(p,'/etc/gtk-2.0/gtkrc');1
  f 'GDK_PIXBUF_MODULE_FILE';(p,'/etc/gtk-2.0/gdk-pixbuf.loaders');1
elseif. UNAME-:'Win' do.
  p=. jpath '~install/gtk'
  gtksetenv_win 'XDG_CONFIG_DIRS'; p,'/etc/xdg'
  gtksetenv_win 'XDG_DATA_DIRS'; p,'/share'
  gtksetenv_win 'GTK_DATA_PREFIX'; p
  gtksetenv_win 'GTK_EXE_PREFIX'; p
  gtksetenv_win 'GTK_PATH'; p
  gtksetenv_win 'GTK2_RC_FILES'; p,'/etc/gtk-2.0/gtkrc'
  gtksetenv_win 'GTK_IM_MODULE_FILE'; p,'/etc/gtk-2.0/gtk.immodules'
  gtksetenv_win 'GDK_PIXBUF_MODULE_FILE'; p,'/etc/gtk-2.0/gdk-pixbuf.loaders'
  if. GtkSetEnv do.
    HWND_BROADCAST=. _1 [ WM_SETTINGCHANGE=. 26 [ SMTO_ABORTIFHUNG=. 2
    'user32 SendMessageTimeoutA > i x i i *c i i *i'&cd HWND_BROADCAST; WM_SETTINGCHANGE; 0; 'Environment'; SMTO_ABORTIFHUNG; 5000; , _1
  end.
end.
)
gtksetenv_win=: 3 : 0
'value data'=. y

f=. '\'&(('/' I.@:= ])})
value=. uucp ,value
data=. uucp f ,data
'kernel32 SetEnvironmentVariableW > i *w *w'&cd value;data

if. 0=GtkSetEnv do. 0 return. end.

REG_SUCCESS=. 0
REG_ERROR=. _1
REG_SZ=. 1
HKEYCURRENTUSER=. _2147483647
HKEYLOCALMACHINE=. _2147483646
RegCreateKey=. 'advapi32 RegCreateKeyW i x *w *x'&cd
RegCloseKey=. 'advapi32 RegCloseKey i x'&cd
RegSetValueExC=. 'advapi32 RegSetValueExW i x *w i i *w i'&cd

hkey=. HKEYLOCALMACHINE
while. 1 do.
  rc=. REG_SUCCESS
  openkey=. ''
  key=. 'System';'CurrentControlSet';'Control';'Session Manager';'Environment'
  while. #key do.
    subkey=. uucp 0{::key
    key=. }.key
    'a b c d'=. RegCreateKey hkey ; subkey ; (, _1)
    if. REG_SUCCESS= rc=. a do.
      openkey=. openkey, hkey=. {. d
    else.
      break.
    end.
  end.
  if. REG_SUCCESS=rc do.
    rc=. 0{:: RegSetValueExC hkey ; value ; 0 ; REG_SZ ; data ; +: >: #data
  end.
  while. #openkey do.
    RegCloseKey <_1{openkey
    openkey=. }: openkey
  end.
  if. REG_SUCCESS=rc do. rc return. end.
  if. hkey= HKEYLOCALMACHINE do.
    hkey=. HKEYCURRENTUSER
  else.
    rc return.
  end.
end.
)
gtkgetenvmac=: 3 : 0
a=. ' XDG_CONFIG_DIRS XDG_DATA_DIRS GTK_DATA_PREFIX GTK_EXE_PREFIX GTK_PATH'
a=. <;._1 a,' GTK2_RC_FILES GTK_IM_MODULE_FILE GDK_PIXBUF_MODULE_FILE'
e=. ('"' -.~ getenv) each a
a,.e,.dir each e
)
win_init_failed=: 0 : 0

GTK init failed.

GTK libs are in J install folder: ',jpath'~install/gtk
If J install is damaged, a re-install may fix the problem.
)
linux_init_failed=: 0 : 0

GTK init failed: libraries not installed or not found.

Find path to gtk folder with shell command:
...> find / -name libgtk-x11-2.0.so 2> /dev/null

If not found, you need to install GTK
 (binaries probably available from your Linux provider).

If found, the path is not in your library search.
Best solution is to add it to your /etc/ld.so.conf file.
 (you must run /sbin/ldconfig after changes to that file)

If you don't want to change ld.so.conf, edit jgtkide
 (~install/bin/jgtkide) to have the export after #!/bin/sh:

export LD_LIBRARY_PATH="path to the libgtk-x11-2.0.so file"
)
mac_init_failed=: win_init_failed
defaultsearchpath=: 3 : 0
if. IF64*.IFWIN do.
  jpath each '~config';'~addons/gui/gtk/config'
else.
  jpath each '~config';'~addons/gui/gtk/config';'~install/gtk/share/gtksourceview-2.0/language-specs'
end.
)
initsearchpath=: 3 : 0
if. -.IFSV do. return. end.

path=. toHOST each defaultsearchpath''

try.
  lm=. gtk_source_language_manager_get_default ''
catch.
  IFSV_jgtk_=: 0 return.
end.

ss=. getlist gtk_source_language_manager_get_search_path lm
if. *./ path e. toHOST each ss do. return. end.
ss=. ~. path,ss
sp=. setlist (direxist &> ss) # ss
gtk_source_language_manager_set_search_path lm,sp

sm=. gtk_source_style_scheme_manager_get_default''
ss=. getlist gtk_source_style_scheme_manager_get_search_path sm
ss=. ~. ss,|.path
sp=. setlist (direxist &> ss) # ss
gtk_source_style_scheme_manager_set_search_path sm,sp

)
newalign=: 3 : 0
gtk_alignment_new y
:
r=. gtk_alignment_new y
gtk_container_add r,x
r
)
newpad=: 3 : 0
r=. gtk_alignment_new 0 0 1 1
gtk_widget_set_size_request r,y
r
)
newxpad=: 3 : 0
p=. newpad }.y
gtk_box_pack_start ({.y),p,0 0 0
p
)
newbutton=: 3 : 0
'label handler'=. y
button=. gtk_button_new_with_mnemonic <label
consig button;'clicked';handler
button
)
newxbutton=: 3 : 0
button=. newbutton }.y
gtk_box_pack_start ({.y),button;0;0;0
button
)
newstocktextbutton=: 3 : 0
'stock text handler'=. y
image=. gtk_image_new_from_stock stock;GTK_ICON_SIZE_BUTTON
button=. gtk_button_new''
consig button;'clicked';handler
hb=. gtk_hbox_new 0 2
label=. gtk_label_new_with_mnemonic <text
gtk_box_pack_start hb,image,0 0 0
gtk_box_pack_start hb,label,0 0 0
align=. gtk_alignment_new 0.5 0.5 0 0
gtk_container_add align,hb
gtk_container_add button,align
gtk_widget_show_all align
button
)
newstockbutton=: 3 : 0
'stock handler'=. y
button=. gtk_button_new''
image=. gtk_image_new_from_stock stock;GTK_ICON_SIZE_BUTTON
gtk_container_add button,image
consig button;'clicked';handler
button
)
newcheckbox=: 3 : 0
'label handler'=. y
cb=. gtk_check_button_new_with_mnemonic <label
consig cb;'clicked';handler
cb
)

readcheckbox=: gtk_toggle_button_get_active
setcheckbox=: gtk_toggle_button_set_active
clipread=: 3 : 0
cb=. gtk_clipboard_get gdk_atom_intern 'CLIPBOARD';0
readstring gtk_clipboard_wait_for_text cb
)
clipwrite=: 3 : 0
txt=. y
if. L. txt do.
  txt=. }. ; LF&, @ , @ ": each txt
else.
  txt=. ": txt
  if. 1 < #$txt do. txt=. }. , LF ,"1 txt end.
end.
len=. #txt
cb=. gtk_clipboard_get gdk_atom_intern 'CLIPBOARD';0
gtk_clipboard_set_text cb;txt;len
gtk_clipboard_store cb
len
)
clipread_z_=: clipread_jgtk_
clipwrite_z_=: clipwrite_jgtk_
newcombo=: 3 : 0
'text handler select hasentry'=. 4 {. boxopen y
store=. gtk_list_store_new_1 1,G_TYPE_STRING
if. 0=#hasentry do. hasentry=. 1 end.
if. 3=GTKVER_j_ do.
  if. hasentry do.
    cb=. gtk_combo_box_new_with_model_and_entry store
    gtk_combo_box_set_entry_text_column cb,0
  else.
    cb=. gtk_combo_box_text_new''
    gtk_combo_box_set_model cb,store
  end.
else.
  if. hasentry do.
    cb=. gtk_combo_box_entry_new_with_model store,0
    gtk_combo_box_entry_set_text_column cb,0
  else.
    cb=. gtk_combo_box_new_text''
    gtk_combo_box_set_model cb,store
  end.
end.
g_object_unref store
setcombo_text cb;<text
if. #select do.
  setcombo_select cb;select
end.
if. #handler do.
  consig cb;'changed';handler
end.
cb
)
newcombotext=: 3 : 0
'text handler select'=. 3 {. boxopen y
newcombo text;handler;select;0
)
readcombo=: 3 : 0
if. 3=GTKVER_j_ do.
  if. gtk_combo_box_get_has_entry y do.
    getentry gtk_bin_get_child y
  else.
    readstringfree gtk_combo_box_text_get_active_text y
  end.
else.
  readstringfree gtk_combo_box_get_active_text y
end.
)
getcombo=: 3 : 0
store=. gtk_combo_box_get_model y
rows=. gtk_tree_model_iter_n_children store;<<0
iter=. i.ITERSIZE
res=. 0$a:
col=. 0
for_row. i.rows do.
  gtk_tree_model_get_iter_from_string store;iter;":row
  val=. ,_1
  gtk_tree_model_get_1 store;iter;col;val;_1
  res=. res,<readstringfree val
end.
)
appendcombo=: 3 : 0
'cb text'=. 2 {. y
store=. gtk_combo_box_get_model cb
iter=. i.ITERSIZE
gtk_list_store_append store;iter
gtk_list_store_set_1 store;iter;0;text;_1
)
insertcombo=: 3 : 0
'cb text pos'=. 3 {. y
store=. gtk_combo_box_get_model cb
iter=. i.ITERSIZE
gtk_list_store_insert store;iter;pos
gtk_list_store_set_1 store;iter;0;text;_1
)
deletecombo=: 3 : 0
'cb pos'=. 2 {. y
store=. gtk_combo_box_get_model cb
iter=. i.ITERSIZE
gtk_tree_model_get_iter_from_string store;iter;":pos
gtk_list_store_remove store;iter
)
setcombo_text=: 3 : 0
'cb text'=. 2 {. y
store=. gtk_combo_box_get_model cb
setstore store;<text
)
setcombotext=: setcombo_text
setcombo_select=: gtk_combo_box_set_active
getentry=: 3 : 'memr (gtk_entry_get_text y),0,_1'
setentry=: gtk_entry_set_text
setentryposition=: gtk_editable_set_position
setentryselection=: gtk_editable_select_region
newentry=: 3 : 0
'text handler'=. y
entry=. gtk_entry_new''
setfont entry;FONT
setentry entry;text
consig entry;'activate';handler
entry
)
sv_button_press=: 3 : 0
'w e p'=. y
k=. {. _2 ic memr e,0 4
state=. {. _2 ic memr e,GdkEventButton_state,4
cs=. 0 2 { 2 2 2 #: state
select. k
case. GDK_BUTTON_PRESS do.
  sv_click cs
case. GDK_2BUTTON_PRESS do.
  sv_double_click cs
case. do.
  0
end.
)
sv_click=: 0:
sv_double_click=: 0:
newexpander=: 3 : 0
'label child'=. y
ex=. gtk_expander_new_with_mnemonic <label
gtk_container_add ex,child
ex
)


browsebox=: 3 : 0
'entry stock handler'=. y
hb=. gtk_hbox_new 0 6
vb=. gtk_vbox_new 0 0
gtk_box_pack_start vb,entry,1 0 0
btn=. newstockbutton stock;handler
gtk_box_pack_end hb,btn,0 0 0
gtk_box_pack_end hb, vb,1 1 0
hb,btn
)
filechooser=: 3 : 0
'type title pattern path'=. y
r=. ''
action=. type{0 1 1 2
stock=. type{GTK_STOCK_OPEN;GTK_STOCK_OK;GTK_STOCK_SAVE;GTK_STOCK_OK
j=. GTK_STOCK_CANCEL;GTK_RESPONSE_CANCEL;stock,GTK_RESPONSE_ACCEPT;0
w=. gtk_file_chooser_dialog_new title;window;action;j
if. isdir path do.
  gtk_file_chooser_set_current_folder w;path
else.
  gtk_file_chooser_set_current_folder w;}:0 pick fpathname path
  gtk_file_chooser_set_current_name w;1{fpathname path
end.
for_p. pattern do.
  addpattern w;>p
end.
if. GTK_RESPONSE_ACCEPT = gtk_dialog_run w do.
  r=. jpathsep readstringfree gtk_file_chooser_get_filename w
end.
gtk_widget_destroy w
r
)
fontdialog=: 3 : 0
'title font'=. y
dialog=. gtk_font_selection_dialog_new <title
gtk_font_selection_dialog_set_font_name dialog;font
r=. ''
if. GTK_RESPONSE_OK=gtk_dialog_run dialog do.
  r=. readstringfree gtk_font_selection_dialog_get_font_name dialog
end.
gtk_widget_destroy dialog
r
)
newframe=: 3 : 0
'label shadow'=. 2 {. boxopen y
fm=. gtk_frame_new<''
if. #label do.
  gtk_frame_set_label fm;label
end.
if. #shadow do.
  gtk_frame_set_shadow_type fm,shadow
end.
fm
)

NB, label
newlabel=: 3 : 0
r=. gtk_label_new_with_mnemonic  <,y
gtk_misc_set_alignment r,0 0.5
r
)
newlabelj=: 3 : 0
r=. newlabel y
gtk_label_set_justify r,3
r
)
newlabelr=: 3 : 0
r=. gtk_label_new_with_mnemonic  <,y
gtk_misc_set_alignment r,1 0.5
r
)

setlabel=: gtk_label_set_text_with_mnemonic
makelistbox=: 3 : 0
'id nms sel top flag'=. y
tv=. gtk_tree_view_new''
store=. gtk_list_store_new_1 1,G_TYPE_STRING
setstore store;<nms
gtk_tree_view_set_model tv,store
gtk_tree_view_set_headers_visible tv,0
consig tv;'cursor_changed';id,'_cursor_changed'
consig3 tv;'key-press-event';id,'_key_press'
consig4 tv;'row-activated';id,'_row_activated'
renderer=. gtk_cell_renderer_text_new''
gtk_tree_view_insert_column_with_attributes tv;_1;'input';renderer;'text';0;<<0
listbox_scroll tv,top
listbox_select tv,sel
if. flag AND 1 do.
  gtk_tree_view_set_rules_hint tv,1
end.
tv
)
setlistbox=: 3 : 0
'tv nms'=. 2 {. y
store=. gtk_tree_view_get_model tv
setstore store;<nms
if. 2 < #y do.
  'sel top'=. 2 {. 2 }. y
  listbox_select tv,sel
  listbox_scroll tv,top
end.
)
listbox_getactiverow=: 3 : 0
c=. mema IF64{4 8
d=. mema IF64{4 8
gtk_tree_view_get_cursor y;c;d
p=. {. memr c,0 1 4
if. p=0 do. _1 return. end.
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
gtk_tree_path_free p
memf c
memf d
row
)
listbox_getscroll=: 3 : 0
c=. mema IF64{4 8
d=. mema IF64{4 8
gtk_tree_view_get_visible_range y;c;d
p=. {. memr c,0 1 4
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
gtk_tree_path_free p
memf c
memf d
row
)
listbox_row_activated=: 3 : 0
'w p c d'=. y
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
)
listbox_select=: 3 : 0
'tv sel'=. 2{.y,_1
if. 0>sel do.
  gtk_tree_selection_unselect_all gtk_tree_view_get_selection tv return.
end.
p=. gtk_tree_path_new_from_string <":sel
gtk_tree_view_set_cursor tv;p;0;0
gtk_tree_view_scroll_to_cell tv,p,0 0 0 0
gtk_tree_path_free p
)
listbox_scroll=: 3 : 0
'tv top'=. 2{.y,_1
if. 0>top do. return. end.
p=. gtk_tree_path_new_from_string <":top
gtk_tree_view_scroll_to_cell tv,p,0 0 0 0
gtk_tree_path_free p
)
makelistgrid=: 3 : 0
'id hdr data sel top flag'=. y
tv=. gtk_tree_view_new''
type=. 2 = 3!:0 &> {.data
cls=. #type
ifhdr=. 0<#hdr
if. -.ifhdr do. hdr=. cls$<'' end.
store=. gtk_list_store_newv cls;type{G_TYPE_BOOLEAN,G_TYPE_STRING
setstore store;<data
gtk_tree_view_set_model tv,store
gtk_tree_view_set_headers_visible tv,ifhdr
gtk_tree_view_set_rules_hint tv,flag AND 1
text_renderer=. gtk_cell_renderer_text_new''
check_renderer=. gtk_cell_renderer_toggle_new''
consig4 tv;'row-activated';id,'_row_activated'
consig3 tv;'key-press-event';id,'_key_press'
if. 0 e. type do. consig3 check_renderer;'toggled';id,'_toggled' end.
for_i. i.cls do.
  if. i{type do.
    gtk_tree_view_insert_column_with_attributes tv;i;(i{hdr),text_renderer;'text';i;<<0
  else.
    gtk_tree_view_insert_column_with_attributes tv;i;(i{hdr),check_renderer;'active';i;<<0
  end.
end.
listgrid_scroll tv,top
listgrid_select tv,sel
tv
)
setlistgrid=: 3 : 0
'tv data'=. 2 {. y
store=. gtk_tree_view_get_model tv
setstore store;<data
if. 2 < #y do.
  'sel top'=. 2 {. 2 }. y
  listgrid_select tv,sel
  listgrid_scroll tv,top
end.
)
listgrid_getactiverow=: 3 : 0
c=. mema IF64{4 8
d=. mema IF64{4 8
gtk_tree_view_get_cursor y;c;d
p=. {. memr c,0 1 4
if. p=0 do. _1 return. end.
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
gtk_tree_path_free p
memf c
memf d
row
)
listgrid_getscroll=: 3 : 0
c=. mema IF64{4 8
d=. mema IF64{4 8
gtk_tree_view_get_visible_range y;c;d
p=. {. memr c,0 1 4
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
gtk_tree_path_free p
memf c
memf d
row
)
listgrid_row_activated=: 3 : 0
'w p c d'=. y
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
)
listgrid_select=: 3 : 0
'tv sel'=. 2{.y,_1
if. 0>sel do.
  gtk_tree_selection_unselect_all gtk_tree_view_get_selection tv return.
end.
p=. gtk_tree_path_new_from_string <":sel
gtk_tree_view_set_cursor tv;p;0;0
gtk_tree_view_scroll_to_cell tv,p,0 0 0 0
gtk_tree_path_free p
)
listgrid_scroll=: 3 : 0
'tv top'=. 2{.y,_1
if. 0>top do. return. end.
p=. gtk_tree_path_new_from_string <":top
gtk_tree_view_scroll_to_cell tv,p,0 0 0 0
gtk_tree_path_free p
)
setstore=: 3 : 0
'store data'=. y
gtk_list_store_clear store
iter=. i.ITERSIZE
if. 1=#$data do. 
  for_p. data do.
    gtk_list_store_append store;iter
    gtk_list_store_set_1 store;iter;0;p,<_1
  end. return.
end.
typ=. 3!:0 &> {.data
chr=. I. 2 = typ
int=. I. 2 ~: typ
for_p. data do.
  gtk_list_store_append store;iter
  for_i. chr do.
    gtk_list_store_set_1 store;iter;i;(i{p),<_1
  end.
  for_i. int do.
   gtk_list_store_set_2 store;iter;i;(i{p),<_1
  end.
end.
)
ccmenu=: 4 : 0
create_menu_command (x;y),5{.getmenu y
)
create_menu_bar=: 3 : 0
menu_bar=: gtk_menu_bar_new''
)
create_menu_command=: 3 : 0
'menu id icon text letter tip cb'=. y
text=. gettext text
tip=. gettext tip
if. #icon do.
  if. 'check' -: 5{.icon do.
    cb_item=. gtk_check_menu_item_new_with_mnemonic <text
    gtk_check_menu_item_set_active cb_item,{. 0 ". 5 }. icon
  else.
    cb_item=. gtk_image_menu_item_new_with_mnemonic <text
    gtk_image_menu_item_set_image cb_item;gtk_image_new_from_stock icon;1
  end.
else.
  cb_item=. gtk_menu_item_new_with_mnemonic <text
end.
if. #letter do.
  msk=. +/('cs'e.letter)#GDK_CONTROL_MASK,GDK_SHIFT_MASK
  letter=. letter-.'cs'
  if. 1=#letter do.
    key=. a.i.{.letter
  elseif. 'F'={.letter do.
    key=. GDK_F1 + <:0 ". }.letter
  elseif. 6=#letter do.
    key=. GDK_Return
  elseif. 1 do.
    key=. a.i.{:letter
  end.
  create_menu_accel window;cb_item;id;key;msk
end.
if. #tip do.
  if. 0=nc <'menutooltips' do.
    gtk_tooltips_set_tip menutooltips;cb_item;tip;<<0
  end.
end.
if. #cb do.
  consig cb_item;'activate';cb
end.
gtk_menu_shell_append menu,cb_item
cb_item
)
create_menu_accel=: 3 : 0
'window menu id key modifier'=. y
if. UNAME-:'Darwin' do.
  if. _1=4!:0<'macmenushortcuts' do.
    macmenushortcuts=: 0 2$''
    consig3 window;'key-press-event';'macwindowshortcut'
  end.
  if. modifier AND GDK_CONTROL_MASK do.
    m=. (2^28)+modifier-GDK_CONTROL_MASK 
  else.
    m=. modifier
  end.
  macmenushortcuts=: macmenushortcuts,id;m,a.i.key
end.
gtk_widget_add_accelerator menu;'activate';accel_group;key;modifier;GTK_ACCEL_VISIBLE
)

create_menu_container=: 3 : 0
container=. gtk_menu_new'' 
gtk_menu_item_set_submenu y,container
container
)
create_menu_popup=: 3 : 0
'menu label'=. y
root_menu=. gtk_menu_item_new_with_mnemonic <label
gtk_menu_shell_append menu,root_menu
root_menu
)
create_menu_sep=: 3 : 0
menu_item=. gtk_separator_menu_item_new''
gtk_menu_shell_append y,menu_item
menu_item
)
create_menu_sub=: 3 : 0
'menu cb ndx text'=. y
cb_item=. gtk_menu_item_new_with_mnemonic <text
g_signal_connect_data cb_item;'activate';cb2;ndx;0;0
gtk_menu_shell_append menu,cb_item
)
focus_in_event=: 3 : 0
((>libigemac),' ige_mac_menu_set_menu_bar >n x')cd menu_bar
0
)
getmk=: 3 : 0
mk=. 256#.endian"1 [2 4$a.i.memr y,GdkEventKey,8
if. GDK_MOD2_MASK AND {.mk do. mk=. mk-GDK_MOD2_MASK,0 end.
mk
)
macmenu=: 3 : 0
if. UNAME-:'Darwin' do.
  if. -. ''-:libigemac do.   
    gtk_widget_hide menu_bar 
    consig3 window;'focus_in_event';'focus_in_event'
  end.
end.
)
macwindowshortcut=: 3 : 0
'view keyevent qpointer'=. y
mk=. getmk keyevent
a=. macmenushortcuts
i=. (1{"1 a)i.<mk
if. i<#a do.
  ".'''''',~>{.i{a
  1 return. 
end.
0
)

setcheckmenu=: gtk_check_menu_item_set_active
MBtypes=: 0 1 3 2 2 2
MBpress=: 1 1 1 4 5 0
MBdefrs=: 5 5 5 8 5 6
mbox=: 3 : 0
0 mbox y
:
'style title text'=. y
a=. (style{MBtypes);(style{MBpress);'%s';,text
if. 0=x do.
  if. 0>nc<'window' do. win=. 0 else. win=. window end.
else.
  win=. x
end.
w=. gtk_message_dialog_new win;2;a
gtk_window_set_title w;title
select. style
case. 5 do.
  gtk_dialog_add_button w;'gtk-cancel';6
  gtk_dialog_add_button w;'gtk-no';9
  gtk_dialog_add_button w;'gtk-yes';8
end.
r=. |gtk_dialog_run w
gtk_dialog_set_default_response w,style{MBdefrs
gtk_widget_destroy w
select. style
case. 0;1;2 do. i.0 0
case. 3 do. r=8
case. 4 do. r=5
case. 5 do. 6 9 8 i. r
end.
)
mbinfo=: 3 : 0
0 mbinfo y
:
x mbox 0;_2 {. '';boxopen y
)
mbnoyes=: 3 : 0
0 mbnoyes y
:
x mbox 3;_2 {. '';boxopen y
)
mbcancelok=: 3 : 0
0 mbcancelok y
:
x mbox 4;_2 {. '';boxopen y
)
mbcancelnoyes=: 3 : 0
0 mbcancelnoyes y
:
x mbox 5;_2 {. '';boxopen y
)
cocurrent 'jgtk'
get_button=: 3 : 0
256#.endian a.i.memr y,GdkEventButton_button,4
)
get_type=: 3 : 0
memr y,0 1,JINT
)

get_button_event_data=: 3 : 0
gtkda get_button_event_data y
:
mousepos=. <.2 3{;gdk_event_get_coords y;(,0.0);,0.0
state=. 2{;gdk_event_get_state y;,0
(get_button y),(get_type y),mousepos,(2 3{getGtkWidgetAllocation x),state
)

cocurrent 'jgtk'
readimg=: 3 : 0
  if. -.IFGTK do. gtkinit'' end.
  if. 0= buf=. gdk_pixbuf_new_from_file y;0 do. 0 0$0 return. end.
  img=. gdk_pixbuf_add_alpha buf;0;0;0;0
  g_object_unref buf
  ad=. gdk_pixbuf_get_pixels img
  w=. gdk_pixbuf_get_width img
  h=. gdk_pixbuf_get_height img
  s=. gdk_pixbuf_get_rowstride img
  assert. s=4*w
  if. IF64 do.
    r=. _2 ic memr ad,0,(w*h*4),JCHAR
  else.
    r=. memr ad,0,(w*h),JINT
  end.
  g_object_unref img
  (h,w)$r
)

OR=: 23 b./
3 : 0''
if. IF64 do.
  ALPHA=: 0{_3 ic 0 0 0 255 255 255 255 255{a.
else.
  ALPHA=: 0{_2 ic 0 0 0 255{a.
end.
''
)
NOTALPHA=: 0{_2 ic 255 255 255 0{a.
pixbufpx_setpixels=: 4 : 0
gtkpx=. x
'a b w h'=. 4{.y
d=. 4}.y
d=. d OR ALPHA
if. IF64 do. d=. 2 ic d end.
buf=. gdk_pixbuf_new_from_data (15!:14<'d'),GDK_COLORSPACE_RGB,1,8,w,h,(4*w),0,0
if. buf do.
  gdk_draw_pixbuf gtkpx,0,buf,0,0,a,b,w,h,0,0,0
end.
g_object_unref buf
EMPTY
)
pixbufcr_setpixels=: 4 : 0
cr=. x
'a b w h'=. 4{.y
d=. 4}.y
d=. d OR ALPHA
if. IF64 do. d=. 2 ic d end.
buf=. gdk_pixbuf_new_from_data (15!:14<'d'),GDK_COLORSPACE_RGB,1,8,w,h,(4*w),0,0
if. buf do.
  gdk_cairo_set_source_pixbuf cr; buf; a; b  
  cairo_paint cr
end.
g_object_unref buf
EMPTY
)
pixbufwin_setpixels=: 4 : 0
(cr=. gdk_cairo_create x) pixbufcr_setpixels y
cairo_destroy cr
EMPTY
)
newradio=: 3 : 0
'button label handler'=. y
rb=. gtk_radio_button_new_with_mnemonic_from_widget button;label
consig rb;'clicked';handler
rb
)
newxradio=: 3 : 0
rb=. newradio }.y
gtk_box_pack_start ({.y),rb;0;0;0
rb
)

readradio=: gtk_toggle_button_get_active
setradio=: gtk_toggle_button_set_active
newsw=: 3 : 0
sw=. gtk_scrolled_window_new 0 0
gtk_scrolled_window_set_policy sw,GTK_POLICY_AUTOMATIC,GTK_POLICY_AUTOMATIC
if. #y do.
  gtk_scrolled_window_set_shadow_type sw,y
end.
sw
)
bufget=: 3 : 0
bgn=. newiterstart y
end=. newiterend y
txt=. ucp readstringfree gtk_text_buffer_get_text y;bgn;end;0
cur=. i. ITERSIZE
bnd=. i. ITERSIZE
if. gtk_text_buffer_get_selection_bounds y;cur;bnd do.
  sel=. #ucp readstringfree gtk_text_buffer_get_text y;bgn;cur;0
  len=. #ucp readstringfree gtk_text_buffer_get_text y;cur;bnd;0
else.
  cur=. newitercursor y
  sel=. #ucp readstringfree gtk_text_buffer_get_text y;bgn;cur;0
  len=. 0
end.
txt;sel;len
)
bufreadlinenumber=: 3 : 0
iter=. i.ITERSIZE
gtk_text_buffer_get_iter_at_mark y;iter;gtk_text_buffer_get_insert y
gtk_text_iter_get_line <iter
)
bufread=: 3 : 0
bgn=. i. ITERSIZE
end=. i. ITERSIZE
gtk_text_buffer_get_bounds y;bgn;end
readstringfree gtk_text_buffer_get_text y;bgn;end;0
)
bufreadcurrentline=: 3 : 0
bufreadline y,bufreadlinenumber y
)
bufreadlastline=: 3 : 0
bgn=. newiterlastline y
end=. newiterend y
readstringfree gtk_text_iter_get_text bgn;end
)
bufreadline=: 3 : 0
bgn=. newiterline y
if. 10 = gtk_text_iter_get_char <bgn do. '' return. end.
end=. newiterline y
gtk_text_iter_forward_to_line_end <end
readstringfree gtk_text_iter_get_text bgn;end
)
bufreadselect=: 3 : 0
bgn=. i. ITERSIZE
end=. i. ITERSIZE
if. 0 = gtk_text_buffer_get_selection_bounds y;bgn;end do.
  '' return.
end.
readstringfree gtk_text_buffer_get_text y;bgn;end;0
)
bufsetselect=: 3 : 0
'buf pos len'=. y
noevents 1
bgn=. newiterpos buf,pos
end=. newiterpos buf,pos
gtk_text_iter_forward_chars end;len
gtk_text_buffer_select_range buf;bgn;end
noevents 0
)
bufwrite=: 3 : 0
'buf txt'=. y
txt=. utf8 txt
gtk_text_buffer_set_text buf;txt;#txt
)
bufwritefile=: 3 : 0
'buf file'=. y
txt=. freads file
if. -. txt -: _1 do.
  bufwrite buf;txt
end.
)
languageids=: 3 : 0
lm=. gtk_source_language_manager_get_default''
getlist gtk_source_language_manager_get_language_ids lm
)
languagepaths=: 3 : 0
lm=. gtk_source_language_manager_get_default''
getlist gtk_source_language_manager_get_search_path lm
)
newsb=: 3 : 0
if. IFSV do.
  sb=. newsb1 y
else.
  sb=. newtb y
end.
iter=. newiterend sb
gtk_text_buffer_create_mark sb;'end';iter;0
gtk_text_buffer_create_mark sb;'scroll';iter;1
sb
)
newsb1=: 3 : 0
'class scheme filename text'=. y
text=. fgets text
sb=. gtk_source_buffer_new 0
gtk_source_buffer_begin_not_undoable_action sb
if. #scheme do.
  sm=. gtk_source_style_scheme_manager_get_default''
  ss=. gtk_source_style_scheme_manager_get_scheme sm;scheme
  gtk_source_buffer_set_style_scheme sb,ss
end.
select. class
fcase. 'edit' do.
  consig sb;'changed';'cb_edit_changed'
  bufwrite sb;text
case. 'term' do.
  lm=. gtk_source_language_manager_get_default''
  sl=. 0
  if. #filename do.
    sl=. gtk_source_language_manager_guess_language ::0: lm;filename;<<0
  end.
  if. sl = 0 do.
    sl=. gtk_source_language_manager_get_language lm;,DefLang
  end.
  if. sl do.
    gtk_source_buffer_set_language sb,sl
  end.
  gtk_source_buffer_set_highlight_syntax sb,1
  gtk_source_buffer_set_highlight_matching_brackets sb,ifMatchBrackets
case. 'view' do.
  bufwrite sb;text
end.
gtk_source_buffer_end_not_undoable_action sb
sb
)
newtb=: 3 : 0
'type scheme filename text'=. y
select. type
case. 'term' do.
  tb=. gtk_text_buffer_new 0
case. 'edit' do.
  tb=. gtk_text_buffer_new 0
  consig tb;'changed';'cb_edit_changed'
  bufwritefile tb;filename
case. 'view' do.
  tb=. gtk_text_buffer_new 0
  bufwrite tb;text
end.
tb
)
styleids=: 3 : 0
sm=. gtk_source_style_scheme_manager_get_default''
getlist gtk_source_style_scheme_manager_get_scheme_ids sm
)
stylepath=: 3 : 0
sm=. gtk_source_style_scheme_manager_get_default''
getlist gtk_source_style_scheme_manager_get_search_path sm
)
newcodeview=: 3 : 0
'class scheme filename text'=. 4 {. y
sb=. newsb class;scheme;filename;text
'sw sv'=. newcodeviewsb sb
sw,sv,sb
)
newcodeviewsb=: 3 : 0
sb=. y
sw=. newsw''
if. IFSV do.
  sv=. gtk_source_view_new_with_buffer sb
  gtk_source_view_set_auto_indent sv,1
  gtk_source_view_set_highlight_current_line sv,1
  gtk_source_view_set_show_line_numbers sv,0
  gtk_source_view_set_tab_width sv,4
else.
  sv=. gtk_text_view_new_with_buffer sb
end.
gtk_container_add sw,sv
consig3 sv;'button-press-event';'sv_button_press'
consig3 sv;'key-press-event';'sv_key_press'
consig3 sv;'populate-popup';'sv_populate_popup'
setfont sv;FixFont
sw;sv
)
sv_key_press=: 0:
sv_populate_popup=: 0:
sview_init=: 3 : 0
initsearchpath''
EMPTY
)
viewlinenumbers=: 3 : 0
if. -.IFSV do. 0 return. end.
'w s'=. 2 {. y,_1
if. s<0 do.
  gtk_source_view_get_show_line_numbers w
else.
  s[gtk_source_view_set_show_line_numbers w,s
end.
)
viewgettop=: 3 : 0
px=. memaz 4  
py=. memaz 4  
iter=. i.ITERSIZE
gtk_text_view_window_to_buffer_coords y;2;0;0;(<px);<<py
cx=. {.memri4 px
cy=. {.memri4 py
memf px
memf py
gtk_text_view_get_iter_at_position y;iter;(<0);cx;cy
gtk_text_iter_get_line <iter
)
viewnewselect=: 3 : 0
'view pos fin new set'=. y
new=. utf8 new
top=. viewgettop view
buf=. gtk_text_view_get_buffer view
noevents 1
bgn=. newiterpos buf,pos
end=. newiterpos buf,pos
gtk_text_iter_forward_chars end;fin-pos
gtk_text_buffer_delete buf;bgn;end
gtk_text_buffer_insert buf;end;new;#new
bgn=. newiterpos buf,{.set
end=. newiterpos buf,{.set
gtk_text_iter_forward_chars end;({:set)-{.set
gtk_text_buffer_select_range buf;bgn;end
viewsetscroll view;top
noevents 0
)
viewread=: 3 : 0
bufread gtk_text_view_get_buffer y
)
viewreplacelast=: 3 : 0
'view txt pos len'=. y
txt=. utf8 pos }. txt
buf=. gtk_text_view_get_buffer view
noevents 1
bgn=. newiterpos buf,pos
end=. newiterend buf
gtk_text_buffer_delete buf;bgn;end
sel=. newiterend buf
gtk_text_buffer_insert buf;sel;txt;#txt
sp0=. newiterpos buf,pos
sp1=. newiterpos buf,pos
gtk_text_iter_forward_chars sp1;len
gtk_text_buffer_select_range buf;sp0;sp1
viewscrolliter view;sp1
noevents 0
)
viewreplaceselect=: 3 : 0
'view pos len new'=. y
new=. utf8 new
buf=. gtk_text_view_get_buffer view
noevents 1
bgn=. newiterpos buf,pos
end=. newiterpos buf,pos
gtk_text_iter_forward_chars end;len
gtk_text_buffer_delete buf;bgn;end
sel=. newiterpos buf,pos
gtk_text_buffer_insert buf;sel;new;#new
viewscrolliter view;sel
noevents 0
)
viewreplacetext=: 3 : 0
'view new'=. y
new=. utf8 new
top=. viewgettop view
top=. 0 >. top <. <: +/new = LF
buf=. gtk_text_view_get_buffer view
noevents 1
bufwrite buf;new
viewsetscroll view;top
noevents 0
)
viewsethigh=: 3 : 0
'view row'=. y
if. row<0 do. EMPTY return. end.
noevents 1
buf=. gtk_text_view_get_buffer view
len=. gtk_text_buffer_get_line_count buf
if. row>len do. EMPTY return. end.
bgn=. newiterline buf,row+1
end=. newiterline buf,row+1
gtk_text_iter_forward_to_line_end <end
gtk_text_buffer_select_range buf;bgn;end
noevents 0
EMPTY
)
viewsetrow=: 3 : 0
'view row'=. y
row=. row>.0
noevents 1
buf=. gtk_text_view_get_buffer view
bgn=. newiterline buf,row
gtk_text_buffer_place_cursor buf;bgn
noevents 0
)
viewsetscroll=: 3 : 0
'view row'=. y
buf=. gtk_text_view_get_buffer view
bgn=. newiterline buf,row
mark=. gtk_text_buffer_get_mark buf;'scroll'
gtk_text_buffer_move_mark buf;mark;bgn
gtk_text_view_scroll_to_mark view,mark,0 1 0 0
)
viewsetselect=: 3 : 0
'view pos len'=. y
buf=. gtk_text_view_get_buffer view
noevents 1
bufsetselect buf,pos,len
viewscrolliter view;newiterpos buf,pos
noevents 0
)
viewscrolliter=: gtk_text_view_scroll_to_iter @ (,&(0;0;0;0))
viewwrite=: 3 : 0
'view txt'=. y
bufwrite (gtk_text_view_get_buffer view);txt
)
newwindow=: 3 : 0
window=: gtk_window_new GTK_WINDOW_TOPLEVEL
windowcaption y
consig3 window;'delete-event';'window_delete'
accel_group=: gtk_accel_group_new''
gtk_window_add_accel_group window,accel_group
)
windowcaption=: 3 : 0
gtk_window_set_title window;y
)

windowcenter=: 3 : 'gtk_window_set_position window,GTK_WIN_POS_CENTER'
windowdefaultsize=: 3 : 0
gtk_window_set_default_size window,y
)
windowborderwidth=: 3 : 0
gtk_container_set_border_width window;y
)
windowfinish=: 3 : 0
gtk_widget_show_all window
macmenu''
)
coclass'jgtkgraph'
coinsert'jgtk'
graph_init=: 3 : 0
'xysize'=. y
gtkbox=: gtk_event_box_new''
gtkda=: gtk_drawing_area_new''
gtk_widget_set_size_request gtkda,xysize
gtk_container_add gtkbox,gtkda
events=. GDK_EXPOSURE_MASK,GDK_BUTTON_PRESS_MASK,GDK_BUTTON_RELEASE_MASK,GDK_POINTER_MOTION_MASK
gtk_widget_add_events gtkda, OR events

gtkpc=: gtk_widget_get_pango_context gtkda
gtkpl=: pango_layout_new gtkpc
gtkplc=: pango_layout_get_context gtkpl

consig3 gtkda;'configure_event';'configure_event'
consig3 gtkda;'expose_event';'expose_event'
consig3 gtkda;'button_press_event';'button_press_event'
consig3 gtkda;'button_release_event';'button_release_event'
consig3 gtkda;'motion_notify_event';'motion_notify_event'
consig gtkda;'destroy';'destroy_event'

gtkwin=: gtkpx=: gtkgc=: gtkdagc=: 0
)
create=: graph_init
destroy=: 3 : 0
cbfree''
codestroy''
0
)
arctan=: _3&o.
dfr=: *&(180%1p1)
OR=: 23 b./
pafc=: 2p1&|@{:@(*.@(j./))  
calcAngle=: ([: pafc _1 1 * -)"1

bufreport=: 3 : 0
smoutput 'width   : ',":w=. gdk_pixbuf_get_width y
smoutput 'height  : ',":h=. gdk_pixbuf_get_height y
smoutput 'stride  : ',":gdk_pixbuf_get_rowstride y
smoutput 'pixels  : ',":d=. gdk_pixbuf_get_pixels y
smoutput 'channels: ',":gdk_pixbuf_get_n_channels y
smoutput 'hasalpha: ',":gdk_pixbuf_get_has_alpha y
smoutput 'bitspers: ',":gdk_pixbuf_get_bits_per_sample y
smoutput 'nub data: ',":~.memr d,0,(w*h),JINT
)
3 : 0''
if. IF64 do.
  ALPHA=: 0{_3 ic 0 0 0 255 255 255 255 255{a.
else.
  ALPHA=: 0{_2 ic 0 0 0 255{a.
end.
''
)
NOTALPHA=: 0{_2 ic 255 255 255 0{a.

flip_rgb=: 3 : 0
d=. ((#y),4)$2 (3!:4) y
d=. 2 1 0 3{"1 d
_2(3!:4),d
)
degree64=: 0.5 <.@:+ 64 * dfr
get_button=: 3 : 0
if. IF64 do.
  a.i.memr y,52 1
else.
  memr y,40 1,JINT
end.
)
get_button=: 3 : 0
256#.endian a.i.memr y,GdkEventButton_button,4
)
get_type=: 3 : 0
memr y,0 1,JINT
)
gtkcolor=: 3 : 0
gdk_gc_set_rgb_fg_color gtkgc;rgb2gtk y
)
gtktextangle=: 3 : 0
mat=. 1 0 0 1 0 0 + 1.1 - 1.1
pango_matrix_rotate mat;y
pango_context_set_matrix gtkplc;mat
pango_layout_context_changed gtkpl
)
gtkarcisi=: 3 : 0
ctr=. (0 1{y) + -: (2 3{y)
'bgn end'=. ctr calcAngle (4 5,:6 7){y
dif=. 2p1 | end - bgn
(4{.y), degree64 bgn,dif
)
rgb2gtk=: 3 : 0
(0 0 0 0{a.), 1 (3!:4) (256 * y) + 255 * 127 < y
)
button_event=: 4 : 0
n=. ,(get_button y){' lmr'
x=. ,>(5=get_type y){x;'dbl'
name=. 'mb',n,x
mousepos=. <.2 3{;gdk_event_get_coords y;(,0.0);,0.0
state=. 2{;gdk_event_get_state y;,0
wh=. glqwh''
sysdata=: 0":mousepos,wh,state
if. _1=nc <name do. 0 return. end.
".name,''''''
0
)
button_press_event=: 3 : 0
'down' button_event 1{y
)
button_release_event=: 3 : 0
'up' button_event 1{y
)
configure_event=: 3 : 0
'widget event data'=. y
if. 0=gtkwin do. gtkwin=: getGtkWidgetWindow gtkda end.
if. 0=gtkdagc do. gtkdagc=: getdagc gtkda end.
gtkwh=: 2 3{gtkxywh=: getGtkWidgetAllocation gtkda
if. gtkpx do. g_object_unref gtkpx end.
gtkpx=: gdk_pixmap_new gtkwin,gtkwh,_1
if. 0=gtkgc do. gtkgc=: gdk_gc_new gtkwin end.
0
)

expose_event=: 0[glpaintx
destroy_event=: 3 : 0
'widget data'=. y
if. -.IFGTK do.
 gtk_main_quit ''
end.
destroy ''
0
)
motion_notify_event=: 3 : 0
if. _1=nc <'mmove' do. 0 return. end.
'widget event gpointer'=. y
mousepos=. <.2 3{;gdk_event_get_coords event;(,0.0);,0.0
state=. 2{;gdk_event_get_state event;,0
wh=. glqwh''
sysdata=: 0":mousepos,wh,state
mmove''
0
)
glarc=: 3 : 0 "1
t=. gtkbrushnull
gtkbrushnull=: 1
glarcx gtkarcisi y
gtkbrushnull=: t
)
glarcx=: 3 : 0 "1
if. -.gtkbrushnull do.
  gtkcolor gtkbrushrgb
  gdk_draw_arc gtkpx,gtkgc,1,y
end.
gtkcolor gtkpenrgb
gdk_draw_arc gtkpx,gtkgc,0,y
)
glbrush=: 3 : 0 "1
gtkbrushrgb=: gtkrgb
gtkbrushnull=: 0
)
glbrushnull=: 3 : 0 "1
gtkbrushnull=: 1
)
glclear=: 3 : 0 "1
glwindoworg 0 0
glclipreset''
glrgb 255 255 255
glpen 1 0
glbrush''
glrect 0 0,gtkwh
glrgb 0 0 0
glpen 1 0
glbrushnull''
gltextxy 0 0
gltextcolor''
glfontangle 0
)
glclip=: 3 : 0 "1
gdk_gc_set_clip_rectangle gtkgc;2(3!:4)y
)
glclipreset=: 3 : 0 "1
gdk_gc_set_clip_rectangle gtkgc;2(3!:4)0 0,gtkwh
)
glcmds=: 3 : 0
while. #y do.
  cnt=. 0{y
  cmd=. 1{y
  dat=. 2}.cnt{.y
  if. 2015=cmd do.
    gllines |dat
  else.
  end.
  y=. cnt}.y
end.
)
glellipse=: 3 : 'glarcx y,"1 [ 0,360*64'
glfont=: 3 : 0 "1
if. 1 e. ' bold' E. y=. tolower y do.
  bold=. 1 [ y=. }. ; (<' bold') -.~ <;.1 ' ', y
else.
  bold=. 0
end.
if. 1 e. ' underline' E. y do.
  gtkunderline=: 1 [ y=. }. ; (<' underline') -.~ <;.1 ' ', y
else.
  gtkunderline=: 0
end.
fnt=. pango_font_description_from_string <y
if. bold do. pango_font_description_set_weight fnt, 700 end.
pango_layout_set_font_description gtkpl,fnt
pango_font_description_free fnt
)
glfontangle=: 3 : 0 "1 
gtkfontangle=: y
)
glrgb=: 3 : 0 "1
gtkrgb=: y
)
gllines=: 3 : 0 "1
gtkcolor gtkpenrgb
c=. <.-:#y=. <.y
if. IF64 do. y=. _3 ic 2 ic y end. 
gdk_draw_lines gtkpx;gtkgc;y;c
)
glpaint=: 3 : 0 "1
gtk_widget_queue_draw gtkda
)
glpaintx=: 3 : 0 "1
glclear''
paint''
gdk_draw_drawable gtkwin,gtkdagc,gtkpx,0 0 0 0 _1 _1
)
glpen=: 3 : 0 "1
gtkpenrgb=: gtkrgb
gtkpenwidth=: {.y
gtkpenstyle=: {:y
gdk_gc_set_line_attributes gtkgc;gtkpenwidth;0;1;0
)
glpie=: 3 : 0 "1
glarcx gtkarcisi y
)
glpixel=: 3 : 0 "1
gtkcolor gtkrgb
gdk_draw_point gtkpx,gtkgc,y
)
glpixels=: 3 : 0 "1
'a b w h'=. 4{.y
d=. 4}.y
d=. d OR ALPHA
if. IF64 do. d=. 2 ic d end.
buf=. gdk_pixbuf_new_from_data (15!:14<'d'),GDK_COLORSPACE_RGB,1,8,w,h,(4*w),0,0
if. buf do.
  gdk_draw_pixbuf gtkpx,0,buf,0,0,a,b,w,h,0,0,0
end.
g_object_unref buf
)
glpolygon=: 3 : 0 "1
c=. <.-:#y=. <.y
if. IF64 do. y=. _3 ic 2 ic y end. 
if. -.gtkbrushnull do.
  gtkcolor gtkbrushrgb
  gdk_draw_polygon gtkpx;gtkgc;1;y;c
end.
gtkcolor gtkpenrgb
gdk_draw_polygon gtkpx;gtkgc;0;y;c
)

glqpixels=: 3 : 0 "1
'a b w h'=. y
pixbuf=. gdk_pixbuf_new GDK_COLORSPACE_RGB,1,8,w,h
gdk_pixbuf_get_from_drawable pixbuf,gtkpx,GDK_COLORSPACE_RGB,a,b,0,0,w,h
ad=. gdk_pixbuf_get_pixels pixbuf
if. IF64 do.
  r=. _2 ic memr ad,0,(w*h*4),JCHAR
else.
  r=. memr ad,0,(w*h),JINT
end.
g_object_unref pixbuf
r AND NOTALPHA
)
glqwh=: 3 : 0
gtkwh
)
glrect=: 3 : 0 "1
if. 0 e. _2{.y do. return. end. 
if. -.gtkbrushnull do.
  gtkcolor gtkbrushrgb
  gdk_draw_rectangle gtkpx,gtkgc,1,y
end.
gtkcolor gtkpenrgb
gdk_draw_rectangle gtkpx,gtkgc,0,y-0 0 1 1
)
glsel=: 3 : 0 "1
'' 
)
glsetbrush=: glbrush @ glrgb
glsetpen=: glpen @ ((1 0 [ glrgb) :((2 {. [) glrgb))
gltext=: 3 : 0 "1
gtkcolor gtktextrgb
if. gtkunderline do.
  atl=. pango_attr_list_new ''
  ul=. pango_attr_underline_new 1        
  pango_attr_list_insert atl,ul
  pango_layout_set_attributes gtkpl,atl
  pango_attr_list_unref atl              
end.
if. 0=gtkfontangle do.
  pango_layout_set_text gtkpl;(,y);#y
  gdk_draw_layout gtkpx,gtkgc,gtktextxy,gtkpl
else.
  gtktextangle gtkfontangle
  pango_layout_set_text gtkpl;(,y);#y
  gdk_draw_layout gtkpx,gtkgc,gtktextxy,gtkpl
  gtktextangle 0
end.
if. gtkunderline do.
  atl=. pango_attr_list_new ''
  ul=. pango_attr_underline_new 0        
  pango_attr_list_insert atl,ul
  pango_layout_set_attributes gtkpl,atl
  pango_attr_list_unref atl              
end.
)
gltextcolor=: 3 : 0 "1
gtktextrgb=: gtkrgb
)
gltextxy=: 3 : 0 "1
gtktextxy=: y
)
glqextent=: 3 : 0 "1
pango_layout_set_text gtkpl;(,y);#y
_2 {. ;pango_layout_get_pixel_size gtkpl;(,2);,3
)
glqextentw=: 3 : 0 "1
{."1>glqextent each<;._2 y,LF#~LF~:{:y
)
glwindoworg=: 3 : 0 "1
'' 
)

0 : 0 
glcapture=:      11!:2062
glcaret=:        11!:2065
glcmds=:         11!:2999
glcursor=:       11!:2069
glemfclose=:     11!:2085
glemfopen=:      11!:2084
glemfplay=:      11!:2086
glfile=:         11!:2066
glnodblbuf=:     11!:2070
glpixelsx=:      11!:2075
glprint=:        11!:2089
glprintmore=:    11!:2091
glqhandles=:     11!:2060
glqprintpaper=:  11!:2092
glqprintwh=:     11!:2088
glqtextmetrics=: 11!:2058
glroundr=:       11!:2033
)
gtkextents=: 4 : 0
p=. mema JINT * 8
pango_layout_get_pixel_extents x,p + 0,JINT * 4
res=. char4toint memr p,0,(4*8),JCHAR
memf p
res
)
gtkextent=: 3 : 0
'p txt font'=. y
glfont font
if. L.txt do.
  |: p gtkextent1 &> txt
else.
  p gtkextent1 ,txt
end.
)
gtkextent1=: 4 : 0
pango_layout_set_text x;(,y);#y
_2 {. ;pango_layout_get_pixel_size x;(,2);,3
)
gtkextentink=: 3 : 0
'p txt font'=. y
glfont font
if. L.txt do.
  |: p gtkextentink1 &> txt
else.
  p gtkextentink1 ,txt
end.
)
gtkextentink1=: 4 : 0
pango_layout_set_text x;(,y);#y
_2 {. gtkextents ''
)

cocurrent 'jgtk'
gtkglade=: 4 : 0
builder=. gtk_builder_new''
if. 0=builder do. 0 0 return. end.
r=. ''
gerr=: ,-0
if. L.y do.
  rc=. gtk_builder_add_from_string builder;(>y);_1;gerr
else.
  rc=. gtk_builder_add_from_file builder;y;gerr
end.
if. 0= rc do.
  smoutput memr (memr gerr,8 1 4),0 _1
  builder, 0 return.
end.
window=. gtk_builder_get_object builder;x
if. 0=window do. builder, 0 return. end.
GLADESIGNALS=: 0 5$'' 
h=. cbreg 'gladecallback_',(>coname''),'_'
gtk_builder_connect_signals_full builder,cb7,h
gladeconsig GLADESIGNALS
builder,window
)
gladereport=: 3 : 0
t=. GLADESIGNALS
han=. 2{"1 t    
obj=. +/>3{"1 t 
flg=. +/>4{"1 t 
sig=. ~.1{"1 t  
mul=. (1<+/"1 = a)#~.a=. 2{"1 t 
r=. ''
if. obj do. r=. r,'row(s) with connect_object - not supported',LF end.
if. flg do. r=. r,'row(s) with flags - not supported',LF end.
r=. r,(0~:#r)#LF
r=. r,'signals: ',gladerepsub sig
r=. r,'handler verbs not defined: ',gladerepsub (3~:nc han)#han
r=. r,'handler verbs defined: ',gladerepsub (3=nc han)#han
)
gladecallback=: 3 : 0
'bulder object psignal phandler connect_object flags qpointer'=. y
signal=. memr psignal,0,_1
handler=. memr phandler,0,_1
t=. (":object),' : ',signal,' : ',handler,LF
GLADESIGNALS=: GLADESIGNALS,object;signal;handler;connect_object;flags
)
gladeconsig=: 3 : 0
for_i. i.#y do.
  'object signal handler connect_object flags'=. i{y
  if. connect_object do.           
  elseif. flags do.           
  elseif. '_event'-:_6{.signal do. 
    consig3 object;signal;handler
  elseif. 1 do.                    
    consig object;signal;handler
  end.
end.
)
gladerepsub=: 3 : 0
LF,~LF,;' ',each,LF,~each y
)

coclass 'jgtkide'
coinsert 'jgtk'
addtilde=: ,~ (0 < #) # '~' -. {.
remtilde=: }.~'~'={.
loadscript=: load
matchparens=: 0:
nc=: 4!:0
spliton=: i.~ ({. ,&< }.@}.) ]
trimWS=: #~ (+./\ *. +./\.)@:-.@(e.&(TAB,CRLF,' '))
bindtextdomain ::0: 'jgtkide';jpath '~install/gtk/share/locale'
bind_textdomain_codeset ::0: 'jgtkide';'UTF-8'
textdomain ::0: <'jgtkide'
cutLF=: 3 : 0
if. L. y do. y return. end.
a: -.~ <;._2 y,LF
)
dialog=: 3 : 0
a=. '' conew 'jgtkdialog'
r=. run__a y
destroy__a''
r
)
getactview=: 3 : 0
select. {.WinFocus
case. window__locTerm do.
  termSV
case. window__locEdit do.
  if. #EditTabs do.
    page_sv EditPage
  else.
    0
  end.
case. do.
  0
end.
)
getcurrentbuf=: 3 : 0
select. {.WinFocus
case. window__locTerm do.
  termSB__locTerm
case. window__locEdit do.
  if. #EditTabs do.
    edit_current_def''
    pSB
  else.
    0
  end.
case. do.
  0
end.
)
getcurrentloc=: 3 : 0
(window__locEdit={.WinFocus) { locTerm,locEdit
)
getmenu=: 3 : 0
ndx=. MENUIDS i. <y
if. ndx=#MENUIDS do.
  ((gettext 'menu not found: '),y) assert 0
end.
ndx pick MENUDEF
)
getselection=: 3 : 0
buf=. getcurrentbuf''
if. buf do. bufreadselect buf else. '' end.
)
getcurrentname=: 3 : 0
buf=. getcurrentbuf''
mark=. newitercursor buf
row=. gtk_text_iter_get_line <mark
bgn=. newiterline buf,row
end=. newiterline buf,row
gtk_text_iter_forward_to_line_end <end
p=. readstringfree gtk_text_iter_get_text bgn;mark
q=. readstringfree gtk_text_iter_get_text bgn;end
'name pos'=. getnameatcursor p;q
name
)
getcurrentccppfx=: 3 : 0
buf=. getcurrentbuf''
mark=. newitercursor buf
row=. gtk_text_iter_get_line <mark
bgn=. newiterline buf,row
end=. newiterline buf,row
gtk_text_iter_forward_to_line_end <end
p=. readstringfree gtk_text_iter_get_text bgn;mark
q=. readstringfree gtk_text_iter_get_text bgn;end
'name pos'=. getccppfxatcursor p;q
name
)
isimagefile=: 3 : 0
if. (<tolower '.' (i:~ }. ]) y) -.@e. '.' ,&.> 'bmp';'gif';'jpg';'jpeg';'png';'svg';'tif';'tiff' do. 0 return. end.
s=. 1!:4 :: _1: f=. fboxname y
if. s>:0 do. 1 return. end.
0
)
istextfile=: 3 : 0
s=. 1!:4 :: _1: f=. fboxname y
if. (s>:0) *. s<MaxText do.
  if. istextfile1 1!:1 :: (''"_) f do. 1 return. end.
end.
f=. tofoldername_jp_ y
t=. (gettext 'open file')
if. s = _1 do.
  mbinfo t;(gettext 'not found: '),f
elseif. s >: 1e6 do.
  mbinfo t;(gettext 'file too big '),f,': ',,'c' 8!:2 s
elseif. do.
  mbinfo t;(gettext 'content is not text: '),f
end.
0
)

istextfile1=: isutf8
ppath=: 3 : 0
if. isroot_j_ y do. y else. jpath '~',y end.
)
setfontall=: 3 : 0
FixFont_jgtkide_=: y
sv=. termSV__locTerm,page_svs''
for_i. sv do. setfont i;y end.
EMPTY
)
cocurrent 'z'

co=: ((] [ 18!:4@[) (>@(18!:5)@(0&$) , ' => ' , >))@((0 ~: #) { 'base'&;)
cofind=: 3 : 0
r=. (<,>y) (4 : 'try. x e. nl__y $0 catch. 0 end.'"0 # ]) 18!:1]0 1
if. 0=#r do. i.0 2 end.
)
cofindv=: 3 : 0
lcs=. cofind y
if. #lcs do.
  lcs ,. ". each (<y,'_') ,each lcs ,each '_'
end.
)
qss=: 3 : 0
r=. y dirss jpath '~Gtk'
r=. r,(0<#r)#LF
r,y dirss jpath '~Ide'
)
show_cbregs=: 3 : 0
smoutput (":,.i.#a),.' ',.>a=. cbregs_jgtk_
)

cocurrent 'jgtkide'
cfdelete=: ]
fpath=: [: }: +./\.@:=&'/' # ]
3 : 0''
if. IFUNIX do. filecase=: [
else. filecase=: tolower end.
0
)
cfsxname=: 3 : 0
(f i: '.') {. f=. 1 pick fpathname y
)
hostcmd=: [: 2!:0 '(' , ,&' || true)'
dquote=: 3 : 0
m=. y='"'
'"',('\' ((+i.@#) I.m) }(1+m)#y),'"'
)
forkcmd=: 3 : 0
if. IFUNIX do.
  2!:0 y, ('&' ~: {:y) # ' &'
else.
  fork y
end.
)
shellcmd=: 3 : 0
if. IFUNIX do.
  hostcmd y
else.
  spawn y
end.
)
setwinfocus=: 3 : 0
WinFocus_jgtkide_=: ~.y,WinFocus
0
)
readwinpos=: 3 : 0
pos=. getwinpos window
if. 0={:pos do.
  (y,'_jgtkide_')=: }:pos
  winpos_save''
end.
)
moveword=: 3 : 0
'dir sb sv'=. y
mark=. i.ITERSIZE
gtk_text_buffer_get_iter_at_mark sb;mark;gtk_text_buffer_get_insert sb
row=. gtk_text_iter_get_line <mark
bgn=. newiterline sb,row
end=. newiterline sb,row
gtk_text_iter_forward_to_line_end <end
p=. readstringfree gtk_text_iter_get_text bgn;mark
q=. readstringfree gtk_text_iter_get_text bgn;end
n=. moveword1 dir;p;q
select. m=. n
case. _3 do. 0 return.
case. _2 do.
  while. 0 <: row=. row-1 do.
    p=. bufreadline sb,row
    n=. moveword1 0;p;p
    if. n ~: _2 do. break. end.
  end.
  if. row=_1 do. 1 return. end.
  if. n=_3 do. 0 return. end.
  bgn=. newiterline sb,row
case. _1 do.
  len=. gtk_text_buffer_get_line_count sb
  while. len > row=. row+1 do.
    p=. bufreadline sb,row
    n=. moveword1 1;'';p
    if. n ~: _1 do. break. end.
  end.
  if. (row=len) +. n=_3 do. 0 return. end.
  bgn=. newiterline sb,row
  mark=. gtk_text_buffer_get_mark sb;'scroll'
  gtk_text_buffer_move_mark sb;mark;bgn
end.
gtk_text_iter_forward_chars bgn;n
gtk_text_buffer_place_cursor sb;bgn
if. m = _1 do.
  gtk_text_view_scroll_to_mark sv,mark,0 0 0 0
else.
  viewscrolliter sv;bgn
end.
1
)
moveword1=: 3 : 0
'dir pfx all'=. y

if. dir=0 do.
  pfx=. dtb pfx
  if. 0 = #pfx do. _2 return. end.
else.
  pfx=. pfx, (0 i.~ ' ' = (#pfx) }. all) # ' '
  if. pfx -: all do. _1 return. end.
end.

try.
  pfx=. ucp pfx
  all=. ucp all
  awf=. ;: all
catch. _3 return. end.

m=. -. @ (-: awf {.~ #) @ (;: ::])
if. dir=0 do.
  while. m pfx=. }:pfx do. end.
else.
  while. m pfx=. pfx,(#pfx){all do. end.
end.

#pfx
)

coclass 'jgtkide'
IFGTK_z_=: 1
LineNos=: 0
MaxText=: 1e6
conn_init=: 0:

bd=: 9!:6'' 
jfe_z_=: 0 0$15!:16
TabCloseStyle=: 0 : 0
style "tab-close-button-style" {
 GtkWidget::focus-padding = 0
 GtkWidget::focus-line-width = 0
 xthickness = 2
 ythickness = 2
}
widget "*.tab-close-button" style "tab-close-button-style"
)
ccp_query=: 3 : 0
''-.@-:locCcp__locEdit return.
)
ccp_new=: 3 : 0
assert. ''-:locCcp__locEdit
if. _1=y do.
  if. 0= #name=. getcurrentccppfx'' do.
    0 return.
  end.
else.
  if. 0= #name=. (utf8 u:y),~ getcurrentccppfx'' do.
    0 return.
  end.
end.
if. 0=#t=. ccp_tagcp name do.
  0 return.
else.
  rect=. 16#{.a.
  iter=. i.ITERSIZE
  gtk_text_buffer_get_iter_at_mark pSB;iter;gtk_text_buffer_get_insert pSB
  gtk_text_view_get_iter_location pSV;iter;rect
  bxywh=. _2 (3!:4) rect
  wx=. ,_1 [ wy=. ,_1
  gtk_text_view_buffer_to_window_coords pSV;1;(0{bxywh);(1{bxywh);wx;wy
  svxywh=. getGtkWidgetAllocation pSV
  tx=. ,_1 [ ty=. ,_1
  gtk_window_get_position (gtk_widget_get_toplevel pSV);tx;ty
  xywh=. (((tx,ty)+(2{.svxywh)+wx,wy),_2{.bxywh)

  locCcp__locEdit=: l=. conew 'jgtkccpbox'
  create__l (pSV;xywh;name;<t)
end.
1
)
ccp_renew=: 3 : 0
assert. -. ''-:locCcp__locEdit
l=. locCcp__locEdit
if. 0= #name=. (utf8 u:y),~ getcurrentccppfx'' do.
  close__l''
  0 return.
end.
if. 0=#t=. ccp_tagcp name do.
  close__l''
  0 return.
else.
  renew__l (name;<t)
end.
1
)
ccp_word=: 3 : 0
assert. ''-.@-:locCcp__locEdit
l=. locCcp__locEdit
pfx=. ucp pfx8=. getcurrentname__l''
name=. ucp getcurrentccppfx''
sfx=. (#name)}.pfx
if. 1 e. r=. sfx e. a.-.AlphaNum do.
  n2=. +/ *./\ r}.~ n1=. r i. 1
  sfx=. sfx{.~ n1+n2
end.
sfx=. utf8 sfx
gtk_text_buffer_insert_at_cursor pSB;sfx;#sfx  

name=. getcurrentccppfx''
if. pfx8-:name do.
  close__l''
  0 return.
end.
1
)
ccp_destroy=: 3 : 0
if. ''-.@-:l=. locCcp__locEdit do.
  close__l''
end.
1
)
ccp_select=: 3 : 0
assert. ''-.@-:locCcp__locEdit
l=. locCcp__locEdit
select__l''
1
)
ccp_scroll=: 3 : 0
assert. ''-.@-:locCcp__locEdit
l=. locCcp__locEdit
scroll__l y
1
)
ccp_scrollend=: 3 : 0
assert. ''-.@-:locCcp__locEdit
l=. locCcp__locEdit
scrollend__l y
1
)
ccp_tagcp=: 3 : 0
t=. ''
if. 't' e. CodeCompletionOption do.
  t=. t, tagcp_jadetag_ y
end.
if. ('g' e. CodeCompletionOption) *. -. ('t' e. CodeCompletionOption) *. (fexist jpath '~addons/api/gtkinclude/tags') *. (<'~addons/api/gtkinclude/tags') e. Tags_j_ do.
  t=. t, tagcp_jgtkdoctag_ y
end.
if. ('d' e. CodeCompletionOption) do.
  if. (0= nc <'UserDict_j_') *. fexist jpath '~addons/general/userdict/userdict.ijs' do.
    require '~addons/general/userdict/userdict.ijs'
    t=. t, usertagcp y
  end.
end.
/:~ ~. (<'') -.~ t
)
tagtab=: 3 : 0
0 tagtab y
:
if. 0=#n=. tagtag_jadetag_ y do. EMPTY return. end.
file=. tagfile_jadetag_ idx=. x{n
if. -.fexist <file do.
  mbinfo (gettext 'Open');(gettext 'not found: '),file
  EMPTY return.
end.
row=. <:{.file tagss_jadetag_ tagline_jadetag_ idx
edit_opentab_show__locEdit file;row;0
EMPTY
)
tag=: 0&$: : (4 : 0)
if. x do. y=. tagcp y end.
if. 0=#n=. tagtag_jadetag_ y do.
  EMPTY return.
elseif. 1=#n do.
  file=. tagfile_jadetag_ idx=. 0{n
  if. -.fexist <file do.
    mbinfo (gettext 'Open');(gettext 'not found: '),file
    EMPTY return.
  end.
  row=. <:{.file tagss_jadetag_ tagline_jadetag_ idx
  edit_opentab_show__locEdit file;row;0
elseif. do.
  t=. tagselect y
  (y;t) conew 'jgtkctag'
end.
EMPTY
)

tagtab_z_=: tagtab_jgtkide_
tag_z_=: tag_jgtkide_
cx_run_clip=: 3 : 0
txt=. clipread''
if. #txt do.
  runimmex1 txt
end.
)
sv_click=: 3 : 0
s=. 2 #. y
if. s = 2 do.
  buf=. getcurrentbuf''
  setidle 'findname_',(>coname''),'_ ',":buf,s{0 2 1
end.
0
)
sv_double_click=: 3 : 0
buf=. getcurrentbuf''
setidle 'findname_',(>coname''),'_ ',":buf,0
0
)
findname=: 3 : 0
'buf sel'=. y
if. 0=buf do. 0 return. end.
mark=. newitercursor buf
row=. gtk_text_iter_get_line <mark
bgn=. newiterline buf,row
end=. newiterline buf,row
gtk_text_iter_forward_to_line_end <end
p=. readstringfree gtk_text_iter_get_text bgn;mark
q=. readstringfree gtk_text_iter_get_text bgn;end
'name pos'=. getnameatcursor p;q
if. #name do.
  mid=. newiterline buf,row
  gtk_text_iter_forward_chars bgn;pos
  gtk_text_iter_forward_chars mid;pos+#name
  gtk_text_buffer_select_range buf;bgn;mid
  if. sel do. fif name;sel end.
end.
)
inputx=: ''
logged=: 0
inputs=: 0
active=: 1

ifxlog=: 0
xlog=: ''
immex=: 3 : 0
logged=: 0
inputs=: 0
inputline=: y
inputready=: 1
)
immexd=: 3 : 0
logged=: 1
inputs=: 0
inputline=: y
inputready=: 1
)
immexs=: 3 : 0
logged=: 0
inputs=: 1
inputline=: y
inputready=: 1
)
input=: 3 : 0
term_append__locTerm prompt=: y
inputready=: 0
inputs=: 0
logged=: 0
while. 1 do.
  whilst. gtk_events_pending'' do.
    gtk_main_iteration''
  end.
  if. inputready do. break. end.
end.
if. ifxlog do. xlog=: xlog,<0;inputline end.
inputline
)
output=: 4 : 0
if. -.active do. return. end.
if. ifxlog do. xlog=: xlog,<x;y end.
if. 3~:x do.
  term_append__locTerm y
else.
  if. inputs do. return. end.
  if. logged do.
    term_append__locTerm y
  else.
    logged=: 1
    term_append__locTerm LF
  end.
end.
)

input_jfe_=: input_jgtkide_
output_jfe_=: output_jgtkide_
runimmex0=: 3 : 0
if. #y do.
  inputx_jgtkide_=: y
  immex_jgtkide_ '0!:100 inputx_jgtkide_'
end.
)
runimmex1=: 3 : 0
if. #y do.
  inputx_jgtkide_=: y
  immex_jgtkide_ '0!:101 inputx_jgtkide_'
end.
)
fkey_list=: 3 : 0
a=. cocreate''
coinsert__a coname''
fkey_list1__a coname''
)
fkey_list1=: 3 : 0
locP=: y
ndx=. /: (100|FKeys),.FKeys
ids=. 'F' ,each ": each 100|FKeys
cs=. (<.FKeys % 100){'';' shift';' ctrl';' ctrl+shift'
lab=. 1{"1 FKeyx
ids=. ids ,each cs
nms=. ndx{ids,.lab
Fx=: ndx
window_delete=: fkey_close
newwindow 'Function Keys'
windowdefaultsize 400 300
gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
gtk_window_set_destroy_with_parent window,1
gtk_window_set_modal window,1
windowcenter''
sw=. newsw''
tv=: makelistgrid 'fkey';'';nms;'';'';1
setchildfocus tv
gtk_container_add sw,tv
gtk_container_add window,sw
windowfinish''
)
fkey_key_press=: 3 : 0
if. isesckey y do. fkey_close'' else. 0 end.
)
fkey_close=: 3 : 0
gtk_widget_destroy window
cbfree''
codestroy''
1
)
fkey_row_activated=: 3 : 0
row=. listbox_getactiverow tv
if. row >: 0 do.
  fkey_exec_index__locTerm row { Fx
end.
if. -. 1{getmodifiers'' do.
  fkey_close''
end.
)
idlers=: ''
runidle=: 3 : 0
if. #idlers do.
  0!:100 ; idlers ,each LF
  idlers_jgtkide_=: ''
end.
0
)
setidle=: 3 : 0
if. #idlers do.
  idlers_jgtkide_=: ~.idlers,<y
else.
  idlers_jgtkide_=: <y
  g_idle_add cb1;cbreg 'runidle_jgtkide_'
end.
0
)
lint=: 3 : 0
if. 0=#EditTabs do. return. end.
require PPScript_jp_
edit_current_def''

'old sel len'=. bufget pSB
crs=. +/ LF = sel {. old
FORMAT_j_=: 1 0 2 1 0 0

new=. pplint_jpp_ old
if. 0 = #new do. return. end.
if. new -: old do. return. end.

top=. viewgettop pSV

if. L. new do.
  'lin msg'=. new
  'bgn end'=. 1 0 + (+/\LF = old) i. lin + 0 1
  viewsetscroll pSV,0 >. lin - 10
  viewsetselect pSV,bgn,end-bgn
  mbinfo (gettext 'Format Script');msg
  return.
else.
  old=. sel {. old
  chr=. +/ -. (TAB,' ') e.~ (1 + old i: LF) }. old
  spc=. (*chr) *. ' ' = {: old
  ndx=. crs { 0, 1 + I. LF = new
  sel=. ndx + chr i.~ 0, +/\ -. (TAB,' ') e.~ ndx }. new
  sel=. sel + spc * LF ~: {. sel }. new
  sel=. sel <. <:#new
  bufwrite pSB;new
  viewsetscroll pSV,top
  viewsetselect pSV,sel,0
end.
)
main_run=: jfe bind 1

detach_console=: 3 : 0
if. IFWIN do.
  'kernel32 FreeConsole > i'&cd ''
end.
0
)
main=: 3 : 0
main_init''
if. r=. conf_init'' do. main_quit r return. end.
if. r=. conn_init'' do. main_quit r return. end.
detach_console''
proj_init''
menu_init''
sview_init''
main_open''
main_run''
0
)
main_init=: 3 : 0
if. IFUNIX do.
  hostfilename=: jpathsep
else.
  hostfilename=: tolower @ jpathsep
end.
extdef=: , (ScriptExt_j_ #~ '.'&e. < 0 < #)
main_init_paths''
gtkinit''
gtkfixf10''
gtk_rc_parse_string <TabCloseStyle
EditTabx=: i.0 0
locFif=: locFiw=: locEdits=: locEdit=: locTerm=: ''
SelectFile=: jpath '~temp/selection.'
Swh=: getscreenwh''
Twh=: 0 0
WinFocus=: ''
)
main_init_paths=: 3 : 0
GtkConfig=: jpath '~addons/ide/gtk/config/'
WinPosFile=: jpath '~config/winpos.dat'
)
main_open=: 3 : 0
locTerm=: '' conew 'jgtkterm'
loc0=. conew 'jgtkedit'
loc1=. conew 'jgtkedit'
locEdit=: loc0
locEdits=: loc0,loc1
Visible=: 0 0
create__loc0 0
create__loc1 1
term_open__locTerm''
)
main_quit=: 3 : 0
active=: 0
jfe 0
noevents 1
delete_empty''
locs=. locFif,locFiw,(locEdits-.locEdit),locEdit
for_loc. locs intersect conl 1 do.
  window_destroy__loc''
end.
2!:55 {.0,y
)
proj_init=: 3 : 0
ProjectDat_jgtkide_=: jpath '~config/project.dat'
projreadopen_jgtkedit_''
projinit_jp_''
)
fontdiff=: 3 : 0
fnt=. deb FixFont
ndx=. fnt i: ' '
setfontall (ndx{.fnt),' ',":y + 10 ". ndx}.fnt
)

fontinc=: fontdiff bind 1
fontdec=: fontdiff bind _1

open=: 3 : 0
f=. getscripts_j_ y
b=. fexist f
if. 0 e. b do.
  j=. (b=0)#f
  if. 1=#j do.
    j=. ,>j
  else.
    j=. LF,; LF&, each j
  end.
  mbinfo (gettext 'Open');(gettext 'not found: '),j
end.
if. #f=. b#f do. edit_openfiles__locEdit f;_1 end.
EMPTY
)

open_z_=: open_jgtkide_
recent_run=: 3 : 0
if. 0 e. #RecentFiles_j_ do.
  mbinfo (gettext 'No recent files') return.
end.
a=. cocreate''
coinsert__a coname''
recent_run1__a coname''
)
recent_run1=: 3 : 0
locP=: y
Shift=: 0
Recent=: RecentFiles_j_
window_delete=: recent_close
newwindow (gettext 'Recent Files')
windowdefaultsize 500 400
gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
gtk_window_set_destroy_with_parent window,1
gtk_window_set_modal window,1
windowcenter''
sw=. newsw 1
hb=. gtk_hbox_new 0 0
nms=. remtilde each tofoldername_j_ Recent
tv=: makelistbox 'recent';nms;'';'';1
gtk_container_add sw,tv
gtk_box_pack_start hb,sw,1 1 0
vb=. gtk_vbox_new 0 0
gtk_box_pack_start vb,(newpad 0 4),0 0 0
newxbutton vb;(gettext 'Open');'recent_open_button'
newxbutton vb;(gettext 'View');'recent_view_button'
newxbutton vb;(gettext 'Run');'recent_run_button'
newxbutton vb;(gettext 'Run Display');'recent_rund_button'
gtk_box_pack_start hb,vb,0 0 6
gtk_container_add window,hb
setchildfocus tv
windowfinish''
)
recent_close=: 3 : 0
gtk_widget_destroy window
cbfree''
codestroy''
1
)

recent_cursor_changed=: ]
recent_key_press=: 3 : 0
if. isesckey y do. recent_close'' else. 0 end.
)
recent_open_button=: 3 : 0
if. 0 = #f=. recent_select'' do. 1 return. end.
edit_opentab_show__locEdit f
if. -. Shift do. recent_close'' end.
1
)
recent_row_activated=: 3 : 0
if. 0 = #f=. recent_select'' do. 1 return. end.
recent_open_button''
)
recent_run_button=: 3 : 0
if. 0 = #f=. recent_select'' do. 1 return. end.
term_load_script__locTerm f
if. -. Shift do. recent_close'' end.
)
recent_rund_button=: 3 : 0
if. 0 = #f=. recent_select'' do. 1 return. end.
term_loadd_script__locTerm f
if. -. Shift do. recent_close'' end.
)
recent_select=: 3 : 0
Shift=: 1{getmodifiers''
if. 0 > row=. listbox_getactiverow tv do. '' return. end.
row pick Recent
)
recent_view_button=: 3 : 0
if. 0 = #f=. recent_select'' do. 1 return. end.
fview f
if. -. Shift do. recent_close'' end.
)
delete_empty=: 3 : 0
c=. jpath '~config/'
m=. 0 = ;2{"1 d=. 1!:0 c,'*.cfg'
if. 1 e. m do.
  ferase (<c) ,each {."1 m#d
end.
c=. jpath '~temp/'
m=. 0 = ;2{"1 d=. 1!:0 c,'*.ijs'
t=. {."1 m # d
m=. istempname_j_ &> t
if. 1 e. m do.
  ferase (<c) ,each m#t
end.
1
)
getnameatcursor=: 3 : 0
'pfx all'=. y
bgn=. pfx #~ *./\. pfx e. AlphaNum,'_'
bgn=. bgn #~ +./\ bgn e. Alpha
sfx=. (#pfx) }. all
end=. sfx #~ *./\ sfx e. AlphaNum,'_'
nam=. bgn,end
nam=. (1 i.~ '__' E. nam) {. nam
if. '_' = {:nam do. nam=. ((}:nam) i: '_') {. nam end.
hit=. ((0<#bgn) +. ' '={:pfx) *. (0<#end) +. ({.sfx) e. ' ',LF
if. hit *. 0<#nam do.
  nam;(#pfx)-#bgn
else.
  '';''
end.
)
getccppfxatcursor=: 3 : 0
'pfx all'=. ucp&.> y
bgn=. utf8 pfx #~ *./\. pfx e. ucp CodeCompletionKeyword
sfx=. (#pfx) }. all
hit=. (0<#bgn) *. ({.sfx) -.@e. ucp CodeCompletionKeyword
if. hit do.
  bgn;(#utf8 pfx)-#bgn
else.
  '';''
end.
)
gotodef=: 3 : 0
if. 0=#y do. 1 return. end.
if. -. *./ y e. AlphaNum,'._' do. 0 return. end.
fif y;1
)
gototag=: 3 : 0
if. 0=#y do. 1 return. end.
tag y
)
gtklocs=: 3 : 0
locEdits,locTerm,locFif,locFiw
)
guigtkconfig=: 3 : 0
jpath '~addons/gui/gtk/config/'
)
interrupt=: 3 : 0
promptclear__locTerm''
immexs_jgtkide_ '''exit jfe (native) - to restart: jfe 1'''
jfe 0
1
)
is_shellscript=: 3 : 0
'.sh' -: _3 {. y
)
runlines=: runimmex1
saveopenwindows=: 3 : 0
noevents'' 
if. window__locEdit do.
  1 tab_saveall__locEdit''
end.
)
tabrun=: 3 : 0
'fl dat'=. tabread__locEdit''
if. 0=#fl do. '' return. end.
if. is_shellscript fl do. hostcmd fl return. end.
cocurrent 'base'
3 : '0!:101 y[4!:55 <''y''' dat
)
tabrunclear=: 3 : 0
term_clear__locTerm''
tabrun''
)
validate=: 3 : 0
b=. 2 }. (3=nc cbregs_jgtk_) +. 0 = #&> cbregs_jgtk_
if. 0 e. b do.
  miss=. (0 0,b=0)#cbregs_jgtk_

  smoutput 'validate missing cdbregs:'
  smoutput copath coname''
  smoutput (;cofind) &> miss

  'missing cbregs' assert 0
end.
for_loc. locEdits_jgtkide_ do.
  if. EditNB__loc do.
    assert. (#EditTabs__loc) = gtk_notebook_get_n_pages EditNB__loc
  end.
end.
EMPTY
)
jgtkide_z_=: main_jgtkide_
coclass 'jgtkdialog'
coinsert 'jgtkide'

ScriptPatterns=: <'*.ijs';'scripts'
AllPattern=: <'*.*';'all files'
ProjPattern=: <'*.jproj';'jproject'
create=: 3 : 0
coextend COCREATOR
)
destroy=: 3 : 0
cbfree''
codestroy''
0
)
run=: 3 : 0
'type arg'=. 2 {. boxopen y
dialogfile (5}.type);arg
)
dialogfile=: 3 : 0
'type arg'=. y
p=. ScriptPatterns,AllPattern
f=. 0
select. type
case. 'open' do.
  d=. getfilepath ''
  t=. (gettext 'open file')
case. 'opentemp' do.
  d=. jpath '~temp'
  t=. (gettext 'open file')
case. 'openuser' do.
  d=. jpath '~user'
  t=. (gettext 'open file')
case. 'opensystem' do.
  d=. jpath '~system'
  t=. (gettext 'open file')
case. 'saveas' do.
  d=. arg,(0=#arg)#getfilepath ''
  t=. (gettext 'save as')
  f=. 2
case. 'new' do.
  d=. getfilepath ''
  t=. (gettext 'new file')
  f=. 1
case. 'newtemp' do.
  d=. arg
  t=. (gettext 'new file')
  f=. 1
case. 'project_open' do.
  p=. ProjPattern
  d=. getprojnewpath''
  t=. (gettext 'open project')
case. 'project_new' do.
  p=. ''
  d=. getprojnewpath''
  t=. (gettext 'new project folder')
  f=. 3
end.
filechooser f;t;p;d
)
getfilepath=: 3 : 0
if. #y do.
  fpath p
else.
  if. (0=window__locEdit) +. 0=#ProjectPath_jp_ do.
    defaultpath''
  else.
    ProjectPath_jp_
  end.
end.
)
getprojnewpath=: 3 : 0
if. (0=window__locEdit) +. 0=#ProjectPath_jp_ do.
  p=. defaultpath''
else.
  p=. ProjectPath_jp_
end.
}: 0 pick fpathname p
)
defaultpath=: 3 : 0
(0<#Pathp) pick (jpath '~install');Pathp
)
browsebox_proj_file=: 3 : 0
p=. readstring gtk_entry_get_text wfile
if. 0=#p do.
  p=. jpath '~config'
end.
while. 1 do.
  s=. filechooser 2;(gettext 'Project Filename');ProjPattern;p
  if. 0=#s do. return. end.
  s=. extproj_j_ s
  if. fexist s do.
    mbinfo (gettext 'Project already exists: '),s continue.
  end.
  setentry wfile;s return.
end.
)
browsebox_proj_path=: 3 : 0
p=. readstring gtk_entry_get_text wpath
if. 0=#p do.
  p=. defaultpath''
end.
s=. filechooser 3;(gettext 'project path');'';p
if. #s do.
  setentry wpath;s
end.
)
browsebox_proj_run=: 3 : 0
p=. fpath readstring gtk_entry_get_text wrun
if. 0=#p do.
  p=. defaultpath''
end.
s=. filechooser 0;(gettext 'Run Command');AllPattern;p
if. #s do.
  setentry wrun;s
end.
)
newproject=: 3 : 0
window=: gtk_dialog_new''
title=: (gettext 'New Project')
gtk_window_set_title window;title
windowdefaultsize 450 0
vb=. gtk_dialog_get_content_area window
gtk_box_pack_start vb, (newpad 0 6), 0 0 0

hb=. gtk_hbox_new 0 3
label=. (newlabel (gettext 'Folder:')) newalign 0 0.5 0 0
name=: gtk_entry_new ''
setentry name;y
'fileb btn'=. browsebox name;'gtk-open';'newproject_folder'
gtk_box_pack_start hb, label, 0 0 3
gtk_box_pack_start hb, fileb, 1 1 3
gtk_box_pack_start vb, hb, 0 0 3
gtk_box_pack_start vb, (newpad 0 8), 0 0 0

fm=. gtk_frame_new <(gettext 'Create Scripts')
vf=. gtk_vbox_new 0 0
hb=. gtk_hbox_new 0 0
cbbuild=: gtk_check_button_new_with_mnemonic <(gettext 'build')
gtk_box_pack_start hb, cbbuild, 0 0 12
cbrun=: gtk_check_button_new_with_mnemonic <(gettext 'run')
gtk_box_pack_start hb, cbrun, 0 0 12
cbinit=: gtk_check_button_new_with_mnemonic <(gettext 'init')
gtk_box_pack_start hb, cbinit, 0 0 12
gtk_box_pack_start vf, hb, 0 0 3
hb=. gtk_hbox_new 0 0
label=. (newlabel (gettext 'Other Scripts:')) newalign 0 0.5 0 0
scripts=: gtk_entry_new ''
gtk_box_pack_start hb, label,0 0 3
gtk_box_pack_start hb, scripts,1 1 3
gtk_box_pack_start vf, hb, 0 0 3
gtk_container_add fm,vf
gtk_box_pack_start vb, fm, 0 0 3
gtk_box_pack_start vb, (newpad 0 6), 0 0 0

setcheckbox cbbuild,1
setcheckbox cbrun,1
setcheckbox cbinit,1

button=. gtk_button_new''
bbox=. gtk_hbox_new 0 0
image=. gtk_image_new_from_stock 'gtk-new';GTK_ICON_SIZE_BUTTON
label=. gtk_label_new_with_mnemonic <(gettext 'C_reate')
gtk_box_pack_start bbox, image, 0 0 3
gtk_box_pack_start bbox, label, 0 0 3
gtk_container_add button, bbox
gtk_dialog_add_action_widget window,button,GTK_RESPONSE_OK
windowfinish''
setentryposition name,_1

res=. ''
while. 1 do.
  r=. gtk_dialog_run window
  if. r ~: GTK_RESPONSE_OK do. break. end.
  p=. jpath remsep readstring gtk_entry_get_text name
  if. 0=#p do.
    mbinfo title;(gettext 'Folder must be given') continue.
  end.
  if. newproject_exist p do. continue. end.
  if. newproject_subfolder p do. continue. end.
  if. -. mkdir_j_ p do.
    mbinfo titile;(gettext 'Unable to create folder: '),p
    continue. end.
  build=. readcheckbox cbbuild
  run=. readcheckbox cbrun
  init=. readcheckbox cbinit
  other=. readstring gtk_entry_get_text scripts
  res=. p;other;build;run;init
  break.
end.

gtk_widget_destroy window
res
)
newproject_exist=: 3 : 0
f=. path2proj_j_ y
if. fexist f do.
  1 [ mbinfo title;(gettext 'Project already exists: '),y
else.
  0
end.
)
newproject_subfolder=: 3 : 0
'f p'=. ffoldername_jp_ y
if. 0=#f do.
  msg=. title;(gettext 'Not in a Folder: '),y,LF,LF,(gettext 'OK to continue?')
  0=mbnoyes msg return.
end.
if. -. (<remsep }.f) e. {."1 UserFolders_j_ do.
  msg=. title;(gettext 'Not a UserFolder: '),y,LF,LF,(gettext 'OK to continue?')
  0=mbnoyes msg return.
end.
if. 0=#p do.
  1[mbinfo title;(gettext 'Sub folder should be given: '),f return.
end.
0
)
newproject_folder=: 3 : 0
p=. dialog 'file_project_new'
if. #p do.
  if. -. newproject_exist p do.
    setentry name;tofoldername_jp_ p
  end.
end.
)
coclass 'jgtkdirm'
coinsert 'jgtkide j'

matched=: 0
window=: 0
written=: 0

title=: (gettext 'Directory Match')

DMCFGFILE=: ''
DMDIRSOLD=: ''
DMPROJECT=: ''
DMPROJECTS=: ''
DMSNAPS=: ''
DMSOURCE=: ''
DMTARGET=: ''
DMFavorites=: i.0 2

DMFOUNDALL=: DMFOUNDCONTENTS=: ''
NOTINSOURCE=: NOTINTARGET=: ''
DIFFTIME=: DIFFCONT=: i.0 6
DIFFTIMEST=: DIFFCONTST=: ''   

DMMSK=: ''
DMTREEX=: ''
DMType=: ''
DMTypes=: 'All *'

DMTAB=: 'std'

DMCONTENTS=: 0
DMTIMESTAMP=: 0

DMSUBDIR=: 1 
IGNOREST=: 0 
IGNORENS=: 0 
IGNORENT=: 0 
IGNORESEP=: 1 
IGNORELTW=: 0 
TEXTBASE=: '/','text-base','/'
dm_init=: 3 : 0
if. 0=#DMCFGFILE do.
  DMCFGFILE=: jpath '~config/dirmatch.cfg'
  dmconfig''
end.

if. #y do.
  p=. boxxopen y
  DMTAB=: 0 pick p
  ('dm_init_',DMTAB)~}.p
end.

DMRUN=: 0
DMCONTENTS=: 0
DMTIMESTAMP=: 0

menu_init''
compare_init''
)
dmconfig=: 3 : 0
0!:0 ::] <GtkConfig,'dirmatch.cfg'
0!:0 ::] <DMCFGFILE
dmconfig1''
)
dmconfig1=: 3 : 0
DMDIRS=: RecentDirmatch
DMMAX=: +:>.-:RecentMax
if. 0=4!:0 <'DirTreeX' do.
  DMTREEX=: boxxopen DirTreeX
end.
'DMTypeT DMTypeN'=: dmtypes DMTypes
DMTypeX=: ((DMTypeN i.&>' ') {.each DMTypeN) i. <DMType
DMFavorites=: _2 ,\ a: -.~ deb each <;._2 termLF DMFavorites
)
dmsaverecent=: 3 : 0
if. DMTAB-:'std' do.
  RecentDirmatch_j_=: DMDIRS
  recentsave''
end.
)
fmtdir=: termsep @ filecase
isempty=: 0: e. $
index=: #@[ (| - =) i.
intersect=: e. # [
quote=: ''''&,@(,&'''')@(#~ >:@(=&''''))
subs=. 2 : 'x I. @(e.&y)@]} ]'
toblank=: ' ' I.@(e.&'_')@]} ]
todelim=: ; @: ((DEL&,) @ (,&DEL) @ , @ ": &.>)
tolist=: }.@;@:(LF&,@,@":&.>)
delBS=: }.~ [: - '/' = {:

termLF=: , (0 < #) # LF -. {:
termSEP=: , (0: < #) # '/'"_ -. _1&{.
termdelSEP=: }.~ [: - 0: i.~ '/'&= @ |.
addtextbase=: 3 : 0
'nms src'=. y
nms=. fpathname &> nms
src=. (<src) ,each ({."1 nms) ,each <'.svn',TEXTBASE
nms=. ({:"1 nms) ,each <'.svn-base'
src ,each nms
)
cleanlist=: 3 : 0
dir=. ~. y -. a:
msk=. (1 e. '.svn'&E.) &> dir
msk=. msk +. (1 e. '.snp'&E.) &> dir
dir #~ -.msk
)
dmenable=: 3 : 0
select. DMTAB
case. 'std' do.
  gtk_widget_show &> wsubdir,wtimestamp,wtype,wtypelabel
case. 'snp' do.
  gtk_widget_show &> wtimestamp,wtype,wtypelabel
  gtk_widget_hide &> wsubdir
case. 'svn' do.
  gtk_widget_hide &> wsubdir,wtimestamp,wtype,wtypelabel
  setlabel wpadding;40$' '
end.
0
)
dmindex=: 4 : 0
if. 0 = #x do. _1 else. x index y end.
)
dminfo=: 3 : 0
mbinfo title;y
)
dmjoin=: 4 : 0
if. 0 = L. y do.
  dat=. y
else.
  dat=. }. , LF ,. (>tohyphen each {."1 y) ,. ' ',. > {:"1 y
end.
dat=. x,'=: 0 : 0',LF,(termLF dat),')',LF
)
dmtypes=: 3 : 0
dat=. dlb each <;._2 termLF y
ndx=. dat i.&> ' '
ids=. toblank each ndx {.each dat
ext=. deb each ndx }. each dat
msk=. 0 < #&> ext
ids=. msk#ids
ext=. msk#ext
ndx=. I. ext = <,'*'
fmt=. ids ,each (<'') ndx} dmtypefmt each ext
ext;<fmt
)
dmtypefmt=: 3 : 0
' (',')',~}.;<@(',*.'&,);._1 ',',y -. ' '
)
dmrep=: 4 : 0
dat=. y
if. (0=#dat) +. 2=3!:0 dat do.
  if. LF e. dat do.
    dat=. dat, LF -. {:dat
    x,'=: 0 : 0', LF, ; <;.2 dat,')',LF
  else.
    x,'=: ',(quote dat),LF
  end.
else.
  x,'=: ',(":dat),LF
end.
)
expandn=: 4 : 0
y #~ (#y)$>:(-x){.0j1
)
filecopy=: 3 : 0
'source dest'=. y
if. 0 = fpathcreate fpath dest do. 0 return.
end.
if. IFWIN do.
  0 pick 'kernel32 CopyFileW i *w *w i' cd (uucp source);(uucp dest);0
else.
  datold=. fread :: 0: dest
  datnew=. fread :: 0: source
  if. -. datold -: datnew do.
    datnew fwrite dest
  end.
end.
1
)
fileread=: 1!:1
filecmp=: 4 : 0
src=. (< @: (1!:1))"0 x
tar=. (< @: (1!:1))"0 y
src = tar
)
fsetrw=: 3 : 0
if. IFWIN do.
  a=. 1!:6 <y
  if. 0=#a do. return. end.
  ('-' 0 } a) 1!:6 <y
else.
  a=. 1!:7 <y
  if. 0=#a do. return. end.
  ('rw' 0 1 } a) 1!:7 <y
end.
)
getsourcename=: 3 : 0
if. (DMTAB-:'svn') do.
  y=. fpathname &> y
  px=. < '.svn',TEXTBASE
  sx=. <'.svn-base'
  y=. ({."1 y) ,each px ,each ({:"1 y) ,each sx
end.
(<fmtdir dmsource) ,each y
)
getsourcename1=: getsourcename&.<
compare_init=: 3 : 0
select. IGNORESEP + 2 * IGNORELTW
case. 0 do.
  compare=: compare_jcompare_
  fcompare=: ('';0;[) fcomp_jcompare_ ]
case. 1 do.
  compare=: compare_jcompare_ & toJ
  fcompare=: ('';1;[) fcomp_jcompare_ ]
case. 2 do.
  compare=: compare_jcompare_ & remltws
  fcompare=: ('';2;[) fcomp_jcompare_ ]
case. 3 do.
  compare=: compare_jcompare_ & remltws & toJ
  fcompare=: ('';3;[) fcomp_jcompare_ ]
end.
i.0 0
)
maxlist=: 3 : '(DMMAX <. #r) {. r=. ~.y'
remltws=: 3 : 0
y=. (toJ y), LF
fn=. #~ ([: (+./\ *. +./\.) -.@(e.&(' ',TAB)))
dat=. fn each <;._2 y
}: ; dat ,each LF
)
requireproject=: 3 : 0
'require'~'~system/util/project.ijs'
)
tolist3=: 3 : 0
}. , LF ,. listfmt y
)
tolist6=: 3 : 0
dat=. ((2 * #y),3) $ ,y
}: tolist 2 expandn <"1 listfmt dat
)
listfmt=: 3 : 0
nm=. > 0 {"1 y
ts=. tsfmt > 1 {"1 y
ts=. ' ' ,. ts ,. ' '
sz=. ": ,. > 2 {"1 y
nm ,. ts ,. sz
)
tsfmt=: 3 : 0
r=. }: $ y
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. y
d=. '--#::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='#') } d
(r,20) $ d
)
getdir=: 3 : 0

r=. i.0 3
path=. y
ifsvn=. '.svn' -: _4 {. path
if. ifsvn do.
  fl=. 1!:0 path,TEXTBASE,'*'
  fl=. fl #~ (<'.svn-base') = _9 {. each {."1 fl
  path=. _4 }. path
  r=. r, (path&, each _9 }. each {."1 fl),.1 2{"1 fl
else.
  fl=. 1!:0 path,'*'
  if. #fl do.
    att=. > 4{"1 fl
    fl=. fl #~ ('h' ~: 1{"1 att) *. 'd' ~: 4{"1 att
  end.
  r=. r, (path&, each {."1 fl),.1 2{"1 fl
end.
if. DMSUBDIR do.
  dl=. 1!:0 path,'*'
  if. #dl do.
    att=. > 4{"1 dl
    dl=. dl #~ ('h' ~: 1{"1 att) *. 'd' = 4{"1 att
    dr=. {."1 dl
    dr=. dr -. DMTREEX
    if. #dr do.
      dr=. (path&, @ ,&('/',ifsvn#'.svn')) each dr
      r=. r, ; getdir each dr
    end.
  end.
end.
if. #r do.
  r=. (filecase L:0 {."1 r) 0 }"0 1 r
end.
if. -. (<,'*') e. DMX do.
  fls=. {."1 r
  ndx=. 1 + fls i: &> '.'
  msk=. (ndx }.each fls) e. DMX
  r=. msk # r
end.

sort r
)
dm_cursor_changed=: dm_row_activated=: dm_key_press=: 0:
dm_wsource_changed=: 3 : 0
if. NoEvents do. 0 return. end.
if. DMTAB-:'snp' do. dm_wsource_changed_snp'' end.
)
dm_wtarget_changed=: 3 : 0
if. NoEvents do. 0 return. end.
if. DMTAB-:'snp' do. match_reshow 1 end.
1
)
dm_wtype_changed=: 3 : 0
if. NoEvents do. 0 return. end.
if. _1 = gtk_combo_box_get_active {.y do. 0 return. end.
match_reshow 1
1
)
wdm_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
dm_match_button''
)
window_close=: 3 : 0
dmsaverecent''
readwinpos 'DirmPos'
gtk_widget_destroy window
1
)
window_key_press=: 3 : 0
if. isesckey y do.
  window_close''
else.
  0
end.
)
dm_compare_button=: comparefiles
dm_compareall_button=: compareallfiles
dm_copy_button=: copy1
dm_ignore_button=: ignore
dm_match_button=: match
dm_open_button=: openfile
dm_subdir_button=: match_reshow bind 1
dm_timestamp_button=: match_reshow bind 1
dm_view_button=: viewfile
dm_xdiff_button=: xdiff

about_activate=: helpabout
filedir_activate=: swap bind 'std'
filefav_activate=: fav_run
filesnap_activate=: swap bind 'snp'
filesvn_activate=: swap bind 'svn'
help_activate=: help
quit_activate=: window_close
toswap_activate=: swapdirs
tocopysrc_activate=: copysource
tocopylater_activate=: copylater
tocopyall_activate=: copyall
window_delete=: 3 : 0
window=: 0
)

wsource_key_press=: wtarget_key_press=: wtype_key_press=: wdm_key_press
fav_run=: 3 : 0
if. 0=#DMFavorites do.
  msg=. 'No favorites defined.',LF2
  msg=. msg,'See menu Edit|Configure|Directory Match.'
  dminfo msg return.
end.
a=. cocreate''
coinsert__a coname''
fav_run1__a coname''
)
fav_run1=: 3 : 0
locP=: y
window_delete=: fav_close
newwindow (gettext 'dirmatch favorites')
windowdefaultsize 600 300
gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
gtk_window_set_destroy_with_parent window,1
gtk_window_set_modal window,1
windowcenter''
sw=. newsw''
tv=: makelistgrid 'fav';('Source';'Target');DMFavorites;'';'';3
setchildfocus tv
gtk_container_add sw,tv
gtk_container_add window,sw
windowfinish''
)
fav_key_press=: 3 : 0
if. isesckey y do. fav_close'' else. 0 end.
)
fav_close=: 3 : 0
gtk_widget_destroy window
cbfree''
codestroy''
1
)
fav_row_activated=: 3 : 0
row=. listbox_getactiverow tv
sel=. deb each row { DMFavorites
DMDIRS__locP=: ~. sel, DMDIRS
dm_write_std__locP''
fav_close''
)
help=: 3 : 'smoutput ''help not yet'''
helpabout=: 3 : 'smoutput ''helpabout not yet'''
comparefiles=: 3 : 0
if. 0 = #name=. getfoundname2'' do.
  dminfo (gettext 'Nothing to compare')
else.
  textview dmcompare name
end.
1
)
compareallfiles=: 3 : 0
nms=. {."1 DIFFCONT
res=. ''
for_n. nms do.
  src=. getsourcename1 > n
  tar=. (fmtdir DMTARGET), > n
  res=. res, dmcompare src;tar
  res=. res, LF, LF
end.
res=. _2 }. res
if. 0=#res do.
  dminfo (gettext 'Nothing to compare')
else.
  textview res
end.
1
)
copy1=: 3 : 0
if. isempty name=. getfoundname2'' do.
  name=. getfoundname1''
end.
if. isempty name do.
  txt=. (gettext 'No file selected')
  dminfo txt return.
end.

name=. boxopen name
if. 2 = #name do.
  'fm to'=. name
else.
  fm=. 0 pick name
  to=. (fmtdir dmtarget), (#fmtdir dmsource) }. fm
end.

fm=. jpathsep fm
fms=. tofoldername fm
to=. jpathsep to

svn=. (DMTAB-:'svn') # ' Subversion'
txt=. (gettext 'OK to copy from'),svn,(gettext ' source to target: '),LF2,fms

if. -. mbnoyes title; txt do. return. end.
res=. filecopy fm;to
if. res = 0 do.
  txt=. (gettext 'Unable to copy file')
  dminfo txt
else.
  if. DMTAB-:'svn' do.
    fsetrw to
  end.
  remfound fm
end.
1
)
copyall=: 3 : 0
not=. {."1 NOTINTARGET
dif=. ({."1 DIFFCONT), {."1 DIFFTIME
fls=. not, dif
if. 0 = # fls do.
  dminfo (gettext 'No source files to copy')
  1 return.
end.
fm=. getsourcename fls
to=. (fmtdir DMTARGET)&, each fls
to docopy fm
1
)
copylater=: 3 : 0
dif=. DIFFCONT,DIFFTIME
msk=. (4 {"1 dif) earlier 1 {"1 dif
fls=. msk # {."1 dif
if. 0 = # fls do.
  dminfo (gettext 'No source files to copy') return.
end.
fm=. getsourcename fls
to=. (fmtdir DMTARGET)&, each fls
to docopy fm
1
)
copysource=: 3 : 0
if. 0 = # NOTINTARGET do.
  dminfo (gettext 'No source files to copy')
  1 return.
end.
fm=. getsourcename {."1 NOTINTARGET
to=. (fmtdir DMTARGET)&, each {."1 NOTINTARGET
to docopy fm
1
)
deletetarget=: 3 : 0
if. 0 = # NOTINSOURCE do.
  dminfo (gettext 'No target files to delete')
  1 return.
end.
nms=. (fmtdir DMTARGET)&, each {."1 NOTINSOURCE
if. mbnoyes title; (gettext 'OK to delete:'),LF2,tolist nms do.
  ferase nms
  match''
end.
1
)
docopy=: 4 : 0
to=. x
fm=. y
fms=. tofoldername y
msg=. title; (gettext 'OK to copy:'),LF2,tolist fms
if. -. mbnoyes msg do. return. end.
res=. filecopy"1 fm ,. to
if. 0 e. res do.
  txt=. (gettext 'Unable to copy:'),LF2,tolist (res=0)#fms
  dminfo txt
end.
if. 1 e. res do.
  match''
end.
)
enablefound=: 3 : 0
setenable"1 FoundButtons,.y
)
ignore=: 3 : 0
nms=. getignorenames''
if. isempty nms do.
  dminfo (gettext 'No file selected') return.
end.

msk=. -. ({."1 DIFFCONT) e. nms
DIFFCONT=: msk # DIFFCONT
DIFFCONTST=: msk # DIFFCONTST

msk=. -. ({."1 DIFFTIME) e. nms
DIFFTIME=: msk # DIFFTIME
DIFFTIMEST=: msk # DIFFTIMEST

NOTINSOURCE=: nms ignore1 NOTINSOURCE
NOTINTARGET=: nms ignore1 NOTINTARGET
match_fmt''
dm_showfind''
1
)
ignore1=: 4 : 0
y #~ -. ({."1 y) e. x
)
ignoreltw=: 3 : 0
IGNORELTW=: -. IGNORELTW
wd 'set mignoreltw ',":IGNORELTW
compare_init''
i.0 0
)
ignorens=: 3 : 0
IGNORENS=: -. IGNORENS
match_reshow''
)
ignorens_do=: 3 : 0
if. IGNORENS do.
  NOTINTARGET=: 0 # NOTINTARGET
end.
)
ignorent=: 3 : 0
IGNORENT=: -. IGNORENT
match_reshow''
)
ignorent_do=: 3 : 0
if. IGNORENT do.
  NOTINSOURCE=: 0 # NOTINSOURCE
end.
)
ignoresep=: 3 : 0
IGNORESEP=: -. IGNORESEP
wd 'set mignoresep ',":IGNORESEP
compare_init''
EMPTY
)
ignorest=: 3 : 0
IGNOREST=: -. IGNOREST
match_reshow''
)
ignorest_do=: 3 : 0
if. -. IGNOREST do. return. end.
if. -. 1 e. DIFFCONTST, DIFFTIMEST do. return. end.
if. #DIFFCONT do.
  DIFFCONT=: (-. DIFFCONTST) # DIFFCONT
  DIFFCONTST=: (#DIFFCONT) $ 0
end.
if. #DIFFTIME do.
  DIFFTIME=: (-. DIFFTIMEST) # DIFFTIME
  DIFFTIMEST=: (#DIFFTIME) $ 0
end.
)
openfile=: 3 : 0
if. 0=#name=. getfoundname1'' do.
  dminfo (gettext 'No file selected')
else.
  try.
    edit_opentab_show__locEdit name
  catch. dminfo (gettext 'Unable to open: '),name
  end.
end.
1
)
swap=: 3 : 0
if. y -: DMTAB do. return. end.
select. y
case. 'std' do.
  setlabel wtypelabel;<'_Project:'
case. 'snp' do.
case. 'svn' do.
  mbinfo (gettext 'not yet') return.
end.
written=: 0
DMTAB=: y
1
)
swapdirs=: 3 : 0
dm_read''
'DMSOURCE DMTARGET'=: DMTARGET ; DMSOURCE
DMDIRS=: (DMSOURCE;DMTARGET),2}.DMDIRS
dm_write''
match_reshow 1
1
)
viewfile=: 3 : 0
if. 0=#name=. getfoundname1'' do.
  dminfo (gettext 'No file selected')
else.
  dat=. freads name
  if. dat -: _1 do.
    dminfo (gettext 'Unable to view: '),name
  else.
    textview name;dat
  end.
end.
1
)
xdiff=: 3 : 0
if. 0=#XDiff do.
  mbinfo (gettext 'First define an external differencer in the base config')
  1 return.
end.
if. 0=#name=. getfoundname2'' do.
  dminfo (gettext 'Nothing to compare')
else.
  'a b'=. name
  forkcmd XDiff,' "',a,'" "',b,'"'
end.
1
)
getfoundname1=: 3 : 0
if. isempty dat=. getnames '' do. '' return. end.
'prev name next'=. dat
if. isempty name do. '' return. end.
if. prev -: name do.
  DMTARGET joindirname name
elseif. name -: next do.
  getsourcename1 name
elseif. (<name) e. {."1 NOTINSOURCE do.
  DMTARGET joindirname name
elseif. (<name) e. {."1 NOTINTARGET do.
  getsourcename1 name
elseif. do.
  ''
end.
)
getfoundname2=: 3 : 0
if. isempty dat=. getnames '' do. '' return. end.
'prev name next'=. dat
if. prev -: name do.
  'first second'=. prev;name
elseif. name -: next do.
  'first second'=. name;next
elseif. do.
  '' return.
end.
(getsourcename1 first);DMTARGET joindirname second
)
getignorenames=: 3 : 0
dat=. getnames ''
if. isempty dat do. '' return. end.
if. isempty 1 pick dat do. '' return. end.
dat -. a:
)
getnames=: 3 : 0
if. 0=#found do. '' return. end.
ndx=. listbox_getactiverow wfound
if. ndx=_1 do. '' return. end.
ndx=. ndx + 0 1 2
dat=. a: , found , a:
if. 0 e. ndx e. i. # dat do. '' return. end.
res=. getname1 each ndx { dat
if. 0=#;res do. '' end.
)
joindirname=: 4 : 0
(fmtdir x), y
)
getname1=: 3 : 0
dat=. deb |. y
ndx=. I. dat = ' '
if. 2 < # ndx do.
  |. (1 + 2 { ndx) }. dat
else.
  ''
end.
)
remfound=: 3 : 0
fm=. <y
dms=. jpathsep dmsource, '/'

msk=. fm ~: dms&, each {."1 DIFFCONT
if. 0 e. msk do.
  DIFFCONT=: msk # DIFFCONT
  DIFFCONTST=: msk # DIFFCONTST
end.

msk=. fm ~: dms&, each {."1 DIFFTIME
if. 0 e. msk do.
  DIFFTIME=: msk # DIFFTIME
  DIFFTIMEST=: msk # DIFFTIMEST
end.

msk=. fm ~: dms&, each {."1 NOTINTARGET
if. 0 e. msk do.
  NOTINTARGET=: msk # NOTINTARGET
end.

match_fmt''
dm_showfind listbox_getscroll wfound
)
match=: 3 : 0
dm_read''
if. isempty DMSOURCE do.
  dminfo (gettext 'Enter the source directory') return.
end.
if. isempty DMTARGET do.
  dminfo (gettext 'Enter the target directory') return.
end.
DMDIRS=: ~. filecase each (DMSOURCE;DMTARGET),DMDIRS
matches 0
noevents 1
dm_showfind''
dmsaverecent''
dm_write''
matched=: 1
noevents 0
)
matches=: 3 : 0
DMFOUNDCONTENTS=: DMFOUNDALL=: ''
if. match_do '' do.
  match_fmt y
end.
)
matchclear=: 3 : 0
DMFOUNDCONTENTS=: DMFOUNDALL=: ''
dm_showfind''
)
match_do=: 3 : 0

NOTINSOURCE=: NOTINTARGET=: ''
DIFFTIME=: DIFFCONT=: i.0 6
DIFFTIMEST=: DIFFCONTST=: '' 

DMX=: ' ,' cutopen DMTypeX pick DMTypeT
dmsource=: DMSOURCE
dmtarget=: DMTARGET

src=. fmtdir dmsource
tar=. fmtdir dmtarget

dx=. getdir src, (DMTAB-:'svn') # '.svn'
dy=. getdir tar

if. (0=#dx) *. 0=#dy do.
  0 [ dminfo (gettext 'Both directories are empty') return.
end.
fx=. {."1 dx
fy=. {."1 dy

fx=. (#src) }. each fx
fy=. (#tar) }. each fy
dx=. fx ,. }."1 dx
dy=. fy ,. }."1 dy
NOTINTARGET=: (-. fx e. fy) # dx
NOTINSOURCE=: (-. fy e. fx) # dy

dx=. (fx e. fy) # dx
dy=. (fy e. fx) # dy
dxy=. dx ,. dy

if. 0 e. #dx do. 1 return. end.
msk=. (2 {"1 dx) ~: 2 {"1 dy
if. 1 e. msk do.
  DIFFCONT=: msk # dxy
  msk=. -. msk
  dx=. msk # dx
  dy=. msk # dy
  dxy=. msk # dxy
end.
nms=. {."1 dx

if. DMTAB-:'svn' do.
  snm=. addtextbase nms;src
else.
  snm=. src&, each nms
end.

cmp=. snm filecmp tar&, each nms 
DIFFCONT=: sort DIFFCONT, (cmp = 0) # dxy
DIFFCONTST=: (1 {"1 DIFFCONT) earlier 4 {"1 DIFFCONT
if. DMTIMESTAMP do.
  dx=. cmp # dx
  dy=. cmp # dy
  dxy=. cmp # dxy
  msk=. -. dx e. dy
  if. 1 e. msk do.
    DIFFTIME=: msk # dxy
    DIFFTIMEST=: (1 {"1 DIFFTIME) earlier 4 {"1 DIFFTIME
  end.
end.
1
)
earlier=: 4 : 0
_2 </ \ /: /: , x ,. y
)
match_fmt=: 3 : 0
ignorens_do''
ignorent_do''
ignorest_do''

count=. {. y,1  
DMFOUNDCONTENTS=: DMFOUNDALL=: ''

hit=. +/ (#DIFFCONT),(#DIFFTIME),(#NOTINSOURCE),#NOTINTARGET

if. 0 = hit do.
  dminfo count pick (gettext 'Contents match');(gettext 'Contents now match')
  return.
end.

if. #DIFFCONT do.
  DMFOUNDCONTENTS=: (gettext 'different contents - source,target: '),LF,(tolist6 DIFFCONT),LF2
end.

txt=. ''
if. #NOTINSOURCE do.
  txt=. txt, (gettext 'not in source: '),LF,(tolist3 NOTINSOURCE),LF2
end.

if. #NOTINTARGET do.
  txt=. txt, (gettext 'not in target: '),LF,(tolist3 NOTINTARGET),LF2
end.

if. #DIFFTIME do.
  txt=. txt, (gettext 'different timestamp - source,target: '),LF,(tolist6 DIFFTIME),LF2
end.

DMFOUNDALL=: txt, DMFOUNDCONTENTS
)
match_reshow=: 3 : 0
if. -. matched do. 1 return. end.
force=. {.y,0
if. force +. (dmsource-:DMSOURCE) *: dmtarget-:DMTARGET do.
  match''
else.
  dm_read''
  match_fmt 0
  dm_showfind''
end.
1
)
menu_init=: 3 : 0
f=. < @ (<;._1) @ (','&,)
j=. f;._2 Menus
MENUIDS=: {.&> j
MENUDEF=: }.each j
0
)
Menus=: fixNB_jp_ 0 : 0
about,gtk-about,_About,,Help About,about_activate
filedir,check1,Source from _Directory,,Source from Directory,filedir_activate
filefav,,Select from _Favorites,,Select from Favorites,filefav_activate
filesnap,check0,Source from _Snapshot,,Source from Snapshot,filesnap_activate
filesvn,check0,Source from _Subversion,,Source from Subversion,filesvn_activate
help,,_Help,,Help,help_activate
quit,gtk-quit,_Quit,cQ,Quit the program,quit_activate
toswap,,Swap source and target directories,,Swap source and target directories,toswap_activate
tocopysrc,,Copy source files not in target,,Copy source files not in target,tocopysrc_activate
tocopylater,,Copy source files later than target,,Copy source files later than target,tocopylater_activate
tocopyall,,Copy all source files,,Copy all source files,tocopyall_activate
)
dm_menu=: 3 : 0
mb=. create_menu_bar''
pop=. create_menu_popup mb;(gettext '_File')
con=. create_menu_container pop
if. DMTAB-:'std' do.
  mnFav=: con ccmenu 'filefav'
  create_menu_sep con
end.

con ccmenu 'quit'
pop=. create_menu_popup mb;(gettext '_Tools')
con=. create_menu_container pop
con ccmenu 'toswap'
con ccmenu 'tocopysrc'
con ccmenu 'tocopylater'
con ccmenu 'tocopyall'
gtk_widget_show_all mb
mb
)
Labstd=: (gettext '_Source:');(gettext '_Target:');(gettext 'T_ype:')
Labsnp=: (gettext '_Project:');(gettext '_Source:');(gettext '_Target:')
dm_open=: 3 : 0
if. window do.
  setwindowfocus window return.
end.
written=: matched=: 0
found=: ''
a=. GTK_FILL
b=. GTK_EXPAND + GTK_FILL
noevents 1
newwindow title
DirmPos setwinpos window
consig3 window;'key-press-event';'window_key_press'
gtk_window_set_icon_from_file window;EditIcon;0
tb=. gtk_table_new 3 3 0
labs=. (DMTAB-:'snp') pick Labstd;<Labsnp
tc=. gtk_table_new 2 3 0
label=. gtk_label_new_with_mnemonic 0{labs
gtk_misc_set_alignment label, 1 0.5
wsource=: newcombo '';'dm_wsource_changed'
w=. gtk_bin_get_child wsource
consig3 w;'key-press-event';'wsource_key_press'
gtk_table_attach tc,label,0 1 0 1,a,0 3 0
gtk_table_attach tc,wsource,2 3 0 1,b,0 3 0

label=. gtk_label_new_with_mnemonic 1{labs
gtk_misc_set_alignment label, 1 0.5
wtarget=: newcombo '';'dm_wtarget_changed'
w=. gtk_bin_get_child wtarget
consig3 w;'key-press-event';'wtarget_key_press'
gtk_table_attach tc,label,0 1 1 2,a,0 3 0
gtk_table_attach tc,wtarget,2 3 1 2,b,0 3 0

wtypelabel=: gtk_label_new_with_mnemonic 2{labs
gtk_misc_set_alignment wtypelabel, 1 0.5
wtype=: newcombo '';'dm_wtype_changed'
w=. gtk_bin_get_child wtype
consig wtype;'changed';'dm_wtype_changed'
gtk_table_attach tc,wtypelabel,0 1 2 3,a,0 3 0
gtk_table_attach tc,wtype,2 3 2 3,b,0 3 0
gtk_table_attach tb,tc,0 1 0 1,b,0 6 6
align=. gtk_alignment_new 0 0 0 0
vb=. gtk_vbox_new 0 0
wtimestamp=: newcheckbox (gettext 'Compare timestamps');'dm_timestamp_button'
wsubdir=: newcheckbox (gettext 'Include subdirectories');'dm_subdir_button'
wpadding=: newlabel ' '
gtk_box_pack_start vb,wtimestamp,0 0 0
gtk_box_pack_start vb,wsubdir,0 0 0
gtk_box_pack_start vb,wpadding,0 0 0
gtk_container_add align,vb
gtk_table_attach tb,align,1 2 0 1,a,a,15 8
hb=. gtk_vbox_new 0 0
bt=. newbutton (gettext '_Match');'dm_match_button'
gtk_box_pack_start hb,bt,0 0 0
gtk_table_attach tb,hb,2 3 0 1,a,a,6 8
hs=. gtk_hseparator_new ''
gtk_table_attach tb,hs,0 3 1 2,b,0 0 3
sw=. newsw''
wfound=: makelistbox 'dm';'';'';'';1
gtk_container_add sw,wfound
gtk_table_attach tb,sw,0 2 2 3,b,b,0 0
vb=. gtk_vbox_new 0 0
r=. $0
r=. r,newxbutton vb;(gettext '_Compare All');'dm_compareall_button'
r=. r,newxbutton vb;(gettext 'Compare Se_lect');'dm_compare_button'
if. #XDiff_j_ do.
  r=. r,newxbutton vb;(gettext 'E_xternal Diff');'dm_xdiff_button'
end.
r=. r,newxbutton vb;(gettext '_Open');'dm_open_button'
r=. r,newxbutton vb;(gettext '_View');'dm_view_button'
r=. r,newxbutton vb;(gettext 'Co_py');'dm_copy_button'
r=. r,newxbutton vb;(gettext '_Ignore');'dm_ignore_button'
gtk_table_attach tb,vb,2 3 2 3,a,a, 6 0
FoundButtons=: r
vb=. gtk_vbox_new 0 0
gtk_container_set_border_width vb,0
mb=. dm_menu ''
gtk_box_pack_start vb,mb,0 0 0
gtk_box_pack_start vb,tb,1 1 0
gtk_container_add window,vb
windowfinish''
enablefound 0
noevents 0
)
dm_compare_snp=: 3 : 0
's t'=. y
p=. 1 i.~ '/snap/.snp/' E. ]
s=. '~snapshot',(51 + p s) }. s
ndx=. p t
if. ndx < #t do.
  t=. '~snapshot',(51 + ndx) }. t
else.
  t=. tofoldername_j_ t
end.
(<s;t) fcompare y
)

dm_init_snp=: 3 : 0
DMSUBDIRS=: 1
DMPROJECTS=: DMPROJECT=: DMSNAPS=: ''
if. 0=#Folder do.
  dminfo (gettext 'No Folder defined')
  0 return.
end.
DMPROJECTS=: (<Folder,'/') ,each FolderIds
if. 0=#DMPROJECTS do.
  dminfo (gettext 'No projects in folder')
  0 return.
end.
if. #y do.
  DMPROJECT=: 0 pick y
else.
  if. 0=nc <'ProjectName_jp_' do.
    DMPROJECT=: ProjectName_jp_
  else.
    DMPROJECT=: 0 pick DMPROJECTS
  end.
end.
dmcompare=: dm_compare_snp
dm_proj_snp''
1
)
dm_proj_snp=: 3 : 0
DMSNAPS=: ss_list_jp_ DMPROJECT
DMSNAPTGT=: 'Current'
if. 0=#DMSNAPS do.
  dminfo (gettext 'No snapshots in project')
  DMSNAPSRC=: ''
  0 return.
end.
DMSNAPSRC=: 0 pick DMSNAPS
)
dm_read_snp=: 3 : 0
if. NoEvents do. 0 return. end.
DMPROJECT=: readcombo wsource
DMSNAPSRC=: readcombo wtarget
DMSNAPTGT=: readcombo wtype
DMPROJECTS=: maxlist (<DMPROJECT),DMPROJECTS
p=. projname2path_jp_ DMPROJECT
s=. snappath_jp_ p
DMSOURCE=: s,'/',DMSNAPSRC
if. DMSNAPTGT-:'Current' do.
  DMTARGET=: p
else.
  DMTARGET=: s,'/',DMSNAPTGT
end.
)
dm_write_snp=: 3 : 0
dmenable''
if. 0=#DMSNAPS do.
  dminfo (gettext 'No snapshots') return.
end.
if. written=0 do.
  setcombo_text wsource;<DMPROJECTS
  setcombo_select wsource;DMPROJECTS index <DMPROJECT
  written=: 1
end.
setcombo_text wtarget;<DMSNAPS
setcombo_select wtarget;DMSNAPS i. <DMSNAPSRC
a=. (<'Current'),DMSNAPS
setcombo_text wtype;<a
setcombo_select wtype;a i. <DMSNAPTGT
)
dm_wsource_changed_snp=: 3 : 0
p=. readcombo wsource
if. DMPROJECT -: p do. return. end.
noevents 1
DMPROJECT=: p
dm_proj_snp''
dm_write_snp''
noevents 0
match''
)
dm_compare_std=: 3 : 0
(<tofoldername each y) fcompare y
)
dm_init_std=: 3 : 0
DMDIRS=: ~.y,DMDIRS
dmcompare=: dm_compare_std
EMPTY
)
dm_read_std=: 3 : 0
DMSOURCE=: jpath readcombo wsource
DMTARGET=: jpath readcombo wtarget
t=. deb readcombo wtype
if. -. (<t) e. DMTypeN do.
  s=. t #~ *./\. t~:'.'
  DMTypeN=: DMTypeN,<t
  DMTypeT=: DMTypeT,<s
end.
DMTypeX=: DMTypeN i. <t
DMTIMESTAMP=: readcheckbox wtimestamp
DMSUBDIR=: readcheckbox wsubdir
DMDIRS=: maxlist (DMSOURCE;DMTARGET),DMDIRS
)
dm_write_std=: 3 : 0
dmenable''
setcheckbox wsubdir,DMSUBDIR
setcheckbox wtimestamp,DMSTIMESTAMP
if. written=0 do.
  setcombo_text wtype;<DMTypeN
  setcombo_select wtype;DMTypeX
  written=: 1
end.
if. -. DMDIRS -: DMDIRSOLD do.
  setcombo_text wsource;<DMDIRS
  setcombo_text wtarget;<DMDIRS
end.
if. #DMDIRS do.
  setcombo_select wsource;0
  setcombo_select wtarget;1
end.
)
dm_showfind=: 3 : 0
found=: <;._2 DMCONTENTS pick DMFOUNDALL;DMFOUNDCONTENTS
setlistbox wfound;found;_1;y
enablefound 1
)
dm_read=: 3 : 0
('dm_read_',DMTAB)~''
)
dm_write=: 3 : 0
('dm_write_',DMTAB)~''
)
dmrun=: 3 : 0
dm_init y
dm_open''
dm_write''
if. DMRUN do. match'' end.
)
dmrunstd=: 3 : 0
empty dmrun (<'std'),y
)
dirmatch_z_=: dmrunstd_jgtkdirm_
coclass 'jgtkdlog'
coinsert 'jgtkide'
create=: 3 : 0
coextend COCREATOR
if. 0=#InputLog do.
  mbinfo (gettext 'Input Log');(gettext 'Nothing in input log.')
  destroy'' return.
end.
make_dlog''
)
destroy=: 3 : 0
cbfree''
codestroy''
)
dlog_row_activated=: 3 : 0
row=. listbox_row_activated y
txt=. 0 delmode row pick InputLog
promptnewlog__COCREATOR txt
dlog_close''
)
dlog_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Escape do. 0 return. end.
'ctrl j shift'=. 2 2 2 #: state
if. ctrl +. shift do. 0 return. end.
dlog_close''
1
)
dlog_close=: 3 : 0
readwinpos 'DlogPos'
setchildfocus window__locTerm
WinDLog_jgtkide_=: 0
gtk_widget_destroy window
destroy''
1
)

dlog_cursor_changed=: 1:
window_delete=: dlog_close
delprompt=: ]
make_dlog=: 3 : 0
newwindow (gettext 'Input Log')
WinDLog_jgtkide_=: window
windowdefaultsize 300 300 >. 2 3{DlogPos
gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
gtk_window_set_destroy_with_parent window,1
gtk_window_set_modal window,1
windowcenter''
sw=. newsw''
txt=. delprompt InputLog
tv=. makelistbox 'dlog';txt;(<:#txt);'';0
setchildfocus tv
gtk_container_add sw,tv
gtk_container_add window,sw
windowfinish''
)
coclass 'jgtkedit'
coinsert 'jgtkide jp'

NBgroup=: mema IF64{4 8
Comment=: 'NB.'
create=: 3 : 0
windex=: y
Class=: 'edit'
locEdit0=: y{locEdits
locEdit1=: (-.y){locEdits
EditNB=: 0
EditPage=: _1
EditTabs=: i.0 11
SideDir=: ''
VisPos=: ''
sbShow=: 1
window=: 0
autoCp=: 0
locCcp=: ''
)
destroy=: 3 : 0
cbfree''
codestroy''
0
)
Gray=: rgb2gtk 232 232 232
getselext=: 3 : 0
r=. (1 + y i: '.') }. y
if. 0=#r do. 0 pick ValExt end.
)
getdirscripts=: 3 : 0
p=. termsep_j_ y
d=. 1!:0 p,'/*'
if. 0=#d do. '' return. end.
f=. ({."1 d) #~ '--' -:"1 [ 1 4 {"1 > 4{"1 d
f=. f #~ ((1 + f i:&> '.') }.each f) e. ValExt
fexists (<p) ,each f
)
getdirtext=: 3 : 0
p=. termsep_j_ y
d=. 1!:0 p,'/*'
if. 0=#d do. '' return. end.
d=. d #~ '--' -:"1 [ 1 4 {"1 > 4{"1 d
ex=. <'svg'
d=. d #~ ex ~: (}.~ 1 + i:&'.') each {."1 d
f=. ({."1 d) #~ MaxText>;2 {"1 d
f=. (<p) ,each f
istext=. isutf8 @ (1!:1) :: 0:
f #~ istext"0 f
)
gettabx=: 3 : '(0{"1 EditTabs) index <y'
gettabn=: 3 : '(1{"1 EditTabs) index <y'
readline=: 3 : 'bufreadline pSB,y'
readentry=: 3 : '1;bufreadline pSB,y'
getxpage=: 3 : '(1{"1 EditTabs__locEdit1) index <y'
edit_sname=: 3 : 0
'f p'=. fpathname y
if. y -: ProjectPath_jp_,'/',p do. p return. end.
remtilde tofoldername_j_ y
)
is_script=: 3 : 0
(<(1+y i: '.') }. y) e. ValExt
)
movewordsv=: 3 : 0
edit_current_def''
moveword y,pSB,pSV
)
pageswitched=: 3 : 0
tab_refresh''
0
)
selectopenfile=: 3 : 0
p=. gettabn y
setcurrentpage p
p
)
showsidebar=: 3 : 0
if. sbShow do.
  gtk_widget_show EditSB
else.
  gtk_widget_hide EditSB
end.
)
tab_addtab=: 3 : 0
edit_open''
EditPage=: edit_opentab1 y
gtk_notebook_set_current_page EditNB,EditPage
script_menu_enable''
edit_current_def''
)
tabread=: 3 : 0
2 tab_save''
edit_current_def''
if. EditPage<0 do. '';'' return. end.
pFL;tab_readall''
)
tab_readall=: 3 : 0
if. 0>p=. {.y,EditPage do. '' return. end.
bufread page_buf p
)
tab_readfile=: 3 : 0
ndx=. (1{"1 EditTabs) i. <y
if. ndx=#EditTabs do.
  freads y
else.
  bufread page_buf ndx
end.
)
tab_readselect=: 3 : 0
if. 0>p=. {.y,EditPage do. '' return. end.
bufreadselect page_buf p
)
tab_restore=: 3 : 0
buf=. page_buf EditPage
bufwrite buf;y
setmodified EditPage,0
1
)
tab_writefile=: 3 : 0
'file text'=. y
ndx=. (1{"1 EditTabs) i. <file
buf=. page_buf ndx
old=. fread file
cur=. fputs bufread buf
if. -. old -: cur do.
  cur pic_jp_ file
end.
bufwrite buf;fgets text
setmodified ndx,1
)
edit_hide=: 3 : 0
if. window=0 do. 1 return. end.
if. -. windex{Visible do. 1 return. end.
ccp_destroy''
if. -. 0 tab_saveall'' do. 0 return. end.
projsaveopen''
tab_closeall''
setchildfocus window__locTerm
setvisible 0
if. (-.windex){Visible do.
  window_focus_in__locEdit1''
else.
  locEdit_jgtkide_=: {. locEdits
end.
1
)
tab_close=: 3 : 0
ccp_destroy''
if. -.tab_close1 y do. 0 return. end.
tab_refresh''
1
)
tab_close1=: 3 : 0
noevents 1
r=. tab_closeit y
noevents 0
r
)
tab_closeit=: 3 : 0
if. y<0 do. 1 return. end.
f=. page_file y
sv=. page_sv y
if. tab_close_empty f do.
  setpos f;viewgettop sv
end.
gtk_notebook_remove_page EditNB,y
EditTabs=: (<<<y){EditTabs
1
)
tab_close_empty=: 3 : 0
if. (istempscript y) +. isconfigfile y do.
  if. 0=#fread y do. 0 [ ferase y return. end.
end.
1
)
tab_closes=: 3 : 0
if. 0=#y do. 1 return. end.
noevents 1
for_i. |. y do. tab_closeit i end.
tab_refresh''
noevents 0
1
)

tab_closeall=: 3 : 'tab_closes i.#EditTabs'
tab_closeother=: 3 : 'tab_closes EditPage -.~ i.#EditTabs'
tab_refresh=: 3 : 0
edit_current_def''
settitle''
sidebar_refresh''
script_menu_enable''
validate''
)
tab_remove=: 3 : 0
r=. y{EditTabs
gtk_notebook_remove_page EditNB,y
EditTabs=: (<<<y){EditTabs
tab_refresh''
r
)
checkdisk1=: (10 {:: ]) -: [: 1!:1 ::(''"_) 1 { ]
dontcheckdisk=: 0
checkdiskall=: 3 : 0
t=. (~:1{"1 t) # t=. EditTabs,EditTabs__locEdit1
b=. checkdisk1"1 t
if. *./b do. return. end.
checkdiskquery"1 (-.b)#t
)
checkdisk=: 3 : 0
if. checkdisk1 y do. return. end.
checkdiskquery y
)
checkdiskquery=: 3 : 0
if. dontcheckdisk do. return. end.
dontcheckdisk=: 1
(PageIds)=. y
new=. 1!:1 :: (''"_) <pFL
id=. pSN,(0=#pSN)#pFL
msg=. 'File contents changed on disk: ',id
msg=. msg,LF2,'Reload from disk?'
rel=. mbnoyes 'File changed';msg
setfiletext pFL;new;rel
setfiletext__locEdit1 pFL;new;rel
dontcheckdisk=: 0
)
cb_edit_changed=: 3 : 0
if. NoEvents do. 0 return. end.
setmodified EditPage,1
0
)
cb_edit_focus_in=: 3 : 0
n=. gtk_notebook_get_current_page {.y
if. n >: 0 do. checkdisk n{EditTabs end.
0
)
cb_edit_page_added=: 3 : 0
if. NoEvents do. 0 return. end.
ccp_destroy''
'n w p d'=. y
ndx=. ({."1 EditTabs) i. <w
if. ndx<#EditTabs do. 0 return. end.
ndx=. ({."1 EditTabx) i. <w
if. ndx=#EditTabx do. 0 return. end.
EditTabs=: (ndx{EditTabx),EditTabs
EditTabx_jgtkide_=: (<<<ndx){EditTabx
script_menu_enable''
1
)
cb_edit_page_removed=: 3 : 0
if. NoEvents do. 0 return. end.
ccp_destroy''
'n w p d'=. y
ndx=. ({."1 EditTabs) i. <w
if. ndx=#EditTabs do. 0 return. end.
EditTabx_jgtkide_=: EditTabx,ndx{EditTabs
EditTabs=: (<<<ndx){EditTabs
script_menu_enable''
setidle 'sidebar_refresh_',(>coname''),'_$0'
1
)
cb_edit_page_reordered=: 3 : 0
ccp_destroy''
'n w new d'=. y
old=. gettabx w
if. old=new do. 0 return. end.
p=. old{EditTabs
t=. (<<<old){EditTabs
EditTabs=: (new{.t),p,new}.t
EditPage=: new
0
)
cb_edit_switch_page=: 3 : 0
if. NoEvents do. 0 return. end.
ccp_destroy''
setidle 'pageswitched_',(>coname''),'_$0'
)
cb_edit_tab_close=: 3 : 0
noevents 1
ccp_destroy''
ndx=. page_index {.y
if. 0 = 0 tab_save ndx do. 1 return. end.
tab_close ndx
noevents 0
sidebar_refresh''
1
)
cb_toolbar_sidebar=: 3 : 0
setcheckmenu mnSideBar,-. sbShow
setcheckmenu mnAutoCp,-. autoCp
1
)
cx_edit_openedit=: 3 : 0
if. NoEvents do. 1 return. end.
ccp_destroy''
edit_open''
cx_edit_openeditp''
edit_current_def''
gtk_widget_show_all EditNB
seteditfocus''
sidebar_refresh''
showsidebar''
1
)
cx_edit_openeditp=: 3 : 0
if. #ProjOpen_jp_ do.
  po=. >{.ProjOpen
  if. (#>{.po) *. fexist Project_jp_ do.
    proj_openfiles''
    proj_fini'' return.
  end.
else.
  po=. ''
end.
proj_close''
sbfiles_open_folder Pathp
if. #po do.
  edit_openfiles (2}.po);0 ". 1 pick po
end.
)
cx_file_close=: 3 : 0
if. -.0 tab_save EditPage do. 0 return. end.
tab_close EditPage
1
)
cx_file_closeall=: 3 : 0
if. -.0 tab_saveall'' do. 0 return. end.
tab_closeall''
)
cx_file_closeother=: 3 : 0
if. -.0 tab_saveother'' do. 0 return. end.
tab_closeother''
)
cx_file_delete=: 3 : 0
if. 0=#EditTabs do. return. end.
'f s'=. 1 2 {EditPage{EditTabs
if. #f do.
  s=. remtilde toprojectfolder_jp_ f
end.
msg=. (gettext 'OK to delete '),s,'?'
if. mbcancelok (gettext 'File Delete');msg do.
  EditTabs=: (<0) (<EditPage;4)} EditTabs
  tab_close EditPage
  ferase ::] f
  sidebar_refresh''
end.
1
)
cx_file_new=: 3 : 0
if. 0=window__locEdit do. proj_close__locEdit'' end.
ccp_destroy''
f=. dialog 'file_new';''
if. 0=#f do. 1 return. end.
cx_file_newfini extdef f
)
cx_file_newtemp=: 3 : 0
if. 0=window__locEdit do. proj_close__locEdit'' end.
ccp_destroy''
p=. jpath '~temp/'
d=. {."1 [ 1!:0 jpath extdef p,'*'
if. 0=#d do.
  def=. extdef '1'
else.
  d=. d #~ istempname_j_ &> d
  d=. 0, (0 {.@". _4 }. ]) &> d
  def=. extdef ": {. (i. >: #d) -. d
end.
cx_file_newfini p,def
)
cx_file_newfini=: 3 : 0
'' fwrite y
recentfiles_add_j_ y
edit_opentab_show y;0;1
)
cx_file_open1=: 3 : 0
r=. dialog y
if. 0 = #r do. 0 return. end.
if. 0=window__locEdit do. proj_close__locEdit'' end.
recentfiles_add_j_ r
edit_opentab_show__locEdit r
1
)

cx_file_open=: cx_file_open1 bind 'file_open'
cx_file_openuser=: cx_file_open1 bind 'file_openuser'
cx_file_opensystem=: cx_file_open1 bind 'file_opensystem'
cx_file_opentemp=: cx_file_open1 bind 'file_opentemp'
cx_file_print=: 3 : 0
edit_current_def''
p=. conew 'jgtkideprint'
print__p pSV
destroy__p''
0
)
cx_file_restore=: 3 : 0
edit_current_def''
if. EditPage = _1 do. 1 return. end.
if. pMOD=0 do. 1 return. end.
s=. remtilde toprojectfolder_jp_ pFL
msg=. (gettext 'OK to restore to saved: '),s,'?'
if. -. mbcancelok (gettext 'File Restore');msg do. 1 return. end.
dat=. freads pFL
if. dat -: _1 do.
  mbinfo (gettext 'File Restore');(gettext 'Unable to read original file: '),s
  1 return.
end.
tab_restore dat
)
cx_file_saveas=: 3 : 0
edit_current_def''
f=. dialog 'file_saveas';pFL
if. 0=#f do. 1 return. end.
f=. extdef f
s=. 1 pick fpathname f
new=. pSW;f;s;0;1;1;pBTN;pLAB;pSV;pSB;''
EditTabs=: new EditPage} EditTabs
gtk_label_set_text pLAB;s
gtk_notebook_set_menu_label_text EditNB;pSW;s
file_save1 EditPage
tab_refresh''
1
)
sv_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. (key=GDK_Control_L) +. key=GDK_Shift_L do. 0 [ ccp_destroy'' return. end.
'ctrl j shift'=. 2 2 2 #: state
if. ccp_query'' do.
  if. ctrl do. 1 [ ccp_destroy'' return. end.
  select. key
  case. GDK_Escape do.
    1 [ ccp_destroy'' return.
  case. GDK_Up do.
    1 [ ccp_scroll _1 return.
  case. GDK_Down do.
    1 [ ccp_scroll 1 return.
  case. GDK_Page_Up do.
    1 [ ccp_scroll - CodeCompletionScroll return.
  case. GDK_Page_Down do.
    1 [ ccp_scroll CodeCompletionScroll return.
  case. GDK_Home do.
    1 [ ccp_scrollend _1 return.
  case. GDK_End do.
    1 [ ccp_scrollend 1 return.
  case. GDK_Tab do.
    1 [ ccp_word'' return.
  case. GDK_Return do.
    1 [ ccp_select'' return.
  case. <"0[3 u: ucp CodeCompletionKeyword do.
    ccp_renew key
  case. do.
    ccp_destroy''
  end.
end.
if. key e. GDK_FKeys do.
  fkey_exec__locTerm key,ctrl,shift return.
end.
if. ctrl > shift do.
  select. key
  case. GDK_Left do. movewordsv 0
  case. GDK_Right do. movewordsv 1
  case. GDK_Return do. cx_run_line''
  case. GDK_y do.
    edit_current_def''
    gtk_source_buffer_redo pSB
  case. 91 do.  
    1 [ ccp_new _1 return.
  end.
end.
if. ctrl *. shift do.
  select. key
  case. GDK_Return do.
    cx_run_line_show 0 return.
  end.
end.
if. autoCp *. (-.ctrl) *. (key e. 3 u: ucp CodeCompletionKeyword) *. -.ccp_query'' do.
  if. (3>.AutoCompletion)<:1+#getcurrentccppfx'' do.
    ccp_new key
  end.
end.
if. ctrl +. shift do. 0 return. end.
select. key
case. GDK_Escape do.
  if. EscClose do. 1 [ edit_hide'' return. end.
end.
0
)
sv_populate_popup=: 3 : 'popup_init y'
window_focus_in=: 3 : 0
if. window = {.WinFocus do. return. end.
checkdiskall''
ppdef''
locEdit_jgtkide_=: locEdit0
setwinfocus window
)
window_focus_out=: 3 : 0
ppack''
)
window_key_press=: 3 : 0
if. isesckey y do.
  if. ccp_query'' do. 1 [ ccp_destroy'' return. end.
  if. EscClose do. 1 [ edit_hide'' return. end.
else.
  0
end.
)
window_delete=: edit_hide
window_destroy=: 3 : 0
if. window do.
  edit_hide''
  window=: 0
end.
1
)
export=: 3 : 0
smoutput 'export not yet'
1
)
edit_maketablabel=: 3 : 0
name=. y
hbox=. gtk_hbox_new 0 2
lb=. gtk_label_new <name
gtk_box_pack_start hbox,lb,0 0 0
btn=. gtk_button_new''
consig btn;'clicked';'cb_edit_tab_close'
gtk_button_set_relief btn,GTK_RELIEF_NONE
gtk_button_set_focus_on_click btn,0
gtk_widget_set_name btn;'tab-close-button'
image=. gtk_image_new_from_stock GTK_STOCK_CLOSE;GTK_ICON_SIZE_MENU
gtk_button_set_image btn,image
align=. btn newalign 1 0 0 0
gtk_box_pack_start hbox,align,1 1 0
hbox,btn,lb
)
edit_open=: 3 : 0
if. window do. edit_show'' return. end.
noevents 1

newwindow (gettext 'Edit')
seteditpos ''

consig3 window;'key-press-event';'window_key_press'
consig3 window;'focus-in-event';'window_focus_in'
consig3 window;'focus-out-event';'window_focus_out'

if. -.UNAME-:'Darwin' do.
  gtk_window_set_icon_from_file window;EditIcon;0
end.
EditSB=: sidebar_init''

vb=. gtk_vbox_new 0 0
tb=. make_edittoolbar''
EditNB=: gtk_notebook_new''
consig3 EditNB;'focus_in_event';'cb_edit_focus_in'
consig4 EditNB;'switch_page';'cb_edit_switch_page'
consig4 EditNB;'page_reordered';'cb_edit_page_reordered'
consig4 EditNB;'page_removed';'cb_edit_page_removed'
consig4 EditNB;'page_added';'cb_edit_page_added'

consig5 EditNB;'create_window';'create_window'
gtk_notebook_set_group :: gtk_notebook_set_group_name ::0: EditNB;<<NBgroup
gtk_notebook_set_scrollable EditNB,1
gtk_notebook_popup_enable EditNB
gtk_box_pack_start vb,tb,0 0 0
gtk_box_pack_start vb,EditNB, 1 1 0

hb=. gtk_hpaned_new''
gtk_container_set_border_width hb,0
if. SideBar do.
  gtk_paned_pack1 hb, vb, 1 1
  gtk_paned_pack2 hb, EditSB, 0 1
else.
  gtk_paned_pack1 hb, EditSB, 0 1
  gtk_paned_pack2 hb, vb, 1 1
end.

vb=. gtk_vbox_new 0 0
gtk_container_set_border_width vb,0
mb=. edit_menu''
gtk_box_pack_start vb,mb,0 0 0
gtk_box_pack_start vb,hb,1 1 0
gtk_container_add window,vb
windowfinish''
setvisible 1
window_focus_in window
script_menu_enable''
noevents 0
)
edit_opencopy=: 3 : 0
'tab txt'=. y
'fname mod'=. (ipFL,ipMOD) { tab
edit_opentab_show fname
edit_current_def''
setmodified EditPage,mod
viewreplacetext pSV;txt
tab_refresh''
1
)
edit_openfiles=: 3 : 0
'files page'=. y
noevents 1
edit_open''
for_f. |.boxxopen files do.
  p=. edit_opentab jpath >f
end.
noevents 0
if. page<0 do. page=. p end.
windowfinish__locEdit''
if. #EditTabs do.
  EditPage=: (<:#EditTabs) <. 0 >. page
  gtk_notebook_set_current_page EditNB;EditPage
else.
  EditPage=: _1
end.
tab_refresh''
seteditfocus''
conf_save''
)

edit_openset=: 3 : 0
'fname sv high'=. y
if. high >: 0 do.
  viewsethigh sv,high
  scroll=. 0 >. high - 5
else.
  scroll=. getpos fname
end.
if. scroll>:0 do.
  setidle 'viewsetscroll_',(>coname''),'_ ',":sv,scroll
end.
)
edit_show=: 3 : 0
if. window=0 do.
  edit_open''
elseif. -. windex{Visible do.
  tab_reopenall''
  setvisible 1
end.
tab_refresh''
seteditfocus''
window_focus_in window
)
edit_opentab=: 3 : 0
noevents 1
edit_open ''
mod=. saved=. 0
high=. _1
if. L. y do.
  'fname high saved'=. y
else.
  fname=. y
end.
if. -. fexist fname do.
  mbinfo (gettext 'File Open');(gettext 'File not found: '),fname
  noevents 0
  _1 return.
end.
p=. selectopenfile fname
if. p >: 0 do.
  edit_openset fname;(page_sv p);high
  noevents 0
  p return.
end.
if. isimagefile fname do.
  noevents 0
  fname conew 'jgtkimage'
  _1 return.
elseif. '.glade'-:tolower _6{.fname do.
  noevents 0
  if. IFUNIX do.
    try. 2!:0 'which glade'
      2!:1 'glade ', (dquote fname), ' &'
      _1 return.
    catch. end.
  else.
    if. 32< 'shell32 ShellExecuteW > i x *w *w *w *w i'&cd 0;(uucp 'open');(uucp fname);(<0);(<0);1 do.
      _1 return.
    end.
  end.
  mbinfo (gettext 'Glade');(gettext 'Glade designer not found')
end.
if. -. istextfile fname do. _1 [ noevents 0 return. end.
sname=. edit_sname fname
ndx=. getxpage fname
if. ndx >: 0 do.
  (PageIds)=. ndx{EditTabs__locEdit1
  sname=. pSN [ ro=. pRO [ mod=. pMOD [ sb=. pSB [ txt=. pTXT
  'sw sv'=. newcodeviewsb sb
else.
  ro=. 0
  txt=. fread fname
  if. txt -: _1 do. txt=. '' end.
  es=. ('.ijs' -: _4 {. fname) # EditScheme
  'sw sv sb'=. newcodeview 'edit';es;fname;txt
end.
edit_openset fname;sv;high
'ebox btn lb'=. edit_maketablabel sname
p=. edit_opentab1 sw;fname;sname;ro;mod;saved;btn;lb;sv;sb;txt;ebox
noevents 0
p
)
edit_opentab_show=: 3 : 0
if. _1= ndx=. edit_opentab y do. EMPTY return. end.
EditPage=: ndx
gtk_widget_show_all page_sw ndx
gtk_widget_show_all EditNB
gtk_notebook_set_current_page EditNB,ndx
edit_current_def''
setchildfocus page_sv ndx
script_menu_enable''
validate''
conf_save''
EMPTY
)
edit_opentab1=: 3 : 0
noevents 1
(PageIds,' ebox')=. y
p=. 0 >. EditPage <. <: #EditTabs
EditTabs=: (p{.EditTabs),(}:y),p}.EditTabs
gtk_widget_show_all ebox
p=. gtk_notebook_insert_page_menu EditNB,pSW,ebox,0,p
gtk_notebook_set_tab_detachable EditNB,pSW,1
gtk_notebook_set_tab_reorderable EditNB,pSW,1
gtk_notebook_set_menu_label_text EditNB;pSW;pSN
viewlinenumbers pSV,LineNos
setchildfocus pSV
if. istempscript_j_ pFL do. setsaved 0 end.
setmodified1 pSN;pLAB;pMOD
noevents 0
p
)
tab_open=: 3 : 0
if. 0=#y do. return. end.
edit_current_def''
if. EditPage<0 do. act=. 0 else. act=. 1{EditPage{EditTabs end.
noevents 1
n=. y -. 1 {"1 EditTabs
for_f. n do.
  edit_opentab >f
end.
m=. ProjectPath_jp_&matchhead_jp_ each 1{"1 EditTabs
EditTabs=: EditTabs /: (m{'10') ,each 1{"1 EditTabs
for_w. ;0{"1 EditTabs do.
  gtk_notebook_reorder_child EditNB,w,w_index
end.
ndx=. 0 >. (1{"1 EditTabs) index act
EditPage=: ndx
gtk_widget_show_all page_sw ndx
gtk_widget_show_all EditNB
gtk_notebook_set_current_page EditNB,ndx
edit_current_def''
setchildfocus pSV
validate''
conf_save''
noevents 0
EMPTY
)
tab_reopen1=: 3 : 0
(PageIds)=. y{EditTabs
old=. freads pFL
new=. bufread pSB
if. -. old -: new do.
  viewreplacetext pSV;old
end.
)
tab_reopenall=: 3 : 0
if. 0=#EditTabs do. 1 return. end.
tab_closes I. -. fexist 1{"1 EditTabs
noevents 1
for_i. i.#EditTabs do. tab_reopen1 i end.
noevents 0
validate''
1
)
PageIds=: 'pSW pFL pSN pRO pMOD pSAV pBTN pLAB pSV pSB pTXT'
('i',each ;:PageIds)=: i.11
page_sw=: 3 : '>(<y;0) { EditTabs'
page_file=: 3 : '>(<y;1) { EditTabs'
page_mod=: 3 : '>(<y;4) { EditTabs'
page_sav=: 3 : '>(<y;5) { EditTabs'
page_but=: 3 : '>(<y;6) { EditTabs'
page_sv=: 3 : '>(<y;8) { EditTabs'
page_buf=: 3 : '>(<y;9) { EditTabs'
page_bufx=: [: > 9&{
page_index=: 3 : 0
(;6 {"1 EditTabs) i. {.y
)
page_svs_jgtkide_=: 3 : 0
l0=. {.locEdits
l1=. {:locEdits
(;8 {"1 EditTabs__l0),;8 {"1 EditTabs__l1
)
edit_current_page=: 3 : 'gtk_notebook_get_current_page EditNB'
edit_current_def=: 3 : 0
EditPage=: edit_current_page''
if. EditPage<0 do.
  p=. <''
else.
  p=. EditPage{EditTabs
end.
(PageIds)=: p
EMPTY
)
readline=: 3 : 'bufreadline pSB,y'
readlastline=: 3 : 'bufreadlastline pSB'
Files_jgtkide_=: ''
Filex_jgtkide_=: $0
setpos=: 3 : 0
cocurrent 'jgtkide'
'f p'=. y
if. 0=#f do. return. end.
ndx=. Files i. <f
if. ndx=#Files do.
  if. p do.
    Files=: Files,<f
    Filex=: Filex,p
  end.
else.
  if. p do.
    Filex=: p (<ndx)} Filex
  else.
    ndx=. <<<ndx
    Files=: ndx{Files
    Filex=: ndx{Filex
  end.
end.
)
getpos=: 3 : 0
(Files i. boxxopen y) { Filex,0
)
cx_load_script=: 3 : 0
if. cx_run_save'' do. 1 return. end.
name=. page_file EditPage
if. is_script name do.
  term_load_script__locTerm name
elseif. is_shellscript name do.
  hostcmd name
elseif. do.
  mbinfo (gettext 'Run Script');(gettext 'Not a valid scriptname: '),name
end.
1
)
cx_run_save=: 3 : 0
if. -. 1 tab_save '' do. 1 return. end.
-. 1 tab_saveall''
)
cx_run_all=: 3 : 0
if. cx_run_save'' do. 1 return. end.
edit_current_def''
if. is_shellscript pFL do.
  hostcmd pFL
else.
  runlines termLF trimWS tab_readall''
end.
1
)
cx_run_line1=: 3 : 0
if. cx_run_save'' do. 1 return. end.
edit_current_def''
row=. bufreadlinenumber pSB
'cnt txt'=. readentry row
if. #txt do.
  term_append_run__locTerm txt
end.
if. -.y do. 1 return. end.
if. row = gtk_text_buffer_get_line_count pSB do. 1 return. end.
bgn=. newiterline pSB,row
gtk_text_iter_set_line bgn;row+cnt
mark=. gtk_text_buffer_create_mark pSB;'';bgn;1
gtk_text_view_scroll_mark_onscreen pSV;mark
gtk_text_buffer_delete_mark pSB;mark
if. #readline row+cnt do.
  gtk_text_iter_forward_to_line_end <bgn
end.
gtk_text_buffer_place_cursor pSB;bgn
1
)
cx_run_line_show=: 3 : 0
r=. 0
Show_jgtkide_=: 1
try. r=. cx_run_line1 y catch. end.
Show_jgtkide_=: 0
r
)
cx_run_select=: 3 : 0
if. 0=#EditTabs do. return. end.
edit_current_def''
runimmex1 bufreadselect pSB
)
cx_run_line=: cx_run_line1 bind 0
cx_run_line_advance=: cx_run_line1 bind 1
file_save=: 4 : 0
checkdiskall''
if. 0=#EditTabs do. 1 return. end.
cx=. y #~ ; y { 4 {"1 EditTabs
if. 0=#cx do. 1 return. end.
if. ConfirmSave <: x=2 do. 1[file_save1 &> cx return. end.

fl=. cx { 1{"1 EditTabs
tx=. (istempscript_j_ &> fl) +. isconfigfile_j_ &> fl
if. *./ tx do. 1[file_save1 &> cx return. end.

if. x do.
  px=. cx #~ tx < 0 = page_sav cx
else.
  px=. cx #~ -.tx
end.
if. 0=#px do. 1[file_save1 &> cx return. end.

if. 3>#px do.
  m=. (gettext 'OK to save: '),}. ;' ',each px { 2 {"1 EditTabs
else.
  m=. (gettext 'OK to save changed files?')
end.
r=. mbcancelnoyes (gettext 'edit');m
if. r=0 do. 0 return. end.
nx=. (r=1)#px
if. #nx do.
  file_savenot1 &> nx
end.
sx=. px -. nx
if. #sx do.
  r=. *./ file_save1 &> sx
end.
r
)
file_save1=: 3 : 0
(PageIds)=. y{EditTabs
if. -.pMOD do. 1 return. end.
old=. fread pFL
new=. fputs bufread pSB
if. -. old -: new do.
  new pic_jp_ pFL
  new fwrite pFL
  recentfiles_add_j_ pFL
end.
settxt y;new
setmodified y,0
setsaved y
1
)
file_savenot1=: 3 : 0
(PageIds)=. y{EditTabs
if. -.pMOD do. 1 return. end.
(fputs bufread pSB) pic_jp_ pFL
txt=. fread pFL
if. -.txt -: _1 do.
  bufwrite pSB;fgets txt
end.
settxt y;txt
setmodified y,0
1
)
tab_save=: 4 : 0
if. 0=#y do.
  edit_current_def''
  y=. EditPage
end.
r=. x file_save y
r[sidebar_refresh''
)
tab_saveall=: 4 : 0
r=. x file_save i.#EditTabs
r[sidebar_refresh''
)
tab_saveother=: 4 : 0
r=. x file_save EditPage -.~ i.#EditTabs
r[sidebar_refresh''
)
select_line=: 3 : 0
edit_current_def''
if. EditPage<0 do. return. end.
'txt bgn len'=. bufget pSB
if. 0 = #txt do.
  mbinfo 'Selection';'No text selected' return.
end.

end=. bgn+len
oldsel=. bgn,end

sel=. bgn }. end {. txt
ndx=. LF i.~ |. bgn {. txt
bgn=. bgn - ndx
if. LF ~: {: sel do.
  txt=. txt, LF
  ndx=. 1 + LF i.~ end }. txt
  end=. end + ndx
end.

sel=. bgn }. end {. txt
csl=. <;.2 sel

len=. #Comment
com=. Comment,' '

select. y
case. 'minus' do.
  msk=. -. ((len+5) {. each csl) e. (com,'----');com,'===='
  csl=. msk # csl
  msk4=. (<com) = (len+1) {. each csl
  msk3=. msk4 < (<Comment) = len {. each csl
  new=. ; ((msk4 * len+1) + msk3 * len) }. each csl
  set=. bgn + 0, <: #new
case. 'plus' do.
  msk=. 1 < # &> csl
  if. 1<len do.
    hdr=. msk{Comment;com
  else.
    hdr=. msk{'';com
  end.
  new=. ; hdr ,each csl
  set=. bgn + 0, <: #new
case. 'plusline1' do.
  cmt=. com,(57#'-'),LF
  new=. ; cmt ; csl
  set=. oldsel + #cmt
case. 'plusline2' do.
  cmt=. com,(57#'='),LF
  new=. ; cmt ; csl
  set=. oldsel + #cmt
case. 'sort' do.
  new=. ; /:~ csl
  set=. bgn + 0, <: #new
end.

if. -. new -: sel do.
  viewnewselect pSV;bgn;end;new;set
  setmodified EditPage,1
end.
)
select_text=: 3 : 0
edit_current_def''
if. EditPage<0 do. return. end.
'txt bgn len'=. bufget pSB
end=. bgn+len

if. bgn = end do.
  mbinfo (gettext 'Selection');(gettext 'No text selected') return.
end.

sel=. bgn }. end {. txt
select. y
case. 'lower' do.
  new=. tolower sel
case. 'toggle' do.
  lwr=. a. {~ (i.26) + a. i. 'a'
  upr=. a. {~ (i.26) + a. i. 'A'
  ndx=. (lwr,upr,a.) i. sel
  new=. ndx { upr,lwr,a.
case. 'upper' do.
  new=. toupper sel
case. 'wrap' do.
  new=. 70 foldtext sel
end.

if. -. new -: sel do.
  viewnewselect pSV;bgn;end;new;bgn,end
  setmodified EditPage,1
end.

)
setcurrentpage=: 3 : 0
if. y e. i.#EditTabs do.
  EditPage=: y
  gtk_notebook_set_current_page EditNB,EditPage
else.
  EditPage=: gtk_notebook_get_current_page EditNB
end.
)
seteditfocus=: 3 : 0
setwindowfocus window
if. #pSV do. setchildfocus pSV end.
)
seteditpos=: 3 : 0
if. windex do.
  'x y w h m'=. getwinpos window__locEdit1
  wid=. {.Swh
  x=. (wid>w++:x) { 0, wid - w
  pos=. x,y,w,h,m
else.
  pos=. EditPos
end.
pos setwinpos window
)
setfiletext=: 3 : 0
'fl txt buf'=. y
page=. (1{"1 EditTabs) i. <fl
if. page=#EditTabs do. return. end.
EditTabs=: (1;txt) (<page;4 10)} EditTabs
if. buf do.
  bufwrite (page_buf page);toJ txt
end.
)
setmodified=: 3 : 0
'page ifmod'=. y
if. page<0 do. 0 return. end.
(PageIds)=. page{EditTabs
if. ifmod = pMOD do. 0 return. end.
setmodified1 pSN;pLAB;ifmod
EditTabs=: (<ifmod) (<page;4)} EditTabs
if. page = EditPage do.
  settitle''
end.
if. 0 <: page=. getxpage pFL do.
  setmodified__locEdit1 page;ifmod
end.
EMPTY
)
setmodified1=: 3 : 0
's l ifmod'=. y
if. ifmod do.
  s=. '<span foreground="red">',s,'</span>'
end.
gtk_label_set_markup l;s
)
setsaved=: 3 : 0
EditTabs=: (<1) (<y;5)} EditTabs
EMPTY
)
settxt=: 3 : 0
'page txt'=. y
EditTabs=: (<txt) (<page;10)} EditTabs
EMPTY
)
settitle=: 3 : 0
if. EditPage < 0 do.
  f=. settitle1 '';'';0
else.
  (PageIds)=. EditPage{EditTabs
  f=. settitle1 pFL;pSN;pMOD
end.
windowcaption f
)
settitle1=: 3 : 0
'file sname changed'=. y
c=. changed#'*'
n=. ProjectName_jp_
n=. (0<#n)#settitlep n
if. 0=#file do.
  f=. (0<#sname)#sname,' - '
else.
  s=. remtilde toprojectfolder_jp_ file
  'p f'=. fpathname s
  if. ProjectName_jp_ -: }:p do.
    s=. f
  end.
  f=. s,' - '
end.
c,f,n,'Edit'
)

settitlep=: '[' , '] - ' ,~ remtilde
setvisible=: 3 : 0
if. y do.
  VisPos setwinpos window
  gtk_widget_show window
else.
  VisPos=: getwinpos window
  gtk_widget_hide window
end.
Visible_jgtkide_=: y windex} Visible
)
make_edittoolbar=: 3 : 0

tb=. gtk_toolbar_new''
gtk_toolbar_set_icon_size tb, GTK_ICON_SIZE_MENU
gtk_toolbar_set_style tb, GTK_TOOLBAR_ICONS

wid=. gtk_tool_button_new_from_stock <'gtk-media-previous'
gtk_widget_set_tooltip_text wid;(gettext 'Open Last Project')
consig wid;'clicked';'projectlast_activate'
gtk_container_add tb, wid

wid=. gtk_tool_button_new_from_stock <'gtk-directory'
gtk_widget_set_tooltip_text wid;(gettext 'Open Project')
consig wid;'clicked';'projectopen_activate'
gtk_container_add tb, wid

gtk_container_add tb, gtk_separator_tool_item_new''

wid=. gtk_tool_button_new_from_stock <'gtk-execute'
gtk_widget_set_tooltip_text wid;(gettext 'Run All Lines')
consig wid;'clicked';'runall_activate'
gtk_container_add tb, wid

tb
)
globals=: 3 : 0
edit_current_def''
nms=. globalassigns bufread pSB
f=. toprojectfolder_jp_ pFL
txt=. 'in file: ',f,LF2,;nms ,each LF
textview txt
1
)
globalassigns=: 3 : 0
rx=. Rxnna_jregex_,'([[:alpha:]][[:alnum:]_]*) *=:'
hit=. rx rxmatches y
if. 0=#hit do. '' return. end.
nms=. ({:"2 hit) rxfrom y
tagcount sort nms
)
tagparen=: ' ('&, @ (,&')') @ ":
tagcount=: 3 : 0
cnt=. #/.~ y
nms=. ~. y
if. 1 e. b=. cnt > 1 do.
  tag=. tagparen each b#cnt
  tag=. (b#nms) ,each tag
  tag (I. b)} nms
end.
)
create_window=: 3 : 0
noevents 1
edit_current_def''
tab_remove EditPage
noevents 0
)
window_closex=: 3 : 0
f=. (0 pick fpathname) each 1{"1 EditTabs
tab_closes I. f ~: <ProjectPath,'/'
1
)
window_dup=: 3 : 0
noevents 1
edit_current_def''
edit_show__locEdit1''
if. -. 0 tab_saveall__locEdit1'' do. 0 return. end.
tab_closeall__locEdit1''
for_t. |. EditTabs do.
  edit_opencopy__locEdit1 t;bufread page_bufx t
end.
setcurrentpage__locEdit1 EditPage
locEdit_jgtkide_=: locEdit0
seteditfocus''
noevents 0
sidebar_refresh__locEdit1''
1
)
window_new=: 3 : 0
edit_show__locEdit1''
)
window_project=: 3 : 0
edit_current_def''
fl=. pFL
'f p'=. fpathname fl
pn=. f,(spath }: f),ProjExt
if. pn -: Project do. 1 return. end.
if. -. fexist pn do. 1 return. end.
if. -. proj_open pn do. 1 return. end.
edit_opentab_show fl
)
window_scripts=: 3 : 0
tab_open |. getdirscripts ProjectPath_jp_
)
window_source=: 3 : 0
tab_open |. fexists Source_jp_
)
window_text=: 3 : 0
tab_open |. getdirtext ProjectPath_jp_
)
window_throw=: 3 : 0
noevents 1
edit_current_def''
txt=. bufread pSB
old=. tab_remove EditPage
edit_opencopy__locEdit1 old;txt
setidle 'pageswitched_',(>locEdit1),'_$0'
locEdit_jgtkide_=: locEdit0
seteditfocus''
noevents 0
1
)
coclass 'jgtkfif'
coinsert 'j'

Assign=: 0
Filename=: 0
Matchcase=: 1
Name=: 0
Path=: ''
Regex=: 0
Search=: ''
SearchList=: 0
Types=: 0
Subdir=: 1

Vars=: 'Assign Filename Matchcase Name Path Regex SearchList Subdir Types'

ifResults=: 0
locP=: 0
window=: 0
Max=: 15
Title=: (gettext 'Find in Files')
create=: 3 : 0
if. SearchList-:0 do.
  SearchList_jgtkfif_=: RecentFif
end.
if. Types-:0 do.
  Types_jgtkfif_=: a: -.~ <;._2 FifTypes_jgtkide_,LF
  Type_jgtkfif_=: >{.Types
end.
setactivewin''
PathList=: {."1 UserFolders
'text ifname'=. 2 {. (boxopen y),<0
p=. ProjectName_jp_
if. #text do.
  Search=: text
  if. ifname do.
    if. '/' e. p do. p=. (p i: '/') {. p end.
    Path=: p
    fif_refresh''
    setcheckbox wassign,ifname-1
    fif_find'' return.
  end.
end.
if. #p do.
  setpathlist remsep 0 pick fpathname p
  Path=: p
end.
fif_refresh''
1
)
destroy=: 3 : 0
cbfree''
codestroy''
)
finfo=: 3 : 'mbinfo Title;y'
fifplain=: ; @ (,~each e.&'[](){}$^.*+?|\' #each '\'"_)
fifmatches=: {.@{."2 @ rxmatches_jregex_

toblank=: ' ' I.@(e.&'_')@]} ]
fifmatch=: ({.@{. + {:@(1&{))@rxmatch_jregex_
groupndx=: [: <: I. + e.~
maxlist=: 3 : '(Max <. #r) {. r=. ~.y'
FifExPaths=: ;: 'release'
fiffilter=: 3 : 0
xt=. '.' ,each <;._1 ' ',Type
if. (<'.*') e. xt do. y return. end.
y #~ (tolower each (}.~i:&'.') each y) e. xt
)
fifsplit=: 3 : 0
dat=. <;._2 y
g=. i.&' '
h=. g (toblank@{. ; deb@}.) ]
h &> dat
)
saverecentfif=: 3 : 0
if. #Search do.
  RecentFif_j_=: recentmax (<Search),RecentFif
  recentsave_j_''
end.
EMPTY
)
setactivewin=: 3 : 0
if. locP ~: loc=. getcurrentloc_jgtkide_ '' do.
  locP=: loc
  ('jgtkfif';(,copath) locP) copath coname''
end.
)
setpathlist=: 3 : 0
if. 0=#y do.
  p=. (0=#Path){Path;Folder
else.
  p=. y
end.
p=. (boxxopen p) -. <''
p=. ~.p,PathList
m=. -. p e. {."1 UserFolders
PathList=: p #~ Max >: m * +/\ m
Path=: 0 pick PathList,<''
)
settypelist=: 3 : 0
if. -. (<y) e. Types do.
  Types=: maxlist ~.(<y),Types
end.
)
setsearchlist=: 3 : 0
SearchList=: maxlist ~. (boxxopen y),SearchList
)
fif_assign_button=: 3 : 0
Assign=: readcheckbox wassign
if. Assign do.
  Name=: 0
  fif_setbuttons''
end.
fif_research''
1
)
fif_close=: 3 : 0
fif_readpos''
locFif_jgtkide_=: ''
pdef_jgtkfif_ pack Vars
gtk_widget_destroy window
destroy''
1
)
fif_find=: 3 : 0
fif_read''
fif_search''
1
)
fif_name_button=: 3 : 0
Name=: readcheckbox wname
if. Name do.
  Assign=: 0
  fif_setbuttons''
end.
fif_research''
1
)
fif_regex_button=: 3 : 0
Regex=: readcheckbox wregex
fif_setenable''
fif_research''
1
)
fif_research=: 3 : 0
if. NoEvents do. 1 return. end.
fif_read''
if. ifResults *. 0 < #Search do. fif_search'' end.
1
)
fif_cursor_changed=: 1:
fif_filename_button=: fif_research
fif_matchcase_button=: fif_research
fif_subdir_button=: fif_research
fif_row_activated=: 3 : 0
'w p c d'=. y
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
fif_show_text row pick Text
)
fif_show_text=: 3 : 0
txt=. y
ndx=. txt i. ':'
file=. (projname2path_jp_ TextPath),'/',ndx{.txt
if. Filename do.
  row=. _1
else.
  txt=. (ndx+1)}.txt
  row=. <: 0 ". (txt i.':'){.txt
end.
edit_opentab_show__locEdit file;row;0
1
)
fif_key_press=: 0:
window_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
'ctrl j shift'=. 2 2 2 #: state
if. shift +. ctrl do. 0 return. end.
if. key=GDK_Escape do. fif_close '' return. end.
0
)
wfif_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
fif_find''
)
wfolder_key_press=: wsearch_key_press=: wtype_key_press=: wfif_key_press
window_destroy=: window_delete=: fif_close
fif_align=: 3 : 0
a=. gtk_alignment_new 0 0.5 0 0
gtk_container_add a,y
a
)
fif_getdirpath=: 3 : 0
p=. }: 0 pick fpathname projname2path_jp_ readcombo wfolder
s=. filechooser 3;(gettext 'folder');'';p
if. #s do.
  w=. gtk_bin_get_child wfolder
  setentry w;s
end.
)
fif_getinsert=: 3 : 0
s=. readcombo wsearch
w=. gtk_bin_get_child wsearch
setentry w;s,' elmo'
)
fif_open=: 3 : 0
if. window do.
  setwindowfocus window return.
end.
a=. GTK_FILL
b=. GTK_EXPAND + GTK_FILL
noevents 1
newwindow Title
consig3 window;'key-press-event';'window_key_press'
p=. _1 (3)} FifPos
gtk_window_move window,0 1 {p
windowdefaultsize 2 3{p
vb=. gtk_vbox_new 0 0
tb=. gtk_table_new 3 2 0
gtk_container_set_border_width tb, 6
gtk_table_set_row_spacings tb,5
gtk_table_set_col_spacings tb,6

label=. gtk_label_new_with_mnemonic <gettext '_Search for:'
gtk_misc_set_alignment label, 1 0.5
wsearch=: newcombo''
w=. gtk_bin_get_child wsearch
consig3 w;'key-press-event';'wsearch_key_press'
gtk_label_set_mnemonic_widget label,wsearch
gtk_table_attach tb,label,0 1 0 1,a,0 0 0
gtk_table_attach tb,wsearch,1 2 0 1,b,0 0 0

label=. gtk_label_new_with_mnemonic <gettext 'In _folder:'
gtk_misc_set_alignment label, 1 0.5
wfolder=: newcombo''
w=. gtk_bin_get_child wfolder
consig3 w;'key-press-event';'wfolder_key_press'
gtk_label_set_mnemonic_widget label,wfolder
gtk_table_attach tb,label,0 1 1 2,a,0 0 0
gtk_table_attach tb,wfolder,1 2 1 2,b,0 0 0

label=. gtk_label_new_with_mnemonic <gettext 'File _types:'
gtk_misc_set_alignment label, 1 0.5
wtype=: newcombo ''
w=. gtk_bin_get_child wtype
consig3 w;'key-press-event';'wtype_key_press'
gtk_label_set_mnemonic_widget label,wtype
gtk_table_attach tb,label,0 1 2 3,a,0 0 0
gtk_table_attach tb,wtype,1 2 2 3,b,0 0 0
gtk_box_pack_start vb,tb,0 0 0
wmatchcase=: newcheckbox (gettext '_Match case');'fif_matchcase_button'
wassign=: newcheckbox (gettext '_Assigned');'fif_assign_button'
wname=: newcheckbox (gettext '_Name only');'fif_name_button'
wregex=: newcheckbox (gettext '_Regex');'fif_regex_button'
wsubdir=: newcheckbox (gettext 'Search su_bfolders');'fif_subdir_button'
wfilename=: newcheckbox (gettext '_Filen_ames only');'fif_filename_button'

hb=. gtk_hbox_new 0 0
sb=. gtk_table_new 3 2 0
gtk_container_set_border_width sb, 6
gtk_table_set_row_spacings sb,0

gtk_table_attach sb,(fif_align wmatchcase),0 1 0 1,b,0 0 0
gtk_table_attach sb,(fif_align wsubdir),0 1 1 2,b,0 0 0
gtk_table_attach sb,(fif_align wfilename),0 1 2 3,b,0 0 0
gtk_table_attach sb,(fif_align wassign),1 2 0 1,b,0 0 0
gtk_table_attach sb,(fif_align wname),1 2 1 2,b,0 0 0
gtk_table_attach sb,(fif_align wregex),1 2 2 3,b,0 0 0

gtk_box_pack_start hb,sb,1 1 0

sb=. gtk_vbox_new 0 0
bt=. newstocktextbutton 'gtk-find';(gettext '_Find  ');'fif_find'
gtk_box_pack_start sb,bt,0 0 0
gtk_box_pack_start hb,sb,0 0 0

align=. gtk_alignment_new 0.5 0.5 0 0
gtk_widget_set_size_request align,6 0
gtk_box_pack_start hb,align,0 0 0
gtk_box_pack_start vb,hb,0 0 0
Rvb=: vb
Svb=: 0
fif_write ''
gtk_container_add window, vb
windowfinish''
noevents 0
)
fif_open_assign=: 3 : 0
'Text Search'=: y
Assign=: 1
setsearchlist Search
Path=: 0 pick PathList,<''
fif_showresult Text;Path
)
fif_read=: 3 : 0
noevents 1
Search=: readcombo wsearch
Path=: readcombo wfolder
Type=: readcombo wtype
Matchcase=: readcheckbox wmatchcase
Filename=: readcheckbox wfilename
Subdir=: readcheckbox wsubdir
Regex=: readcheckbox wregex
Name=: readcheckbox wname
Assign=: readcheckbox wassign
fif_readpos''
fif_refresh''
noevents 0
0
)
fif_readpos=: 3 : 0
readwinpos 'FifPos'
)
fif_refresh=: 3 : 0
setsearchlist Search
setpathlist Path
settypelist Type
if. window do.
  fif_write ''
else.
  fif_open''
end.
setwindowfocus window
)
fif_setactive=: 3 : 0
setcombo_select wsearch,<:0<#Search
setcombo_select wfolder,<:0<#PathList
fif_setbuttons''
)
fif_setbuttons=: 3 : 0
setcheckbox wregex,Regex
setcheckbox wfilename,Filename
setcheckbox wmatchcase,Matchcase
setcheckbox wsubdir,Subdir
setcheckbox wname,Name
setcheckbox wassign,Assign
)
fif_setenable=: 3 : 0
setenable wname,-.Regex
setenable wassign,-.Regex
)
fif_show=: 3 : 0
setwindowfocus window
)
fif_showresult=: 3 : 0
if. y-:0 do.
  Text=: TextPath=: '' return.
end.
'Text TextPath'=: y
if. Svb=0 do.
  Svb=: gtk_vbox_new 0 0
  hs=. gtk_hseparator_new ''
  sw=. newsw''
  Rtv=: makelistbox 'fif';Text;'';'';1
  gtk_container_add sw,Rtv
  gtk_box_pack_start Svb,hs,0 0 0
  gtk_box_pack_start Svb,sw,1 1 0
  gtk_box_pack_start Rvb,Svb,1 1 0
  min=. 0 500
  gtk_window_resize window,min >. 2 3{FifPos
else.
  setlistbox Rtv;<Text
end.
windowfinish''
ifResults=: 1
)
fif_write=: 3 : 0
setcombo_text wsearch;<SearchList
setcombo_text wfolder;<PathList
setcombo_text wtype;<Types
setcombo_select wtype,Types i. <Type
fif_setactive''
fif_setenable''
)
dirfilter=: 3 : 0
d=. 1!:0 y
if. 0=#d do. return. end.
f=. {."1 d
m=. ('~' = {: &> f) +. ({.&> f) e. '.~'
d=. d #~ -. m
if. 0=#d do. return. end.
d #~ 'h' ~: 1 {"1 > 4 {"1 d
)
fif_getfiles=: 3 : 0
p=. filecase termsep y
d=. dirfilter p,'*'
if. 0 = #d do. '' return. end.
m=. 'd' = 4 {"1 > 4{"1 d
n=. {."1 d
f=. (<p) ,each n
r=. (-.m)#f
m=. m > n e. FifExPaths
if. Subdir *. 1 e. m do.
  r=. r, ;fif_getfiles each m#f
end.
fiffilter r
)
fif_search=: 3 : 0
if. 0=#Search do.
  finfo (gettext 'No search defined')
  0 return.
end.
r=. fifss''
fif_showresult r;Path
if. 0=#r do.
  finfo (gettext 'No match found')
  ifResults pick 0;''
end.
saverecentfif ''
)
fifss=: 3 : 0
if. 0=#Search do. '' return. end.
path=. termsep projname2path_jp_ Path
fls=. fif_getfiles path
if. 0=#fls do. '' return. end.

if. Matchcase do. case=. ] else. case=. tolower end.
what=. case Search
if. 0=fifss_init what do. '' return. end.

r=. ''
for_f. fls do.
  dat=. freads f
  if. dat -: _1 do. continue. end.
  txt=. case dat
  if. RX do.
    ndx=. FIFCOMP fifmatches txt
  else.
    ndx=. I. what E. txt
  end.
  if. 0=#ndx do. continue. end.
  if. Filename do.
    r=. r, <(>f),':',":#ndx
  else.
    ind=. ~. (0,}:I. dat = LF) groupndx ndx
    txt=. ind { <;._2 dat
    inx=. ':' ,each (":each ind) ,each <': '
    r=. r, f ,each inx ,each txt
  end.
end.

if. RX do. rxfree_jregex_ FIFCOMP end.
(#path) }.each r
)
fifss_init=: 3 : 0

RX=: +./ Assign,Name,Regex
if. -.RX do. 1 return. end.

if. Regex do.
  p=. y
elseif. Assign do.
  p=. Rxnna_jregex_,(fifplain y),Rxass_jregex_
elseif. Name do.
  p=. Rxnna_jregex_,(fifplain y),Rxnnz_jregex_
end.

FIFCOMP=: rxcomp_jregex_ :: _1: p
if. FIFCOMP -: _1 do.
  finfo (gettext 'Unable to compile regular expression')
  rxfree_jregex_ FIFCOMP
  0
else.
  1
end.
)
fif_jgtkide_=: 3 : 0
if. 0=#locFif do.
  locFif_jgtkide_=: conew 'jgtkfif'
end.
create__locFif y
)
coclass 'jgtkfilem'
coinsert 'jgtkide j'

Title=: (gettext 'File Snapshots')
create=: 3 : 0
if. -. fexist y do.
  mbinfo (gettext 'File Snapshots');(gettext 'not found: '),y
  destroy'' return.
end.
'Path File'=: fpathname y
f=. pic_files_jp_ Path
f=. sort ~. f,<File
m=. fexist (<Path) ,each f
Files=: m#f
Temps=: ''
fm_init File
fm_open''
fm_compare 0
)
destroy=: 3 : 0
cbfree''
codestroy''
)
fm_close=: 3 : 0
ferase Temps
gtk_widget_destroy window
destroy''
1
)
fm_restore_button=: 3 : 0
ndx=. listbox_getactiverow wsnaps
ss=. ndx pick Stamps
msg=. (gettext 'OK to restore file snapshot: '),File,' ',ss,'?'
if. -. mbnoyes Title;msg do. 1 return. end.
tab_writefile__locEdit (Path,File);ndx{Texts
fm_close''
1
)
fm_view_button=: 3 : 0
ndx=. listbox_getactiverow wsnaps
if. ndx>:0 do.
  textview fgets ndx pick Texts
end.
)
fm_wfile_changed=: 3 : 0
if. -. NoEvents do.
  fm_init readcombo wfile
  setlistbox wsnaps;<Stamps
  if. #Stamps do.
    listbox_select wsnaps,0
    listbox_scroll wsnaps,0
  end.
  fm_compare 0
  setchildfocus wsnaps
end.
1
)
fm_xdiff_button=: 3 : 0
if. -. 0 tab_save__locEdit '' do. 1 return. end.
f=. newtempscript''
Temps=: Temps,<f
ndx=. listbox_getactiverow wsnaps
if. ndx=_1 do. '' return. end.
(ndx pick Texts) fwrite f
forkcmd XDiff,' "',f,'" "',(Path,File),'"'
)
snaps_cursor_changed=: 3 : 0
if. -. NoEvents do.
  fm_compare listbox_getactiverow wsnaps
end.
1
)
fm_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
fm_match_button''
)
window_key_press=: 3 : 0
if. isesckey y do.
  fm_close''
else.
  0
end.
)
snaps_key_press=: fm_key_press
snaps_row_activated=: 0:
window_delete=: fm_close
fm_compare=: 3 : 0
old=. y pick Texts
r=. (gettext 'comparing:'),LF
r=. r,File,'  ',(y pick Stamps),'  ',(":#old),LF
r=. r,File,(gettext '  current   '),(":#Text),LF
r=. r,(fgets old) compare Text
fm_write r
)
fm_init=: 3 : 0
File=: y
file=. Path,File
Text=: tab_readfile__locEdit file
dat=. pic_read_jp_ file
if. 0=#dat do.
  dat=. fread file
  if. dat-:_1 do.
    mbinfo Title;(gettext 'No previous saves for: '),File
    0 return.
  end.
  Stamps=: ,<'start   '
  Texts=: ,<dat
else.
  Stamps=: |. (<'start   ') 0} <"1 ": pp_unstamp_jp_ dat
  Texts=: |. _6 }. each dat
  if. (1<#Texts) *. Text -: 0 pick Texts do.
    Stamps=: }. Stamps
    Texts=: }. Texts
  end.
end.
1
)
fm_write=: 3 : 0
gtk_text_buffer_set_text Buf;y;#y
viewsetrow View,4
)
fm_open=: 3 : 0

a=. GTK_FILL
b=. GTK_EXPAND + GTK_FILL

noevents 1
newwindow Title
FilemPos setwinpos window
consig3 window;'key-press-event';'window_key_press'
gtk_window_set_icon_from_file window;EditIcon;0

vb=. gtk_vbox_new 0 0
hb=. gtk_hbox_new 0 0
label=. newlabel (gettext ' _File: ')
wfile=: newcombo Files;'fm_wfile_changed';0

gtk_box_pack_start hb,label,0 0 3
gtk_box_pack_start hb,wfile,0 0 0
label=. newlabel ' '
label2=. newlabel ' '
wview=: newbutton (gettext ' _View ');'fm_view_button'
wxdiff=: newbutton (gettext ' _External Diff ');'fm_xdiff_button'
wrestore=: newbutton (gettext ' _Restore ');'fm_restore_button'
gtk_box_pack_start hb,label,1 1 0
gtk_box_pack_start hb,wview,0 0 0
gtk_box_pack_start hb,wxdiff,0 0 0
gtk_box_pack_start hb,wrestore,0 0 0
gtk_box_pack_start hb,label2,0 0 3

gtk_box_pack_start vb,hb,0 0 8
hs=. gtk_hseparator_new ''
gtk_box_pack_start vb,hs,0 0 3
hb=. gtk_hpaned_new''
gtk_container_set_border_width hb,0
sw=. newsw''
wsnaps=: makelistbox 'snaps';Stamps;0;'';1
gtk_container_add sw,wsnaps
gtk_widget_set_size_request sw,90 0
gtk_paned_pack1 hb,sw,0 0

'sw sv sb'=. newcodeview 'view';EditScheme;'';''
View=: sv
Buf=: sb
gtk_paned_pack2 hb,sw,1 0
gtk_box_pack_start vb,hb,1 1 0
gtk_container_add window,vb
windowfinish''
noevents 0
setchildfocus wsnaps
)
coclass 'jgtkfiw'
coinsert 'j'

Assign=: 0
Matchcase=: 1
Name=: 0
ReplaceList=: ''
SearchList=: ''

Vars=: 'Assign Matchcase Name ReplaceList SearchList'

Max=: 15
Title=: (gettext 'Find')
locP=: ''
create=: 3 : 0
FiwInc=: 0
FiwLast=: ''
ifReplace=: 0
setsearchlist y
setactivewin''
fiw_open ''
1
)
destroy=: 3 : 0
cbfree''
codestroy''
)
finfo=: 3 : 'mbinfo Title;y'
groupndx=: [: <: I. + e.~
maxlist=: 3 : '(Max <. #r) {. r=. ~.y'
setactivewin=: 3 : 0
if. locP ~: loc=. getcurrentloc_jgtkide_ '' do.
  locP=: loc
  ('jgtkfiw';(,copath) locP) copath coname''
end.
if. 'term' -: Class__locP do.
  SB=: termSB
  SV=: termSV
else.
  edit_current_def''
  SB=: pSB
  SV=: pSV
end.
)
setreplacelist=: 3 : 0
ReplaceList=: maxlist ~. (boxopen y),ReplaceList -. <''
)
setsearchlist=: 3 : 0
SearchList=: maxlist ~. (boxxopen y),SearchList
)
fiw_assign_button=: 3 : 0
Assign=: readcheckbox wassign
if. Assign do.
  Name=: 0
  fiw_setbuttons''
end.
1
)
fiw_close=: 3 : 0
fiw_readpos''
locFiw_jgtkide_=: ''
pdef_jgtkfiw_ pack Vars
gtk_widget_destroy window
destroy''
1
)
fiw_findback=: 3 : 0
fiw_read''
fiw_search _1
1
)
fiw_find=: 3 : 0
fiw_read''
fiw_search 1
1
)
fiw_findtop=: 3 : 0
fiw_read''
fiw_search 0
1
)
fiw_name_button=: 3 : 0
Name=: readcheckbox wname
if. Name do.
  Assign=: 0
  fiw_setbuttons''
end.
1
)
fiw_replace_one=: 3 : 0
fiw_read''
fiw_search_replace 0
)
fiw_replace_forward=: 3 : 0
fiw_read''
fiw_search_replace 1
)
fiw_showreplace=: 3 : 0
if. ifReplace do. 0 return. end.
fiw_read''
fiw_open_replace''
)
fiw_undo_last=: 3 : 0
fiw_read''
viewreplacelast SV;FiwLast
FiwLast=: ''
fiw_show''
)
window_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
'ctrl j shift'=. 2 2 2 #: state
if. shift do. 0 return. end.
if. ctrl do.
  if. key=GDK_r do. fiw_showreplace'' return. end.
else.
  if. key=GDK_Escape do. fiw_close '' return. end.
end.
0
)
wreplace_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
fiw_replace_one''
)
wfind_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
fiw_findtop''
)
window_destroy=: window_delete=: fiw_close
wfolder_key_press=: wsearch_key_press=: wtype_key_press=: wfind_key_press
fiw_open=: 3 : 0
Title=: gettext 'Find'

a=. GTK_FILL
b=. GTK_EXPAND + GTK_FILL
noevents 1
newwindow Title
consig3 window;'key-press-event';'window_key_press'

gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
gtk_window_set_destroy_with_parent window,1
p=. _1 (3)} FiwPos
gtk_window_move window,0 1 {p
windowdefaultsize 2 3{p
vb=. gtk_vbox_new 0 0
tb=. gtk_table_new (1+ifReplace),2 0
gtk_container_set_border_width tb, 6
gtk_table_set_row_spacings tb,5
gtk_table_set_col_spacings tb,6

label=. newlabelr gettext '_Search for:'
wsearch=: newcombo''
w=. gtk_bin_get_child wsearch

consig3 w;'key-press-event';'wsearch_key_press'
gtk_label_set_mnemonic_widget label,wsearch
gtk_table_attach tb,label,0 1 0 1,a,0 0 0
gtk_table_attach tb,wsearch,1 2 0 1,b,0 0 0
gtk_box_pack_start vb,tb,0 0 0
Rtb=: tb
wmatchcase=: gtk_check_button_new_with_mnemonic <gettext '_Match case'
wassign=: gtk_check_button_new_with_mnemonic <gettext '_Assigned'
wname=: gtk_check_button_new_with_mnemonic <gettext '_Name only'
consig wassign;'clicked';'fiw_assign_button'
consig wname;'clicked';'fiw_name_button'

hb=. gtk_hbox_new 0 0
align=. gtk_alignment_new 0 0 0 0
gtk_widget_set_size_request align,6 0
gtk_box_pack_start hb,align,0 0 0

bb=. gtk_vbox_new 0 0
align=. gtk_alignment_new 0 0 0 0
gtk_widget_set_size_request align,0 10
gtk_box_pack_start bb,align,1 1 0
gtk_box_pack_start bb,wmatchcase,0 0 0
gtk_box_pack_start bb,wassign,0 0 0
gtk_box_pack_start bb,wname,0 0 0
align=. gtk_alignment_new 0 0 0 0
gtk_widget_set_size_request align,0 10
gtk_box_pack_start bb,align,1 1 0
gtk_box_pack_start hb,bb,0 0 0

Ftb=: tb=. gtk_table_new 2 3 0
gtk_container_set_border_width tb, 6
gtk_table_set_row_spacings tb,4
gtk_table_set_col_spacings tb,4

bt=. newstocktextbutton 'gtk-go-back';(gettext 'Find _Back ');'fiw_findback'
gtk_table_attach tb,bt,0 1 0 1,b,0 0 0
bt=. newstocktextbutton 'gtk-goto-top';(gettext '_Find Top ');'fiw_findtop'
gtk_table_attach tb,bt,1 2 0 1,b,0 0 0
bt=. newstocktextbutton 'gtk-go-forward';(gettext 'Find _Next ');'fiw_find'
gtk_table_attach tb,bt,2 3 0 1,b,0 0 0
bt=. newstocktextbutton 'gtk-find-and-replace';(gettext '_Replace');'fiw_showreplace'
gtk_table_attach tb,bt,2 3 1 2,b,0 0 0
Btb=: tb
SRbt=: bt

gtk_box_pack_end hb,tb,0 1 6
gtk_box_pack_start vb,hb,0 0 0
fiw_write ''
gtk_container_add window, vb
windowfinish''
gtk_widget_hide &> Rep
gtk_window_resize window,(2{getwinpos window),1
noevents 0
)
fiw_open_replace=: 3 : 0
a=. GTK_FILL
b=. GTK_EXPAND + GTK_FILL
windowcaption 'Find and Replace'
ifReplace=: 1

label=. gtk_label_new_with_mnemonic <gettext '_Replace by:'
gtk_misc_set_alignment label, 1 0.5
wreplace=: newcombo''
w=. gtk_bin_get_child wreplace
consig3 w;'key-press-event';'wreplace_key_press'
gtk_label_set_mnemonic_widget label,wreplace
gtk_table_attach Rtb,label,0 1 1 2,a,0 0 0
gtk_table_attach Rtb,wreplace,1 2 1 2,b,0 0 0

wundo=: newstocktextbutton 'gtk-undo';(gettext '_Undo Last');'fiw_undo_last'
gtk_table_attach Btb,wundo,0 1 1 2,b,0 0 0
bt=. newstocktextbutton 'gtk-find-and-replace';(gettext 'Re_place');'fiw_replace_one'
gtk_table_attach Btb,bt,1 2 1 2,b,0 0 0
bt=. newstocktextbutton 'gtk-go-forward';(gettext 'Replace For_ward');'fiw_replace_forward'
gtk_table_attach Btb,bt,2 3 1 2,b,0 0 0

windowfinish''
gtk_widget_hide SRbt
setchildfocus wreplace
)
fiw_read=: 3 : 0
Search=: readcombo wsearch
Matchcase=: readcheckbox wmatchcase
Assign=: readcheckbox wassign
Name=: readcheckbox wname
if. ifReplace do.
  Replace=: readcombo wreplace
end.
fiw_readpos''
fiw_refresh''
0
)
fiw_readpos=: 3 : 0
readwinpos 'FiwPos'
)
fiw_refresh=: 3 : 0
setsearchlist Search
if. ifReplace do.
  setreplacelist Replace
end.
fiw_write ''
)
fiw_setactive=: 3 : 0
setcombo_select wsearch,<:0<#SearchList
if. ifReplace do.
  setcombo_select wreplace,<:0<#ReplaceList
end.
fiw_setbuttons''
)
fiw_setbuttons=: 3 : 0
setcheckbox wmatchcase,Matchcase
setcheckbox wassign,Assign
setcheckbox wname,Name
)
fiw_setenable=: 3 : 0
if. -.ifReplace do. return. end.
setenable wundo,#FiwLast
)
fiw_show=: 3 : 0
fiw_setenable''
setwindowfocus window
)
fiw_showhit=: 3 : 0
viewsetselect SV,TextPos,#ucp Search
)
fiw_write=: 3 : 0
setcombo_text wsearch;<SearchList
if. ifReplace do.
  setcombo_text wreplace;<ReplaceList
end.
fiw_setactive''
fiw_setenable''
)
fiw_search=: 3 : 0
if. 0=#SB do. return. end.
'Text TextPos TextSel'=: bufget SB
hit=. fiwss y
if. hit=_1 do.
  finfo (gettext 'not found: '),Search
else.
  TextPos=: hit
  FiwInc=: 1
  fiw_showhit''
end.
fiw_show''
)
fiwss=: 3 : 0
if. Matchcase do.
  txt=. Text
  search=. ucp Search
else.
  txt=. tolower Text
  search=. ucp tolower Search
end.
if. Assign do.
  f=. fiwss_assign
elseif. Name do.
  f=. fiwss_name
elseif. do.
  f=. fiwss_plain
end.
if. y<0 do.
  {: _1, search f TextPos {. txt return.
end.
if. y=0 do.
  TextPos=: FiwInc=: 0
end.
p=. TextPos + FiwInc
{. (p + search f p }. txt), _1
)
fiwss_assign=: 4 : 0
x=. Rxnna_jregex_,x,Rxass_jregex_
x fiwss_regex y
)
fiwss_name=: 4 : 0
x=. Rxnna_jregex_,x,Rxnnz_jregex_
x fiwss_regex y
)
fiwss_plain=: I. @ E.
fiwss_regex=: ({.@{.+{:@(1&{))"2 @ rxmatches
fiw_search_replace=: 3 : 0
if. 0=#SB do. return. end.
'Text TextPos TextSel'=: bufget SB
FiwInc=: 0
FiwLast=: ''
sel=. #ucp Search
select. hit=. fiwss 1
case. _2 do.
  mbinfo (gettext 'Replace');(gettext 'No match found')
case. _1 do.
case. do.
  TextPos=: hit
  FiwLast=: Text;TextPos;sel
  FiwInc=: 1
  viewreplaceselect SV;TextPos;sel;Replace
  Text=: (hit{.Text),(ucp Replace),(hit+sel)}.Text
  if. Class-:'edit' do.
    setmodified__locEdit0 EditPage,1
  end.
  if. y=0 do.
    if. 0 <: hit=. fiwss 1 do.
      TextPos=: hit
      fiw_showhit''
    end.
  else.
    count=. 1
    pad=. <: #ucp Replace
    TextPos=: TextPos + pad
    while. 0 <: hit=. fiwss 1 do.
      viewreplaceselect SV;hit;sel;Replace
      Text=: (hit{.Text),(ucp Replace),(hit+sel)}.Text
      TextPos=: hit + pad
      count=. >:count
    end.
    finfo (":count),(ngettext ' replacement';' replacements';count),(gettext ' made')
  end.
end.
fiw_show''
)
fiw_jgtkide_=: 3 : 0
if. 0=#locFiw do.
  locFiw_jgtkide_=: conew 'jgtkfiw'
end.
create__locFiw y
)
coclass 'jgtkide'
helpabout_activate=: 3 : 0
w=. gtk_about_dialog_new''
gtk_about_dialog_set_copyright w;'Copyright ',(194 169{a.),' 1994-2011 Jsoftware'
gtk_about_dialog_set_website w;'www.jsoftware.com'
gtk_about_dialog_set_program_name ::gtk_about_dialog_set_name w;'J701'
gtk_about_dialog_set_comments w;JVERSION
gtk_dialog_run w
gtk_widget_destroy w
)
helpcontext_activate=: 3 : 0
if. 0=buf=. getcurrentbuf'' do. 0 return. end.
sel=. bufreadselect buf
if. 0=#sel do. sel=. helppos buf end.
if. 0=#sel do. 0 return. end.
helpsel sel
1
)
helpconstants_activate=: 3 : 'htmlhelp ''dictionary/dcons.htm'''
helpcontrols_activate=: 3 : 'htmlhelp ''dictionary/ctrl.htm'''
helpdictionary_activate=: 3 : 'htmlhelp ''dictionary/contents.htm'''
helpforeigns_activate=: 3 : 'htmlhelp ''dictionary/xmain.htm'''
helpgeneral_activate=: 3 : 'htmlhelp ''user/product.htm'''
helphelp_activate=: 3 : 'htmlhelp ''index.htm'''
helprelease_activate=: 3 : 'htmlhelp ''user/relhigh.htm'''
helprelnotes_activate=: 3 : 'htmlhelp ''release/contents.htm'''
helpvocab_activate=: 3 : 'htmlhelp ''dictionary/vocabul.htm'''
helpgtkide_activate=: 3 : 0
if. fexist f=. jpath '~addons/docs/gtkide/index.htm' do.
  browse 'file://', f
else.
  browse 'http://www.jsoftware.com/jwiki/Guides/Gtk%20IDE'
end.
0
)
helpcairo_activate=: 3 : 'htmlhelpgtk ''cairo/'''
helpgdk_activate=: 3 : 'htmlhelpgtk ''gdk/'''
helpgdkpixbuf_activate=: 3 : 'htmlhelpgtk ''gdk-pixbuf/'''
helpgio_activate=: 3 : 'htmlhelpgtk ''gio/'''
helpglib_activate=: 3 : 'htmlhelpgtk ''glib/'''
helpgobject_activate=: 3 : 'htmlhelpgtk ''gobject/'''
helpgtk_activate=: 3 : 'htmlhelpgtk ''gtk/'''
helpgtksourceview_activate=: 3 : 'htmlhelpgtk ''gtksourceview-2.0/'''
helppango_activate=: 3 : 'htmlhelpgtk ''pango/'''
helpcairodocumentation_activate=: 3 : 0
browse 'http://cairographics.org/documentation/'
0
)

helpgtkdocumentation_activate=: 3 : 0
browse 'http://www.gtk.org/documentation.html'
0
)

helpgtktutorial_activate=: 3 : 0
if. fexist f=. jpath '~addons/docs/gtk/tutorial/book1.html' do.
  browse 'file://', f
else.
  browse 'http://library.gnome.org/devel/gtk-tutorial/stable/'
end.
0
)
helppos=: 3 : 0
buf=. y
mark=. i.ITERSIZE
gtk_text_buffer_get_iter_at_mark buf;mark;gtk_text_buffer_get_insert buf
row=. gtk_text_iter_get_line <mark
bgn=. newiterline buf,row
end=. newiterline buf,row
gtk_text_iter_forward_to_line_end <end
p=. readstringfree gtk_text_iter_get_text bgn;mark
q=. readstringfree gtk_text_iter_get_text bgn;end
r=. p
if. Class-:'term' do. r=. 1 delmode r end.
off=. (#p) - len=. #r
q=. off }. q
if. 0=#deb q do. '' return. end.
helppos1 q;len
)
helppos1=: 3 : 0
'txt pos'=. y
if. '[-' -: }. 3 {. txt do.
  if. helperror txt do. '' return. end.
end.
if. Class-:'term' do.
  at=. pos{txt,LF          
  as=. pos{LF,txt          
  if. *./ (at,as) e. ' ',CRLF do.
    '' [ helpword txt return.
  end.
end.
sep=. {.~ <./ @ (i.&('() ''',{.a.))
beg=. sep&.|. pos{.txt
bit=. beg,sep pos}.txt

if. 0=#bit-.' ' do.
  txt=. ''
else.
  wds=. ;:bit
  len=. #&>}:wds
  txt=. > wds {~ 0 i.~ (#beg)>:+/\len
end.

txt
)
helpsel=: 3 : 0
assert. 2=3!:0 y
s=. dlb@dtb y
if. 0=#s do. return. end.
if. 0=#ContextHelp do. return. end.
for_h. ,ContextHelp do.
  select. h
  case. 'j' do.
    if. #ndx=. helpndx s do.
      htmlhelp 'dictionary/',ndx return.
    end.
  case. 'b' do.
    if. #n=. tagtag_jbaselibtag_ s do.
      htmlhelpbaselib tagfile_jbaselibtag_ {.n return.
    end.
  case. 'g' do.
    if. #n=. tagtag_jgtkdoctag_ s do.
      htmlhelpgtkdoc tagfile_jgtkdoctag_ {.n return.
    end.
  end.
end.
mbinfo 'Help';'Help topic not found: ', y
)
helpndx=: 3 : 0
y=. ,y
if. 2 = 3!:0 y do.
  if. 'goto_' -: 5{.y do. y=. 'goto_?'
  elseif. 'for_' -: 4{.y do. y=. 'for_?'
  elseif. 'label_' -: 6{.y do. y=. 'label_?'
  end.
  top=. <y
  if. top e. DICT do.
    (>DICTX {~ DICT i.top),'.htm'
  else.
    ''
  end.
else.
  ''
end.
)
helpword=: 3 : 0
r=. ;: :: 0: y
if. r -: 0 do.
  smoutput LF,'word formation failed: ',dlb y
else.
  smoutput ,LF,.":r
end.
)
htmlhelpbaselib=: 3 : 0
  if. fexist f=. jpath '~.Main/', y do.
    open f     
  else.
    browse_j_ 'http://www.jsoftware.com/trac/base7/browser/trunk/', y
  end.
0
)
htmlhelpgtk=: 3 : 0
lib=. ({.~ i.&'/') y
f1=. (f;'index.html'){::~ 0=#f=. }.(}.~ i.&'/') y
select. lib 
case. 'gtk' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gtk/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gtk/stable/', f
  end.
case. 'gdk' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gdk/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gdk/stable/', f
  end.
case. 'gdk-pixbuf' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gdk-pixbuf/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gdk-pixbuf/stable/', f
  end.
case. 'glib' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/glib/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/glib/stable/', f
  end.
case. 'gobject' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gobject/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gobject/stable/', f
  end.
case. 'gio' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gio/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gio/stable/', f
  end.
case. 'pango' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/pango/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gtk/stable/', f
  end.
case. 'cairo' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/cairo/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://cairographics.org/manual/', f
  end.
case. 'gtksourceview-2.0' do.
  if. fexist ({.~ i.&'#') f2=. jpath '~addons/docs/gtk/gtksourceview-2.0/', f1 do.
    browse_j_ 'file://', f2
  else.
    browse_j_ 'http://library.gnome.org/devel/gtksourceview/stable/', f
  end.
end.
0
)
j=. <;._2 (0 : 0)
= d000
=. d001
=: d001
< d010
<. d011
<: d012
> d020
>. d021
>: d022
_ d030
_. d031
_: d032
+ d100
+. d101
+: d102
* d110
*. d111
*: d112
- d120
-. d121
-: d122
% d130
%. d131
%: d132
^ d200
^. d201
^: d202n
$ d210
$. d211
$: d212
~ d220n
~. d221
~: d222
| d230
|. d231
|: d232
. d300
.. d301
.: d301
: d310n
:. d311
:: d312
, d320
,. d321
,: d322
; d330
;. d331
;: d332
# d400
#. d401
#: d402
! d410
!. d411
!: d412
/ d420
/. d421
/: d422
\ d430
\. d431
\: d432
[ d500
[: d502
] d500
{ d520
{. d521
{: d522
{:: d523
} d530n
}. d531
}: d532
" d600n
". d601
": d602
` d610
`: d612
@ d620
@. d621
@: d622
& d630n
&. d631
&: d632
&.: d631c
? d640
?. d640
__ d030
a. dadot
a: dadot
A. dacapdot
b. dbdotn
C. dccapdot
d. dddot
D. ddcapdot
D: ddcapco
e. dedot
E. decapdot
f. dfdot
H. dhcapdot
i. didot
i: dico
I. dicapdot
j. djdot
L. dlcapdot
L: dlcapco
M. dmcapdot
o. dodot
p. dpdot
p.. dpdotdot
p: dpco
q: dqco
r. drdot
s: dsco
S: dscapco
t. dtdotm
t: dtco
T. dtcapdot
u: duco
x: dxco
assert. cassert
break. cbreak
catch. ctry
do. ctrl
else. cif
elseif. cif
end. ctrl
label_? cgoto
case. csel
continue. ccont
fcase. csel
for. cfor
for_? cfor
goto_? cgoto
if. cif
return. cret
select. csel
throw. cthrow
try. ctry
while. cwhile
whilst. cwhile
0: dconsf
1: dconsf
2: dconsf
3: dconsf
4: dconsf
5: dconsf
6: dconsf
7: dconsf
8: dconsf
9: dconsf
_1: dconsf
_2: dconsf
_3: dconsf
_4: dconsf
_5: dconsf
_6: dconsf
_7: dconsf
_8: dconsf
_9: dconsf
)

n=. j i.&> ' '
DICT=: n {.each j
DICTX=: (n+1) }.each j
coclass 'jgtkide'
menu_init=: 3 : 0
f=. < @ (<;._1) @ (','&,)
j=. f;._2 Menus
MENUIDS=: {.&> j
MENUDEF=: }.each j
Launch=: menu_fexist Launch
Studio=: menu_fexist Studio
0
)
menu_fexist=: 3 : 0
t=. y #~ (fexist +. 0 = #) &> {:"1 y
t #~ (+. 1 |. (> </\)) 0 < # &> {:"1 t
)
j=. <;._2 (0 : 0)
0base.cfg
1dirmatch.cfg
1fkeys.cfg
0folders.cfg
1gtkide.cfg
1launch.cfg
0pacman.cfg
0startup.ijs
)

CDirs=: '1'={.&>j
CFiles=: }.each j
cb_cfg_open=: 3 : 0
if. y -: 'all' do.
  drs=. CDirs
  fls=. CFiles
else.
  ind=. (<y) i.~ (#y) {.each CFiles
  drs=. ind{CDirs
  fls=. ind{CFiles
end.
d=. (jpath '~system/config/');GtkConfig
cfg=. (<jpath '~config/') ,each fls
src=. (drs{d) ,each fls
for_f. cfg do.
  if. (fsize f) e. _1 0 do.
    s=. f_index pick src
    if. '.ijs' -: _4 {. s do.
      dat=. ''
    else.
      dat=. fread s
      if. dat -: _1 do.
        mbinfo (gettext 'Could not read: '),s
        1 return.
      end.
    end.
    dat fwrite f
  end.
end.
edit_openfiles__locEdit cfg;_1
1
)
config_menu=: 3 : 0
con=. gtk_menu_new''
m=. (<'cfg') ,each (CFiles i.&> '.') {.each CFiles
con&ccmenu each _1 }. m
create_menu_sep con
con&ccmenu each _1 {. m
create_menu_sep con
con ccmenu 'cfgall'
con
)
cfg_base_activate=: cb_cfg_open bind 'base'
cfg_dirmatch_activate=: cb_cfg_open bind 'dirmatch'
cfg_fkeys_activate=: cb_cfg_open bind 'fkeys'
cfg_folders_activate=: cb_cfg_open bind 'folders'
cfg_gtkide_activate=: cb_cfg_open bind 'gtkide'
cfg_launch_activate=: cb_cfg_open bind 'launch'
cfg_pacman_activate=: cb_cfg_open bind 'pacman'
cfg_startup_activate=: cb_cfg_open bind 'startup'
cfg_all_activate=: cb_cfg_open bind 'all'
proj_menu_enable=: 3 : 0
if. window__locEdit do.
  setenable mnProjectEnable__locEdit,.y
end.
setenable mnProjectEnable__locTerm,.y
)
script_menu_enable=: 1:
clearterm_activate=: 3 : 'term_clear__locTerm y'
editascii_activate=: 3 : 'boxdraw_j_ -. ''+'' e. 9!:6$0'
editfif_activate=: 3 : 'fif getselection$0'
editinputlog_activate=: 3 : 'cx_edit_inputlog__locTerm y'
fileclose_activate=: 3 : 'cx_file_close__locEdit y'
filecloseall_activate=: 3 : 'cx_file_closeall__locEdit y'
filecloseother_activate=: 3 : 'cx_file_closeother__locEdit y'
filedelete_activate=: 3 : 'cx_file_delete__locEdit y'
filenew_activate=: 3 : 'cx_file_new__locEdit y'
filenewtemp_activate=: 3 : 'cx_file_newtemp__locEdit y'
fileopen_activate=: 3 : 'cx_file_open__locEdit y'
fileopensystem_activate=: 3 : 'cx_file_opensystem__locEdit y'
fileopentemp_activate=: 3 : 'cx_file_opentemp__locEdit y'
fileopenuser_activate=: 3 : 'cx_file_openuser__locEdit y'
filerecent_activate=: 3 : '1[recent_run_jgtkide_ y'
filerestore_activate=: 3 : 'cx_file_restore__locEdit y'
filesave_activate=: 3 : '2 tab_save__locEdit$0'
filesaveall_activate=: 3 : '2 tab_saveall__locEdit$0'
filesaveas_activate=: 3 : 'cx_file_saveas__locEdit$0'
openedit_activate=: 3 : 'cx_edit_openedit__locEdit y'
openterm_activate=: 3 : 'cx_edit_openterm__locTerm y'
openterminal_activate=: 3 : 'cx_project_openterminal__locEdit y'
projectbuild_activate=: 3 : 'cx_project_build__locEdit y'
projectclose_activate=: 3 : 'cx_project_close__locEdit y'
projectlast_activate=: 3 : 'cx_project_last__locEdit y'
projectnew_activate=: 3 : 'make_project_new__locEdit y'
projectopen_activate=: 3 : 'cx_project_open__locEdit y'
projectprops_activate=: 3 : 'cx_project_props__locEdit y'
projectrun_activate=: 3 : 'cx_project_run__locEdit y'
runall_activate=: 3 : 'cx_run_all__locEdit y'
runclip_activate=: 3 : 'cx_run_clip y'
rundebug_activate=: 3 : 'cx_run_debug__locTerm$0'
runline_activate=: 3 : 'cx_run_line__locEdit y'
runlineadvance_activate=: 3 : 'cx_run_line_advance__locEdit y'
runscript_activate=: 3 : 'cx_load_script__locEdit y'
runselect_activate=: 3 : 'cx_run_select__locEdit y'
snapcompare_activate=: 3 : 'cx_project_snapcompare__locEdit y'
snapmake_activate=: 3 : 'cx_project_snapmake__locEdit y'
toexportscript_activate=: 3 : 'export__locEdit y'
toformatscript_activate=: 3 : 'lint__locEdit y'
toglobals_activate=: 3 : 'globals__locEdit y'
toolsdirm_activate=: 3 : '1[dmrun_jgtkdirm_ ''std'''
toolsfilesnaplist_activate=: 3 : 'smoutput pic_list_jp_$0'
toolsfkeys_activate=: 3 : 'fkey_list_jgtkide_$0'
tosellower_activate=: 3 : 'select_text__locEdit ''lower'''
toselminus_activate=: 3 : 'select_line__locEdit ''minus'''
toselplus_activate=: 3 : 'select_line__locEdit ''plus'''
toselplusline1_activate=: 3 : 'select_line__locEdit ''plusline1'''
toselplusline2_activate=: 3 : 'select_line__locEdit ''plusline2'''
toselsort_activate=: 3 : 'select_line__locEdit ''sort'''
toseltoggle_activate=: 3 : 'select_text__locEdit ''toggle'''
toselupper_activate=: 3 : 'select_text__locEdit ''upper'''
toselwrap_activate=: 3 : 'select_text__locEdit ''wrap'''
winclosex_activate=: 3 : 'window_closex__locEdit$0'
windup_activate=: 3 : 'window_dup__locEdit$0'
winnew_activate=: 3 : 'window_new__locEdit$0'
winproj_activate=: 3 : 'window_project__locEdit$0'
winscripts_activate=: 3 : 'window_scripts__locEdit$0'
winsource_activate=: 3 : 'window_source__locEdit$0'
wintext_activate=: 3 : 'window_text__locEdit$0'
winthrow_activate=: 3 : 'window_throw__locEdit$0'

create_menu_popup_gotodef=: popup_gotodef
create_menu_popup_gototag=: popup_gototag
cb_filer_recent_open=: 3 : 0
ndx=. {:y
fn=. 'cb_filer_recent_open_',(>coname''),'_'
ndx=. ndx - cbregs_jgtk_ i. <fn
if. 0=window__locEdit do. proj_close__locEdit'' end.
edit_opentab_show__locEdit ndx pick RecentFiles_j_
1
)
cb_project_recent=: 3 : 0
if. -.proj_closeok__locEdit'' do. 0 return. end.
ndx=. {:y
fn=. 'cb_project_recent_',(>coname''),'_'
ndx=. ndx - cbregs_jgtk_ i. <fn
proj_open__locEdit ndx pick RecentProjects_j_
1
)
clipcopy_activate=: 3 : 0
if. 0=buf=. getcurrentbuf'' do. 1 return. end.
gtk_text_buffer_copy_clipboard buf,gtk_clipboard_get 0
1
)
clipcut_activate=: 3 : 0
if. 0=buf=. getcurrentbuf'' do. 1 return. end.
gtk_text_buffer_cut_clipboard buf,(gtk_clipboard_get 0),1
1
)
clippaste_activate=: 3 : 0
if. 0=buf=. getcurrentbuf'' do. 1 return. end.
gtk_text_buffer_paste_clipboard buf,(gtk_clipboard_get 0),0 1
1
)
editfiw_activate=: 3 : 0
if. Class -: 'term' do.
  cx_edit_fiw__locTerm, y
else.
  cx_edit_fiw__locEdit y
end.
1
)
cx_edit_fiw=: 3 : 0
sel=. getselection''
if. #sel do.
  pos=. 1 pick bufget pSB
  bufsetselect pSB,pos,0
end.
fiw sel
1
)
editfont_activate=: 3 : 0
r=. fontdialog (gettext 'Session Font');FixFont
if. #r do. setfontall r end.
1
)
edittag_activate=: 3 : 0
if. 0= #name=. getselection'' do.
  if. 0= #name=. getcurrentname'' do.
    0 return.
  end.
end.
tag name
1
)
editccp_activate=: 3 : 0
if. ccp_query'' do. 1 return. end.
ccp_new _1
1
)
editacp_activate=: 3 : 0
autoCp=: -. autoCp
1
)
gitgui_activate=: 3 : 0
gitgui_jp_''
1
)
gitstatus_activate=: 3 : 0
gitstatus_jp_''
1
)
editsidebar_activate=: 3 : 0
sbShow=: -. sbShow
showsidebar''
1
)
fileload_activate=: 3 : 0
if. 0<#EditTabs__locEdit do.
  cx_load_script__locEdit''
end.
1
)
fileprint_activate=: 3 : 0
if. locEdit=coname'' do.
  cx_file_print__locEdit''
else.
  cx_file_print__locTerm''
end.
0
)
filequit_activate=: 3 : 0
if. locEdit=coname'' do.
  edit_hide''
else.
  term_close''
end.
0
)
filerecent_activate_open=: 3 : 0
ndx=. {:y
fn=. 'filerecent_activate_open_',(>coname''),'_'
ndx=. ndx - cbregs_jgtk_ i. <fn
if. 0=window__locEdit do. proj_close__locEdit'' end.
edit_opentab_show__locEdit ndx pick RecentFiles_j_
1
)
svncompare_activate=: 3 : 0
smoutput 'svn compare'
1
)
svnstatus_activate=: 3 : 0
smoutput 'svn status'
1
)
testrun_activate=: 3 : 0
if. Class-:'edit' do.
  edit_current_def''
  f=. pFL
else.
  f=. ''
end.
cx_test_run__locTerm f
1
)
tofilesnaps_activate=: 3 : 0
if. EditPage>:0 do.
  edit_current_def''
  pFL conew 'jgtkfilem'
end.
1
)
toolsjtags_activate=: 3 : 0
if. fexist jpath '~addons/general/jtags/jtags.ijs' do.
  require 'jtags ~addons/general/jtags/jtags.ijs'
  mbinfo 'jtags';(gettext 'This may take several minutes to finish')
  jtags''
  mbinfo 'jtags';(gettext 'Done')
else.
  mbinfo 'jtags';(gettext 'Please install addons general/jtags to run')
end.
0
)
toolslabsadvance_activate=: 3 : 0
if. (<'jlab')e.conl 0 do. labnext_jlab_'' end.
0
)
toolspacman_activate=: 3 : 0
require 'pacman ~addons/ide/gtk/pacman.ijs'
'' conew 'jpacman'
1
)
viewlinenos_activate=: 3 : 0
if. locTerm=coname'' do.
  viewlinenumbers termSV,-.viewlinenumbers termSV
else.
  LineNos_jgtkide_=: -.LineNos_jgtkide_
  edit_current_def''
  if. EditPage>:0 do.
    viewlinenumbers"1 (page_svs''),.LineNos_jgtkide_
  end.
end.
1
)
launch_menu=: 3 : 0
if. 0 = #Launch do. return. end.
create_menu_sep y
r=. y ccmenu 'toolslaunch'
m=. I. 0 < # &> {:"1 Launch
cb=. 'cb_launch_run'
n=. #cbregs_jgtk_
cbregs_jgtk_=: cbregs_jgtk_, (#m)#<cb,'_',(>coname''),'_'
con=. gtk_menu_new''
for_d. {."1 Launch do.
  if. d_index e. m do.
    create_menu_sub con;cb;(n+m i. d_index);d
  else.
    create_menu_sep con
  end.
end.
gtk_menu_item_set_submenu r,con
)
cb_launch_run=: 3 : 0
ndx=. 1{y
ndx=. ndx - cbregs_jgtk_ i. ndx{cbregs_jgtk_
ndx=. ndx { I. 0 < # &> {:"1 Launch
load (<ndx;1){Launch
)
Menus=: fixNB_jp_ 0 : 0
cfgall,,Open All,,Open All,cfg_all_activate
cfgbase,,Base,,Base,cfg_base_activate
cfgdirmatch,,Directory Match,,Directory Match,cfg_dirmatch_activate
cfgfkeys,,Function Keys,,Function Keys,cfg_fkeys_activate
cfgfolders,,Folders,,Folders,cfg_folders_activate
cfggtkide,,Gtk Ide,,Gtk Ide,cfg_gtkide_activate
cfglaunch,,Launch Pad,,Launch,cfg_launch_activate
cfgpacman,,Pacman,,Pacman,cfg_pacman_activate
cfgprofile,,Profile Script,,Profile Script,cfg_profile_activate
cfgstartup,,Startup Script,,Startup Script,cfg_startup_activate

clearterm,gtk-execute,Clear Terminal,csT,Clear Terminal,clearterm_activate

clipcopy,gtk-copy,_Copy,cC,Copy,clipcopy_activate
clipcut,gtk-cut,Cu_t,cX,Cut,clipcut_activate
clippaste,gtk-paste,_Paste,cV,Paste,clippaste_activate

editascii,,_Toggle Ascii Box Drawing,,Toggle Ascii Box Drawing,editascii_activate
editconfig,,Configure,,Configure,
editfif,gtk-find,_Find in Files,csF,Find in Files,editfif_activate
editfiw,gtk-find,_Find,cF,Find,editfiw_activate
edittag,gtk-find,Find _Tag,c],Find Tag,edittag_activate
editccp,gtk-find,Code Completion,c[,Code Completion,editccp_activate
editacp,check0,Auto Completion,cU,Auto Completion,editacp_activate
editfont,gtk-select-font,_Session Font,,Set Session Font,editfont_activate
editinputlog,gtk-index,_Input Log,cD,Input Log,editinputlog_activate
editsidebar,check1,_Sidebar,cB,Sidebar,editsidebar_activate

fileclose,gtk-close,_Close,cW,Close window,fileclose_activate
filecloseall,gtk-close,C_lose All,,Close all windows,filecloseall_activate
filecloseother,gtk-close,C_lose Other,csW,Close other open documents,filecloseother_activate
filedelete,gtk-delete,_Delete,,Delete file,filedelete_activate
fileload,gtk-execute,_Load,cL,Load a script,fileload_activate
fileloadd,gtk-execute,_Load Display,cL,Load a script,fileloadd_activate
filenew,gtk-new,_New,,Create new script,filenew_activate
filenewtemp,gtk-new,_New temp,cN,Create a new temp script,filenewtemp_activate
fileopen,gtk-open,_Open,,Open a script,fileopen_activate
fileopensystem,gtk-open,_Open system,,Open a temp script,fileopensystem_activate
fileopentemp,gtk-open,_Open temp,cO,Open a temp script,fileopentemp_activate
fileopenuser,gtk-open,_Open user,,Open a user script,fileopenuser_activate
fileprint,gtk-print,_Print,,Print,fileprint_activate
filequit,gtk-quit,_Quit,cQ,Quit the program,filequit_activate
filerecent,,Recent,cG,Recent scripts,filerecent_activate
filerestore,,Restore,,Restore to Saved,filerestore_activate
filerun,gtk-execute,_Run,,Run a script,fileload_activate
filerund,gtk-execute,_Run Display,,Run script with display,fileloadd_activate
filesave,gtk-save,_Save,cS,Save,filesave_activate
filesaveall,gtk-save,_Save A_ll,csS,Save All,filesaveall_activate
filesaveas,gtk-save-as,Save _As,,Save As,filesaveas_activate

gitgui,,Git Gui,,Git Gui,gitgui_activate
gitstatus,,Git Status,,Git Status,gitstatus_activate

gotodef,gtk-open,Find _Definition,,Find Definition,create_menu_popup_gotodef
gototag,gtk-find,Find _Tag,,Find Tag,create_menu_popup_gototag

help,,_Help,,Help,helphelp_activate
helpabout,gtk-about,_About,,Help About,helpabout_activate
helpconstants,,Constants,,Constants,helpconstants_activate
helpcontext,,_Context Sensitive,cF1,Context Sensitive,helpcontext_activate
helpcontrols,,Control _Structures,,Control Structures,helpcontrols_activate
helpdictionary,,_Dictionary,,Dictionary,helpdictionary_activate
helpforeigns,,_Foreign Conjunction,,Foreign Conjunction,helpforeigns_activate
helpgeneral,,_General Info,,General Info,helpgeneral_activate
helpgtkapi,,GTK,,Helpgtkapi,
helpgtkide,,GTK IDE,,Helpgtkide,helpgtkide_activate
helprelease,,Release Highlights,,Release Highlights,helprelease_activate
helprelnotes,,Release _Notes,,Release _Notes,helprelnotes_activate
helpvocab,,Vocabulary,F1,Vocabulary,helpvocab_activate

helpcairo,,Cairo,,Cairo,helpcairo_activate
helpcairodocumentation,,On-line Cairo Documentation,,On-line Cairo Documentation,helpcairodocumentation_activate
helpgdk,,GDK,,GDK,helpgdk_activate
helpgdkpixbuf,,GDK Pixbuf,,GDK Pixbuf,helpgdkpixbuf_activate
helpgio,,GIO,,GIO,helpgio_activate
helpglib,,GLib,,GLib,helpglib_activate
helpgobject,,GObject,,GObject,helpgobject_activate
helpgtk,,GTK,,GTK,helpgtk_activate
helpgtkdocumentation,,On-line GTK Documentation,,On-line GTK Documentation,helpgtkdocumentation_activate
helpgtksourceview,,GtkSourceView,,GtkSourceView,helpgtksourceview_activate
helpgtktutorial,,GTK Tutorial,,Gtk Tutorial,helpgtktutorial_activate
helppango,,Pango,,Pango,helppango_activate

interrupt,,j console,,j console,interrupt

load_script,,_Load Script,cL,Load Script,runscript_activate

openedit,,Editor,cM,Editor,openedit_activate
openterm,,Terminal,cT,Terminal,openterm_activate
openterminal,,Open in Terminal,,Open in Terminal,openterminal_activate
openview,,Viewer,cK,Viewer,openview_activate

projectbuild,gtk-execute,_Build,cF9,Build Project,projectbuild_activate
projectclose,gtk-close,Close,,Close Project,projectclose_activate
projectlast,gtk-open,Open _Last,,Open Last Project,projectlast_activate
projectnew,gtk-new,New,,Create New Project,projectnew_activate
projectopen,gtk-open,Open,,Open Project,projectopen_activate
projectprops,gtk-properties,Properties,,Project Properties,projectprops_activate
projectrun,gtk-execute,_Run,F9,Run Project,projectrun_activate

runalllines,,All Lines,csR,All Lines,runall_activate
runclip,,_Clipboard,F8,Clipboard,runclip_activate
rundebug,,_Debug...,cK,Debug,rundebug_activate
runline,,_Line,cReturn,Line,runline_activate
runlineadvance,,Line and _Advance,cR,Line Advance,runlineadvance_activate
runproject,gtk-execute,_Run Project,F9,Run Project,projectrun_activate
runscript,,_Load Script,cL,Load Script,runscript_activate
runselect,,Run S_election,cE,Run Selection,runselect_activate
runtest,gtk-execute,_Test,F5,Run test verb,testrun_activate

snapcompare,,Project Snapshots,,Compare Project Snapshots,snapcompare_activate
snapmake,,Make Snapshot,,Make Snapshot,snapmake_activate

svncompare,,Compare SVN...,,Compare SVN,svncompare_activate
svnstatus,,Status SVN...,,Status SVN,svnstatus_activate

toexport,'',_Export,,Export Script,toexportscript_activate
tofilesnaps,'',_Script Snapshots,,Script Snapshots,tofilesnaps_activate
toglobals,'',_Global Assignments,,Global Assignments in File,toglobals_activate
tolint,'',_Format,csP,Format Script,toformatscript_activate
toselection,,Selection,,Selection,
tosellower,'',_Lower Case,,Lower Case,tosellower_activate
toselminus,'',_Remove nb.,csB,Remove nb.,toselminus_activate
toselplus,'',_Add nb.,csN,Add nb.,toselplus_activate
toselplusline1,'',_Add nb. ---,csK,Add nb. ---,toselplusline1_activate
toselplusline2,'',_Add nb. ===,csL,Add nb. ===,toselplusline2_activate
toselsort,'',_Sort,,Sort,toselsort_activate
toseltoggle,'',_Toggle Case,,Toggle Case,toseltoggle_activate
toselupper,'',_Upper Case,,Upper Case,toselupper_activate
toselwrap,'',_Wrap,,Wrap,toselwrap_activate

toolsdirm,,_Directory Match,,Directory Match,toolsdirm_activate
toolsfkeys,,Function Keys,,Function Keys,toolsfkeys_activate
toolsjtags,,Generate _Tags,,Generate Tags,toolsjtags_activate
toolspacman,,_Package Manager,,Package Manager,toolspacman_activate
toolslaunch,,Launch Pad,,Launch Pad,
toolsstudio,,Studio,,Studio,

viewlinenos,,Toggle Line _Numbers,,Toggle Line Numbers,viewlinenos_activate

winclosex,,_Close non-Project Files,,Close non-Project Files,winclosex_activate
windup,,_Duplicate Window,,Duplicate Edit Window,windup_activate
winnew,,_Other Window,csM,Other Edit Window,winnew_activate
winproj,,_Switch to Project at Tab,,Switch to Project at Tab,winproj_activate
winscripts,,Open All Scri_pts,,Open All Scripts,winscripts_activate
winsource,,Open All _Source,,Open All Source,winsource_activate
wintext,,Open All Te_xt,,Open All Text,wintext_activate
winthrow,,_Throw Tab,,Throw Tab to other Window,winthrow_activate
)
edit_menu=: 3 : 0
mb=. create_menu_bar''
file_menu mb
editx_menu mb;'edit'
view_menu mb;'edit'
run_menu mb
tools_menu mb
script_menu mb
project_menu mb
window_menu mb
help_menu mb
gtk_widget_show_all mb
widgetshow mnGit;0
mb
)
term_menu=: 3 : 0
mb=. create_menu_bar''
pop=. create_menu_popup mb;'_File'
con=. create_menu_container pop
con ccmenu 'filenewtemp'
create_menu_sep con
con ccmenu 'fileopentemp'
con ccmenu 'fileopenuser'
con ccmenu 'fileopensystem'
create_menu_sep con
con ccmenu 'filerecent'
if. IFSV do.
  create_menu_sep con
  con ccmenu 'fileprint'
end.
create_menu_sep con
con ccmenu 'filequit'
editx_menu mb;'term'
viewx_menu mb;'term'
runx_menu mb
tools_menu mb
projectx_menu mb
help_menu mb
gtk_widget_show_all mb
mb
)
editx_menu=: 3 : 0
'm s'=. 2 {. y
pop=. create_menu_popup m;(gettext '_Edit')
con=. create_menu_container pop
con ccmenu 'clipcut'
con ccmenu 'clipcopy'
con ccmenu 'clippaste'
create_menu_sep con
con ccmenu 'editfiw'
con ccmenu 'editfif'
if. s-:'edit' do.
  create_menu_sep con
  con ccmenu 'edittag'
  con ccmenu 'editccp'
  mnAutoCp=: con ccmenu 'editacp'
end.
if. s-:'edit' do.
  create_menu_sep con
  r=. con ccmenu 'toselection'
  gtk_menu_item_set_submenu r,selection_menu''
end.
create_menu_sep con
con ccmenu 'editfont'
r=. con ccmenu 'editconfig'
gtk_menu_item_set_submenu r,config_menu''
con
)
file_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_File')
con=. create_menu_container pop
con ccmenu 'filenew'
con ccmenu 'fileopen'
create_menu_sep con
con ccmenu 'filenewtemp'
con ccmenu 'fileopentemp'
create_menu_sep con
con ccmenu 'filerecent'
create_menu_sep con
con ccmenu 'filesave'
con ccmenu 'filesaveas'
con ccmenu 'filesaveall'
if. IFSV do.
  create_menu_sep con
  con ccmenu 'fileprint'
end.
create_menu_sep con
con ccmenu 'fileclose'
con ccmenu 'filecloseother'
con ccmenu 'filecloseall'
create_menu_sep con
con ccmenu 'filedelete'
create_menu_sep con
con ccmenu 'filequit'
)
gtkapi_menu=: 3 : 0
con=. gtk_menu_new''
m=. (<'help') ,&.> ;:'gtktutorial'
con&ccmenu &.> m
create_menu_sep con
m=. (<'help') ,&.> ;:'gtk gdk gdkpixbuf glib gobject gio pango gtksourceview'
con&ccmenu &.> m
create_menu_sep con
m=. (<'help') ,&.> ;:'cairo'
con&ccmenu &.> m
create_menu_sep con
m=. (<'help') ,&.> ;:'gtkdocumentation cairodocumentation'
con&ccmenu &.> m
con
)
help_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Help')
con=. create_menu_container pop
con ccmenu 'help'
create_menu_sep con
con ccmenu 'helpgeneral'
con ccmenu 'helprelease'
create_menu_sep con
con ccmenu 'helpvocab'
con ccmenu 'helpconstants'
con ccmenu 'helpcontrols'
con ccmenu 'helpforeigns'
create_menu_sep con
con ccmenu 'helprelnotes'
con ccmenu 'helpdictionary'
studio_menu con
create_menu_sep con
con ccmenu 'helpgtkide'
create_menu_sep con
r=. con ccmenu 'helpgtkapi'
gtk_menu_item_set_submenu r,gtkapi_menu''
create_menu_sep con
con ccmenu 'helpcontext'
create_menu_sep con
con ccmenu 'helpabout'
)
project_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Project')
con=. create_menu_container pop
con ccmenu 'projectnew'
con ccmenu 'projectopen'
con ccmenu 'projectlast'
create_menu_sep con
r=. con ccmenu 'projectclose'
create_menu_sep con
r=. r,con ccmenu 'projectrun'
r=. r,con ccmenu 'projectbuild'
create_menu_sep con
r=. r,con ccmenu 'projectprops'
create_menu_sep con
r=. r,con ccmenu 'snapcompare'
r=. r,con ccmenu 'snapmake'
s=. create_menu_sep con
s=. s,con ccmenu 'gitgui'
mnGit=: s,con ccmenu 'gitstatus'
r=. r,}.mnGit
s=. create_menu_sep con
s=. s,con ccmenu 'svncompare'
mnSVN=: s,con ccmenu 'svnstatus'
r=. r,}.mnSVN
create_menu_sep con
r=. r,con ccmenu 'openterminal'
mnProjectEnable=: mnProjectEnable,r
)
projectx_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Project')
con=. create_menu_container pop
con ccmenu 'projectnew'
con ccmenu 'projectopen'
mnProjectEnable=: mnProjectEnable,con ccmenu 'projectclose'
)
run_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Run')
con=. create_menu_container pop
con ccmenu 'runline'
con ccmenu 'runlineadvance'
con ccmenu 'runselect'
con ccmenu 'runalllines'
create_menu_sep con
con ccmenu 'runclip'
create_menu_sep con
con ccmenu 'load_script'
create_menu_sep con
con ccmenu 'runtest'
mnProjectEnable=: con ccmenu 'runproject'
launch_menu con
)
runx_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Run')
con=. create_menu_container pop
con ccmenu 'runclip'
create_menu_sep con
con ccmenu 'runtest'
mnProjectEnable=: con ccmenu 'runproject'
launch_menu con
)
script_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Script')
con=. create_menu_container pop
r=. ''
r=. r,con ccmenu 'tolint'
create_menu_sep con
r=. r,con ccmenu 'filerestore'
create_menu_sep con
r=. r,con ccmenu 'tofilesnaps'
create_menu_sep con
r=. r,con ccmenu 'toglobals'
mnScriptEnable=: r
)
selection_menu=: 3 : 0
con=. gtk_menu_new''
con ccmenu 'toselminus'
con ccmenu 'toselplus'
con ccmenu 'toselplusline1'
con ccmenu 'toselplusline2'
create_menu_sep con
con ccmenu 'tosellower'
con ccmenu 'toselupper'
con ccmenu 'toseltoggle'
create_menu_sep con
con ccmenu 'toselsort'
create_menu_sep con
con ccmenu 'toselwrap'
con
)
tools_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Tools')
con=. create_menu_container pop
con ccmenu 'toolsdirm'
create_menu_sep con
con ccmenu 'toolspacman'
create_menu_sep con
con ccmenu 'toolsjtags'
create_menu_sep con
con ccmenu 'toolsfkeys'
con
)
view_menu=: 3 : 0
'mb asc'=. y
pop=. create_menu_popup mb;(gettext '_View')
con=. create_menu_container pop
con ccmenu 'editinputlog'
create_menu_sep con
mnSideBar=: con ccmenu 'editsidebar'
con ccmenu 'openterm'
create_menu_sep con
con ccmenu 'clearterm'
create_menu_sep con
if. asc do. con ccmenu 'editascii' end.
if. IFSV do. con ccmenu 'viewlinenos' end.
)
viewx_menu=: 3 : 0
'mb asc'=. y
pop=. create_menu_popup mb;(gettext '_View')
con=. create_menu_container pop
con ccmenu 'editinputlog'
create_menu_sep con
con ccmenu 'openedit'
create_menu_sep con
con ccmenu 'clearterm'
create_menu_sep con
if. asc do. con ccmenu 'editascii' end.
if. IFSV do. con ccmenu 'viewlinenos' end.
)
window_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Window')
con=. create_menu_container pop
con ccmenu 'winnew'
con ccmenu 'windup'
create_menu_sep con
con ccmenu 'winthrow'
create_menu_sep con
con ccmenu 'winproj'
create_menu_sep con
con ccmenu 'winsource'
con ccmenu 'winscripts'
con ccmenu 'wintext'
create_menu_sep con
con ccmenu 'winclosex'
)
submenu=: 3 : 0
'cb len val hnd'=. y
t=. <cb,'_',(>coname''),'_'
if. len<0 do.
  n=. 0 >. (#val) - +/ cbregs_jgtk_ = t
  cbregs_jgtk_=: cbregs_jgtk_, n#t
else.
  cbregs_jgtk_=: cbregs_jgtk_, (len * -. t e. cbregs_jgtk_)#t
end.
n=. cbregs_jgtk_ i. t
sub=. gtk_menu_new''
for_d. val do.
  create_menu_sub sub;cb;(n+d_index);d
end.
gtk_menu_item_set_submenu hnd,sub
setenable hnd,0<#val
gtk_widget_show_all sub
)
popup_init=: 3 : 0
ccp_destroy''
menu=. 1{y
c=. get_glist gtk_container_get_children menu
for_w. _2 {. c do.
  gtk_container_remove menu,w
end.
w=. menu ccmenu 'gotodef'
w=. menu ccmenu 'gototag'
gtk_widget_show_all menu
0
)
popup_gotodef=: 3 : 0
gotodef bufreadselect getcurrentbuf''
)
popup_gototag=: 3 : 0
if. 0= #name=. getselection'' do.
  if. 0= #name=. getcurrentname'' do.
    0 return.
  end.
end.
gototag name
0
)
studio_menu=: 3 : 0
if. 0 = #Studio do. return. end.
create_menu_sep y
r=. y ccmenu 'toolsstudio'
m=. I. 0 < # &> {:"1 Studio
cb=. 'cb_studio_run'
n=. #cbregs_jgtk_
cbregs_jgtk_=: cbregs_jgtk_, (#m)#<cb,'_',(>coname''),'_'
con=. gtk_menu_new''
for_d. {."1 Studio do.
  if. d_index e. m do.
    create_menu_sub con;cb;(n+m i. d_index);d
  else.
    create_menu_sep con
  end.
end.
gtk_menu_item_set_submenu r,con
)
cb_studio_run=: 3 : 0
ndx=. 1{y
ndx=. ndx - cbregs_jgtk_ i. ndx{cbregs_jgtk_
ndx=. ndx { I. 0 < # &> {:"1 Studio
load (<ndx;1){Studio
)
coclass 'jgtkedit'
make_script_new=: 4 : 0
if. -. fexist x,y do.
  (DefCmt,(extnone_j_ y),LF2) fwrite x,y
end.
)
make_project_new=: 3 : 0
parent=. tofoldername_j_ fpath_j_ ProjectPath_jp_
r=. newproject_jgtkdialog_ termsep parent
if. 0=#r do. 1 return. end.
'path other build run init'=. r
p=. path2proj_j_ path
if. -.proj_closeok'' do. 1 return. end.
projwritenew_jp_ p
f=. (build,run,init)#;:'build run init'
f=. f, cutopen other
if. #f do.
  f=. sort ~. extsrc each f
  (<path,'/') make_script_new each f
  f=. f -. ('build';'run') ,each <ScriptExt
end.
proj_open__locEdit p
if. #f do.
  Source_jp_=: (<path,'/') ,each f
  (;LF,~each projsname each Source) fappends Project
  tab_open__locEdit |. fexists Source_jp_
end.
1
)
cx_project_props=: 3 : '1[edit_opentab_show Project_jp_'
cx_project_build=: 3 : 0
if. 0=#Build_jp_ do.
  mbinfo (gettext 'Project Build');(gettext 'First set the project build script.')
  1 return.
end.
if. -.fexist jpath Build_jp_ do.
  mbinfo (gettext 'Project Build');(gettext 'Project build script not found:'),LF2,Build_jp_
  1 return.
end.
if. 1 tab_saveall'' do.
  term_load_script__locTerm Build_jp_
end.
1
)
cx_project_close=: 3 : 0
proj_closeok''
tab_refresh''
1
)
cx_project_last=: 3 : 0
ndx=. (0 ~: window__locEdit) *. 0 < #Project_jp_
if. ndx < #RecentProjects_j_ do.
  if. proj_closeok'' do.
    proj_open ndx pick RecentProjects_j_
  end.
end.
1
)
cx_project_open=: 3 : 0
'' conew 'jgtkpsel'
1
)
cx_project_openterminal=: 3 : 0
if. 0=#ProjectPath_jp_ do. return. end.
if. -.IFUNIX do.
  smoutput (gettext 'not yet in windows') return.
end.
term=. Terminal_jgtkide_
if. 0=#term do.
  mbinfo (gettext 'Terminal');gettext 'Terminal not defined in gtkide configuration.'
  1 return.
end.
ndx=. 1 i.~ '%1' E. term
2!:1 (ndx{.term),ProjectPath_jp_,(ndx+2)}.term
0
)
cx_project_run=: 3 : 0
if. 0=#Run_jp_ do.
  mbinfo (gettext 'Project Run');(gettext 'No project run script.')
  1 return.
end.
if. -.fexist jpath Run_jp_ do.
  f=. toprojectfolder_jp_ Run_jp_
  mbinfo (gettext 'Project Run');(gettext 'Project run script not found:'),LF2,f
  1 return.
end.
if. 1 tab_saveall'' do.
  if. fexist jpath Build_jp_ do.
    loadscript Build_jp_
  end.
  term_load_script__locTerm Run_jp_
end.
1
)
cx_project_snapcompare=: 3 : 0
p=. ProjectName_jp_
if. 0=#p do.
  mbinfo (gettext 'Compare Snapshots');(gettext 'First open a project.')
  1 return.
end.
if. 0=#ss_list_jp_ p do.
  mbinfo (gettext 'Compare Snapshots');(gettext 'No snapshots for this project.')
  1 return.
end.
dmrun_jgtkdirm_ 'snp'
)
cx_project_snapmake=: 3 : 'snapshot_jp_ 1'
proj_close=: 3 : 0
projclose_jp_''
conf_save''
proj_menu_enable 0
)
proj_closeok=: 3 : 0
if. 0=#Project_jp_ do. 1 return. end.
if. window__locEdit do.
  if. -.0 tab_saveall'' do. 0 return. end.
  projsaveopen''
  tab_closeall__locEdit''
end.
proj_close''
1
)
proj_fini=: 3 : 0
sbfiles_open_folder ProjectPath_jp_
widgetshow mnGit;gitcheck_jp_''
widgetshow mnSVN;0 
proj_menu_enable 1
)
proj_open=: 3 : 0
if. -. proj_closeok'' do. 0 return. end.
noevents 1
edit_show''
projopen_jp_ y
conf_save''
sidebar_set_page 0
if. -. fexist Project_jp_ do.
  EditPage=: _1
  proj_menu_enable 0
  script_menu_enable''
  noevents 0
  sidebar_refresh''
  0 return.
end.
proj_openfiles''
proj_fini''
gtk_widget_show_all EditNB__locEdit
noevents 0
sidebar_refresh''
1
)
proj_openfiles=: 3 : 0
edit_openfiles projgetopen''
)
PJdef=: PPdef=: i.0 2

PJnames=: <;._2 (0 : 0)
Folder
FolderIds
FolderTree
)

PPnames=: <;._2 (0 : 0)
Project
ProjectPath
ProjectName
Build
Run
Source
)
ppack=: 3 : 0
PJdef=: pack_j_ PJnames
PPdef=: pack_jp_ PPnames
EMPTY
)
ppdef=: 3 : 0
pdef_j_ PJdef
pdef_jp_ PPdef
)
projgetopen=: 3 : 0
ndx=. ({.&>ProjOpen) i. <getprojname''
if. ndx<#ProjOpen do.
  dat=. ndx pick ProjOpen
  open=. (#~ fexist) projfname each 2 }. dat
  page=. (<: #open) <. 0 ". 1 pick dat
else.
  open=. ''
  page=. _1
end.
open;page
)
projreadopen=: 3 : 0
ProjOpen_jp_=: ''
dat=. 'b' freads ProjectDat
if. dat -: _1 do. return. end.
dat=. a: -.~ deb each dat
dat=. dat #~ (<'NB.') ~: 3 {.each dat
if. 0=#dat do. return. end.
sep=. {. 0 pick dat
dat=. (-sep={:&>dat) }.each dat
ProjOpen_jp_=: <;._1 each dat
)
projsaveopen=: 3 : 0
f=. 1{"1 EditTabs
open=. projsname each f #~ 0 < #&> f
page=. EditPage <. <:#open
id=. getprojname''
ndx=. ({.&>ProjOpen) i. <id
if. ndx<#ProjOpen do.
  ProjOpen_jp_=: (<<<ndx){ProjOpen
end.
msk=. 0 < #&> 0 pick each ProjOpen
ProjOpen_jp_=: msk # ProjOpen
new=. (<id;(":page);open),ProjOpen
new=. new #~ ~: {.&> new
ProjOpen_jp_=: ((RecentMax<.#){.]) new
sep=. '|!@#$%^&*+-=?~`' -. ;ProjOpen
if. #sep do.
  sep=. {. sep
else.
  sep=. {.(32}.a.) -. ;ProjOpen
end.
p=. ([: ; sep ,each ]) each ProjOpen
txt=. 'NB. gtkide open files',LF2,;p ,each LF
txt fwrites ProjectDat
)
coclass 'jgtkpsel'
coinsert 'jgtkide'

MinSize=: 350 400
Root=: '{root}'
getrecent=: 3 : 0
if. 0=#y do. '' return. end.
r=. touserfolder @ }: @ (0 pick fpathname) each y
a: -.~ ('~'={.&> r) }.each r
)
create=: 3 : 0
coextend COCREATOR

Folders=: 0{"1 UserFolders_j_
Recent=: getrecent RecentProjects_j_

if. (0=#Folders) *. 0=#Recent do.
  projbrowse'' return.
end.

Paths=: jpath each 1{"1 UserFolders_j_
Ids=: (#Folders)#<0
Idx=: (#Folders)#_1

msk=. -. isroot_j_ &> Recent
ndx=. msk * Recent i. &> '/'
Recent2=: (ndx {.each Recent) ,. (ndx+msk) }.each Recent

Predraw=: 0

initsel''
noevents 1
make_psel''
noevents 0
1
)
destroy=: 3 : 0
cbfree''
codestroy''
)
initsel=: 3 : 0
if. #Recent do.
  Rtx=: 0
  Ftx=: Folders index {.{.Recent2
  if. Ftx>:0 do.
    getids Ftx
    t=. Ftx pick Ids
    ndx=. t index {:{.Recent2
    Idx=: ndx Ftx} Idx
  end.
else.
  Rtx=: _1
  Ftx=: 0 >. Folders index <Folder_j_
  getids Ftx
  t=. Ftx pick Ids
  ndx=. t index <ProjectPath_jp_,'/'
  Idx=: ndx Ftx} Idx
end.
)
getids=: 3 : 0
if. 0 -: y pick Ids do.
  ndx=. _1
  p=. 1 pick getfolderdefs_j_ y pick Paths
  p=. (<Root) (I.p=<'')} p
  Ids=: (<p) y} Ids
  if. (0<#p) *. 0<#Recent2 do.
    ind=. ({."1 Recent2) i. Ftx{Folders
    if. ind < #Recent2 do.
      ndx=. p index {:ind{Recent2
    end.
  end.
  if. 1=#p do. ndx=. 0 end.
  Idx=: ndx Ftx} Idx
end.
EMPTY
)
getrecentx=: 3 : 0
ndx=. Ftx{Idx
if. (ndx<0) +. Ftx<0 do.
  Rtx=: _1
else.
  Rtx=: Recent2 index (Ftx{Folders),ndx{Ftx pick Ids
end.
)
predraw=: 3 : 0
if. -. Predraw do. return. end.
if. Ftx<0 do. return. end.
getids Ftx
nms=. Ftx pick Ids
setlistbox Ptv;nms;Ftx{Idx
Predraw=: 0
)
projbrowse=: 3 : 0
r=. dialog 'file_project_open'
if. #r do.
  proj_open__locEdit r
end.
destroy''
)
escape_close=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Escape do. 0 return. end.
'ctrl j shift'=. 2 2 2 #: state
if. ctrl +. shift do. 0 return. end.
projsel_close''
1
)
fsel_cursor_changed=: 3 : 0
if. NoEvents do. 1 return. end.
noevents 1
Ftx=: listbox_getactiverow Ftv
getids Ftx
setlistbox Ptv;(Ftx pick Ids);Ftx{Idx
getrecentx''
listbox_select Rtv,Rtx
noevents 0
1
)
projsel_close=: 3 : 0
readwinpos 'PselPos'
gtk_widget_destroy window
destroy''
1
)
psel_cursor_changed=: 3 : 0
if. NoEvents do. 1 return. end.
noevents 1
row=. listbox_getactiverow Ptv
Idx=: row Ftx} Idx
getrecentx''
listbox_select Rtv,Rtx
noevents 0
1
)
rsel_cursor_changed=: 3 : 0
if. NoEvents do. 1 return. end.
noevents 1
Rtx=: listbox_getactiverow Rtv
Ftx=: Folders index {. Rtx{Recent2
if. Ftx<0 do.
  setlistbox Ptv;''
  Predraw=: 1
else.
  getids Ftx
  setlistbox Ptv;(Ftx pick Ids);Ftx{Idx
  t=. Ftx pick Ids
  ndx=. t index {:Rtx{Recent2
  Idx=: ndx Ftx} Idx
  listbox_select Ftv,Ftx
  listbox_select Ptv,Ftx{Idx
  predraw''
end.
noevents 0
1
)
fsel_row_activated=: psel_row_activated=: rsel_row_activated=: open
fsel_key_press=: psel_key_press=: rsel_key_press=: escape_close
projsel_button=: open
window_delete=: projsel_close
make_psel=: 3 : 0
newwindow (gettext 'select project')
size=. MinSize >. 2 3{PselPos
windowdefaultsize size
gtk_window_set_modal window,1
gtk_window_set_type_hint window,GDK_WINDOW_TYPE_HINT_DIALOG
windowcenter''

vbox=. gtk_vbox_new 0 0
hb=. gtk_hpaned_new''
hp=. gtk_hpaned_new''
vb=. gtk_vbox_new 0 0
Flb=: label=. gtk_label_new <(gettext 'Folder:')
gtk_misc_set_alignment label, 0 0.5
gtk_box_pack_start vb, label, 0 1 3
sw=. newsw''
Ftv=: tv=. makelistbox 'fsel';Folders;Ftx;'';0
gtk_container_add sw,tv
gtk_box_pack_start vb, sw, 1 1 3
gtk_paned_pack1 hp, vb, 1 1
vb=. gtk_vbox_new 0 0
label=. gtk_label_new <(gettext 'Project:')
gtk_misc_set_alignment label, 0 0.5
gtk_box_pack_start vb, label, 0 1 3
sw=. newsw''
if. Ftx<0 do.
  ids=. ''
  idx=. _1
else.
  ids=. Ftx pick Ids
  idx=. Ftx{Idx
end.
Ptv=: tv=. makelistbox 'psel';ids;idx;'';0
gtk_container_add sw,tv
gtk_box_pack_start vb, sw, 1 1 3
gtk_paned_pack2 hp, vb, 1 1

fex=. hp
gtk_paned_pack1 hb, hp, 1 1
hx=. gtk_hbox_new 0 0
vb=. gtk_vbox_new 0 0
label=. gtk_label_new <(gettext 'Recent:')
gtk_misc_set_alignment label, 0 0.5
gtk_box_pack_start vb, label, 0 1 3
sw=. newsw''
Rtv=: tv=. makelistbox 'rsel';Recent;Rtx;'';0
gtk_container_add sw,tv
gtk_box_pack_start vb, sw, 1 1 3
rex=. vb

gtk_paned_pack2 hb, vb, 1 1
gtk_box_pack_start vbox, hb, 1 1 3
hbox=. gtk_hbox_new 0 3
lab=. gtk_label_new <''
gtk_box_pack_start hbox,lab,1 0 0

button=. gtk_button_new''
bbox=. gtk_hbox_new 0 0
image=. gtk_image_new_from_stock 'gtk-open';GTK_ICON_SIZE_BUTTON
label=. gtk_label_new_with_mnemonic <(gettext 'Open')
gtk_box_pack_start bbox, image, 0 0 3
gtk_box_pack_start bbox, label, 0 0 3
gtk_container_add button, bbox
gtk_box_pack_start hbox,button,0 0 3
consig button;'clicked';'projsel_button'
gtk_box_pack_start vbox,hbox,0 0 3
gtk_container_add window,vbox
gtk_paned_set_position hb,<.0.6*{.size
windowfinish''
if. Rtx>:0 do.
  setchildfocus Rtv
else.
  setchildfocus Ftv
end.
if.0=#Folders do.
  gtk_widget_hide fex
elseif. 0=#Recent do.
  gtk_widget_hide rex
end.

)
open=: 3 : 0
if. open1'' do. projsel_close'' else. 1 end.
)
open1=: 3 : 0
r=. open2''
if. 0 -: r do.
  mbinfo (gettext 'select project');(gettext 'No project selected')
  0 return.
end.
if. 0=+/Visible do.
  mod=. 0
  edit_show__locEdit''
else.
  mod=. 1{getmodifiers''
  if. mod do. window_new'' end.
end.
'f p'=. r
n=. (termsep f),p
if. (n -: ProjectName_jp_) *: f -: Folder_j_ do.
  if. -.proj_closeok'' do. 1 return. end.
end.
if. -. f -: Folder_j_ do.
  setfolder_j_ f
end.
edit=. mod{locEdit0,locEdit1
proj_open__edit ppath n
1
)
open2=: 3 : 0
if. Rtx>:0 do.
  Rtx{Recent2 return.
end.
ndx=. Ftx{Idx
if. _1 e. Ftx,ndx do. 0 return. end.
id=. ndx{Ftx pick Ids
if. id -: Root do.
  id=. ''
else.
  (Ftx{Folders),id
end.
)
coclass 'jgtkedit'

SideAss=: ''
SideList=: ''
SidePos=: 0
SideRow=: _1
SideIds=: ''
SideSrc=: ''
SideTabs=: 'sbfiles';'sbsource';'sbdefs'
fv_getfiles=: 3 : 0
d=. fv_getfilelist SidePath,'/*'
e=. (,<'..');''
if. 0=#d do. e return. end.
f=. {."1 d
m=. 'd' = 4 {"1 > 4 {"1 d
ndx=. /: tolower each f
f=. ndx{f
m=. ndx{m
((<'..'),m#f);<(-.m)#f
)
fv_getfilelist=: 3 : 0
d=. 1!:0 y
if. 0=#d do. return. end.
f=. {."1 d
d=. d #~ -. ('~' = {: &> f) +. ({.&> f) e. '.~'
if. 0=#d do. return. end.
d #~ 'h' ~: 1 {"1 > 4 {"1 d
)
sbdefs_init=: 3 : 0
vb=. gtk_vbox_new 0 0
tb=. make_sbdefs_toolbar''
gtk_box_pack_start vb, tb, 0 0 0
sd=. makelistbox 'sbdefs';'';'';'';0
sw=. newsw''
gtk_container_add sw,sd
gtk_box_pack_start vb, sw, 1 1 0
SideDefs=: sd
vb
)

sbdefs_cursor_changed=: 1:
sbdefs_row_activated=: 3 : 0
sbdefs_select listbox_row_activated y
)
sbdefs_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
sbdefs_select listbox_getactiverow w
)
sbdefs_refresh=: 3 : 0
edit_current_def''
if. EditPage<0 do.
  nms=. ''
else.
  nms=. globalassigns bufread page_buf EditPage
  nms=. nms /: (a.,~(97+i.26){a.)&i. each nms
end.
if. -. nms -: SideAss do.
  setlistbox SideDefs;<nms
  SideAss=: nms
  SideRow=: _1
  SidePos=: 0
end.
)
sbdefs_select=: 3 : 0
edit_current_def''
ass=. y pick SideAss
nam=. (ass i. ' ') {. ass
if. (nam -: ass) +. y ~: SideRow do.
  SidePos=: 0
end.
SideRow=: y
txt=. bufread pSB
pos=. sbdefs_select_do nam;SidePos;txt
if. pos = _1 do.
  SidePos=: 0
  mbinfo (gettext 'Not found: '),nam return.
end.
SidePos=: pos + #nam
viewsetselect pSV,pos,#nam
1
)
sbdefs_select_do=: 3 : 0
'nam pos txt'=. y
hit=. nam fiwss_assign_jgtkfiw_ pos }. txt
if. #hit do. pos + {.hit return. end.
{. _1 ,~ nam fiwss_assign_jgtkfiw_ txt
)
fb_activate=: 3 : 0
sidebar_refresh''
1
)
fv_project_path=: 3 : 0
if. #ProjectPath_jp_ do.
  p=. ProjectPath_jp_
else.
  p=. Pathp
end.
assert. 0=nc<'p'
sbfiles_open_folder p
1
)
fv_row_activated=: 3 : 0
'w p c d'=. y
r=. 0 pick gtk_tree_path_get_indices <<p
row=. {. _2 ic memr r,0 4
'dir file'=. SideList
if. row=0 do.
  ftb_go_up''
elseif. row<#dir do.
  sbfiles_open_folder SidePath,'/',row pick dir
elseif. 1 do.
  edit_opentab_show SidePath,'/',(row-#dir) pick file
end.
1
)
ftb_current_path=: 3 : 0
file=. page_file EditPage
if. 0=#file do.
  sidebar_project_path'' return.
end.
sbfiles_open_folder fpath file
)
ftb_go_home=: 3 : 0
sbfiles_open_folder jpath '~home'
)
ftb_go_up=: 3 : 0
SidePath=: (SidePath i: '/') {. SidePath
sidebar_refresh''
)
path_entry_activate=: 3 : 0
p=. getentry sidePathEntry
sp=. jpath p
if. -. isdir sp do.
  sp=. jpath addtilde p
end.
SidePath=: sp
sidebar_refresh''
)
sbfiles_init=: 3 : 0
vb=. gtk_vbox_new 0 0
tb=. make_sbfiles_toolbar''
gtk_box_pack_start vb, tb, 0 0 0
sidePathEntry=: path=. gtk_entry_new''
gtk_box_pack_start vb, path, 0 0 2
consig path;'activate';'path_entry_activate'
fv=. make_fileview''
sw=. newsw''
gtk_container_add sw,fv
gtk_container_add vb,sw
vb
)
sbfiles_clear_filter=: 3 : 0
sidebar_refresh''
)
sbfiles_open_folder=: 3 : 0
SidePath=: y
sidebar_refresh''
)
sbfiles_refresh=: 3 : 0
p=. remtilde toprojectfolder_jp_ SidePath
setentry sidePathEntry;p
fv_refresh''
)
sidebar_init=: 3 : 0
nb=. gtk_notebook_new''
consig4 nb;'switch_page';'sidebar_switch_page'

fs=. sbfiles_init''
lab=. newlabel (gettext 'files')
gtk_notebook_append_page nb,fs,lab

ss=. sbsource_init''
lab=. newlabel (gettext 'source')
gtk_notebook_append_page nb,ss,lab

ds=. sbdefs_init''
lab=. newlabel (gettext 'defs')
gtk_notebook_append_page nb,ds,lab

SidePage=: 0

nb
)
sidebar_refresh=: 3 : 0
if. NoEvents do. 0 return. end.
edit_current_def''
((SidePage pick SideTabs),'_refresh')~''
widgetshow SideTB,0<#ProjectName_jp_
0
)
sidebar_set_page=: 3 : 0
gtk_notebook_set_current_page EditSB,SidePage=: y
sidebar_refresh''
)
sidebar_switch_page=: 3 : 0
if. NoEvents do. 0 return. end.
SidePage=: 2 pick y
sidebar_refresh''
)
sbsource_init=: 3 : 0
vb=. gtk_vbox_new 0 0
tb=. make_sbsource_toolbar''
gtk_box_pack_start vb, tb, 0 0 0
sd=. makelistbox 'sbsource';'';'';'';0
sw=. newsw''
gtk_container_add sw,sd
gtk_box_pack_start vb, sw, 1 1 0
SideLB=: sd
SideTB=: vb
vb
)

sbsource_cursor_changed=: 1:
sbsource_row_activated=: 3 : 0
sbsource_select listbox_row_activated y
)
sbsource_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. key ~: GDK_Return do. 0 return. end.
sbsource_select listbox_getactiverow w
)
sbsource_refresh=: 3 : 0
'nms ids'=. projssource_jp_''
SideSrc=: nms
if. SideIds -: ids do. return. end.
SideIds=: ids
setlistbox SideLB;<ids
)
sbsource_select=: 3 : 0
edit_opentab_show y pick SideSrc
)
make_sbdefs_toolbar=: 3 : 0
tb=. gtk_toolbar_new''
gtk_toolbar_set_icon_size tb, GTK_ICON_SIZE_MENU
gtk_toolbar_set_style tb, GTK_TOOLBAR_ICONS
wid=. gtk_tool_button_new_from_stock <'gtk-refresh'
gtk_widget_set_tooltip_text wid;(gettext 'Refresh')
consig wid;'clicked';'sidebar_refresh'
gtk_container_add tb, wid
tb
)
make_sbfiles_toolbar=: 3 : 0

tb=. gtk_toolbar_new''
gtk_toolbar_set_icon_size tb, GTK_ICON_SIZE_MENU
gtk_toolbar_set_style tb, GTK_TOOLBAR_ICONS

wid=. gtk_tool_button_new_from_stock <'gtk-refresh'
gtk_widget_set_tooltip_text wid;(gettext 'Refresh')
consig wid;'clicked';'sidebar_refresh'
gtk_container_add tb, wid

wid=. gtk_tool_button_new_from_stock <'gtk-home'
gtk_widget_set_tooltip_text wid;(gettext 'Home')
consig wid;'clicked';'ftb_go_home'
gtk_container_add tb, wid

wid=. gtk_tool_button_new_from_stock <'gtk-jump-to'
gtk_widget_set_tooltip_text wid;(gettext 'Set path from document')
consig wid;'clicked';'ftb_current_path'
gtk_container_add tb, wid

tb
)
make_sbsource_toolbar=: 3 : 0
tb=. gtk_toolbar_new''
gtk_toolbar_set_icon_size tb, GTK_ICON_SIZE_MENU
gtk_toolbar_set_style tb, GTK_TOOLBAR_ICONS
wid=. gtk_tool_button_new_from_stock <'gtk-refresh'
gtk_widget_set_tooltip_text wid;(gettext 'Refresh')
consig wid;'clicked';'sidebar_refresh'
gtk_container_add tb, wid
tb
)

fv_clear=: 3 : 0
gtk_list_store_clear SideFS
if. last_dir_iter do.
  gtk_tree_iter_free last_dir_iter
  last_dir_iter = 0
end.
)
fv_refresh=: 3 : 0
if. -. isdir SidePath do.
  SideList=: ''
  gtk_list_store_clear SideFS
  EMPTY return.
end.
df=. fv_getfiles ''
if. df -: SideList do. EMPTY return. end.
SideList=: df
gtk_list_store_clear SideFS
iter=. i.ITERSIZE
for_i. 0 1 do.
  icon=. i pick 'gtk-directory';'gtk-file'
  for_d. i pick df do.
    gtk_list_store_append SideFS;iter
    gtk_list_store_set_3 SideFS;iter;0;icon;1;d,<_1
  end.
end.
EMPTY
)
make_fileview=: 3 : 0
SideFV=: fv=. gtk_tree_view_new''
SideFS=: fs=. gtk_list_store_new_2 2,2#G_TYPE_STRING
gtk_tree_view_set_model fv,fs
g_object_unref fs
icon_renderer=. gtk_cell_renderer_pixbuf_new''
text_renderer=. gtk_cell_renderer_text_new''
column=. gtk_tree_view_column_new ''
gtk_tree_view_column_pack_start column,icon_renderer,0
gtk_tree_view_column_add_attribute column;icon_renderer;'stock-id';0
gtk_tree_view_column_pack_start column,text_renderer,1
gtk_tree_view_column_add_attribute column;text_renderer;'text';1
gtk_tree_view_append_column fv,column
gtk_tree_view_set_headers_visible fv,0
gtk_tree_view_set_enable_search fv,0
select=. gtk_tree_view_get_selection fv
gtk_tree_selection_set_mode select, GTK_SELECTION_MULTIPLE
consig fv;'realize';'fv_project_path'
consig4 fv;'row-activated';'fv_row_activated'
fv
)

coclass 'jgtkterm'
coinsert 'jgtkide j'
create=: 3 : 0
locTerm_jgtkide_=: coname''
Class=: 'term'
ifOutput=: 0
ifResized=: 1
MaxBufLines=: 1000
InputLogDat=: jpath '~config/inputlog.dat'
InputLogMax=: 100
InputLog=: dlog_read''
InputLogPos=: #InputLog
window=: 0
)
destroy=: 3 : 0
cbfree''
codestroy''
)
CheckMoves=: GDK_Home

delmode=: ]
getcmd=: ]
prompt_init=: ]

begin_action=: 3 : 'gtk_text_buffer_begin_user_action termSB'
end_action=: 3 : 'gtk_text_buffer_end_user_action termSB'
bufiterbounds=: 3 : 'y;(newiterstart y);newiterend y'
docmd=: 3 : 0
settermsize''
s=. dltb y
dlog_add s
immex_jgtkide_ s
)

exec=: docmd
fkey_exec=: 3 : 0
'key c s'=. y
ndx=. FKeys i. 1 + (key-GDK_F1) + 100 * 2 #. c,s
if. ndx=#FKeys do. return. end.
fkey_exec_index ndx
)
fkey_exec_index=: 3 : 0
'out lab code'=. y{FKeyx
select. out
case. 0 do.
  promptclear''
  runimmex0 code
case. 1 do.
  promptclear''
  runimmex1 code
case. 2 do.
  promptnew (getprompt''),code
case. 3 do.
  0!:100 code
end.
1
)
getfontsize=: 3 : 0
rect=. i.4
layout=. gtk_widget_create_pango_layout termSV;,'W'
pango_layout_get_pixel_extents layout;0;rect
if. IF64 do.
  Fwh=: |.(0,256^4)#:1{rect
else.
  Fwh=: 2 3{rect
end.
EMPTY
)
getprompt=: 3 : 0
prompt_jgtkide_
)
moveit=: 3 : 0
if. y ~: GDK_Home do. 0 return. end.
mark=. i.ITERSIZE
gtk_text_buffer_get_iter_at_mark termSB;mark;gtk_text_buffer_get_insert termSB
bgn=. newiterline termSB,gtk_text_iter_get_line <mark
p=. readstringfree gtk_text_iter_get_text bgn;mark
viewscrolliter termSV;bgn
if. n=. (#p) | (p=' ')i.0 do.
  gtk_text_iter_forward_chars bgn;n
end.
gtk_text_buffer_place_cursor termSB;bgn
1
)
setmaxbuflines=: 3 : 0
len=. gtk_text_buffer_get_line_count termSB
if. len <: MaxBufLines do. return. end.
bgn=. newiterstart termSB
end=. newiterline termSB,len-MaxBufLines
gtk_text_buffer_delete termSB;bgn;end
)
settermsize=: 3 : 0
if. -.ifResized do. return. end.
settermsize1 0 >. <.(Twh-1) % Fwh
ifResized=: 0
)
settermsize1=: 3 : 0
Cwh_j_=: 0 >. <: y
)
dlog_add=: 3 : 0
if. (0=#y) +. 'NB. ' -: 4 {. y do. return. end.
dlog_add1 y
)
dlog_add1=: 3 : 0
InputLog=: (InputLog-.<y),<y
if. KeepInputLog do.
 (y,LF) 1!:3 ::] <InputLogDat
end.
dlog_max''
)
dlog_max=: 3 : 0
if. InputLogMax < #InputLog do.
  InputLog=: (-InputLogMax){.InputLog
end.
InputLogPos=: #InputLog
)
dlog_read=: 3 : 0
if. -.KeepInputLog do. '' return. end.
dat=. 'b' freads InputLogDat
if. (dat -: _1) +. 0 = #dat do. '' return. end.
dat=. ~.&.|. a: -.~ ('NB.' -: 3 {. 0 pick dat) }. dat
(- InputLogMax <. #dat) {. dat
)
dlog_scroll=: 3 : 0
if. 0=#InputLog do. 1 return. end.
new=. 0 >. (#InputLog) <. InputLogPos + y
if. new=InputLogPos do. 1 return. end.
InputLogPos=: new
if. InputLogPos=#InputLog do.
  p=. _1 pick InputLog
else.
  p=. InputLogPos pick InputLog
end.
promptnewlog p
1
)
dlog_write=: 3 : 0
if. -.KeepInputLog do. '' return. end.
dat=. ~.&.|. (dlog_read''),InputLog
dat=. (- InputLogMax <. #dat) {. dat
('NB. gtkide inputlog',LF,; dat ,each LF) fwrites InputLogDat
)
cx_edit_inputlog=: 3 : 0
'' conew 'jgtkdlog'
)
cx_edit_openterm=: 3 : 0
setwindowfocus window
setchildfocus termSV
)
cx_file_print=: 3 : 0
p=. conew 'jgtkideprint'
print__p termSV
destroy__p''
0
)
cx_test_run=: 3 : 0
exec 'test''',y,''''
)
cx_run_debug=: 3 : 0
dbgtk 1
)
dbgtk=: 3 : 0
if. y do.
  if. _1 = 4!:0 <'jdb_open_jdebug_' do.
    0!:0 <jpath '~addons/ide/gtk/debugs.ijs'
  end.
  jdb_open_jdebug_''
  13!:0 [ 1
else.
  jdb_close_jdebug_ :: ] ''
  13!:15 ''
  13!:0 [ 0
end.
)
hs_changed=: 3 : 0
smoutput 'hschanged'
0
)
sv_key_press=: 3 : 0
'w e p'=. y
'state key'=. gtkeventkey e
if. (key=GDK_Control_L) +. key=GDK_Shift_L do. 0 return. end.
'ctrl j shift'=. 2 2 2 #: state
if. key e. GDK_FKeys do.
  fkey_exec__locTerm key,ctrl,shift return.
end.
if. ctrl > shift do.
  select. key
  case. GDK_Left do. moveword 0,termSB,termSV
  case. GDK_Right do. moveword 1,termSB,termSV
  case. GDK_d do. cx_edit_inputlog''
  case. GDK_j do. lab_jlab_ ::] 0
  case. GDK_k do. cx_run_debug''
  case. GDK_y do. gtk_source_buffer_redo termSB
  case. GDK_Return;GDK_KP_Enter do. term_key_enter 1
  end.
  return.
end.
if. shift > ctrl do. 0 return. end.
if. shift do.
  select. key
  case. GDK_Up do. dlog_scroll _1
  case. GDK_Down do. dlog_scroll 1
  end.
  return.
end.
if. key e. CheckMoves do.
  if. moveit key do. 1 return. end.
end.
select. key
case. GDK_Return;GDK_KP_Enter do. term_key_enter 0 return.
case. GDK_Escape do.
  if. EscClose do. term_close'' return. end.
end.
0
)
sv_populate_popup=: 3 : 'popup_init y'
term_close=: 3 : 0
if. ConfirmClose do.
  if. 0=mbnoyes 'term';(gettext 'OK to exit J?') do. 1 return. end.
end.
if. -. edit_hide__locEdit'' do. 0 return. end.
dlog_write''
main_quit_jgtkide_''
1
)
term_key_enter=: 3 : 0
len=. gtk_text_buffer_get_line_count termSB
row=. bufreadlinenumber termSB
txt=. readline row
if. row < len-1 do.
  promptnew getcmd txt
else.
  if. y do. 0 return. end.
  docmd txt
end.
1
)
window_configure=: 3 : 0
e=. 1{y
wh=. _2 ic memr e,(GdkEventConfigure_xywh+8),8
if. -. Twh -: wh do.
  Twh=: wh
  ifResized=: 1
end.
0
)
window_focus_in=: 3 : 'setwinfocus {.y'
window_delete=: term_close
term_open=: 3 : 0
newwindow 'Term'
TermPos setwinpos window
if. -.UNAME-:'Darwin' do.
  gtk_window_set_icon_from_file window;TermIcon;0
end.
consig3 window;'configure_event';'window_configure'
consig3 window;'focus-in-event';'window_focus_in'
vb=. gtk_vbox_new 0 0
gtk_container_set_border_width vb,0
termMenu=: term_menu window
proj_menu_enable 0
'termSW termSV termSB'=: newcodeview 'term';TermScheme;'';''
termEnd=: gtk_text_buffer_get_mark termSB;'end'
termScroll=: gtk_text_buffer_get_mark termSB;'scroll'
prompt_init''
gtk_box_pack_start vb, termMenu, 0 0 0
gtk_box_pack_start vb, termSW, 1 1 0
gtk_container_add window,vb
windowfinish''
gtk_window_present window
getfontsize''
)
readline=: 3 : 0
bgn=. newiterline termSB,y
end=. newiterline termSB,y
gtk_text_iter_forward_to_line_end <end
readstringfree gtk_text_iter_get_text bgn;end
)
readlastline=: 3 : 0
bgn=. newiterlastline termSB
end=. newiterend termSB
readstringfree gtk_text_iter_get_text bgn;end
)
readtext=: 3 : 0
readstringfree gtk_text_iter_get_text (newiterstart termSB);newiterend termSB
)
term_exec_script=: 4 : 0
f=. deb y
if. 0 = #f do. return. end.
if. 0 = fexist jpath f do. return. end.
c=. (x=2) term_load_script_fmt f
if. x=0 do.
  exec c return.
end.
promptnew c
exec c
conf_save''
gtk_widget_show_all termMenu
macmenu''
)
term_load_script=: 1 & term_exec_script
term_loadd_script=: 2 & term_exec_script
term_load_script_fmt=: 4 : 0
'   load',(x#'d'),' ''',y,''''
)
term_newscript=: 3 : 0
edit_opentab_show ''
)
appendtext=: 3 : 0
t=. octal_j_ y
gtk_text_buffer_insert termSB;(newiterend termSB);t;_1
)
movecursorend=: 3 : 0
gtk_text_buffer_place_cursor termSB;newiterend termSB
)
promptclear=: 3 : 0
bgn=. newiterlastline termSB
end=. newiterend termSB
gtk_text_buffer_delete termSB;bgn;end
)
promptnew=: 3 : 0
promptclear''
term_append y,(0=#y)#getprompt''
)
promptnewlog=: 3 : 0
promptnew (getprompt''),y
)
showlastline=: 3 : 0
if. 0~: termScroll do.
  iter=. newiterlastline termSB
  gtk_text_buffer_move_mark termSB;termScroll;iter
  gtk_text_view_scroll_mark_onscreen termSV,termScroll
end.
)
showprompt=: 3 : 0
if. ifOutput do.
  ifOutput=: 0
  if. 0~: termEnd do.
    gtk_text_view_scroll_to_mark termSV,termEnd,0 0 0 0
  end.
end.
EMPTY
)
term_append=: 3 : 0
begin_action''
appendtext y
setmaxbuflines''
showlastline''
movecursorend''
end_action''
ifOutput=: 1
setidle 'showprompt_',(>locTerm),'_$0'
)
term_append_run=: 3 : 0
promptclear''
appendtext (getprompt''),y
exec readline termSB,gtk_text_buffer_get_line_count termSB
)
term_clear=: 3 : 0
gtk_text_buffer_delete bufiterbounds termSB
term_append getprompt''
)
coclass 'jtextview'
coinsert 'jgtkide'
create=: makeview
destroy=: 3 : 0
cbfree''
codestroy''
0
)
makeview=: 3 : 0
'title text'=. _2 {. 'view';y
text=. octal_j_ text
newwindow title
windowdefaultsize 700 500
consig3 window;'key-press-event';'window_key_press'
windowcenter''
'sw sv sb'=. newcodeview 'view';EditScheme;'';text
gtk_container_add window,sw
gtk_text_view_set_editable sv,0
windowfinish''
EMPTY
)
sv_key_press=: 0:
sv_button_press=: 0:
sv_populate_popup=: 0:
view_close=: 3 : 0
gtk_widget_destroy window
destroy''
1
)
window_key_press=: 3 : 0
if. -.isesckey y do. 0 return. end.
view_close''
1
)
textview_z_=: 3 : 0
empty y conew 'jtextview'
)

window_delete=: view_close
coclass 'jgtkdialog'

ScriptPatterns=: ('*.q';'q scripts');('*.k';'k scripts');<'*.s';'s scripts'
ProjPattern=: <'*.qproj';'qconsole project'
coclass 'jgtkdirm'
dmconfig=: 3 : 0
dat=. 'b' freads DMCFGFILE
dat=. dat #~ (<'# ') ~: 2 {.each dat
dat=. dat <;.1~ '=' e.&> dat
for_d. dat do.
  def=. >d
  hdr=. 0 pick def
  ndx=. hdr i. '='
  id=. deb ndx {. hdr
  if. id -: 'DMType' do.
    DMType=: deb (ndx+1) }. hdr
  else.
    def=. (}.def) -. a:
    (id)=: ; def,each LF
  end.
end.
dmconfig1''
)
coclass 'jgtkdlog'
delprompt=: 3 : 0
p=. getprompt''
n=. #p
msk=. (<p) = n {.each y
(n * msk) }.each y
)
coclass 'jgtkedit'

Comment=: ,'/'
getname=: #~ [: *./\ e.&(AlphaNum,'_')
getselext=: 3 : 0
m=. {. r=. (1 + y i: '.') }. y
if. (1=#r) *. m e. 'qkjrs' do. m else. Mode end.
)
maskbraces=: 3 : 0
' ' (I.(+/\y='{')-0,}:+/\y='}')} y
)
maskquotes=: 3 : 0
' ' (I.(+.~:/\) y='"')} y
)
masktables=: 3 : 0
n=. 1 i.~ '([' E. y
if. n=#y do. y return. end.
hdr=. n {. y
y=. n }. y
ndx=. 0 i.~ (+/\y='(')-0,}:+/\y=')'
hdr,(ndx#' '),ndx}.y
)
maskall=: 3 : 0
if. 0=#y do. '' return. end.
masktables maskbraces y
)
readalllines=: 3 : 0
mode=. {. getselext pFL
dat=. <;._2 termLF y
r=. ''
while. #dat do.
  'cnt txt'=. readnextentry dat;mode
  r=. r,<txt
  dat=. cnt }. dat
end.
r
)
readentry=: 3 : 0
mode=. {. getselext pFL
ctx=. Context__locTerm
txt=. y }. <;._2 termLF tab_readall''
readnextentry txt;mode;ctx
)
splitcomment=: 4 : 0
if. x='s' do. y;'' return. end.
p=. ' ',y,' '
m=. (' /' E. p) > ~:/\ (p='"') > 0,}:p='\'
if. 1 e. m do.
  x=. m i. 1
  (}.x{.p);}:x}.p
else.
  y;''
end.
)
cx_run_all=: 3 : 0
if. cx_run_save'' do. 1 return. end.
edit_current_def''
if. is_shellscript pFL do.
  hostcmd pFL
else.
  cx_runlines termLF trimWS tab_readall''
end.
1
)
cx_run_select=: 3 : 0
edit_current_def''
cx_runlines tab_readselect''
)
cx_runlines=: 3 : 0
txt=. <;._2 termLF y
mode=. {. getselext pFL
ctx=. Context__locTerm
runlines txt;mode
Context__locTerm=: ctx
promptnew__locTerm''
1
)
globalassigns=: 3 : 0
txt=. <;._2 termLF y
txt=. maskquotes each txt
txt=. ; txt ,each LF
rx=. '([[:alpha:]][[:alnum:]_]*) *:'
nms=. getname @ (-.&' ') each rx rxall txt
tagcount sort nms
)
coclass 'jregex'

Rxnna=: '\b'
Rxnnz=: '($|[^[:alnum:]_.])'
Rxass=: '[[:space:]]*:'

fiwss_regex_jgtkfiw_=: {.@{."2 @ rxmatches_jregex_
cocurrent 'z'
f2utf8=: 3 : 0
r=. y
if. -. 1 e. 127 < a.i.y do. return. end.
select. FileEncoding
case. 'gbk' do.
  'rc r'=. gconvert_jgtk_ 'utf8';'gbk';y
  if. rc do.
    if. -. isutf8 r=. y do. _1 return. end.
  end.
case. 'utf8' do.
  if. -. isutf8 y do.
    'rc r'=. gconvert_jgtk_ 'utf8';'gbk';y
    if. rc do. _1 return. end.
  end.
end.
r
)
fread=: [: 1!:1 :: _1: fboxname
freads=: 3 : 0
'' freads y
:
dat=. fread y
if. (dat -: _1) +. 0=#dat do. return. end.
txt=. fgets dat
if. 'b'e.x do. <;._2 txt end.
)
fgets=: 3 : 0
y=. (-(26{a.)={:y) }. y
if. 0=#y do. '' return. end.
y=. f2utf8 toJ y
if. -. y -: _1 do. y,LF -. {:y end.
)
fputs=: 3 : 0
dat=. ":y
if. 0 e. $dat do. '' return. end.
txt=. dat=. toHOST dat,LF -. {: dat
select. FileEncoding
case. 'gbk' do.
  if. 1 e. 127 < a.i.dat do.
    'rc txt'=. gconvert_jgtk_ 'gbk';'utf8';dat
    if. rc do. txt=. dat end.
  end.
end.
txt
)
coclass 'jgtkide'
AA=: j=. cutopen 0 : 0
! Reference/BangSymbol
# Reference/NumberSign
$ Reference/DollarSign
' Reference/Apostrophe
': Reference/ApostropheColon
. Reference/DotSymbol
/ Reference/Slash
/: Reference/SlashColon
0: Reference/ZeroColon
1 Reference/One
1: Reference/OneColon
2 Reference/Two
2: Reference/TwoColon
: Reference/Colon
:: Reference/ColonColon
? Reference/QuestionSymbol
@ Reference/AtSymbol
\ Reference/BackSlash
\: Reference/BackSlashColon
\\ Reference/BackSlashBackSlash
^ Reference/Caret
_ Reference/Underscore
~ Reference/Tilde
, Reference/Comma

abs Reference/abs
acos Reference/acos
aj Reference/aj
all Reference/all
and Reference/and
any Reference/any
asc Reference/asc
asin Reference/asin
asof Reference/asof
atan Reference/atan
attr Reference/attr
avg Reference/avg
avgs Reference/avgs
bin Reference/bin
ceiling Reference/ceiling
cols Reference/cols
cor Reference/cor
cos Reference/cos
count Reference/count
cov Reference/cov
cross Reference/cross
cut Reference/cut
delete Reference/delete
deltas Reference/deltas
desc Reference/desc
dev Reference/dev
differ Reference/differ
distinct Reference/distinct
div Reference/div
do Reference/do
each Reference/each
ej Reference/ej
enlist Reference/enlist
eval Reference/eval
except Reference/except
exec Reference/exec
exit Reference/exit
exp Reference/exp
fby Reference/fby
fills Reference/fills
first Reference/first
fkeys Reference/fkeys
flip Reference/flip
floor Reference/floor
get Reference/get
getenv Reference/getenv
group Reference/group
gtime Reference/gtime
hclose Reference/hclose
hcount Reference/hcount
hdel Reference/hdel
hopen Reference/hopen
hsym Reference/hsym
iasc Reference/iasc
idesc Reference/idesc
if Reference/if
ij Reference/ij
in Reference/in
insert Reference/insert
inter Reference/inter
inv Reference/inv
joins Reference/joins
key Reference/key
keys Reference/keys
last Reference/last
like Reference/like
list Reference/list
lj Reference/lj
load Reference/load
log Reference/log
lower Reference/lower
lsq Reference/lsq
ltime Reference/ltime
ltrim Reference/ltrim
mavg Reference/mavg
max Reference/max
maxs Reference/maxs
mcount Reference/mcount
md5 Reference/md5
mdev Reference/mdev
med Reference/med
meta Reference/meta
min Reference/min
mins Reference/mins
mmax Reference/mmax
mmin Reference/mmin
mmu Reference/mmu
mod Reference/mod
msum Reference/msum
neg Reference/neg
next Reference/next
not Reference/not
null Reference/null
or Reference/or
over Reference/over
parse Reference/parse
peach Reference/peach
pj Reference/pj
plist Reference/plist
prd Reference/prd
prds Reference/prds
prev Reference/prev
prior Reference/prior
rand Reference/rand
rank Reference/rank
ratios Reference/ratios
raze Reference/raze
read0 Reference/read0
read1 Reference/read1
reciprocal Reference/reciprocal
reverse Reference/reverse
rload Reference/rload
rotate Reference/rotate
rsave Reference/rsave
rtrim Reference/rtrim
save Reference/save
scan Reference/scan
select Reference/select
set Reference/set
setenv Reference/setenv
show Reference/show
signum Reference/signum
sin Reference/sin
sqrt Reference/sqrt
ss Reference/ss
ssr Reference/ssr
string Reference/string
sublist Reference/sublist
sum Reference/sum
sums Reference/sums
sv Reference/sv
system Reference/system
tables Reference/tables
tan Reference/tan
til Reference/til
trim Reference/trim
txf Reference/txf
type Reference/type
uj Reference/uj
ungroup Reference/ungroup
union Reference/union
update Reference/update
upper Reference/upper
upsert Reference/upsert
value Reference/value
var Reference/var
view Reference/view
views Reference/views
vs Reference/vs
wavg Reference/wavg
where Reference/where
while Reference/while
within Reference/within
wj Reference/wj
wsum Reference/wsum
xasc Reference/xasc
xbar Reference/xbar
xcol Reference/xcol
xcols Reference/xcols
xdesc Reference/xdesc
xexp Reference/xexp
xgroup Reference/xgroup
xkey Reference/xkey
xlog Reference/xlog
xprev Reference/xprev
xrank Reference/xrank

.Q.PD DotQ/DotQDotPDx
.Q.PV DotQ/DotQDotPVx
.Q.V DotQ/DotQDotVx

.Q.D DotQ/DotQDotD
.Q.P DotQ/DotQDotP
.Q.addmonths DotQ/DotQDotaddmonths
.Q.addr DotQ/DotQDotaddr
.Q.chk DotQ/DotQDotchk
.Q.cn DotQ/DotQDotcn
.Q.dd DotQ/DotQDotdd
.Q.dpft DotQ/DotQDotdpft
.Q.dsftg DotQ/DotQDotdsftg
.Q.fc DotQ/DotQDotfc
.Q.fk DotQ/DotQDotfk
.Q.fmt DotQ/DotQDotfmt
.Q.fs DotQ/DotQDotfs
.Q.ft DotQ/DotQDotft
.Q.fu DotQ/DotQDotfu
.Q.gc DotQ/DotQDotgc
.Q.hdpf DotQ/DotQDothdpf
.Q.host DotQ/DotQDothost
.Q.ind DotQ/DotQDotind
.Q.j10 DotQ/DotQDotj10
.Q.par DotQ/DotQDotpar
.Q.pd DotQ/DotQDotpd
.Q.pf DotQ/DotQDotpf
.Q.ph DotQ/DotQDotph
.Q.pv DotQ/DotQDotpv
.Q.qt DotQ/DotQDotqt
.Q.s DotQ/DotQDots
.Q.u DotQ/DotQDotu
.Q.v DotQ/DotQDotv
.Q.w DotQ/DotQDotw
.Q.y DotQ/DotQDoty

.z.K Reference/dotzdotKx
.z.N Reference/dotzdotNx
.z.P Reference/dotzdotPx
.z.W Reference/dotzdotWx
.z.Z Reference/dotzdotZx

.z.a Reference/dotzdota
.z.ac Reference/dotzdotac
.z.b Reference/dotzdotb
.z.exit Reference/dotzdotexit
.z.f Reference/dotzdotf
.z.h Reference/dotzdoth
.z.i Reference/dotzdoti
.z.k Reference/dotzdotk
.z.l Reference/dotzdotl
.z.n Reference/dotzdotn
.z.o Reference/dotzdoto
.z.p Reference/dotzdotp
.z.pc Reference/dotzdotpc
.z.pg Reference/dotzdotpg
.z.ph Reference/dotzdotph
.z.pi Reference/dotzdotpi
.z.po Reference/dotzdotpo
.z.pp Reference/dotzdotpp
.z.ps Reference/dotzdotps
.z.pw Reference/dotzdotpw
.z.s Reference/dotzdots
.z.ts Reference/dotzdotts
.z.u Reference/dotzdotu
.z.vs Reference/dotzdotvs
.z.w Reference/dotzdotw
.z.x Reference/dotzdotx
.z.z Reference/dotzdotz
)

j=. j -. a:
ndx=. j i.&> ' '
Helps=: ndx {.each j
Helpfiles=: (<'') ,~ (ndx+1) }. each j
Version=: '1.03'
browseq=: 3 : 0
if. LocalWiki < 'kxwiki/' matchhead y do.
  if. 'x'={:y do.
    y=. (-(a.i_2{' ',y) e. 65+i.26) }. y
  end.
  url=. 'https://code.kx.com/',7}.y
else.
  url=. 'file://',jpath '~install/help/',y,'.html'
end.
browse_j_ url
)
browseref=: 3 : 0
browseq 'kxwiki/trac/wiki/',y
)
helpabout_activate=: 3 : 0
w=. gtk_about_dialog_new''
c=. ' ',(":2011>.{.6!:0''),' Chris Burke'
gtk_about_dialog_set_copyright w;'Copyright ',(194 169{a.),c
gtk_about_dialog_set_version w;Version
gtk_about_dialog_set_name w;'Qconsole'
gtk_about_dialog_set_logo_icon_name w;GTK_STOCK_EDIT
gtk_dialog_run w
gtk_widget_destroy w
)
cb_help_brief=: 3 : 0
browseq 'briefref'
)
cb_help_interc=: 3 : 0
browseq 'kxwiki/trac/wiki/Cookbook/InterfacingWithC'
)
cb_help_reference=: 3 : 0
browseq 'kxwiki/trac/wiki/Reference'
)
cb_help_wiki=: 3 : 0
browseq 'kxwiki/trac/wiki/WikiStart'
)
getnamefromwords=: 3 : 0
'p len'=. y
m=. qxp p
if. 0=m do. '';'' return. end.
cnt=. +/\ # &> m
if. len < <:#p do.
  len=. 0 >. len - ' '=len{p
end.
ndx=. (cnt > len) i. 1
if. ndx = #m do. 0 return. end.
name=. ndx pick m
pos=. ndx{0,cnt
name;pos
)
helplookup=: 3 : 0
(Helps i. <deb y) pick Helpfiles
)
helppos1=: 3 : 0
'p len'=. y
s=. helplookup p
if. #s do. p return. end.
m=. qxp p
if. 0=#m do.
  mbinfo 'Help';'Unable to parse: ',p
  '' return.
end.
cnt=. +/\ # &> m
if. len < <:#p do.
  len=. 0 >. len - ' '=len{p
end.
ndx=. (cnt > len) i. 1
if. ndx = # m do. '' return. end.
ndx pick m
)
helpsel=: 3 : 0
s=. deb y
if. 0=#s do. return. end.
p=. helplookup s
if. 0=#p do.
  mbinfo (gettext 'Help');(gettext 'Help not available for: '),s return.
end.
browseref p
)
coclass 'jlint'
coinsert 'jgtkide j'
read=: 3 : 0
'txt mode'=: y
txt=. dtb each txt
res=. ''
while. #txt do.
  'txt new'=. read1 txt;mode
  res=. res,<new
end.
res
)
read1=: 3 : 0
'txt mode'=. y
'mode res'=. gettextmode mode;{.txt
cmd=. 0 pick mode splitcomment res
bal=. }. txt
pfx=. ''
res=. dtb res
if. (0<#res) > ({.res) e. '/\' do.
  while. (','={:cmd) +. matchparens mode;cmd do.
    if. 0=#bal do. break. end.
    res=. res,dltb 0 pick bal
    cmd=. cmd,dltb 0 pick splitcomment mode;0 pick bal
    bal=. }. bal
  end.
end.
bal;pfx,res
)
Indent=: 2
Split=: 1
Width=: 40
write=: 3 : 0
'txt mode'=. y
Mode=: mode
r=. ''
state=. 0
while. #txt do.
  n=. #s=. 0 pick txt
  txt=. }.txt
  select. n
  case. 0 do. r=. r,<s continue.
  case. 1 do.
    select. {.s
    case. '\' do.
      state=. <:state
      r=. r,<s
      if. state<0 do. break. else. continue. end.
    case. '/' do.
      state=. >:state
    end.
  case. 2 do.
    if. '\\' -: s do. r=. r,<s break. end.
  end.
  if. state +. '/'={.s do. r=. r,<s continue. end.
  r=. r,write1 s
end.
; r ,each LF
)
write1=: 3 : 0
if. LF e. y do. writemulti y return. end.
Width writewrap each writesplit y
)
writesplit=: 3 : 0
if. Split do.
  splitsemicolon y
else.
  <y
end.
)
writemulti=: 3 : 0
<'nonce: ',y
)
writewrap=: 4 : 0
y
)
coclass 'jgtkide'
ifMatchBrackets_jgtk_=: 1
DefCmt_jgtk_=: '/ '
DefLang_jgtk_=: 'q'
ValExt_jgtk_=: ;: 'k q s'

ScriptExt_j_=: '.q'
ProjExt_j_=: '.qproj'
extsrc_j_=: extsrc_jgtk_=: , ('.q' #~ '.'&e. < 0 < #)
extproj_j_=: , (ProjExt_j_ #~ '.'&e. < 0 < #)
path2proj_j_=: ,'/',ProjExt_j_ ,~ spath
snapwrite=: 3 : 0
'.qx.s' set y
)
loadscript=: 3 : 0
0 term_exec_script__locTerm y
)
qc_z_=: main_run_jgtkide_
istextfile1=: [: -. _1 -: fgets
matchhead=: [ -: #@[ {. ]
cx_run_clip=: 3 : 0
txt=. clipread''
if. #txt do.
  txt=. <;._2 termLF txt
  ctx=. Context__locTerm
  runlines txt;Mode__locTerm
  Context__locTerm=: ctx
  promptnew__locTerm''
end.
1
)
gettextmode=: 3 : 0
'mode txt'=. y
'mx cmd'=. ')' spliton getcmd__locTerm mode,')',txt
({.mx);cmd
)
guigtkconfig=: 3 : 0
jpath '~lib/'
)
interrupt=: 3 : 0
gtk_main_quit''
smoutput 'In J console. To return to Q, enter:',LF,'   qc'''''
1
)
log_z_=: 3 : 0
f=. jpath '~home/t9.txt'
if. y -: 0 do.
  '' (1!:2 :: 0:) <f
else.
  t=. LF,~,":y
  t (1!:3 :: 0:) <f
end.
)
qbread_z_=: 3 : 0
dat=. 'b' freads y
if. dat -: _1 do. return. end.
dat=. dtb each dat
msk=. (1 < #&> dat) *: ' ' = {.&> dat
if. 0 e. msk do.
  dat=. }: each (1 (0}) msk) <@;;.1 dat ,each LF
end.
dat #~ (0 < #&> dat) *. '#' ~: {.&> dat
)
cbflatten=: 3 : 0
msk=. (<'0 : 0') = _5 {.each y
if. -. 1 e. msk do. y return. end.
n=. msk i. 1
(n {. y),;(n }. msk) cbflatten1;.1 n }. y
)
cbflatten1=: 3 : 0
ndx=. 1 + y i. <,')'
<(<;(ndx{.y) ,each LF),ndx}.y
)

qserver=: 3 : 0
t=. deb QServer
x=. 1 i.~ '-e "~' E. t
if. x=#t do. t return. end.
h=. (x+4) {. t
t=. (x+4) }. t
x=. t i. '"'
h,(jpath x{.t),x }. t
)
readnextentry=: 3 : 0
'txt mode ctx'=. y
if. 0=#txt do. 0;'' return. end.
cmd=. dtb detab 0 pick txt
txt=. }. txt
'mode cmd'=. gettextmode mode;cmd
if. #ctx do.
  ctx=. (mode e. 'kq') # '.',ctx
end.
res=. mode,ctx,')',dlb cmd
cnt=. 0 i.~ ' ' = {.&> txt
if. (cnt=0) +. ' ' = {.cmd do.
  1;res return.
end.
mid=. dtb each detab each cnt {. txt
end=. {:mid
mid=. (0 pick mode splitcomment ]) each }:mid
cnt=. cnt - *./ (cnt < #txt),' ' = >end
bal=. mid,end
(cnt+1);res,;bal #~ (' ' +./ .~: ]) &> bal
)
runimmex0=: 3 : 'do__ y'
runlines=: 3 : 0
'txt mode'=. y
row=. 0
state=. 0
blank=. 0
while. row < #txt do.
  n=. #s=. dtb row pick txt
  if. (n=1) *. '\'={.s do.
    state=. <:state
    if. state<0 do. 1 return. end.
    row=. row + 1 continue.
  end.
  if. (n=1) *. '/'={.s do.
    state=. >:state
  end.
  if. state do.
    row=. row + 1 continue.
  end.
  if. n do.
    'cnt s'=. readnextentry (row}.txt);mode;Context__locTerm
    term_append_run__locTerm s
    blank=. 0
    row=. row + cnt
  else.
    if. blank=0 do.
      term_append__locTerm LF,getprompt__locTerm''
    end.
    blank=. 1
    row=. row + 1
  end.
end.
1
)
toqlist=: 3 : 0
'(', ')',~ }. ; ';' ,each dquote each y
)
main_init_config=: 3 : 0
'~config/qconsole.conf'
)
conf_fkeys=: 3 : 0
conf_fkeys1 cbread jpath '~lib/fkeys.def'
)

conf_gtkide=: ]
conf_winpos=: 3 : 0
DirmPos=: 300 100 700 700
DlogPos=: 0 0 300 400
FilemPos=: 300 100 700 700
FifPos=: 200 200 500 100
FiwPos=: 200 200 500 100
PselPos=: 0 0 350 400
ViewPos=: 100 100 700 700
0!:0 ::] <WinPosFile
)
jexec=: 3 : 0
inputline=: y
gtk_main_quit''
jfe 1
1
)
input=: 3 : 0
inputline
)
output=: 4 : 0
if. 3~:x do.
  jfe 0
  setprompt__locTerm (-.silent) # y
  gtk_main''
end.
)
input_jfe_=: input_jgtkide_
output_jfe_=: output_jgtkide_
defaultsearchpath=: 3 : 0
jpath each '~lib';'~config'
)
qid=: ([: *./ e.&AlphaNum_j_) > Num_j_ e.~ {.
jid=: [: ([: *./ (0=#&>) +. _2 < nc) (1 i.~ '__' E. ]) ({.;(2+[) }.]) ]
jxs=: 3 : 0
silent_jgtkide_=: 0
jexec_jgtkide_ y
)
jassign=: 3 : 0
'cmd ndx'=. y
nam=. ndx{.cmd
'rc val'=. get__locQ (ndx+1)}.cmd
loc=. locTerm
if. rc=0 do.
  cocurrent 'base'
  (nam)=: val
end.
setprompt__loc''
)
qassign=: 3 : 0
'cmd ndx'=. y
nam=. ndx{.cmd
cmd=. (ndx+1)}.cmd
try.
  val=. do__ cmd
catch.
  setprompt '''error - ',cmd return.
end.
'rc res'=. nam set__locQ val
if. rc=0 do.
  setprompt ''
else.
  setprompt '''jerror - ',res
end.
)
qxs_cqclient_=: 3 : 0
cmd=. SYNC,ftoQs y
try=. 2
while. try do.
  try.
    send cmd
    res=. 8}.read''
    if. #res do. 0 qtoJs res return. end.
  catcht.
    r=. 1 pick thrown
    if. -. r -: 'socket unknown error' do. return. end.
  end.
  if. conn_init_jgtkide_'' do. break. else. 6!:3[0.1 end.
  try=. try-1
end.
'cannot connect to q server'
)
conn_init=: 3 : 0
sdcleanup_jsocket_''
locQ_z_=: 1 conew 'cqclient'
if. 0=#User do.
  p=. getenv 'USER'
  if. 2 ~: 3!:0 p do. p=. '' end.
  User_jgtkide_=: p
end.
r=. qopen Host;Port;User,(0<#Pass)#':',Pass
if. r do.
  1[mbinfo 'connect';'could not connect to q server'
end.
)
qopen=: 3 : 0
r=. connect y
if. L.r do.
  try. forkcmd qserver'' catch. 1 return. end.
  for_i. i.5 do.
    r=. connect y
    if. 0 = L.r do. break. end.
    6!:3[1
  end.
end.
if. L.r do. 1 return. end.
qstart''
0
)
qxc=: 3 : 0
'mx cmd'=. ')' spliton getcmd y
'mode ctx'=. '.' spliton mx
if. mode='j' do. jxs cmd return. end.
if. (mode e. 'kq') *. '\d ' -: 3 {. cmd do.
  qxcontext cmd return.
end.
if. (mode='q') *. Show +. 'show ' -: 5 {. cmd do.
  bal=. (4 * 'show ' -: 5 {. cmd) }. cmd
  if. 0 e. bal=' ' do.
    cmd=. '{show x;x}' , bal
  end.
end.
if. #ctx do.
  if. mode e. 'jr' do.
    setprompt__locTerm termLF_j_ '''context' return.
  end.
  if. '\'={.cmd do.
    cmd=. 'value"\',cmd,'"'
  end.
  cmd=. mode,')value"\\d .',ctx,'";',cmd
else.
  cmd=. mode,')',cmd
end.
setprompt__locTerm termLF_j_ qxs__locQ '.qx.x';cmd
)
qxcontext=: 3 : 0
d=. deb 3 }. y
if. '.' ~: {.d do.
  res=. '''',d
else.
  Context=: }. (d i. ' ') {. d
  res=. ''
end.
setprompt__locTerm res
)

qxp=: 3 : 0
'rc res'=. qxparse y
if. rc do.
  LF ,~ 'unexpected result: ',,":res
else.
  res
end.
)
qxparse=: 3 : 0
execr__locQ '.qx.p';y
)
qstart=: 3 : 0
if. -. 100-:cmdr'type .qx.x' do.
  if. -. qloadstart'' do. return. end.
end.
a=. ('home';'qhome'),.cmdr '(.qx.home;.qx.qhome)'
a=. a,SystemFolders_j_
SystemFolders_j_=: a #~ ~: {."1 a
nam=. {."1 UserFolders_j_
val=. jpath each {:"1 UserFolders_j_
UserFolders_j_=: nam,.val
cmd '.qx.folders:(`$',(toqlist nam),')!',toqlist val
ids=. ;:'bin break help install lib snap system tools user'
sys=. SystemFolders_j_ #~ -. ({."1 SystemFolders_j_) e. ids
nam=. {."1 sys
val=. jpath each {:"1 sys
cmd '.qx.folderss:((`$',(toqlist nam),')!',(toqlist val),'),.qx.folders'
)
qloadstart=: 3 : 0
r=. cmdr '@[value;"\\l ',(jpath '~lib/startup.k'),'";0]'
if. r-:0 do.
  s=. 'qconsole_startup.k'
  exec '0:';(s:<':',s);<<freads jpath '~lib/startup.k'
  r=. cmdr '@[value;"\\l ',s,'";0]'
  if. r-:0 do.
    mbinfo 'Qconsole';'Unable to load startup.k'
    0 return.
  end.
end.
1
)
restart_z_=: 3 : 0
main_run_jgtkide_''
)
main_init_paths=: 3 : 0
GtkConfig=: jpath '~lib/'
WinPosFile=: jpath '~config/winpos.dat'
)
main_run=: gtk_main
run_all=: 3 : 'cx_run_all__locEdit$0'
run_all_clear=: 3 : 0
term_clear__locTerm''
run_all''
)
run_show=: 3 : 'cx_run_show__locEdit$0'
escmask=: 3 : 0
r=. $0
while. #y do.
  n=. 2 + y i. '\'
  if. n > #y do. r,(#y)#0 return. end.
  y=. n}.y
  r=. r,(-n){.1
end.
)
matchparens=: 3 : 0
'mode s'=. y
if. mode='j' do. 0 return. end.
c=. mode~:'s'
q=. c { '''"'
r=. ''
while. #s do.
  n=. s i. q
  p=. n{.s
  if. c *. 1 e. m=. ' / ' E. ' ',p,' ' do.
    r=. r,(m i. 1){.p break.
  end.
  r=. r,p
  s=. (n+1)}.s
  if. 0=#s do. break. end.
  t=. 1 i.~ (s=q) > escmask s
  if. t=#s do. 3 return. end.
  s=. (t+1)}.s
end.
matchparens1 r
)
matchparens1=: 3 : 0
if. 0=#y do. 0 return. end.
b=. '[({' =/ y
e=. '])}' =/ y
s=. +/\"1 b-e
if. 1 e. 0 > ,s do. 2 return. end.
if. +/{:"1 s do. 1 return. end.
p=. '[]{}()'
y=. y #~ y e. p
p=. _2[\p
while. #y do.
  s=. y #~ (+: _1&|.) +./p E."1 y
  if. s -: y do.
    1 + +./ ']})' e. s return.
  end.
  y=. s
end.
0
)
splitsemicolon=: 3 : 0
if. (0=#y) +. '/' = {. y do. '' return. end.
txt=. ' ',y,' '
m=. (' / ' E. txt) > ~:/\ txt = '"'
if. 1 e. m do.
  x=. m i. 1
  cmt=. x }. y
  txt=. x {. y
else.
  cmt=. ''
  txt=. y
end.
m=. ~:/\ (txt='"') > escmask txt
b=. m < txt =/ '[({'
e=. m < txt =/ '])}'
m=. m +. +./"1 [ 0 ~: +/\ b-e
m=. m < txt = ';'
if. -. 1 e. m do. <y return. end.
r=. (1,~}:m) <;.2 txt
if. #cmt do.
  (}:r),<(_1 pick r),cmt
end.
)
Last=: Lastp=: ''
moveparse=: 3 : 0
if. y -: Last do. Lastp return. end.
'rc res'=. qxparse y
if. rc +. res -: 0 do. 0 return. end.
Last_jgtkide_=: y
Lastp_jgtkide_=: res
)
moveword1=: 3 : 0
'dir pfx all'=. y

if. dir=0 do.
  pfx=. dtb pfx
  if. 0 = #pfx do. _2 return. end.
else.
  pfx=. pfx, (0 i.~ ' ' = (#pfx) }. all) # ' '
  if. pfx -: all do. _1 return. end.
end.

try.
  pfx=. ucp pfx
  all=. ucp all
catch. _3 return. end.

if. 0 -: awf=. moveparse all do. _3 return. end.
if. 0 = #awf do. dir{_2 _1 return. end.

cnt=. +/\ # &> awf
if. dir=0 do.
  (0,cnt) {~ 1 i.~ (#pfx) <: cnt
else.
  cnt {~ 1 i.~ (#pfx) < cnt
end.

)
DirmPos=: 300 100 700 700
DlogPos=: 0 0 300 400
FilemPos=: 300 100 700 700
FifPos=: 200 200 500 100
FiwPos=: 200 200 500 100
PselPos=: 0 0 350 400
CtagPos=: 0 0 300 300
ViewPos=: 100 100 700 700
httpget=: 3 : 0
'f t'=. 2 {. (boxxopen y),a:
n=. f #~ -. +./\. f e. '=/'
p=. jpath '~temp/',n
q=. jpath '~temp/httpget.log'
t=. ":{.t,3
ferase p;q
fail=. 0
cmd=. HTTPCMD rplc '%O';(dquote p);'%L';(dquote q);'%t';t;'%T';(":TIMEOUT);'%U';f
try.
  e=. shellcmd cmd
catch. fail=. 1 end.
if. fail +. 0 >: fsize p do.
  if. _1-:msg=. freads q do.
    if. 0=#msg=. e do. msg=. 'Unexpected error' end. end.
  log 'Connection failed: ',msg
  info 'Connection failed:',LF2,msg
  r=. 1;msg
  ferase p;q
else.
  r=. 0;p
  ferase q
end.
r
)
httpgetr=: 3 : 0
res=. httpget y
if. 0 = 0 pick res do.
  f=. 1 pick res
  txt=. freads f
  ferase f
  0;txt
end.
)
coclass 'jgtkide'

Show=: 0
CFiles=: <;._1 ' base.cfg dirmatch.cfg folders.cfg launch.cfg'
cb_cfg_open=: 3 : 0
if. y -: 'all' do.
  fls=. CFiles
else.
  fls=. CFiles {~ (<y) i.~ (#y) {.each CFiles
end.
cfg=. (<jpath '~config/') ,each fls
ndx=. I. _1 = fsize cfg
''&fwrite each ndx{cfg
edit_openfiles__locEdit cfg;0
1
)
cb_modej=: 3 : 'term_modeset__locTerm ''j'''
cb_modek=: 3 : 'term_modeset__locTerm ''k'''
cb_modeq=: 3 : 'term_modeset__locTerm ''q'''
cb_moder=: 3 : 'term_modeset__locTerm ''r'''
cb_modes=: 3 : 'term_modeset__locTerm ''s'''
cb_basecontext=: 3 : 0
setprompt Context=: ''
)
reloadq_activate=: 3 : 0
try. cmd__locQ '\\' catch. end.
conn_init_jgtkide_''
)
runallq_activate=: 3 : 'cx_run_all__locEdit$0'
runlineshow_activate=: 3 : 'cx_run_line_show__locEdit 1'
cb_launch_run=: 3 : 0
ndx=. 1{y
ndx=. ndx - cbregs_jgtk_ i. ndx{cbregs_jgtk_
ndx=. ndx { I. 0 < # &> {:"1 Launch
cmd=. getcmd '\l ',jpath (<ndx;1) pick Launch
promptnew cmd
exec cmd
1
)
Menus=: Menus,fixNB_jp_ 0 : 0
helpbriefref,,_Brief Reference,F1,Brief reference,cb_help_brief
helpreference,,_Reference,csF1,Kx wiki Reference,cb_help_reference
helpwiki,,_Wiki,,Kx wiki,cb_help_wiki
helpinterc,,_Interfacing with C,,Interfacing with C,cb_help_interc
basecontext,,_Base Context,csB,Base Context,cb_basecontext
modej,,j) mode,csJ,j mode,cb_modej
modek,,k) mode,csK,k mode,cb_modek
modeq,,q) mode,csQ,q mode,cb_modeq
moder,,r) mode,csR,r mode,cb_moder
modes,,s) mode,csS,s mode,cb_modes
toolsmodes,,Modes,,Modes,
reloadq,,Reload q server,,Reload q server,reloadq_activate
runallq,,All Lines,csE,All Lines,runallq_activate
runlineshow,,Line Advance Show,csR,Run Line Advance and Show,runlineshow_activate
)
edit_menu=: 3 : 0
mb=. create_menu_bar''
file_menu mb
editx_menu mb;'edit'
view_menu mb;'edit'
run_menu mb
tools_menu mb;'edit'
script_menu mb
project_menu mb
window_menu mb
help_menu mb
gtk_widget_show_all mb
mb
)
script_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Script')
con=. create_menu_container pop
r=. ''
r=. r,con ccmenu 'filerestore'
create_menu_sep con
r=. r,con ccmenu 'tofilesnaps'
create_menu_sep con
r=. r,con ccmenu 'toglobals'
mnScriptEnable=: r
)
term_menu=: 3 : 0
mb=. create_menu_bar''
pop=. create_menu_popup mb;'_File'
con=. create_menu_container pop
con ccmenu 'filenewtemp'
con ccmenu 'fileopentemp'
create_menu_sep con
con ccmenu 'filerecent'
create_menu_sep con
con ccmenu 'reloadq'
create_menu_sep con
con ccmenu 'filequit'
editx_menu mb;'term'
viewx_menu mb;'term'
runx_menu mb
tools_menu mb;'term'
projectx_menu mb
help_menu mb
gtk_widget_show_all mb
mb
)
help_menu=: 3 : 0
pop=. create_menu_popup y;'_Help'
con=. create_menu_container pop
con ccmenu 'helpbriefref'
create_menu_sep con
con ccmenu 'helpcontext'
con ccmenu 'helpreference'
con ccmenu 'helpwiki'
create_menu_sep con
con ccmenu 'helpinterc'
create_menu_sep con
con ccmenu 'helpabout'
)
modes_menu=: 3 : 0
con=. gtk_menu_new''
con ccmenu 'basecontext'
create_menu_sep con
con ccmenu 'modeq'
con ccmenu 'modek'
con ccmenu 'modes'
create_menu_sep con
con ccmenu 'modej'
con ccmenu 'moder'
create_menu_sep con
con ccmenu 'interrupt'
con
)
run_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Run')
con=. create_menu_container pop
con ccmenu 'runline'
con ccmenu 'runlineadvance'
con ccmenu 'runlineshow'
con ccmenu 'runselect'
con ccmenu 'runallq'
create_menu_sep con
con ccmenu 'runclip'
create_menu_sep con
con ccmenu 'load_script'
create_menu_sep con
mnProjectEnable=: con ccmenu 'runproject'
launch_menu con
)
runx_menu=: 3 : 0
pop=. create_menu_popup y;(gettext '_Run')
con=. create_menu_container pop
con ccmenu 'runclip'
create_menu_sep con
mnProjectEnable=: con ccmenu 'runproject'
launch_menu con
)
tools_menu=: 3 : 0
'mb type'=. y
pop=. create_menu_popup mb;'_Tools'
con=. create_menu_container pop
con ccmenu 'toolsdirm'
create_menu_sep con
con ccmenu 'toolsfkeys'
if. type-:'term' do.
  create_menu_sep con
  r=. con ccmenu 'toolsmodes'
  gtk_menu_item_set_submenu r,modes_menu''
end.
launch_menu con
con
)


coclass 'jgtkterm'
CheckMoves=: GDK_BackSpace,GDK_Down,GDK_Left,GDK_Home
Mode=: 'q'
Context=: ''
prompt_init=: setprompt
delmode=: 4 : 0
if. x do.
  p=. getcmd y
  (>: p i. ')') }. p
else.
  p=. getprompt''
  ((#p) * p matchhead y) }. y
end.
)
dlog_add=: 3 : 0
if. 0=#y do. return. end.
'mode cmd'=. ')' spliton getcmd y
if. '/ ' -: 2 {. cmd do. return. end.
dlog_add1 y
)
docmd=: 3 : 0
s=. getcmd dltb y
select. #s
case. 2 do. setprompt'' return.
case. 3 do.
  if. '\'=2{s do.
    togglemode''
    setprompt'' return.
  end.
case. 4 do.
  if. '\\' -: _2 {. s do.
    term_close'' return.
  end.
end.
'mode cmd'=. ')' spliton s
t=. matchparens ({.mode);cmd
select. t
case. 0 do.
  exec__locTerm s
case. 1 do.
  mbinfo 'Command';'incomplete parens: ',s
case. 2 do.
  mbinfo 'Command';'unmatched parens: ',s
case. 3 do.
  mbinfo 'Command';'unmatched quotes: ',s
end.
)
exec=: 3 : 0
settermsize''
s=. dltb y
dlog_add s
qxc s
)
getcmd=: 3 : 0
ndx=. (y e. '.)',AlphaNum_j_) i. 0
inx=. (ndx{.y) i: ')'
if. inx=ndx do. Mode,')',y return. end.
m=. inx {. y
(inx }. y) ,~ m #~ *./\. m~:')'
)
getprompt=: 3 : 0
if. (Mode~:'j') *. #Context do.
  Mode,'.',Context,')'
else.
  Mode,')'
end.
)
moveit=: 3 : 0
line=. gtk_text_buffer_get_line_count termSB
if. line = 0 do. 0 return. end.
n=. #p=. getprompt''
txt=. readline line-1
if. -. p matchhead txt do. 0 return. end.
iter=. newitercursor termSB
row=. gtk_text_iter_get_line <iter
bgn=. newiterline termSB,line
select. y
fcase. GDK_Left do.
case. GDK_BackSpace do.
  if. (row = line-1) *. n = gtk_text_iter_get_line_offset <iter do.
    1 return.
  end.
case. GDK_Down do.
  if. (row = line-2) *. n > gtk_text_iter_get_line_offset <iter do.
    gtk_text_iter_forward_chars bgn;n
    gtk_text_buffer_place_cursor termSB;bgn
    1 return.
  end.
case. GDK_Home do.
  if. row = line-1 do.
    viewscrolliter termSV;bgn
    gtk_text_iter_forward_chars bgn;n
    gtk_text_buffer_place_cursor termSB;bgn
    1 return.
  end.
end.
0
)
promptnewlog=: 3 : 0
a=. getprompt''
if. -. a matchhead y do.
  y=. a,y
end.
promptnew y
)
setprompt=: 3 : 0
b=. 0 < #bufread termSB
term_append (b#LF),y,getprompt''
)
settermsize1=: 3 : 0
cmd '\c ',": 10 >. _6 0 + |.y
)
term_load_script_fmt=: 4 : 0
(getprompt''),'\l ',y
)
term_modeset=: 3 : 0
Mode=: y
t=. readlastline ''
t=. 1 delmode t
promptnew (getprompt''),t
1
)
togglemode=: 3 : 0
if. #y do.
  term_modeset y
else.
  Mode=: (Mode='q'){'qk'
end.
)
showprompt=: 3 : 0
if. ifOutput do.
  ifOutput=: 0
  gtk_text_view_scroll_to_mark termSV,termEnd,0 0 0 0
end.
EMPTY
)
term_append_run=: 3 : 0
last=. readline termSB,<:gtk_text_buffer_get_line_count termSB
cmd=. getcmd last,y
promptnew cmd
exec cmd
)

configrun_jcfg_''
cocurrent 'base'
13!:0[1
jgtkide''
