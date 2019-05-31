compiler: y.tab.c lex.yy.c table_symboles.c tab_instru.c 
	gcc lex.yy.c y.tab.c table_symboles.c tab_instru.c -o compiler -ly -ll

lex.yy.c: compiler.l
	flex compiler.l

y.tab.c: compiler.y
	yacc -d -v -t compiler.y

clean:
	rm -rf *.yy.c *.t compiler y.tab.* y.output testTabSym.txt
