all: rsa elgamal
.SUFFIXES: .rel .c

.c.rel:
	sdcc -mmcs51 -c $<

rsa: main_rsa.ihx

elgamal: main_elgamal.ihx

main_rsa.ihx: main_rsa.rel lib.rel
	sdcc -mmcs51 --iram-size 128 --xram-size 2049 --code-size 40960 --model-small main_rsa.rel lib.rel

main_elgamal.ihx: main_elgamal.rel lib.rel
	sdcc -mmcs51 --iram-size 128 --xram-size 2049 --code-size 40960 --model-small main_elgamal.rel lib.rel

clean:
	rm *.asm *.lnk *.map *.mem *.rel *.rst *.sym *.lst *~ *.aux *.bbl *.log *.blg

