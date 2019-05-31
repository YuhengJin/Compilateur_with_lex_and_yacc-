struct instr{
	char * inst;
	int val1, val2, val3;
};
struct instr tab_instr[1024];

void instr_add(char * name, int v1, int v2,int v3);
void print_tab_ins(int ln);
int getmyindex();
void changejumpline(int linenum, int value);
void write_fichier();

