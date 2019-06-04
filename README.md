# TP System-informatique INSA 4ème année 
Compilateur_with_lex_and_yacc-
Developpement d'un compilateur en utilisant lex et yacc
The UnitTest doc include all the test of instruction we implemented for the compilateur  


See the Makefile for compile our project



make clean
makecompiler: y.tab.c lex.yy.c table_symboles.c tab_instru.c 
	gcc lex.yy.c y.tab.c table_symboles.c tab_instru.c -o compiler -ly -ll

lex.yy.c: compiler.l
	flex compiler.l

y.tab.c: compiler.y
	yacc -d -v -t compiler.y

clean:
rm -rf *.yy.c *.t compiler y.tab.* y.output testTabSym.txt
./compiler < eric.c
cat testTabSym.txt
