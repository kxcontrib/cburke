/ qview.q

f:{.[2:;(`qview;(x;1));-1]}
grid:f`grid
grids:f`grids
plot:f`plot
plots:f`plots

P:`:demo

tab0:("CFF";enlist ",") 0: ` sv P,`bookdepth.csv
tab1:("DFFFFI";enlist ",") 0: ` sv P,`ohlc.csv
tab2:("DFI";enlist ",") 0: ` sv P,`price.csv
tab21:("DFFF";enlist ",") 0: ` sv P,`price1.csv
tab22:("DSF";enlist ",") 0: ` sv P,`price2.csv
tab3:("UFF";enlist ",") 0: ` sv P,`regnms.csv
tab4:("UF";enlist ",") 0: ` sv P,`volprof.csv

f:{plots x;grids x;}

f tab0
f tab1
f tab2
f tab21
f tab22
f tab3
f tab4
