/* plot.h */

#ifndef PLOT
#define PLOT

dvec *XPos,*XTic,*YTic;

typedef struct {
	double inx;
	double min;
	double max;
	dvec *p;
} axis;

void drawfooter();
void drawbookdepth();
void drawboxes();
void drawkeys();
void drawohlc();
void drawpost();
void drawpre(double mindef);
void drawprice();
void drawpricefini();
void drawpricesym();
void drawregnms();
void drawcaption();
void drawvolprof();
void drawvolprof();
void drawvolumes();
void drawxaxis();
void drawylabels();

axis *getaxis(int cnt,double min,double max);

cairo_pattern_t *glcolor(int i);

void plot_free();
K plot_init(K p);
K plot_bookdepth(K s);
K plot_ohlc(K s);
K plot_price(K s);
K plot_pricesym(K p);
K plot_regnms(K s);
K plot_volprof(K s);

#endif
