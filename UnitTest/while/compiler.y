%{
	#include "table_symboles.h"
	#include "tab_instru.h"

	int yylex(void);
	void yyerror(char*);
	int yydebug = 1;
	int typeFormat =0;
	int lnOld =0;
	int lnOld2 =0;
	int lnNew = 0;
%}


%token tMAIN tAO tAF tCONST tINT tCHAR tSUPEQU tSUP tINFEQU tINF tTAB tBACK tESPACE tEQU tNOTEQU tPLUS tMOINS tETOILE tSLASH tPE tEAGLE tPO tPF tVI tPV tFIN tWHILE tIF tELSE tENTIER tID tPRINTF terror tAND tOR tTRUE tFALSE


%left tPLUS tMOINS
%left tETOILE tSLASH

%union{
	int e;
	char * e2;
} 
 

%type<e> tENTIER;
%type<e2> tID;


%%

/* REGLES */
start: fonctions {write_fichier();};
fonctions: fonction fonctions | ;
fonction :  Type element tPO args tPF tAO instructions tAF |  Type tMAIN tPO args tPF body;
body: tAO instructions tAF    {printf("Body \n");};
//instruction : affectation | declaration |  print | appelFonction | while | si | siElse;
instruction : affectation | declaration |  print | appelFonction | si | while ;
instructions : instruction instructions| ;
args  : arg args_suite | ;
args_suite : tVI arg args_suite | ;
arg : Type element;



si : 
		tIF tPO conditions tPF 
			{	
				printf("++++++++++++   si  ++++++++++++++++++\n"); 
				instr_add("LOAD",0,last_sys_adr(),0);
				ts_delete();
				instr_add("JMPC",0xFFFF,0,0);
				lnOld = (getmyindex());
				print_tab_ins(lnOld-1);
				printf("+++++++++++++++++++++++++++++++++before if body line is %d\n",lnOld ); 
			}
		body
			{	
				lnOld2 = (getmyindex());
				printf("+++++++++++++++++++++++++++++++++++++ fin of body  line is %d\n" ,lnOld2); 
				printf("++++++++lnold is  %d   lnOld2 is %d \n" ,lnOld,lnOld2);
				changejumpline(lnOld-1, lnOld2);	
				print_tab_ins(lnOld-1);
				instr_add("JMP",0xFFFF,0,0);
			}
		tELSE
			{
				printf("++++++++++++   else  ++++++++++++++++++\n");
				lnNew = (getmyindex());
				printf("+++++++++++++++++++++++++++++++++++++ begining of else  line is %d\n" ,lnNew); 

			}
		body
			{
				lnNew = (getmyindex());
				printf("+++++++++++++++++++++++++++++++++++++fin else body line is %d\n" ,lnNew);
				changejumpline(lnOld2, lnNew);	
				print_tab_ins(lnOld2);
			}
;



while : tWHILE 
			{
				lnOld = (getmyindex());
				printf("+++++++++++++++++++++++++++++++++++++ Begin while  line is %d\n" ,lnOld); 
			}
		tPO conditions tPF
			{
				instr_add("LOAD",0,last_sys_adr(),0);
				ts_delete();
				instr_add("JMPC",0xFFFF,0,0);
				lnOld2 = (getmyindex());
			} 
		body
			{
				instr_add("JMP",lnOld,0,0);
				lnNew = (getmyindex());
				printf("+++++++++++++++++++++++++++++++++++++ Fin while  line is %d\n" ,lnNew); 
				changejumpline(lnOld2-1, lnNew);	
				print_tab_ins(lnOld2-1);
			}
;




expression : 
	expression tETOILE expression
		{	
			printf("******* MULTIPLICATION ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("MUL",0,0,1);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	| expression tSLASH expression
		{
			printf("******* DIVISION ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("DIV",0,0,1);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	| expression tPLUS expression 	
		{
			printf("******* ADDITION ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("ADD",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	| expression tMOINS expression
		{
			printf("******* SOUTRACTION ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("SUB",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	| element 
	;

element:
		tID
			{
				int index = ts_get_index($1);
				int n = ts_add_tmp();

				printf ("index %s is %d  Load  %d r0 \n",$1, index,ts_get_adr(index));			
				instr_add("LOAD",0,ts_get_adr(index),0);
				
				printf ("Store %d r0 \n",last_sys_adr());
				instr_add("STORE",last_sys_adr(),0,0);
			}
		| tENTIER
			{
				//int index_var = ts_add(1);
				//int n = ts_add_tmp(tINT);
				int index_var = ts_add_tmp();  
		
				printf ("Afc r0 %d \n",$1);
				instr_add("AFC",0,$1,0);
				
				printf ("Store %d r0 \n",last_sys_adr());
				instr_add("STORE",last_sys_adr(),0,0);
			}
		| appelFonction
		;

appelFonction :  element tPO args tPF;

declaration : 
	Type decl_id  declaration2 tPV
			{
				printf("******************** DECLARATION *******************\n");
			};
declaration2 :  |tVI decl_id declaration2;
decl_id : tID 
			{
				int n = ajout_ts($1,0);
			}
		|tID tEAGLE expression
		 	{
				printf ("Load r0 %d \n",last_sys_adr());			
				instr_add("LOAD",0,last_sys_adr(),0);
				ts_delete();
			
				int n = ajout_ts($1,0);
				printf ("Store %d r0 \n",ts_get_adr(n));
				instr_add("STORE",ts_get_adr(n),0,0);

			}
		|tID tEAGLE conditions
		 	{

				printf ("Load r0 %d \n",last_sys_adr());			
				instr_add("LOAD",0,last_sys_adr(),0);
				ts_delete();
			
				int n = ajout_ts($1,0);
				printf ("Store %d r0 \n",ts_get_adr(n));
				instr_add("STORE",ts_get_adr(n),0,0);

			}


; 




conditions :
	expression tNOTEQU expression
		{
			printf("******* CONDITIONS NOT EQU ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("NEQU",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	|expression tEQU expression
		{
			printf("********************* CONDITIONS EQU ******************************\n");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("EQU",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	|expression tINFEQU expression
		{
			printf("******* CONDITIONS ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("INFE",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}	
	|expression tSUPEQU expression
		{
			printf("******* CONDITIONS ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("SUPE",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	|expression tINF expression
		{
			printf("******* CONDITIONS ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("INF",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
	|expression tSUP expression
		{
			printf("******* CONDITIONS ********");
			instr_add("LOAD",0, last_sys_adr(),0);
			ts_delete();
			instr_add("LOAD",1, last_sys_adr(),0);
			instr_add("SUP",0,1,2);
			instr_add("STORE",last_sys_adr(),0,0);
		}
		;



affectation : 
		tID tEAGLE expression tPV	
			{
				printf("***** AFFECTATION CAS1*****");
				int index = ts_get_index($1);	

				printf ("Load r0 %d ",last_sys_adr());
				instr_add("LOAD",0,last_sys_adr(),0);
			
				printf ("Store %d r0 \n",ts_get_adr(index));
				instr_add("STORE",0,ts_get_adr(index),0);

				ts_delete();  //action pop
			
			};

print : tPRINTF tPO element tPF tPV;









Type : tINT | tCONST | tCHAR ;






/*ACTIONS */

/*LOAD r1 last_sym_adr()
	instr_pop()
	pop()	
	LOAD r2 last_sym_adr()
	ADD r0 r1 r2
	STORE last_sys_adr() r0
	*/


 


/*
%%


;

expr:(tENTIER||tNOM)  tPLUS (tENTIER||tNOM){$$ = nœud ('+', $1, $3); } 
*/




