lisa2: lisa2.yy.c lisa2.tab.c
	g++ -static -g lex.yy.c lisa2.tab.c -o lisa2

lisa2.yy.c: lisa2.tab.c lisa2.l
	flex lisa2.l

lisa2.tab.c: lisa2.y
	bison -d lisa2.y

clean:
	rm -rf lex.yy.c lisa2.tab.c lisa2.tab.h lisa2
