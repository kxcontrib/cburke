/* gl.c */

#include "main.h"
#include "state.h"
#include "win.h"

static void gl_init_color();
static void gl_init_font();
static void gl_init_stdcolor();

static double STDCLR[30] = {
  220,20,60,0,192,0,100,149,237,128,0,128,205,133,
  63,139,69,19,0,128,0,205,92,92,0,0,255,165,42,42};

static cairo_pattern_t **StdClr;

void drawtext(char *s,double x,double y)
{
  pango_layout_set_text(PL,s,-1);
  cairo_move_to(CR,x,y);
  pango_cairo_show_layout(CR,PL);
}

void drawtexta(char *s,double x,double y,int align)
{
  int w;
  pango_layout_set_text(PL,s,-1);
  pango_layout_get_pixel_size(PL,&w,NULL);
  cairo_move_to(CR,x-(align*w)/2.0,y);
  pango_cairo_show_layout(CR,PL);
}

void glclear()
{
  cairo_set_source(CR,White);
  cairo_rectangle(CR,0,0,Tw,Th);
  cairo_fill(CR);
}

void gl_init()
{
  gl_init_color();
  gl_init_stdcolor();
  gl_init_font();
}

void gl_init_color()
{
  Black=cairo_pattern_create_rgb(0,0,0);
  Blue=cairo_pattern_create_rgb(0,0,1);
  DarkGray=cairo_pattern_create_rgb(0.663,0.663,0.663);
  DarkSlateGray=cairo_pattern_create_rgb(0.1843,0.3098,0.3098);
  Red=cairo_pattern_create_rgb(1,0,0);
  Silver=cairo_pattern_create_rgb(0.7529,0.7529,0.7529);
  White=cairo_pattern_create_rgb(1,1,1);

/* grid -------------------- */
  GridNormal=Silver;
  GridBorder=DarkSlateGray;
  GridLight=White;
  GridShadow=DarkGray;
  GridMark=DarkSlateGray;
  GridAltBack=cairo_pattern_create_rgb(0.9412,0.9412,0.9804); // 240 240 250
  HdrBack=cairo_pattern_create_rgb(0.9098,0.8863,0.8627); // 232 226 220

/* plot -------------------- */
  FrameColor=cairo_pattern_create_rgb(0.666667,0.733333,0.8);
  GridColor=cairo_pattern_create_rgb(0.823529,0.882353,0.941176);
  BuyColor=cairo_pattern_create_rgb(0.8,0.4,0.333333);
  SellColor=cairo_pattern_create_rgb(0.4,0.8,0.666667);
  DownColor=cairo_pattern_create_rgb(0.752941,0,0);
  UpColor=cairo_pattern_create_rgb(0,0.752941,0);
  InColor=cairo_pattern_create_rgb(0.941176,0.972549,1); // AliceBlue
  BarColor=cairo_pattern_create_rgb(0.392157,0.584314,0.929412); // CornflowerBlue
  VolColor=cairo_pattern_create_rgb(0.254902,0.411765,0.882353); // RoyalBlue
}

void gl_init_font()
{
  CellFont=pango_font_description_from_string("sansserif 10");
  LabelFont=pango_font_description_from_string("sansserif 8");
  LabelFontB=pango_font_description_from_string("sansserif bold 8");
  CaptionFont=pango_font_description_from_string("sansserif bold 10");
  TitleFont=pango_font_description_from_string("sansserif 12");
}

void gl_init_stdcolor()
{
  int i,p;
  StdClr=(cairo_pattern_t **)g_malloc(10*sizeof(cairo_pattern_t *));
  for(i=0,p=0;i<10;i++) {
    StdClr[i]=cairo_pattern_create_rgb(
      STDCLR[p]/255,STDCLR[p+1]/255,STDCLR[p+2]/255);
    p+=3;
  }
}

cairo_pattern_t *glcolor(int i)
{
  return StdClr[i%10];
}

void getgridfontsizes()
{
  pango_layout_set_font_description(PL,CellFont);
  pango_layout_set_text(PL,"D",-1);
  pango_layout_get_pixel_size(PL,&CellFontWid,&CellFontHit);
  CellHit=CellFontHit+Hy*2;
  pango_layout_set_text(PL,".",-1);
  pango_layout_get_pixel_size(PL,&DotWid,NULL);
  pango_layout_set_text(PL,"2",-1);
  pango_layout_get_pixel_size(PL,&NumWid,NULL);
  pango_layout_set_text(PL,"T",-1);
  pango_layout_get_pixel_size(PL,&TWid,NULL);
  pango_layout_set_text(PL,"0W",-1);
  pango_layout_get_pixel_size(PL,&InfWid[1],NULL);
  pango_layout_set_text(PL,"-0W",-1);
  pango_layout_get_pixel_size(PL,&InfWid[2],NULL);
  pango_layout_set_text(PL,"0w",-1);
  pango_layout_get_pixel_size(PL,&InfWid[3],NULL);
  pango_layout_set_text(PL,"-0w",-1);
  pango_layout_get_pixel_size(PL,&InfWid[4],NULL);
}

void getplotfontsizes()
{
  pango_layout_set_font_description(PL,LabelFont);
  pango_layout_set_text(PL,"X",-1);
  pango_layout_get_pixel_size(PL,&LabelWid,&LabelHit);
  pango_layout_set_text(PL,"xxx",-1);
  pango_layout_get_pixel_size(PL,&KeyWid,NULL);
  pango_layout_set_text(PL,"XXXXXXX",-1);
  pango_layout_get_pixel_size(PL,&XLabWid,NULL);
}

int gettextwidth(char *txt)
{
  int w,h;
  pango_layout_set_text(PL,txt,-1);
  pango_layout_get_pixel_size(PL,&w,&h);
  return w;
}

