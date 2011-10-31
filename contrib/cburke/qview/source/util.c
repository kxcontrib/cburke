/* util.c */

#include "main.h"
#include "util.h"

static double TOL=1e-13;

double frac(double t){return t-floor(t);}

double *getklist(K p)
{
  double *r;

  r=g_malloc(p->n*sizeof(double));
  switch(p->t){
    case 1 : case 4 : DO(p->n,r[i]=kG(p)[i]);break;
    case 5 : DO(p->n,r[i]=kH(p)[i]);break;
    case 6 : case 13 : case 14 : case 17 : case 18 :
      DO(p->n,r[i]=kI(p)[i]);break;
    case 7 : case 16 : DO(p->n,r[i]=kJ(p)[i]);break;
    case 8 : DO(p->n,r[i]=kE(p)[i]);break;
    case 9 : case 15 : DO(p->n,r[i]=kF(p)[i]);break;
    case 10 : DO(p->n,r[i]=kC(p)[i]);break;
    default : g_free(r);return (double *)kerr("invalid numeric type");
  }
  return r;
}

int iskeyedtable(K p)
{
  K v;
  if (99!=p->t) return FALSE;
  v=kK(p)[0];
  if (98!=v->t) return FALSE;
  v=kK(p)[1];
  if (98!=v->t) return FALSE;
  return TRUE;
}

double maxd(int n,double *d)
{
  double r=DBL_MIN;DO(n,if (r<d[i])r=d[i]);return r;
}

double mind(int n,double *d)
{
  double r=DBL_MAX;DO(n,if (r>d[i])r=d[i]);return r;
}

int mini(int n,int *t)
{
  int r=INT_MAX;DO(n,if (r>t[i])r=t[i]);return r;
}

int maxi(int n,int *t)
{
  int r=INT_MIN;DO(n,if (r<t[i])r=t[i]);return r;
}

double rounddn(double num,double scale)
{
  return scale*floor(num/scale);
}

int roundint(double num)
{
  if (num<0) return (int)num-0.5; else return (int)(num+0.5);
}

double roundup(double num,double scale)
{
  return scale*ceil(num/scale);
}

int strhas(char *s,char t)
{
  while(*s) if(t==*s++) return 1;return 0;
}

int tolceil(double a)
{
  if (a<0) return 1+(int)(a+a*TOL);else return 1+(int)(a-a*TOL);;
}

int tolequal(double a,double b)
{
  return (fabs(a-b))<=TOL*MAX(fabs(a),fabs(b));
}

int tolfloor(double a)
{
  if (a<0) return (int)(a-a*TOL);else return (int)(a+a*TOL);;
}

