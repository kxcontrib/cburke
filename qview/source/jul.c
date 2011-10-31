/* jul.c  */

#include "main.h"
#include "jul.h"

int *q2ymd(int p,int *r)
{
  int c,d,m,y;
  double a;
  a=730425.75+p;
  c=floor(a/36524.25);
  d=floor(a-36524.25*c);
  y=floor((d+0.75)/365.25);
  d=floor(1.75+d-365.25*y);
  m=floor((d-0.59)/30.6);
  r[0]=(c*100)+y+(m>=10);
  r[1]=1+(m+2)%12;
  r[2]=floor(0.41+d-30.6*m);
  return r;
}

int ymd2q(int *p)
{
  int d,m,y,n,r,s;
  y=p[0];m=p[1];d=p[2];
  y=y-(m<=2);
  r=floor(y/100);
  s=floor(y-r*100);
  n=floor(r*36524.25)+floor(s*365.25);
  n=n+floor(0.41+d+30.6*((m+9)%12));
  return n-730426;
}

/* month to q */
int m2q(int p)
{
  int m,y;
  y=p/12;
  m=p-12*y;
  YMD[0]=2000+y;
  YMD[1]=1+m;
  YMD[2]=1;
  return ymd2q(YMD);
}
