grammar FactoryC;

statements : (statement)+ EOF ;

statement : (
        assignmentStmt
        | declarationStmt
    ) ';' ;

shapeLiteral : ALL | NON | SQR | CIR | TLS | TRS | BLS | BRS | TLC | TRC | BLC | BRC;
functionExpr: FUNCNAME;
variableExpr : (modifier = ('*' | '&'))? VARNAME ;
valueExpr:
	shapeLiteral
    | variableExpr 
    | functionExpr;
expr:
    valueExpr
	| expr op = ('+' | '-') valueExpr;

assignmentStmt : (deref = '*')? VARNAME '=' expr ;

declarationStmt : (protect = 'nodirect')? 'shape' (pointer = '*')? VARNAME ('=' expr)? ;

ALL: 'ALL';
NON: 'NON';
SQR: 'SQR';
CIR: 'CIR';
TLS: 'TLS';
TRS: 'TRS';
BLS: 'BLS';
BRS: 'BRS';
TLC: 'TLC';
TRC: 'TRC';
BLC: 'BLC';
BRC: 'BRC';
fragment ALPHA : [a-zA-Z] ;
fragment DIGIT : [0-9] ;
FUNCNAME: ALPHA (ALPHA | DIGIT | '_')* '(' ')';
VARNAME: ALPHA (ALPHA | DIGIT | '_')*;
WHITESPACE: [ \t\r\n]-> skip;
COMMENT: '//' ~[\r\n]* -> skip;