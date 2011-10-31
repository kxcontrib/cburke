/* fmt.h */

#ifndef FMT
#define FMT

int fmtdate(int day,char *buf,int first);
cvec *fmtday(dvec *p);
cvec *fmtlabel(dvec *p);
cvec *fmtmonth(dvec *p);
cvec *fmttime(ivec *p,int w);
cvec *fmtyear(dvec *p);

#endif
