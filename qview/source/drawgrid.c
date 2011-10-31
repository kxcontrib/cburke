/* drawgrid.c */

#include "main.h"
#include "state.h"
#include "util.h"
#include "win.h"
#include "grid.h"

static int Align[]={0,1,0,0,2,2,2,2,2,2,1,0,2,2,2,2,2,2,2,2,0};

static void drawcells();
static void drawcellback();
static void drawcelllines();
static void drawframe();
static void drawhdr();
static int drawinit();
static void drawsizes();

void drawgrid()
{
  if (!drawinit()) return;
  pango_layout_set_font_description(PL,CellFont);
  drawsizes();
  drawhdr();
  drawcellback();
  drawcelllines();
  drawcells();
  drawframe();
}

void drawcells()
{
  int i,h,j,p,t;
  int m,x,y,r;

  h=CellFontHit+Hy*2;
  cairo_set_source(CR,Black);

  x=Gx+Lwid+0.5;
  t=MIN(Drws,Rws-Ny);

  for(i=Nx;i<Nx+Dcls;i++){
    p=Ny+Rws*i;
    r=x+Cwid[i];

    switch(Align[MIN(20,Ctyp[i])]){
      case 0 :
        m=x+Hx;
        y=Gy+CellHit+Hy+0.5;
        for(j=0;j<t;j++) {
          pango_layout_set_text(PL,Valp[p++],-1);
          cairo_move_to(CR,m,y);
          pango_cairo_show_layout(CR,PL);
          y+=CellHit;
        }
        break;
      case 1 :
        m=x+r;
        y=Gy+CellHit+Hy+0.5;
        for(j=0;j<t;j++) {
          pango_layout_set_text(PL,Valp[p],-1);
          cairo_move_to(CR,(m-Valw[p++])/2,y);
          pango_cairo_show_layout(CR,PL);
          y+=CellHit;
        }
        break;
      case 2 :
        m=r-Hx;
        y=Gy+CellHit+Hy+0.5;
        for(j=0;j<t;j++) {
          pango_layout_set_text(PL,Valp[p],-1);
          cairo_move_to(CR,m-Valw[p++],y);
          pango_cairo_show_layout(CR,PL);
          y+=CellHit;
        }
        break;
    }
    x=r;
  }
}

void drawcellback()
{
  int h,w;
  double x,y;
  cairo_set_source(CR,GridAltBack);
  x=Gx+Lwid;
  y=Gy+CellHit;
  h=CellHit;
  w=Dw-Lwid;
  DO((Drws+1)/2,{
    cairo_rectangle(CR,x,y,w,h);
    y+=CellHit*2;});
  cairo_fill(CR);
}

void drawcelllines()
{
  double x,y;

  cairo_set_line_width(CR,1);
  cairo_set_source(CR,GridLight);

  cairo_move_to(CR,Gx,Gy+1);
  cairo_line_to(CR,Gx+Dw,Gy+1);
  cairo_move_to(CR,Gx+1,Gy);
  cairo_line_to(CR,Gx+1,Gy+Dh);

  x=Gx;
  y=Gy+CellHit+1;
  DO(Drws,{
    cairo_move_to(CR,x,y);
    cairo_line_to(CR,x+Lwid,y);
    y+=CellHit;});

  x=Gx+Lwid+1;
  y=Gy;
  DO(Dcls,{
    cairo_move_to(CR,x,y);
    cairo_line_to(CR,x,y+CellHit);
    x+=Cwid[i+Nx];});
  cairo_stroke(CR);

  cairo_set_source(CR,GridNormal);
  x=Gx;
  y=Gy+CellHit;
  DO(Drws,{
   cairo_move_to(CR,x,y);
   cairo_line_to(CR,x+Dw,y);
   y+=CellHit;});

  cairo_set_source(CR,GridNormal);
  cairo_set_source(CR,Black);
  x=Gx+Lwid;
  y=Gy;
  DO(Dcls,{
    cairo_move_to(CR,x,y);
    cairo_line_to(CR,x,y+Dh);
    x+=Cwid[i+Nx];});
  cairo_stroke(CR);
}

void drawframe()
{
  cairo_set_source(CR,GridBorder);
  cairo_set_line_width(CR,1);
  cairo_rectangle(CR,Gx,Gy,Dw,Dh);
  cairo_stroke(CR);
}

void drawhdr()
{
  char buf[12];
  int i,m,r,x,y;

  cairo_set_source(CR,HdrBack);
  cairo_rectangle(CR,Gx,Gy,Dw,CellHit);
  cairo_rectangle(CR,Gx,Gy,Lwid,Dh);
  cairo_fill(CR);
  cairo_set_source(CR,Black);
  r=Gx+Lwid-Hx;
  y=Gy+CellHit+Hy+0.5;
  DO(Drws,{
     x=r-NumWid*sprintf(buf,"%d",i+Ny);
     pango_layout_set_text(PL,buf,-1);
     cairo_move_to(CR,x,y);
     pango_cairo_show_layout(CR,PL);
     y+=CellHit;});
  x=Gx+Lwid;
  y=Gy+Hy+0.5;
  for(i=Nx;i<Nx+Dcls;i++){
    r=x+Cwid[i];
    m=(x+r-Hwid[i])/2;
    pango_layout_set_text(PL,Hnms[i],-1);
    cairo_move_to(CR,m,y);
    pango_cairo_show_layout(CR,PL);
    x=r;
  }
}

int drawinit()
{
  if ((0==Tw) || 0==Th) return FALSE;
  glclear();
  scroll_init();
  return TRUE;
}

void drawsizes()
{
  int i,s;

  setgxywh(0.5,0.5,Tw-1,Th-1);
  Drws=MIN(Rws-Ny,1+ceil((Gh-Gy)/CellHit));
  Dh=MIN(Gh,(Drws+1)*CellHit);

  for(i=Nx,s=Lwid;i<Cls;i++) {
    s+=Cwid[i];
    if (s>Gw) break;
  }
  Dcls=MIN(Cls-Nx,i);
  Dw=MIN(Gw,s);
}
