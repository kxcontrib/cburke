NB. built from project: ~Qclient/base/base
NB. init

script_z_ '~system/main/dates.ijs'
script_z_ '~system/main/dll.ijs'
script_z_ '~system/main/libpath.ijs'
script_z_ '~system/main/socket.ijs'

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
roundtime=: (%86400) & round
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
qread=: 3 : 0
y qtoJ 8 }. read''
)
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
'rc tim'=. fix_second 11 }."1 y
if. rc=10 do. 10;y return. end.
15;JFLOATNULL (I.msk) } dat + tim % 86400
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
fmt_date=: 3 : 0
res=. '.' 4 7 }"1 [ 4 3 3 ": 0 100 100 +"1 todate 73048 + ,y
JDATENULL (I. y= JINTNULL) } res
)
fmt_datetime=: 3 : 0
res=. (fmt_date <. y),.'T',.fmt_second roundint 86400 * 1 | y
JDATETIMENULL (I. y= JFLOATNULL) } res
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


ALPH0=: {.a.
OK=: 0;EMPTY
THROW=: ''

KSHORTNULL=: <.-2^15
KFLOATNULL=: 0 0 0 0 0 0 248 255 { a. 
KREALNULL=: 0 0 192 255 { a.

JINTNULL=: <.-2^31
JFLOATNULL=: __
JLONGNULL=: -2^56x
JDATENULL=: 'nnnn.nn.nn'
JDATETIMENULL=: 'nnnn.nn.nnTnn:nn:nn'
JMINUTENULL=: 'nn:nn'
JMONTHNULL=: 'nnnn.nnm'
JSECONDNULL=: 'nn:nn:nn'
JTIMENULL=: 'nn:nn:nn.nnn'

JFLOATNULL8=: 2 fc JFLOATNULL
JREALNULL4=: 1 fc JFLOATNULL
MAXREAD=: 5000
MAXREADF=: 4000
endian=. a. i. {. 1 ic 1
ASYNC=: (endian,0 0 0) { a.
SYNC=: (endian,1 0 0) { a.
RESPONSE=: (endian,2 0 0) { a.
j=. ];._2 (0 : 0)
boolean   1b                   b     1     1
byte      0xff                 x     4     1
short     23h                  h     5     2     0Nh
int       23                   i     6     4     0N
long      23j                  j     7     8     0Nj
real      2.3e                 e     8     4     0Ne
float     2.3                  f     9     8     0n
char      "a"                  c     10    1     " "
varchar   `ab                  s     11    *     `
month     2003.03m             m     13    4     0Nm
date      2003.03.23           d     14    4     0Nd
datetime  2003.03.23T08:31:53  z     15    8     0Nz
minute    08:31                u     17    4     0Nu
second    08:31:53             v     18    4     0Nv
time      09:10:35.000         t     19    4     0Nt
enum      `s$`b, where s:`a`b  *     20..  4     `s$..
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
  send USER,{.a.
  res=. read''
  if. res -: ,'c' do.
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
case. 19 do. fix_datetime y
case. do. 10;y
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
WAIT=: 20000
WAIT=: 2000  
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
if. 128 = a.i.{.y do.
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
case. 13 do. _2 ic y
case. 14 do. _2 ic y
case. 15 do. roundtime toJ_float y
case. 17 do. _2 ic y
case. 18 do. _2 ic y
case. 19 do. _2 ic y
case. do. throw 'type: ',":x
end.
)
toJ_fmt=: 4 : 0
select. x
case. 13 do. fmt_month y
case. 14 do. fmt_date y
case. 15 do. fmt_datetime y
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
neg=. 0 ~: {."1 dat
(256x #. }."1 dat) - neg * 2^56x
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
case. 13 do. 2 ic y
case. 14 do. 2 ic y
case. 15 do. 2 fc y
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
neg=. y < 1
dat=. y + neg * 2^56x
dat=. (255*neg) ,"0 1 (7#256) #: dat
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
