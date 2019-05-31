struct symbol{
	char name[16];
	char type[16];
	int adress;
	int depth;
};

int ajout_ts (char *name, int depth);

int ts_add_tmp(void);

int ts_get_adr(int index);

int ts_get_index(char *name);

void ts_print(void);

void ts_delete();

int last_sys_adr(void);
