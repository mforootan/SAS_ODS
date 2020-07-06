/* Original data from Gomez&Gomez p81*/

PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET="C-Digitized$a1:d244";
			getnames=yes;

label group='Replication';
label block='Block';
label treatmnt='Genotype';
label yld='YIELD';

ods html file="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.html"
CONTENTS="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\CONTENTS.HTML"
PAGE="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\PAGE.HTML"
FRAME="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\THOR.HTML"; 
ods rtf file='C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.rtf';
ods listing close;


proc print data=roqumi label;

proc lattice data=roqumi;
var yld;
run;

ods html close;
ods rtf close;
