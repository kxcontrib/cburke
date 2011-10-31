/* state.h */

#ifndef STATE
#define STATE

char *pVal,*Val,**Valp,**Hnms;

int Class,HV,VV,Nx,Ny,SB;
int Keys,Index,Split,Time,Type;
int pIndex,pSplit,pTime,pType;
int Lwid,Twid,Rws,Cls;

int xVal;
int *Valn,*Valw,*Ctyp,*Cwid,*Hwid;

char* Caption;
cvec *Key,*pKey,*XLab,*YLab;
ivec *Kex,*pKex;
dvec *Date,*pDate,*PDate,*Size,*pSize;
dmat *Data,*pData,*PData;

void gGrid();
void gScroll();
void pPlot();
void sDraw();
void sWin();

int state_count();
void state_defDA(GtkWidget *w);
void state_defSB(GtkWidget *w);
void state_defWP(GtkWidget *w);
void state_def(int i);
void state_delete(int i);
int state_index(int n);
void state_init();
void state_maxxy(int *mx,int *my);
void state_view();

#endif
