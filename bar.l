%{
    
    #include "fubar.h"
    #include "foo.tab.h"

    void yyerror(const char *);
%}

num_with_pt [0-9]*\.[0-9]+|[0-9]+\.[0-9]*

%%

if              return IF;
for             return FOR;
do              return DO;
while           return WHILE;

{num_with_pt} {
                yylval = string(yytext);
                return FLOATPT;
              }

[0-9]+       {
                yylval = string(yytext);
                return NUMBER;
             }

[A-Za-z]+       return ID;

\"[^"]*\"    {
                yylval = string(yytext);
                return STRING;
             }

[-+;(){}]    {
                return *yytext;
             }

[ \t\n]      ; /* skip whitespace */

.            yyerror("invalid character");
%%

int yywrap(void) {
    return 1;
}
