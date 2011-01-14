NB. qtype
NB.
NB. get Q type from J data

NB. =========================================================
NB. qtype
NB.
NB. return: type;data
qtype=: 3 : 0
NB. smoutput 'qtype';($y);y
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

NB. =========================================================
qtypechar1=: 3 : 0
'typ dat'=. qtypechar2 ,:y
if. typ=10 do. dat=. ,dat else. dat=. {.dat end.
typ;dat
)

NB. =========================================================
qtypechar2=: 3 : 0
NB. smoutput 'qtypechar2';($y);y
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

NB. =========================================================
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
  case. 0 1 do. 99 NB. dict
  case. 1 0 do. 98 NB. flip
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
