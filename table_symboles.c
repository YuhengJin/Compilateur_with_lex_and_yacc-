#include "table_symboles.h"
#include <stdio.h>
#include <string.h>


/*
struct symbol{
	char name[16];
	int adress;
	int depth;
} symbols[1024];
*/



struct symbol symbols[1024];
int ts_index = 100;
int current_adress= 400;




int ajout_ts (char *name, int depth){
	ts_print();
	strcpy(symbols[ts_index].name , name);
	symbols[ts_index].adress = current_adress;
	symbols[ts_index].depth =depth;
	ts_index += 1;
	current_adress += 4;
	return ts_index;
}




int ts_add_tmp(void){
	ts_print();
	// ADD TESTS
	symbols[ts_index].adress=current_adress;	
	ts_index++;
	current_adress+=4;
	return ts_index;	
}


int ts_get_adr(int index){
	return symbols[index].adress;
}


int last_sys_adr(void){
	return symbols[ts_index-1].adress;
}


/*int ts_get_depth(int index){
	return symbols[ts_index].depth;*/

int ts_get_index(char *name){
	int i=100;
	
	while(i< ts_index){
		if (strcmp(symbols[i].name, name) ==0) return i;
		i++;	
	}
	return -1;
}

void ts_print(void){
	printf("++++++++++++++++++++\n");
	printf("++++++++Name : %s\n", symbols[ts_index-1].name);
	printf("++++++++Adress : %d\n", symbols[ts_index-1].adress);
	printf("++++++++Depth : %d\n", symbols[ts_index-1].depth);
	printf("++++++++++++++++++++\n");
}

void ts_delete() {
	current_adress-=4;
	ts_index--;
}
