/* util.h */

#ifndef UTIL
#define UTIL

char *Title,*RFooter,*LFooter;
int Lx,Ly,Ty;
int MinTic,TicLen;
int xData;
double YMin,YMax;
K Qarg;

void fitgrafx(dvec *p);
void fitgrafy(dvec *p);
double frac(double t);
void getdateaxis(int type);
dvec *getdatetime(K p);
double *getklist(K p);
int gettextwidth(char *txt);
void getyaxis(double mindef);
int iskeyedtable(K p);

double mind(int len,double *d);
double maxd(int len,double *d);
int mini(int n,int *t);
int maxi(int n,int *t);
void ps(char *p);
int *q2ymd(int p,int *r);
double rounddn(double num,double scale);
int roundint(double num);
double roundup(double num,double scale);
void setgxywh(double x,double y,double w,double h);
void setrxywh(double x,double y,double w,double h);
void setsxywh(double x,double y,double w,double h);
int strhas(char *s,char t);
int tolceil(double a);
int tolequal(double a,double b);
int tolfloor(double a);
void win_init();
void win_open();
ivec *xmonth(int day);
ivec *xquarter(int day);
ivec *xsemi(int day);
ivec *xyear(int day,int len);
ivec *xweek(int day);
ivec *xweek2(int day);
int ymd2q(int *p);

#endif
