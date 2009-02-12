NB. methods
NB.
NB. all methods return a pair:
NB.   returncode (0=success)
NB.   result or throw message
NB.
NB. all methods wrapped in try/catcht
NB.
NB. close
NB. cmd|cmdr|f|x
NB. cmdraw
NB. connect
NB. disconnect
NB. exec|execr|f|x
NB. get|f|x
NB. set
NB. sub
NB.
NB. messages are ASYNC (no result), or SYNC (result)

NB. =========================================================
close=: 3 : 0
destroy''
OK
)

NB. =========================================================
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

NB. =========================================================
NB. cmd: send command string to Q for execution, no response
NB. cmdr: with response
NB. cmdrf: with formatted response
NB. cmdrx: with extended response
NB. cmd
cmd=: 3 : 0
try. send ASYNC,wrapcmd y
  OK
catcht. thrown end.
)

NB. =========================================================
NB. cmdr
cmdr=: 3 : 0
try. send SYNC,wrapcmd y
  qread 0
catcht. thrown end.
)

NB. =========================================================
NB. cmdr
cmdrf=: 3 : 0
try. send SYNC,wrapcmd y
  qread 1
catcht. thrown end.
)

NB. =========================================================
NB. cmdr
cmdrx=: 3 : 0
try. send SYNC,wrapcmd y
  qread 2
catcht. thrown end.
)

NB. =========================================================
NB. cmdraw
NB.
NB. send command string to Q for execution, with raw response
NB.
NB. method intended for development only
cmdraw=: 3 : 0
try. send SYNC,wrapcmd y
  0;read ''
catcht. thrown end.
)

NB. =========================================================
disconnect=: 3 : 0
if. #SK do.
  sd_close :: ] SK
end.
)

NB. =========================================================
NB. exec
NB.
NB. sends function, parameter list
exec=: 3 : 0
try. send ASYNC,ftoQ y
  OK
catcht. thrown end.
)

NB. =========================================================
execr=: 3 : 0
try. send SYNC,ftoQ y
  qread 0
catcht. thrown end.
)

NB. =========================================================
execrf=: 3 : 0
try. send SYNC,ftoQ y
  qread 1
catcht. thrown end.
)

NB. =========================================================
execrx=: 3 : 0
try. send SYNC,ftoQ y
  qread 2
catcht. thrown end.
)

NB. =========================================================
NB. get - identical to cmdr
get=: cmdr
getf=: cmdrf
getx=: cmdrx

NB. =========================================================
NB. set v name set value
NB.
NB. sends "set";`name;value
NB.
NB. checks the name has been set, else signals throw.
set=: 4 : 0
try. sym=. s:<x
  'rc res'=. execr 'set';sym;<y
  if. (rc=0) *. res -: sym do.
    res=. EMPTY
  end.
  rc;res
catcht. thrown end.
)

NB. =========================================================
NB. subscribe to tickerplant
NB.
NB. sub table;syms or '' to close
NB.
NB. sub 'trade';'AIG IBM'
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
