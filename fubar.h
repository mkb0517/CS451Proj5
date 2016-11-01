#include <string>
#include <iostream>
#include <iomanip>

using namespace std;

//typedef string YYSTYPE;
#define YYSTYPE string

int yylex(void);
void yyerror(const char*);
