# CobolR - An R interface to Cobol

Really just a wrapper for [GnuCOBOL](https://gnucobol.sourceforge.io). 

To test that you have GnuCOBOL installed, try:
```bash
cobc -V
```
If so, you can create R-functions of COBOL programs like this:
```R
source('./R/cobolR.R')

cobolCode <- '
IDENTIFICATION DIVISION.
PROGRAM-ID. summa.
DATA DIVISION.
WORKING-STORAGE SECTION.
    01 WS-ADD     USAGE  BINARY-LONG.
LINKAGE SECTION.
    01 INP-VAL-1    USAGE BINARY-LONG.
    01 INP-VAL-2    USAGE BINARY-LONG.
PROCEDURE DIVISION USING INP-VAL-1 INP-VAL-2.
        ADD INP-VAL-1 INP-VAL-2 GIVING WS-ADD.
        DISPLAY "Sum is "WS-ADD.   
EXIT.
'

cobolSum <- cobolR(cobolCode)

res <- cobolSum(as.integer(1000),as.integer(1234))
```
This should print: 
![output](/documentation/output.png)


