/* bookdepth.c */

#include "main.h"
#include "fmt.h"
#include "plot.h"
#include "state.h"
#include "win.h"
#include "util.h"

static int pmo[2]={-1,1};

void drawbookdepth()
{
  int bid,cnt,h,len,lw,mw,my,ndx;
  int *yext;
  double del,max,mid,min,s,t,*size,*w,*y;
  axis *x;

  len=Size->n;
  bid=0;DO(len,bid+=0>Size->v[i]);

  size=g_malloc(len*sizeof(double));
  DO(len,size[i]=fabs(Size->v[i]));

  min=dvec_min(Size);
  max=dvec_max(Size);

  cnt=MAX(2,MIN(8,(Rw-2*Lx)/XLabWid));

  YLab=fmtlabel((dvec *)Data);
  yext=g_malloc(len*sizeof(int));
  pango_layout_set_font_description(PL,LabelFont);
  DO(len,yext[i]=gettextwidth(YLab->v[i]));

  my=(int)My;
  lw=XLabWid/2;
  mw=TicLen+MAX(lw,maxi(len,yext));
  setgxywh(Rx+mw,Ry+my,Rw-(mw+lw),Rh-(my+LabelHit+Ly));

  x=getaxis(cnt,min,max);
  XPos=x->p;
  XLab=fmtlabel(XPos);
  XTic=dvec_dup(XPos);
  del=x->max-x->min;
  DO(XTic->n,XTic->v[i]=(XTic->v[i]-x->min)/del);

  YMin=x->min;
  YMax=x->max;
  YTic=dvec_dup(x->p);
  DO(YTic->n,YTic->v[i]=(YTic->v[i]-YMin)/(YMax-YMin));

  h=Gh/(1+len);
  y=g_malloc(len*sizeof(double));
  s=len;t=1.0/(2*s);
  DO(len,y[i]=Gy+Gh*(1-(t+i/s)));
  h=h/4;

  cairo_set_line_width(CR,1);
  cairo_set_source(CR,GridColor);
  DO(len,{
    cairo_move_to(CR,Gx-TicLen,y[i]);
    cairo_line_to(CR,Gx+Gw,y[i]);});
  cairo_stroke(CR);

  t=LabelHit/2;
  pango_layout_set_font_description(PL,LabelFont);
  cairo_set_source(CR,Black);

  DO(len,{
    pango_layout_set_text(PL,YLab->v[i],-1);
    cairo_move_to(CR,Gx-(TicLen+2+yext[i]),y[i]-t);
    pango_cairo_show_layout(CR,PL);});

  drawxaxis();
  drawboxes();

  fitgrafx(XTic);
  for(ndx=0;ndx<len;ndx++)
    if (XPos->v[ndx]==0)break;
  mid=XTic->v[ndx];
  cairo_set_source(CR,FrameColor);
  cairo_move_to(CR,mid,Gy);
  cairo_line_to(CR,mid,Gy+Gh);
  cairo_stroke(CR);

  w=g_malloc(len*sizeof(double));
  DO(len,w[i]=roundint(Gw*Size->v[i]/del));
  cairo_set_source(CR,BuyColor);
  DO(bid,{
   cairo_rectangle(CR,mid,y[i]-h,w[i],2*h);
   cairo_fill(CR);});

  cairo_set_source(CR,SellColor);
  DO(len-bid,{
    cairo_rectangle(CR,mid,y[i+bid]-h,w[i+bid],2*h);
    cairo_fill(CR);});

  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,LabelFontB);
  pango_layout_set_text(PL,"Price/Size",-1);
  cairo_move_to(CR,Gx,Gy-(LabelHit+Ly));
  pango_cairo_show_layout(CR,PL);

  g_free(size);
  g_free(w);
  g_free(yext);
}

/* side,price,size */
K plot_bookdepth(K p)
{
  int n;
  double *t;
  K c,s,v;

pType=0;
  v=kK(p->k)[1];
  s=kK(v)[0];
  n=s->n;

  c=kK(v)[1];
  t=getklist(c);
  if (t==NULL) return (K)0;
  pData=dmat_newv(1,n,t);

  c=kK(v)[2];
  t=getklist(c);
  if (t==NULL) return (K)0;
  pSize=dvec_newv(n,t);
  DO(n,pSize->v[i]=pSize->v[i]*pmo['S'==kC(s)[i]]);

  pPlot();
  return ki(0);
}

