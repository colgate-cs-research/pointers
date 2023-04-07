grammar FactoryC;

statements : (statement)+ EOF ;

statement : (
        assignmentStmt
        | declarationStmt
    ) ';' ;

shapeLiteral : SQR | CIR | TLS | TRS | BLS | BRS | TLC | TRC | BLC | BRC;
variableExpr : (modifier = ('*' | '&'))? VARNAME ;
valueExpr:
    variableExpr
    | shapeLiteral ;
expr:
    valueExpr
    | expr op = ('+' | '-') valueExpr ;

assignmentStmt : (deref = '*')? VARNAME '=' expr ;

declarationStmt : 'shape'(pointer = '*')? VARNAME ('=' expr)? ;

fragment ALPHA : [a-zA-Z] ;
fragment DIGIT : [0-9] ;
VARNAME : ALPHA (ALPHA | DIGIT | '_')*;
WHITESPACE: [ \t\r\n]-> skip;
SQR : 'SQR';
CIR : 'CIR';
TLS : 'TLS';
TRS : 'TRS';
BLS : 'BLS';
BRS : 'BRS';
TLC : 'TLC';
TRC : 'TRC';
BLC : 'BLC';
BRC : 'BRC';
COMMENT: '//' ~[ \r\n]* -> skip;