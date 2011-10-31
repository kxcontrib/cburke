/* win.h */

#ifndef WIN
#define WIN

GThread *GT;
GtkWidget *DA,*HS,*VS,*WP;
cairo_t *CR;

PangoLayout *PL;
PangoFontDescription *CellFont;
PangoFontDescription *LabelFont,*LabelFontB,*CaptionFont,*TitleFont;

cairo_pattern_t *Black,*Blue,*BlueSel,*Coral,*Red,*Silver,*White;
cairo_pattern_t *FrameColor,*GridColor,*BuyColor,*SellColor;
cairo_pattern_t *DownColor,*UpColor,*InColor,*BarColor,*VolColor;
cairo_pattern_t *DarkGray,*DarkSlateGray;
cairo_pattern_t *LightBlue,*LightYellow,*PaleTurquoise;
cairo_pattern_t *GridAltBack,*GridBack,*GridNormal,*GridBorder;
cairo_pattern_t *GridLight;
cairo_pattern_t *GridShadow,*GridMark;
cairo_pattern_t *HdrBack;

int CellFontWid,CellFontHit,CellHit;
int DotWid,KeyWid,NumWid,TWid,XLabWid;
int InfWid[5];
int LabelWid,LabelHit;
int Tw,Th;
double Gx,Gy,Gw,Gh,Rx,Ry,Rw,Rh,Sx,Sy,Sw,Sh;
int Hx,Hy;
double Mx,Mr,My,Ms;

void drawtext(char *s,double x,double y);
void drawtexta(char *s,double x,double y,int align);

void drawgrid();
void drawplot();
void getgridfontsizes();
void getplotfontsizes();
void gl_init();
void glclear();
int scrollha_change(GtkAdjustment *a,gpointer d);
int scrollva_change(GtkAdjustment *a,gpointer d);
int scrollhs_change(GtkRange *r,GtkScrollType s,double v,gpointer d);
int scrollvs_change(GtkRange *r,GtkScrollType s,double v,gpointer d);
void scroll_init();
int win_done(int *index);
void win_resize();

#endif
