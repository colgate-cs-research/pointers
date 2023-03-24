grammar FactoryC;

statements : (statement)+ EOF ;

statement : (
        assignmentStmt
        | modifyStmt
    ) ';' ;

shapeLiteral : '!' BIT BIT BIT BIT BIT BIT BIT BIT ;
variableExpr : (modifier = ('*' | '&'))? VARNAME ;

assignmentStmt : (deref = '*')? VARNAME '=' variableExpr ;
modifyStmt : (deref = '*')? VARNAME op = ('<' | '>') shapeLiteral ;

fragment ALPHA : [a-zA-Z] ;
fragment DIGIT : [0-9] ;
VARNAME : ALPHA (ALPHA | DIGIT | '_')*;
BIT : [0-1] ;
WHITESPACE: [ \t\r\n]-> skip;
