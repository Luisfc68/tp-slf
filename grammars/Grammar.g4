grammar Grammar;

root: stm*;

stm:
    call ';'
  | assignation ';'
  | declaration ';'
  | control_block
  | function_declaration
  | return ';'
  ;

call: ID'('args')' | ID'('call')';
args: arg | arg','args;
arg: literal | exp | ID;

assignation: ID '=' value | declaration '=' value;
declaration: 'const 'ID | 'var 'ID;
value: literal | '('exp')' | call | ID | 'null';
literal: NUM | STRING;
exp: bool_exp | num_exp | concat_exp;

num_exp: term | num_exp '+' term | num_exp '-' term;
term: factor | term '*' factor | term '/' factor | term '%' factor;
factor: '('num_exp')' | NUM | call | ID; // preguntar lo de los parentesis, si los quito me da error

bool_exp: bool_exp '&&' low_bool_exp | low_bool_exp;
low_bool_exp: low_bool_exp '||' comparison | comparison;
comparison: value COMPARATOR value;

concat_exp: value('+'value)+;

function_declaration: 'func' ID '('arg_declaration')' '{'(stm)*'}';
arg_declaration: ID | ID','arg_declaration;

control_block: if_stm | while_stm | switch_stm;

if_stm:'if' '('bool_exp')' '{'(stm)+'}' (else_stm)?;
else_stm: 
  'else if' '('bool_exp')' '{'(stm)*'}' else_stm 
  | 'else' '{'(stm)*'}';

while_stm: 'while' '('bool_exp')' '{'(stm)*'}';

switch_stm: 'switch' '('ID')' '{'case_stm* (default_stm)?'}';
case_stm: 'on' literal ':' (stm)*;
default_stm: 'default' ':' (stm)*;

return: 'return '(value)?;

WS : [ \t\r\n]+ -> skip;
ID : [a-zA-Z0-9]+;
NUM: [0-9]+;
STRING: '"'[a-zA-Z0-9+-/%>*\\ ]*'"';
COMPARATOR: '>='|'<='|'<'|'>'|'=='|'!=';