/ run

script "~qhome/chart/gnuplot/gnuplot.q"

/ try:
.g.plot 2 3 5 11
.g.plot sin 0.005 * (til 100) xexp\ 1 + 0.015 * til 10

\
script "~Dev/gnuplot/demo.q"
.g.gp1[]
.g.gp2[]
.g.gp3[]
.g.gp4[]
