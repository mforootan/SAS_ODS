/* Original data from Yazdi p199*/

PROC IMPORT DATAFILE= "C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.xls" 
			OUT= roqumi 
        	DBMS=EXCEL2000 REPLACE;
			SHEET="D-Digitized$a1:c49";
			getnames=yes;

label rep='Replication';
label treat='Treatment';
label cnt='Count';


ods html file="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.html"
CONTENTS="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\CONTENTS.HTML"
PAGE="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\PAGE.HTML"
FRAME="C:\Documents and Settings\forootan\My Documents\RIFR\SAS\THOR.HTML"; 
ods rtf file='C:\Documents and Settings\forootan\My Documents\RIFR\SAS\XL2SAS test.rtf';
ods listing close;


proc print data=roqumi label;

proc glm data=roqumi;
/* NOTES: 
1. for orthogonal comparison, PROC ANOVA doesn't support CONTRAST
2. model variables are automatically sorted, so the coefficiets should be assigned accordingly. It is therefore recommended that treatments be sorted proir to exporting to SAS.
*/

/*A(O) B(hg1) C(hg2) D(mfA1) H(mfA2) F(mfBn1) G(mfBn2) E(mfBo)*/

class rep treat; 
model cnt= rep treat/ss3;
contrast 'O vs. others' treat +7 -1 -1 -1 -1 -1 -1 -1;
contrast 'hg vs. mf' treat 0 +5 +5 -2 -2 -2 -2 -2;
contrast 'hg1 vs. hg2' treat 0 +1 -1 0 0 0 0 0;
contrast 'mfA vs. mfB' treat 0 0 0 +3 +3 -2 -2 -2;
contrast 'mfA1 vs. mfA2' treat 0 0 0 +1 -1 0 0 0;
contrast 'mfBn vs mfBo' treat 0 0 0 0 0 +1 +1 -2;
contrast 'mfBn1 vs mfBn2' treat 0 0 0 0 0 +1 -1 0;


means treat /duncan lines;

run;

ods html close;
ods rtf close;
