/* plot.c */

#include "main.h"
#include "state.h"
#include "util.h"
#include "win.h"
#include "plot.h"

static int Seq=0;
static K unkey(K p);
static void plot_defs();

void plot_defs()
{
  Lx=2;Ly=Ty=3;
  Mx=Mr=12.5;My=15.5;Ms=6.5;
  TicLen=3;MinTic=60;
  Tw=Th=0;
  PL=NULL;
}

void plot_free()
{
  cvec_free(XLab);
  cvec_free(YLab);
  Key=XLab=YLab=NULL;
  pKey=NULL;

  dvec_free(PDate);
  dvec_free(XPos);
  dvec_free(XTic);
  dvec_free(YTic);
  PDate=XPos=XTic=YTic=NULL;
  Date=Size=NULL;
  pDate=pSize=NULL;

  Kex=NULL;
  pKex=NULL;

  dmat_free(PData);
  Data=pData=PData=NULL;
}

K plot_init(K p)
{
  int cls;
  char **nms;
  K c;

  pSplit=pTime=0;

  if (0==Seq++) plot_defs();

  switch(p->t) {
    case 98 : break;
    case 99 : p=unkey(p);if (p==NULL) return p;break;
    default : return kerr("not a table");
  }

  plot_free();
  c=kK(p->k)[0];
  nms=kS(c);
  cls=c->n;
  if (cls==2) {
    if ((0==strcmp("minute",nms[0]))
     &&(0==strcmp("volume",nms[1])))
      return plot_volprof(p);
  }

  if (cls==3) {
    if ((0==strcmp("minute",nms[0]))
     &&(0==strcmp("inside",nms[1]))
     &&(0==strcmp("outside",nms[2])))
      return plot_regnms(p);

    if ((0==strcmp("side",nms[0]))
     &&(0==strcmp("price",nms[1]))
     &&(0==strcmp("size",nms[2])))
      return plot_bookdepth(p);
  }

  if (cls>4) {
    if ((0==strcmp("open",nms[1]))
     &&(0==strcmp("high",nms[2]))
     &&(0==strcmp("low",nms[3]))
     &&(0==strcmp("close",nms[4])))
      return plot_ohlc(p);
  }

  return plot_price(p);
}

K unkey(K p)
{
  K v;
  if (98==p->t) return r1(p);
  if (99!=p->t) return kerr("not dictionary");
  v=kK(p)[0];
  if (98!=v->t) return kerr("keys not a table");
  v=kK(p)[1];
  if (98!=v->t) return kerr("values not a table");
  return r1(ktd(p));
}

