openssl enc -pass pass:TheKeyUsedToEncrypt -aes-256-cbc -salt \
              -in PAYLOAD.pdf -out PAYLOAD.pdf.enc
ls -l PAYLOAD.pdf.enc
PRINT=-printIndiv
#$ PRINT=-printOne
java -jar secretshare.jar split -k 3 -n 6 -sS "TheKeyUsedToEncrypt" $PRINT
java -jar secretshare.jar combine -k 3 \
   -s2 1882356874773438980155973947620693982153929916 \
   -s4 1882357204724127580025723830249209987221192644 \
   -s5 1882357444072759374568880025530775541595539408
openssl enc -d -pass pass:TheKeyUsedToEncrypt -aes-256-cbc \
              -in PAYLOAD.pdf.enc -out RECOVER.pdf
cmp PAYLOAD.pdf RECOVER.pdf
open RECOVER.pdf
~                      
