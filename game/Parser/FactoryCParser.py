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
        4,1,10,55,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,1,0,4,
        0,14,8,0,11,0,12,0,15,1,0,1,0,1,1,1,1,3,1,22,8,1,1,1,1,1,1,2,1,2,
        1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,3,3,3,37,8,3,1,3,1,3,1,4,3,4,42,
        8,4,1,4,1,4,1,4,1,4,1,5,3,5,49,8,5,1,5,1,5,1,5,1,5,1,5,0,0,6,0,2,
        4,6,8,10,0,2,1,0,3,4,1,0,6,7,53,0,13,1,0,0,0,2,21,1,0,0,0,4,25,1,
        0,0,0,6,36,1,0,0,0,8,41,1,0,0,0,10,48,1,0,0,0,12,14,3,2,1,0,13,12,
        1,0,0,0,14,15,1,0,0,0,15,13,1,0,0,0,15,16,1,0,0,0,16,17,1,0,0,0,
        17,18,5,0,0,1,18,1,1,0,0,0,19,22,3,8,4,0,20,22,3,10,5,0,21,19,1,
        0,0,0,21,20,1,0,0,0,22,23,1,0,0,0,23,24,5,1,0,0,24,3,1,0,0,0,25,
        26,5,2,0,0,26,27,5,9,0,0,27,28,5,9,0,0,28,29,5,9,0,0,29,30,5,9,0,
        0,30,31,5,9,0,0,31,32,5,9,0,0,32,33,5,9,0,0,33,34,5,9,0,0,34,5,1,
        0,0,0,35,37,7,0,0,0,36,35,1,0,0,0,36,37,1,0,0,0,37,38,1,0,0,0,38,
        39,5,8,0,0,39,7,1,0,0,0,40,42,5,3,0,0,41,40,1,0,0,0,41,42,1,0,0,
        0,42,43,1,0,0,0,43,44,5,8,0,0,44,45,5,5,0,0,45,46,3,6,3,0,46,9,1,
        0,0,0,47,49,5,3,0,0,48,47,1,0,0,0,48,49,1,0,0,0,49,50,1,0,0,0,50,
        51,5,8,0,0,51,52,7,1,0,0,52,53,3,4,2,0,53,11,1,0,0,0,5,15,21,36,
        41,48
    ]

class FactoryCParser ( Parser ):

    grammarFileName = "FactoryC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'!'", "'*'", "'&'", "'='", "'<'", 
                     "'>'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "VARNAME", "BIT", "WHITESPACE" ]

    RULE_statements = 0
    RULE_statement = 1
    RULE_shapeLiteral = 2
    RULE_variableExpr = 3
    RULE_assignmentStmt = 4
    RULE_modifyStmt = 5

    ruleNames =  [ "statements", "statement", "shapeLiteral", "variableExpr", 
                   "assignmentStmt", "modifyStmt" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    T__6=7
    VARNAME=8
    BIT=9
    WHITESPACE=10

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
            self.state = 13 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 12
                self.statement()
                self.state = 15 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==3 or _la==8):
                    break

            self.state = 17
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


        def modifyStmt(self):
            return self.getTypedRuleContext(FactoryCParser.ModifyStmtContext,0)


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
            self.state = 21
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
            if la_ == 1:
                self.state = 19
                self.assignmentStmt()
                pass

            elif la_ == 2:
                self.state = 20
                self.modifyStmt()
                pass


            self.state = 23
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

        def BIT(self, i:int=None):
            if i is None:
                return self.getTokens(FactoryCParser.BIT)
            else:
                return self.getToken(FactoryCParser.BIT, i)

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
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 25
            self.match(FactoryCParser.T__1)
            self.state = 26
            self.match(FactoryCParser.BIT)
            self.state = 27
            self.match(FactoryCParser.BIT)
            self.state = 28
            self.match(FactoryCParser.BIT)
            self.state = 29
            self.match(FactoryCParser.BIT)
            self.state = 30
            self.match(FactoryCParser.BIT)
            self.state = 31
            self.match(FactoryCParser.BIT)
            self.state = 32
            self.match(FactoryCParser.BIT)
            self.state = 33
            self.match(FactoryCParser.BIT)
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
            self.state = 36
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==3 or _la==4:
                self.state = 35
                localctx.modifier = self._input.LT(1)
                _la = self._input.LA(1)
                if not(_la==3 or _la==4):
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


    class AssignmentStmtContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.deref = None # Token

        def VARNAME(self):
            return self.getToken(FactoryCParser.VARNAME, 0)

        def variableExpr(self):
            return self.getTypedRuleContext(FactoryCParser.VariableExprContext,0)


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
        self.enterRule(localctx, 8, self.RULE_assignmentStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 41
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==3:
                self.state = 40
                localctx.deref = self.match(FactoryCParser.T__2)


            self.state = 43
            self.match(FactoryCParser.VARNAME)
            self.state = 44
            self.match(FactoryCParser.T__4)
            self.state = 45
            self.variableExpr()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ModifyStmtContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser
            self.deref = None # Token
            self.op = None # Token

        def VARNAME(self):
            return self.getToken(FactoryCParser.VARNAME, 0)

        def shapeLiteral(self):
            return self.getTypedRuleContext(FactoryCParser.ShapeLiteralContext,0)


        def getRuleIndex(self):
            return FactoryCParser.RULE_modifyStmt

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterModifyStmt" ):
                listener.enterModifyStmt(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitModifyStmt" ):
                listener.exitModifyStmt(self)




    def modifyStmt(self):

        localctx = FactoryCParser.ModifyStmtContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_modifyStmt)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 48
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==3:
                self.state = 47
                localctx.deref = self.match(FactoryCParser.T__2)


            self.state = 50
            self.match(FactoryCParser.VARNAME)
            self.state = 51
            localctx.op = self._input.LT(1)
            _la = self._input.LA(1)
            if not(_la==6 or _la==7):
                localctx.op = self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 52
            self.shapeLiteral()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





