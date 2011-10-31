/* draw.c */

#include "main.h"
#include "grid.h"
#include "plot.h"
#include "state.h"
#include "util.h"
#include "win.h"

static char *Captions[]={
  "Book Depth","Open, High, Low, Close",
  "Price","RegNMS","Volume Profile"};

static int drawinit();
static void drawyaxis();

void drawplot()
{
  if (!drawinit()) return;
  getplotfontsizes();
  setrxywh(Mx,My,Tw-(Mx+Mr),Th-(My+Ms));
  drawcaption();
  drawfooter();
  switch(Type) {
    case 0 : drawbookdepth();break;
    case 1 : drawohlc();break;
    case 2 : drawprice();break;
    case 3 : drawregnms();break;
    case 4 : drawvolprof();break;
  }
}

void drawboxes()
{
  cairo_set_source(CR,FrameColor);
  cairo_rectangle(CR,Gx,Gy,Gw,Gh);
  cairo_stroke(CR);
}

void drawcaption()
{
  char *t;
  int w,h;
  double p;

  t=Caption;
  if(t==NULL)t=Captions[Type];
  if (0==strlen(t)) return;
  cairo_set_source(CR,Black);
  pango_layout_set_font_description(PL,TitleFont);
  pango_layout_set_text(PL,t,-1);
  pango_layout_get_pixel_size(PL,&w,&h);
  cairo_move_to(CR,Rx+(Rw-w)/2,Ry);
  pango_cairo_show_layout(CR,PL);
  p=h+Ty;
  setrxywh(Rx,(Ry+p),Rw,Rh-p);
}

void drawfooter()
{
  int h,w,y;
  if ((0==NZC(LFooter)) && (0==NZC(RFooter))) return;
  pango_layout_set_font_description(PL,LabelFont);
  y=Ry+Rh-LabelHit;
  if (NZC(LFooter))
    drawtext(LFooter,Mx,y);
  if (NZC(RFooter)) {
    pango_layout_set_text(PL,RFooter,-1);
    pango_layout_get_pixel_size(PL,&w,&h);
    y=Ry + Rh - LabelHit;
    cairo_move_to(CR,Rx+Rw-w,y);
    pango_cairo_show_layout(CR,PL);
  }
  setrxywh(Rx,Ry,Rw,Rh-LabelHit);
}


int drawinit()
{
  if ((0==Tw) || 0==Th) return FALSE;
  glclear();
  return TRUE;
}

void drawpost()
{
  drawylabels();
}

void drawpre(double mindef)
{
  getyaxis(mindef);
  drawyaxis();
  drawxaxis();
  drawboxes();
}

void drawxaxis()
{
  int i,len,w,h;
  double gs;
  dvec *xtic;

  len=XTic->n;
  if (len==0) return;

  xtic=dvec_dup(XTic);
  fitgrafx(xtic);

  gs=Gy+Gh;
  cairo_set_line_width(CR,1);
  cairo_set_source(CR,GridColor);
  for(i=0;i<len;i++) {
    cairo_move_to(CR,xtic->v[i],Gy);
    cairo_line_to(CR,xtic->v[i],gs);
  }
  cairo_stroke(CR);
  gs=gs+Ly;
  pango_layout_set_font_description(PL,LabelFont);
  cairo_set_source(CR,Black);
  for(i=0;i<len;i++) {
    pango_layout_set_text(PL,XLab->v[i],-1);
    pango_layout_get_pixel_size(PL,&w,&h);
    cairo_move_to(CR,xtic->v[i]-(w/2.0),gs);
    pango_cairo_show_layout(CR,PL);
  }
  g_free(xtic);
}

void drawyaxis()
{
  int i,len;
  double gr,*val;
  if (0==YTic->n) return;
  dvec *p;
  gr=Gx+Gw;
  p=dvec_dup(YTic);
  dvec_except(p,0);
  dvec_except(p,1);
  len=p->n;
  if (len==0) return;
  val=p->v;
  DO(len,val[i]=1-val[i]);
  fitgrafy(p);
  cairo_set_line_width(CR,1);
  cairo_set_source(CR,GridColor);
  for(i=0;i<len;i++) {
    cairo_move_to(CR,Gx,val[i]);
    cairo_line_to(CR,gr,val[i]);
  }
  cairo_stroke(CR);
  g_free(p);
}

void drawylabels()
{
  double x,p;

  if (0==YTic->n) return;

  pango_layout_set_font_description(PL,LabelFont);
  cairo_set_source(CR,Black);
  fitgrafy(YTic);

  DO(YTic->n,YTic->v[i]=roundint(YTic->v[i])-LabelHit);

  x=Gx+Lx;
  DO(YTic->n,{
    p=YTic->v[i];
    if (p>Gy)
      drawtext(YLab->v[i],x,p);
  });
}
