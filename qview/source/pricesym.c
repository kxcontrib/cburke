/* price.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "qcon.h"
#include "state.h"
#include "win.h"
#include "util.h"

static void drawpricessym();
static void nms2key(K c);

void drawpricesym()
{
  int cls,my;

  cls=Data->c;
  PDate=dvec_dup(Date);

  PData=dmat_new(1,cls);
  DO(Data->n,PData->v[i]=Data->v[i]);

  my=(int) My;
  setgxywh(Rx,Ry+my,Rw,Rh-(my+LabelHit+Ly));
  getdateaxis(0);

  drawpre(-1);
  drawpricessym();
  drawpost();
  drawkeys();
}

void drawpricessym()
{
  int cls,j,len,*m,p;
  double d,*x,*y;

  d=YMax-YMin;
  len=PData->n;
  cls=PData->c;
  DO(len,PData->v[i]=(PData->v[i]-YMin)/d);
  fitgrafy((dvec *)PData);
  fitgrafx(XPos);

  cairo_set_line_width(CR,1);
  x=XPos->v;
  y=PData->v;
  m=g_malloc(Kex->n*sizeof(int));
  DO(Kex->n,{
    p=0;
    for(j=0;j<len;j++)
      if (Kex->v[j]==i) m[p++]=j;
    if (p==0) continue;
    cairo_set_source(CR,glcolor(i));
    cairo_move_to(CR,x[m[0]],y[m[0]]);
    for(j=1;j<p;j++)
      cairo_line_to(CR,x[m[j]],y[m[j]]);
    cairo_stroke(CR);
  });
  g_free(m);
  drawpricefini();
}

K plot_pricesym(K p)
{
  int n;
  double *t;
  K c,v;

  v=kK(p->k)[1];
  c=kK(v)[1];
  n=c->n;

  nms2key(c);
  pData=dmat_new(1,n);
  c=kK(v)[2];
  t=getklist(c);
  if (t==NULL) return (K)0;
  DO(n,pData->v[i]=t[i]);
  g_free(t);

  pPlot();
  return ki(0);
}

void nms2key(K c)
{
  int n;
  K d,e;
  if (c->t==11) {
    d=qxf("asc",qxf("distinct",r1(c)));
    e=qxv("?",r1(d),r1(c));
  }
  else {
    d=qxf("distinct",qxf("value",r1(c)));
    e=c;
  }
  n=e->n;
  pKex=ivec_new(n);
  DO(n,pKex->v[i]=kI(e)[i]);
  n=d->n;
  pKey=cvec_new(n);
  DO(n,pKey->v[i]=g_strdup(kS(d)[i]));
}
