# Generated from FactoryC.g4 by ANTLR 4.13.1
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO

def serializedATN():
    return [
        4,1,24,76,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,1,0,4,0,20,8,0,11,0,12,0,21,1,0,1,0,1,1,1,1,3,
        1,28,8,1,1,1,1,1,1,2,1,2,1,3,1,3,1,4,3,4,37,8,4,1,4,1,4,1,5,1,5,
        1,5,3,5,44,8,5,1,6,1,6,1,6,1,6,1,6,1,6,5,6,52,8,6,10,6,12,6,55,9,
        6,1,7,3,7,58,8,7,1,7,1,7,1,7,1,7,1,8,3,8,65,8,8,1,8,1,8,3,8,69,8,
        8,1,8,1,8,1,8,3,8,74,8,8,1,8,0,1,12,9,0,2,4,6,8,10,12,14,16,0,3,
        1,0,9,20,1,0,2,3,1,0,4,5,76,0,19,1,0,0,0,2,27,1,0,0,0,4,31,1,0,0,
        0,6,33,1,0,0,0,8,36,1,0,0,0,10,43,1,0,0,0,12,45,1,0,0,0,14,57,1,
        0,0,0,16,64,1,0,0,0,18,20,3,2,1,0,19,18,1,0,0,0,20,21,1,0,0,0,21,
        19,1,0,0,0,21,22,1,0,0,0,22,23,1,0,0,0,23,24,5,0,0,1,24,1,1,0,0,
        0,25,28,3,14,7,0,26,28,3,16,8,0,27,25,1,0,0,0,27,26,1,0,0,0,28,29,
        1,0,0,0,29,30,5,1,0,0,30,3,1,0,0,0,31,32,7,0,0,0,32,5,1,0,0,0,33,
        34,5,21,0,0,34,7,1,0,0,0,35,37,7,1,0,0,36,35,1,0,0,0,36,37,1,0,0,
        0,37,38,1,0,0,0,38,39,5,22,0,0,39,9,1,0,0,0,40,44,3,4,2,0,41,44,
        3,8,4,0,42,44,3,6,3,0,43,40,1,0,0,0,43,41,1,0,0,0,43,42,1,0,0,0,
        44,11,1,0,0,0,45,46,6,6,-1,0,46,47,3,10,5,0,47,53,1,0,0,0,48,49,
        10,1,0,0,49,50,7,2,0,0,50,52,3,10,5,0,51,48,1,0,0,0,52,55,1,0,0,
        0,53,51,1,0,0,0,53,54,1,0,0,0,54,13,1,0,0,0,55,53,1,0,0,0,56,58,
        5,2,0,0,57,56,1,0,0,0,57,58,1,0,0,0,58,59,1,0,0,0,59,60,5,22,0,0,
        60,61,5,6,0,0,61,62,3,12,6,0,62,15,1,0,0,0,63,65,5,7,0,0,64,63,1,
        0,0,0,64,65,1,0,0,0,65,66,1,0,0,0,66,68,5,8,0,0,67,69,5,2,0,0,68,
        67,1,0,0,0,68,69,1,0,0,0,69,70,1,0,0,0,70,73,5,22,0,0,71,72,5,6,
        0,0,72,74,3,12,6,0,73,71,1,0,0,0,73,74,1,0,0,0,74,17,1,0,0,0,9,21,
        27,36,43,53,57,64,68,73
    ]

class FactoryCParser ( Parser ):

    grammarFileName = "FactoryC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'*'", "'&'", "'+'", "'-'", "'='", 
                     "'nodirect'", "'shape'", "'ALL'", "'NON'", "'SQR'", 
                     "'CIR'", "'TLS'", "'TRS'", "'BLS'", "'BRS'", "'TLC'", 
                     "'TRC'", "'BLC'", "'BRC'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "ALL", "NON", "SQR", "CIR", "TLS", "TRS", 
                      "BLS", "BRS", "TLC", "TRC", "BLC", "BRC", "FUNCNAME", 
                      "VARNAME", "WHITESPACE", "COMMENT" ]

    RULE_statements = 0
    RULE_statement = 1
    RULE_shapeLiteral = 2
    RULE_functionExpr = 3
    RULE_variableExpr = 4
    RULE_valueExpr = 5
    RULE_expr = 6
    RULE_assignmentStmt = 7
    RULE_declarationStmt = 8

    ruleNames =  [ "statements", "statement", "shapeLiteral", "functionExpr", 
                   "variableExpr", "valueExpr", "expr", "assignmentStmt", 
                   "declarationStmt" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    T__6=7
    T__7=8
    ALL=9
    NON=10
    SQR=11
    CIR=12
    TLS=13
    TRS=14
    BLS=15
    BRS=16
    TLC=17
    TRC=18
    BLC=19
    BRC=20
    FUNCNAME=21
    VARNAME=22
    WHITESPACE=23
    COMMENT=24

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.1")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class StatementsContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(FactoryCParser.EOF, 0)

        def statement(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(FactoryCParser.StatementContext)
            else:
                return self.getTypedRuleContext(FactoryCParser.StatementContext,i)


        def getRuleIndex(self):
            return FactoryCParser.RULE_statements

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStatements" ):
                listener.enterStatements(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStatements" ):
                listener.exitStatements(self)




    def statements(self):

        localctx = FactoryCParser.StatementsContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_statements)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 19 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 18
                self.statement()
                self.state = 21 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not ((((_la) & ~0x3f) == 0 and ((1 << _la) & 4194692) != 0)):
                    break

            self.state = 23
            self.match(FactoryCParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StatementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def assignmentStmt(self):
            return self.getTypedRuleContext(FactoryCParser.AssignmentStmtContext,0)


        def declarationStmt(self):
            return self.getTypedRuleContext(FactoryCParser.DeclarationStmtContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_statement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStatement" ):
                listener.enterStatement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStatement" ):
                listener.exitStatement(self)




    def statement(self):

        localctx = FactoryCParser.StatementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_statement)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 27
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [2, 22]:
                self.state = 25
                self.assignmentStmt()
                pass
            elif token in [7, 8]:
                self.state = 26
                self.declarationStmt()
                pass
            else:
                raise NoViableAltException(self)

            self.state = 29
            self.match(FactoryCParser.T__0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ShapeLiteralContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def ALL(self):
            return self.getToken(FactoryCParser.ALL, 0)

        def NON(self):
            return self.getToken(FactoryCParser.NON, 0)

        def SQR(self):
            return self.getToken(FactoryCParser.SQR, 0)

        def CIR(self):
            return self.getToken(FactoryCParser.CIR, 0)

        def TLS(self):
            return self.getToken(FactoryCParser.TLS, 0)

        def TRS(self):
            return self.getToken(FactoryCParser.TRS, 0)

        def BLS(self):
            return self.getToken(FactoryCParser.BLS, 0)

        def BRS(self):
            return self.getToken(FactoryCParser.BRS, 0)

        def TLC(self):
            return self.getToken(FactoryCParser.TLC, 0)

        def TRC(self):
            return self.getToken(FactoryCParser.TRC, 0)

        def BLC(self):
            return self.getToken(FactoryCParser.BLC, 0)

        def BRC(self):
            return self.getToken(FactoryCParser.BRC, 0)

        def getRuleIndex(self):
            return FactoryCParser.RULE_shapeLiteral

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterShapeLiteral" ):
                listener.enterShapeLiteral(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitShapeLiteral" ):
                listener.exitShapeLiteral(self)




    def shapeLiteral(self):

        localctx = FactoryCParser.ShapeLiteralContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_shapeLiteral)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 31
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2096640) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def FUNCNAME(self):
            return self.getToken(FactoryCParser.FUNCNAME, 0)

        def getRuleIndex(self):
            return FactoryCParser.RULE_functionExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunctionExpr" ):
                listener.enterFunctionExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunctionExpr" ):
                listener.exitFunctionExpr(self)




    def functionExpr(self):

        localctx = FactoryCParser.FunctionExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_functionExpr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 33
            self.match(FactoryCParser.FUNCNAME)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class VariableExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.modifier = None # Token

        def VARNAME(self):
            return self.getToken(FactoryCParser.VARNAME, 0)

        def getRuleIndex(self):
            return FactoryCParser.RULE_variableExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterVariableExpr" ):
                listener.enterVariableExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitVariableExpr" ):
                listener.exitVariableExpr(self)




    def variableExpr(self):

        localctx = FactoryCParser.VariableExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_variableExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 36
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2 or _la==3:
                self.state = 35
                localctx.modifier = self._input.LT(1)
                _la = self._input.LA(1)
                if not(_la==2 or _la==3):
                    localctx.modifier = self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()


            self.state = 38
            self.match(FactoryCParser.VARNAME)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ValueExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def shapeLiteral(self):
            return self.getTypedRuleContext(FactoryCParser.ShapeLiteralContext,0)


        def variableExpr(self):
            return self.getTypedRuleContext(FactoryCParser.VariableExprContext,0)


        def functionExpr(self):
            return self.getTypedRuleContext(FactoryCParser.FunctionExprContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_valueExpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterValueExpr" ):
                listener.enterValueExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitValueExpr" ):
                listener.exitValueExpr(self)




    def valueExpr(self):

        localctx = FactoryCParser.ValueExprContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_valueExpr)
        try:
            self.state = 43
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]:
                self.enterOuterAlt(localctx, 1)
                self.state = 40
                self.shapeLiteral()
                pass
            elif token in [2, 3, 22]:
                self.enterOuterAlt(localctx, 2)
                self.state = 41
                self.variableExpr()
                pass
            elif token in [21]:
                self.enterOuterAlt(localctx, 3)
                self.state = 42
                self.functionExpr()
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.op = None # Token

        def valueExpr(self):
            return self.getTypedRuleContext(FactoryCParser.ValueExprContext,0)


        def expr(self):
            return self.getTypedRuleContext(FactoryCParser.ExprContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)



    def expr(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = FactoryCParser.ExprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 12
        self.enterRecursionRule(localctx, 12, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 46
            self.valueExpr()
            self._ctx.stop = self._input.LT(-1)
            self.state = 53
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,4,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = FactoryCParser.ExprContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                    self.state = 48
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 49
                    localctx.op = self._input.LT(1)
                    _la = self._input.LA(1)
                    if not(_la==4 or _la==5):
                        localctx.op = self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume()
                    self.state = 50
                    self.valueExpr() 
                self.state = 55
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,4,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class AssignmentStmtContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.deref = None # Token

        def VARNAME(self):
            return self.getToken(FactoryCParser.VARNAME, 0)

        def expr(self):
            return self.getTypedRuleContext(FactoryCParser.ExprContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_assignmentStmt

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssignmentStmt" ):
                listener.enterAssignmentStmt(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssignmentStmt" ):
                listener.exitAssignmentStmt(self)




    def assignmentStmt(self):

        localctx = FactoryCParser.AssignmentStmtContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_assignmentStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 57
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2:
                self.state = 56
                localctx.deref = self.match(FactoryCParser.T__1)


            self.state = 59
            self.match(FactoryCParser.VARNAME)
            self.state = 60
            self.match(FactoryCParser.T__5)
            self.state = 61
            self.expr(0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DeclarationStmtContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.protect = None # Token
            self.pointer = None # Token

        def VARNAME(self):
            return self.getToken(FactoryCParser.VARNAME, 0)

        def expr(self):
            return self.getTypedRuleContext(FactoryCParser.ExprContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_declarationStmt

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDeclarationStmt" ):
                listener.enterDeclarationStmt(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDeclarationStmt" ):
                listener.exitDeclarationStmt(self)




    def declarationStmt(self):

        localctx = FactoryCParser.DeclarationStmtContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_declarationStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 64
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==7:
                self.state = 63
                localctx.protect = self.match(FactoryCParser.T__6)


            self.state = 66
            self.match(FactoryCParser.T__7)
            self.state = 68
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2:
                self.state = 67
                localctx.pointer = self.match(FactoryCParser.T__1)


            self.state = 70
            self.match(FactoryCParser.VARNAME)
            self.state = 73
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==6:
                self.state = 71
                self.match(FactoryCParser.T__5)
                self.state = 72
                self.expr(0)


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx



    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates == None:
            self._predicates = dict()
        self._predicates[6] = self.expr_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def expr_sempred(self, localctx:ExprContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 1)
         




