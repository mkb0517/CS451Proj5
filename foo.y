%{
    #include "fubar.h"

    int yylex(void);
    void yyerror(const char *);
%}

%token ID
%token FLOATPT
%token NUMBER
%token STRING
%token IF
//%token SWITCH
%token DO
%token FOR
%token WHILE
//%token CASE

%%

program:
        program fndef 
        |  //{ $$ = cout << "Program Ready" << endl; }
        ;
fndef:
        type ID '(' params ')' block //{ $$ = cout << "Function Defined" << endl;}
        ;
type:   
        ID
        ;
params:
        ;
block:
        '{' statements '}'
        ;
statements:
        statements statement
        |
        ;
statement:
        if
        | do
        | for
//        | switch
        | block
        | ';'
        | sexpr ';'
        ;
if:
        IF '(' params ')' block { $$ = "Found IF"; }
        ;
do:
        DO block WHILE '(' params ')'
        ;
for:
        FOR '(' params ';' params ';' params ')' block
        ;
//switch:
//        SWITCH '(' params ')' block
//        ;
sexpr:
        STRING
        | NUMBER
        | FLOATPT
        ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
