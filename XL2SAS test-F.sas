/* Original data from Der p80*/

PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET='F-multivariate$a2:n49';
			getnames=yes;


ods html file="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.html"
CONTENTS="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\CONTENTS.HTML"
PAGE="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\PAGE.HTML"
FRAME="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\THOR.HTML"; 
ods rtf file='C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.rtf';
ods listing close;

proc print data=roqumi label;

proc reg data=roqumi corr;
model R=Age S Ed Ex0 Ex1 LF M N NW U1 U2 W X;

proc gplot data=roqumi;
symbol cv=blue value=circle;
 /* plot (_numeric_); */


plot R*(Age--X) 
/*
/overlay 
*/
;

run;

ods html close;
ods rtf close;

