/ set

/ build set arguments
/ if x is empty, return and reset buffer

gflatten:{.Q.s x}
gwrite:{y 0: gflatten x}
