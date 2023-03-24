grammar PsuedoC;

statements : (statement)+ EOF ;

statement : (
        declarationStmt
        | assignmentStmt
    ) ';' ;

expression :
    baseExpr
    | mathExpr
    ;

literalExpr : INT ;
variableExpr : (modifier = ('*' | '&'))? VARNAME ;

baseExpr :
    literalExpr
    | variableExpr
    ;

mathExpr : baseExpr (operator = ('+' | '-') mathExpr)* ;

type : typename = ('robot' | 'dronebay') ;

declarationStmt : type '*'? VARNAME ('=' expression)? ;
assignmentStmt : (deref = '*')? VARNAME '=' expression ;

fragment ALPHA : [a-zA-Z] ;
fragment DIGIT : [0-9] ;
VARNAME : ALPHA (ALPHA | DIGIT)*;
INT : DIGIT+ ;
WHITESPACE: [ \t\r\n]-> skip;
