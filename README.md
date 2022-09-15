The spreadsheet file contains raw data for different ANOVA models, SAS files point to individual sheets within the spreadsheet.

The ```XL2SAS test.xls``` contains sample raw data for different ANOVA models. They are letter-coded as follow:

* A: [Split-split plot](https://www.google.com/search?q=split-split+plot+design)
* B: [Latin square](https://www.google.com/search?q=latin-square)
* C: [Partially balanced lattice](https://www.google.com/search?q=partially+balanced+lattice)
* D: [Orthogonal contrast](https://www.google.com/search?q=orthogonal+contrast+anova)
* E: [ANOVA over location and year](https://www.google.com/search?q=ANOVA+over+location+and+years) ([fixed & random factors](https://www.google.com/search?q=fixed+and+random+factors)) 
* F: Multivariate analysis ([regression](https://www.google.com/search?q=multiple+regression) and [principal component analysis](https://www.google.com/search?q=principal+component+analysis))

Each design has data in raw format, pivoted format, and analysis results. The SAS codes are embedded in the sheets as a comment, but also saved as a separate file ```XL2SAS test-X.sas``` (```X``` corresponds to the above letters).

Codes contain ODS, so data would be read from the spreadsheet (**NOTE**: file paths are local and should be changed accordingly) and the output will be redirected both in ```HTML``` and ```RTF``` format.
