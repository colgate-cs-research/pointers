grammar PsuedoC;

statements : (statement)+ EOF ;

statement : (
        declarationStmt
        | assignmentStmt
    ) ';' ;

expression :
    literalExpr
    | variableExpr
    | expression ( '+' | '-') expression
//    | mathExpr
    ;

literalExpr : INT ;
variableExpr : ('*' | '&')? VARNAME ;
//mathExpr : expression (( '+' | '-' ) expression)+ ;

type :
    'robot'
    | 'dronebay'
    ;

declarationStmt : type '*'? VARNAME ('=' expression)? ;
assignmentStmt : '*'? VARNAME '=' expression ;

fragment ALPHA : [a-zA-Z] ;
fragment DIGIT : [0-9] ;
VARNAME : ALPHA (ALPHA | DIGIT)*;
INT : DIGIT+ ;
WHITESPACE: [ \t\r\n]-> skip;
