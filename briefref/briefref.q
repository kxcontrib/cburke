/ make briefref.html from simons help

h:getenv`HOME
S:`$":",h,"/svn/kx/contrib/simon/help/texts"
T:`$":",h,"/briefref.html"

Hdr:(
 "<html><head>";
 "<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\"/>";
 "<title>Q Brief Reference</title>\n<style>";
 "h3,h4 {color:#015293;font-family:sans-serif;border-bottom:2px solid silver;";
 " margin-top:1.2em;margin-bottom:0.5em;line-height:1.3}";
 "a{text-decoration:none}";
 "a:link{color:024C7E}";
 "a:visited{color:024C7E}";
 "a:active{color:958600}";
 "</style></head><body>";
 "<a name=\"top\"></a>";
 "<h3>Q Brief Reference</h3>";
 "<h4>Table of Contents</h4>")

briefhtml:{
 n:(key S) except `.svn;
 d:{read0 ` sv S,x} each n;
 t:first each d;
 x:iasc ("+." "."=first each t) ,' t;
 ndx:briefindex t x;
 txt:raze brieftext each d x;
 ftr:briefftr 0;
 Hdr,ndx,txt,ftr}

briefindex:{(enlist "<ul>"),(briefindex1 each x),enlist "</ul>"}
briefindex1:{
 x:trim x;
 k:alphonly lower x;
 "<a href=\"#",k,"\">",x,"</a><br/>"}

brieftext:{
 x:trims each x;
 k:alphonly lower h:x 0;
 t:.h.xs each 1_x;
 r:("<hr/>";"<a name=\"",k,"\"></a><h4>",h,"</h4>\n<pre>");
 r,t,enlist "</pre>\n<a href=\"#top\">return to top</a>"}

briefftr:{
 r:("<hr/>";"Source: Kx svn <a href=http://code.kx.com/wsvn/code/contrib/simon/help>contrib/simon/help</a>");
 r,("<br/>Built: ",string "d"$.z.p;"</body></html>")}

alphonly:{x where x in .Q.a}
trims:{x where ((&\)m)=reverse(&\)reverse m:x in " \n\t"}

T 0: briefhtml 0

\\