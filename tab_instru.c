#include "tab_instru.h"
#include <stdio.h>
#include <stdlib.h>



/*struct instr{
	char * inst;
	int val1, val2, val3;
}*/

int idx_instr=0;



void instr_add(char* name, int v1, int v2,int v3){
	tab_instr[idx_instr].inst = name;
	tab_instr[idx_instr].val1=v1;
	tab_instr[idx_instr].val2=v2;
	tab_instr[idx_instr].val3=v3;
	idx_instr++;
}

void print_tab_ins(int ln){
	printf("+++++++instruction+++++++++++\n");
	printf("%s %d %d %d \n", tab_instr[ln].inst,tab_instr[ln].val1,tab_instr[ln].val2,tab_instr[ln].val3);
	printf("++++++++++++++++++++\n");
}


int getmyindex(){
	return idx_instr;
}



void changejumpline(int linenum, int value){
	tab_instr[linenum].val1  = value;
}



void write_fichier(){
	FILE* fichier = NULL;
 
    fichier = fopen("testTabSym.txt", "w");
 
    if (fichier != NULL)
    {
		printf("Maitenant combien d'intructions:    %d\n",idx_instr);
		for (int i=0;i<idx_instr;i++){
			//Ecriture dans le fichier 
			fprintf(fichier,"%s %d %d %d \n",tab_instr[i].inst,tab_instr[i].val1,tab_instr		[i].val2,tab_instr[i].val3);
		}
    }
        	fclose(fichier); 
}

//int main(void){
//	/*instr_add("load",'2','3');
//	instr_add("b",'4','5');
//	*/
//	printf("Write dans un fichier les instruction\n");
//	write_fichier();
//	return 0;
//}




