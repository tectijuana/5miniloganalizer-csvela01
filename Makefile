all:
	as -o analyzer.o analyzer.s
	ld -o analyzer analyzer.o

run:
	cat logs.txt | ./analyzer
