/ cx.q
/ example clients

x:.z.x 0                  / client type
s:`all;                   / default all symbols
d:`GOOG`IBM`MSFT          / symbol selection
t:`trade`quote            / default tables
h:hopen `::5010           / connect to tickerplant

/ rdb
if[x~"rdb";
 upd:insert]

/ high low close volume
if[x~"hlcv";
 t:`trade;
 hlcv:([sym:()]high:();low:();price:();size:());
 upd:{[t;x]hlcv::select max high,min low,last price,sum size by sym
  from(0!hlcv),select sym,high:price,low:price,price,size from x}]

/ last
if[x~"last";
 upd:{[t;x].[t;();,;select by sym from x]}]

/ show only
if[x~"show";upd:{show x;show y}]

/ all trades with then current quote
if[x~"tq";
 upd:{[t;x]$[t~`trade;
  @[{tq,:x lj q};x;""];
  q,:select by sym from x]}]

if[x~"vwap";t:`trade;
 upd:{[t;x]vwap+:select size wsum price,sum size by sym from x};
 upds:{[t;x]vwap+:select size wsum price,sum size by sym from x;show x}]

{h("sub";x;s)} each t;
