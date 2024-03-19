# Generated from FactoryC.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .FactoryCParser import FactoryCParser
else:
    from FactoryCParser import FactoryCParser

# This class defines a complete listener for a parse tree produced by FactoryCParser.
class FactoryCListener(ParseTreeListener):

    # Enter a parse tree produced by FactoryCParser#statements.
    def enterStatements(self, ctx:FactoryCParser.StatementsContext):
        pass

    # Exit a parse tree produced by FactoryCParser#statements.
    def exitStatements(self, ctx:FactoryCParser.StatementsContext):
        pass


    # Enter a parse tree produced by FactoryCParser#statement.
    def enterStatement(self, ctx:FactoryCParser.StatementContext):
        pass

    # Exit a parse tree produced by FactoryCParser#statement.
    def exitStatement(self, ctx:FactoryCParser.StatementContext):
        pass


    # Enter a parse tree produced by FactoryCParser#shapeLiteral.
    def enterShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        pass

    # Exit a parse tree produced by FactoryCParser#shapeLiteral.
    def exitShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        pass


    # Enter a parse tree produced by FactoryCParser#functionExpr.
    def enterFunctionExpr(self, ctx:FactoryCParser.FunctionExprContext):
        pass

    # Exit a parse tree produced by FactoryCParser#functionExpr.
    def exitFunctionExpr(self, ctx:FactoryCParser.FunctionExprContext):
        pass


    # Enter a parse tree produced by FactoryCParser#variableExpr.
    def enterVariableExpr(self, ctx:FactoryCParser.VariableExprContext):
        pass

    # Exit a parse tree produced by FactoryCParser#variableExpr.
    def exitVariableExpr(self, ctx:FactoryCParser.VariableExprContext):
        pass


    # Enter a parse tree produced by FactoryCParser#valueExpr.
    def enterValueExpr(self, ctx:FactoryCParser.ValueExprContext):
        pass

    # Exit a parse tree produced by FactoryCParser#valueExpr.
    def exitValueExpr(self, ctx:FactoryCParser.ValueExprContext):
        pass


    # Enter a parse tree produced by FactoryCParser#expr.
    def enterExpr(self, ctx:FactoryCParser.ExprContext):
        pass

    # Exit a parse tree produced by FactoryCParser#expr.
    def exitExpr(self, ctx:FactoryCParser.ExprContext):
        pass


    # Enter a parse tree produced by FactoryCParser#assignmentStmt.
    def enterAssignmentStmt(self, ctx:FactoryCParser.AssignmentStmtContext):
        pass

    # Exit a parse tree produced by FactoryCParser#assignmentStmt.
    def exitAssignmentStmt(self, ctx:FactoryCParser.AssignmentStmtContext):
        pass


    # Enter a parse tree produced by FactoryCParser#declarationStmt.
    def enterDeclarationStmt(self, ctx:FactoryCParser.DeclarationStmtContext):
        pass

    # Exit a parse tree produced by FactoryCParser#declarationStmt.
    def exitDeclarationStmt(self, ctx:FactoryCParser.DeclarationStmtContext):
        pass



del FactoryCParser