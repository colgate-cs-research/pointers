# Generated from FactoryC.g4 by ANTLR 4.12.0
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
        4,1,21,71,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,1,0,4,0,18,8,0,11,0,12,0,19,1,0,1,0,1,1,1,1,3,1,26,8,1,
        1,1,1,1,1,2,1,2,1,3,3,3,33,8,3,1,3,1,3,1,4,1,4,3,4,39,8,4,1,5,1,
        5,1,5,1,5,1,5,1,5,5,5,47,8,5,10,5,12,5,50,9,5,1,6,3,6,53,8,6,1,6,
        1,6,1,6,1,6,1,7,3,7,60,8,7,1,7,1,7,3,7,64,8,7,1,7,1,7,1,7,3,7,69,
        8,7,1,7,0,1,10,8,0,2,4,6,8,10,12,14,0,3,1,0,11,20,1,0,2,3,1,0,4,
        5,71,0,17,1,0,0,0,2,25,1,0,0,0,4,29,1,0,0,0,6,32,1,0,0,0,8,38,1,
        0,0,0,10,40,1,0,0,0,12,52,1,0,0,0,14,59,1,0,0,0,16,18,3,2,1,0,17,
        16,1,0,0,0,18,19,1,0,0,0,19,17,1,0,0,0,19,20,1,0,0,0,20,21,1,0,0,
        0,21,22,5,0,0,1,22,1,1,0,0,0,23,26,3,12,6,0,24,26,3,14,7,0,25,23,
        1,0,0,0,25,24,1,0,0,0,26,27,1,0,0,0,27,28,5,1,0,0,28,3,1,0,0,0,29,
        30,7,0,0,0,30,5,1,0,0,0,31,33,7,1,0,0,32,31,1,0,0,0,32,33,1,0,0,
        0,33,34,1,0,0,0,34,35,5,9,0,0,35,7,1,0,0,0,36,39,3,4,2,0,37,39,3,
        6,3,0,38,36,1,0,0,0,38,37,1,0,0,0,39,9,1,0,0,0,40,41,6,5,-1,0,41,
        42,3,8,4,0,42,48,1,0,0,0,43,44,10,1,0,0,44,45,7,2,0,0,45,47,3,8,
        4,0,46,43,1,0,0,0,47,50,1,0,0,0,48,46,1,0,0,0,48,49,1,0,0,0,49,11,
        1,0,0,0,50,48,1,0,0,0,51,53,5,2,0,0,52,51,1,0,0,0,52,53,1,0,0,0,
        53,54,1,0,0,0,54,55,5,9,0,0,55,56,5,6,0,0,56,57,3,10,5,0,57,13,1,
        0,0,0,58,60,5,7,0,0,59,58,1,0,0,0,59,60,1,0,0,0,60,61,1,0,0,0,61,
        63,5,8,0,0,62,64,5,2,0,0,63,62,1,0,0,0,63,64,1,0,0,0,64,65,1,0,0,
        0,65,68,5,9,0,0,66,67,5,6,0,0,67,69,3,10,5,0,68,66,1,0,0,0,68,69,
        1,0,0,0,69,15,1,0,0,0,9,19,25,32,38,48,52,59,63,68
    ]

class FactoryCParser ( Parser ):

    grammarFileName = "FactoryC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'*'", "'&'", "'+'", "'-'", "'='", 
                     "'nodirect'", "'shape'", "<INVALID>", "<INVALID>", 
                     "'SQR'", "'CIR'", "'TLS'", "'TRS'", "'BLS'", "'BRS'", 
                     "'TLC'", "'TRC'", "'BLC'", "'BRC'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "VARNAME", "WHITESPACE", "SQR", "CIR", 
                      "TLS", "TRS", "BLS", "BRS", "TLC", "TRC", "BLC", "BRC", 
                      "COMMENT" ]

    RULE_statements = 0
    RULE_statement = 1
    RULE_shapeLiteral = 2
    RULE_variableExpr = 3
    RULE_valueExpr = 4
    RULE_expr = 5
    RULE_assignmentStmt = 6
    RULE_declarationStmt = 7

    ruleNames =  [ "statements", "statement", "shapeLiteral", "variableExpr", 
                   "valueExpr", "expr", "assignmentStmt", "declarationStmt" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    T__6=7
    T__7=8
    VARNAME=9
    WHITESPACE=10
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
    COMMENT=21

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.12.0")
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
            self.state = 17 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 16
                self.statement()
                self.state = 19 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not ((((_la) & ~0x3f) == 0 and ((1 << _la) & 900) != 0)):
                    break

            self.state = 21
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
            self.state = 25
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [2, 9]:
                self.state = 23
                self.assignmentStmt()
                pass
            elif token in [7, 8]:
                self.state = 24
                self.declarationStmt()
                pass
            else:
                raise NoViableAltException(self)

            self.state = 27
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
            self.state = 29
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2095104) != 0)):
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
        self.enterRule(localctx, 6, self.RULE_variableExpr)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 32
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2 or _la==3:
                self.state = 31
                localctx.modifier = self._input.LT(1)
                _la = self._input.LA(1)
                if not(_la==2 or _la==3):
                    localctx.modifier = self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()


            self.state = 34
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
        self.enterRule(localctx, 8, self.RULE_valueExpr)
        try:
            self.state = 38
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]:
                self.enterOuterAlt(localctx, 1)
                self.state = 36
                self.shapeLiteral()
                pass
            elif token in [2, 3, 9]:
                self.enterOuterAlt(localctx, 2)
                self.state = 37
                self.variableExpr()
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
        _startState = 10
        self.enterRecursionRule(localctx, 10, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 41
            self.valueExpr()
            self._ctx.stop = self._input.LT(-1)
            self.state = 48
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,4,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = FactoryCParser.ExprContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                    self.state = 43
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 44
                    localctx.op = self._input.LT(1)
                    _la = self._input.LA(1)
                    if not(_la==4 or _la==5):
                        localctx.op = self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume()
                    self.state = 45
                    self.valueExpr() 
                self.state = 50
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
        self.enterRule(localctx, 12, self.RULE_assignmentStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 52
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2:
                self.state = 51
                localctx.deref = self.match(FactoryCParser.T__1)


            self.state = 54
            self.match(FactoryCParser.VARNAME)
            self.state = 55
            self.match(FactoryCParser.T__5)
            self.state = 56
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
        self.enterRule(localctx, 14, self.RULE_declarationStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 59
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==7:
                self.state = 58
                localctx.protect = self.match(FactoryCParser.T__6)


            self.state = 61
            self.match(FactoryCParser.T__7)
            self.state = 63
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2:
                self.state = 62
                localctx.pointer = self.match(FactoryCParser.T__1)


            self.state = 65
            self.match(FactoryCParser.VARNAME)
            self.state = 68
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==6:
                self.state = 66
                self.match(FactoryCParser.T__5)
                self.state = 67
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
        self._predicates[5] = self.expr_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def expr_sempred(self, localctx:ExprContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 1)
         




