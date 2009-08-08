NB. toj
NB.
NB. convert Q data to J

NB. =========================================================
dread=: 3 : 0
if. y=1 do.
  res=. POS { DAT
else.
  res=. (POS,:y) [;.0 DAT
end.
POS=: POS + y
res
)

NB. =========================================================
NB. convert Q data to J
NB.
NB. return returncode;result
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
FMT=: x NB. 0=raw,1=formatted,2=extended
res=. toJ ''
rc=. POS ~: #DAT
DAT=: ''
rc;<res
)

NB. =========================================================
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

NB. =========================================================
toJ_base=: 4 : 0
res=. x toJ_raw y
if. FMT=1 do.
  x toJ_fmt res
end.
)

NB. =========================================================
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
case. 13 do. _2 ic y
case. 14 do. _2 ic y
case. 15 do. roundtime toJ_float y
case. 17 do. _2 ic y
case. 18 do. _2 ic y
case. 19 do. _2 ic y
case. do. throw 'type: ',":x
end.
)

NB. =========================================================
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

NB. =========================================================
NB. can be done under try/catch when NaN signals J error
toJ_float=: 3 : 0
NB. try. _2 fc y
NB. catch.
t=. _8 [\ y
_2 fc , JFLOATNULL8 (I. KFLOATNULL -:"1 t) } t
NB. end.
)


NB. =========================================================
NB. same comment as for toJ_float
toJ_real=: 3 : 0
NB. try. _1 fc y
NB. catch.
t=. _4 [\ y
_1 fc , JREALNULL4 (I. KREALNULL -:"1 t) } t
NB. end.
)

NB. =========================================================
toJ_short=: 3 : 'JINTNULL (I. KSHORTNULL=y) } y=. _1 ic y'

NB. =========================================================
NB. dict (or table)
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

NB. =========================================================
NB. object
toJ_object=: 3 : 0
len=. _2 ic }. dread 5
res=. ''
for_i. i.len do.
  res=. res, <toJ ''
end.
)

NB. =========================================================
toJ_long=: 3 : 0
dat=. _8 [\ a.i.y
dat=. |."1 dat
neg=. 0 ~: {."1 dat
(256x #. }."1 dat) - neg * 2^56x
)

NB. =========================================================
NB. flip
toJ_flip=: 3 : 0
POS=: >: POS
res=. toJ ''
if. FMT~:2 do. |: res end.
)
