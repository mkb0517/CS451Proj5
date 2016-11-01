#!/bin/bash
# assignment 5 compiler compiler script

echo "Doing Bison"
bison -d foo.y
echo "Doing Flex"
flex bar.l
echo "Compiling"
g++-6 foo.tab.c lex.yy.c -ll -ly -o CS451Assign5
echo "Run the program with ./CS451Assign5"
