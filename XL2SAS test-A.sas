/* Original data from Basiri p430*/

PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET="A-Digitized$a1:e49";
			getnames=yes;

label ir='Irrigation';
label gen='Genotype';
label ch='Chemical';
label rep='Replication';
label cnt='Count';
ods html file="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.html"
CONTENTS="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\CONTENTS.HTML"
PAGE="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\PAGE.HTML"
FRAME="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\THOR.HTML"; 
ods rtf file='C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.rtf';
ods listing close;


proc print data=roqumi label;

/* A simple 2*2*4 factorial design */
proc glm data=roqumi;
class rep ir gen ch;
model cnt= 
rep 
ir 
gen 
ch 
ir*gen 
ir*ch 
gen*ch 
ir*gen*ch
/ss3;

/* A split-plot design with Irrigation & genotype in main plot, and chemical in sub-subplot*/
proc glm data=roqumi;
class rep ir gen ch;
model cnt=
rep 
ir 
gen 
ir*gen 
rep(ir gen)
ch 
ir*ch 
gen*ch 
ir*gen*ch
/ss3;

test h=ir gen ir*gen e=rep(ir gen);


/* A split-split plot design with Irrigation in main plot, genotype in subplot, and chemical in sub-subplot*/
proc anova data=roqumi;
class rep ir gen ch;
model cnt= 
rep 
ir 
rep*ir 
gen 
ir*gen 
rep*gen(ir) 
ch 
ir*ch 
gen*ch 
ir*gen*ch
;

test h=rep ir e=rep*ir;
test h=gen ir*gen e=rep*gen(ir);

means ir|gen|ch / duncan lines;

run;
ods html close;
ods rtf close;
