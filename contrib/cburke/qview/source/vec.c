/* vec.c
  dvec list of double
  ivec list of int
  dmat is a list of double with shape */

#include "main.h"
#include "vec.h"
#include "util.h"

void cvec_free(cvec *c){
  if (c!=NULL){DO(c->n,g_free(c->v[i]));g_free(c);}}

cvec *cvec_new(int len)
{
  cvec *r=g_malloc(sizeof(cvec));
  r->v=g_malloc0(len*sizeof(char *));
  r->n=len;
  return r;
}

void cvec_view(cvec *r)
{
  int max=5000;
  char *s=(char*) g_malloc0 (max*sizeof(char));
  g_strlcat(s,g_strdup_printf("len %d ",r->n),max);
  DO(r->n,g_strlcat(s,g_strdup_printf(" %s",r->v[i]),max));
  O("%s\n",s);
  g_free(s);
}

dvec *dvec_dup(dvec *d)
{
  dvec *r=dvec_new(d->n);
  DO(d->n,r->v[i]=d->v[i]);return r;
}

void dvec_except(dvec *d,double t)
{
  int j=0;
  DO(d->n,if (d->v[i]!=t)d->v[j++]=d->v[i]);
  d->n=j;
}

double dvec_first(dvec *d){return d->v[0];}

void dvec_free(dvec *d){if (d==NULL)return;g_free(d->v);g_free(d);}

/* interval 0={(0.5+til x)%x}  1={(til x)%x-1} */
dvec *dvec_int01(int len,int type)
{
  int d=len-type;dvec *r=dvec_new(len);
  if (type==0)
    {DO(len,r->v[i]=(0.5+i)/d);}
  else
    {DO(len,r->v[i]=i/d);}
  return r;
}

int dvec_has(dvec *d,double t)
{
  int i;
  for(i=0;i<d->n;i++)
    if (t==d->v[i]) return TRUE;
  return FALSE;
}

double dvec_last(dvec *d){return d->v[d->n-1];}
double dvec_min(dvec *d){return mind(d->n,d->v);}
double dvec_max(dvec *d){return maxd(d->n,d->v);}

dvec *dvec_new(int len)
{
  dvec *r=g_malloc(sizeof(dvec));
  r->v=(double *)g_malloc(len*sizeof(double));
  r->n=len;
  return r;
}

dvec *dvec_newv(int len,double *val)
{
  dvec *r=dvec_new(len);r->v=val;return r;
}

int dvec_runlength(dvec *d,int p)
{
  int r,s;
  double v;
  if(p>=d->n) return 0;
  r=1;
  s=d->n-p;
  v=d->v[p];
  while((r<s)&(v==d->v[p+r]))r++;
  return r;
}

dvec *dvec_til(int len)
{
  dvec *r=dvec_new(len);
  DO(len,r->v[i]=i);return r;
}

void dvec_view(dvec *r)
{
  int max=5000;
  char *s=(char*) g_malloc0 (max*sizeof(char));
  g_strlcat(s,g_strdup_printf("len %d ",r->n),max);
  DO(r->n,g_strlcat(s,g_strdup_printf(" %fl",r->v[i]),max));
  O("%s\n",s);
  g_free(s);
}

void ivec_free(ivec *d){if (d!=NULL){g_free(d->v);g_free(d);}}

ivec *ivec_new(int len)
{
  ivec *r=g_malloc(sizeof(ivec));
  r->v=(int *)g_malloc(len*sizeof(int));
  r->n=len;
  return r;
}

void ivec_view(ivec *r)
{
  int max=5000;
  char *s=(char*) g_malloc0 (max*sizeof(char));
  g_strlcat(s,g_strdup_printf("len %d ",r->n),max);
  DO(r->n,g_strlcat(s,g_strdup_printf(" %d",r->v[i]),max));
  O("%s\n",s);
  g_free(s);
}

void dmat_free(dmat *d){if (d==NULL)return;g_free(d->v);g_free(d);}

dmat *dmat_new(int rows,int cols)
{
  int len=rows*cols;
  dmat *r=g_malloc(sizeof(dmat));
  r->v=(double *)g_malloc(len*sizeof(double));
  r->n=len;
  r->r=rows;
  r->c=cols;
  return r;
}

dmat *dmat_newv(int rows,int cols,double *val)
{
  dmat *r=dmat_new(rows,cols);r->v=val;return r;
}

void dmat_view(dmat *r)
{
  int max=5000;
  char *s=(char*) g_malloc0 (max*sizeof(char));
  g_strlcat(s,g_strdup_printf("len %d, rws %d, cls %d ",r->n,r->r,r->c),max);
  DO(r->n,g_strlcat(s,g_strdup_printf(" %lf",r->v[i]),max));
  O("%s\n",s);
  g_free(s);
}

void dmat_write(dmat *d,int row,double *v)
{
  double *p=d->v+row*d->c;
  DO(d->c,p[i]=v[i]);
}
