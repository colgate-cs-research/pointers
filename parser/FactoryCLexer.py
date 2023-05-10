# Generated from FactoryC.g4 by ANTLR 4.12.0
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
    from typing import TextIO
else:
    from typing.io import TextIO


def serializedATN():
    return [
        4,0,10,58,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
        6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,1,0,1,0,1,1,1,
        1,1,2,1,2,1,3,1,3,1,4,1,4,1,5,1,5,1,6,1,6,1,7,1,7,1,8,1,8,1,9,1,
        9,1,9,1,9,5,9,48,8,9,10,9,12,9,51,9,9,1,10,1,10,1,11,1,11,1,11,1,
        11,0,0,12,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,0,17,0,19,8,21,9,23,10,
        1,0,4,2,0,65,90,97,122,1,0,48,57,1,0,48,49,3,0,9,10,13,13,32,32,
        58,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,
        11,1,0,0,0,0,13,1,0,0,0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,0,0,0,1,
        25,1,0,0,0,3,27,1,0,0,0,5,29,1,0,0,0,7,31,1,0,0,0,9,33,1,0,0,0,11,
        35,1,0,0,0,13,37,1,0,0,0,15,39,1,0,0,0,17,41,1,0,0,0,19,43,1,0,0,
        0,21,52,1,0,0,0,23,54,1,0,0,0,25,26,5,59,0,0,26,2,1,0,0,0,27,28,
        5,33,0,0,28,4,1,0,0,0,29,30,5,42,0,0,30,6,1,0,0,0,31,32,5,38,0,0,
        32,8,1,0,0,0,33,34,5,61,0,0,34,10,1,0,0,0,35,36,5,60,0,0,36,12,1,
        0,0,0,37,38,5,62,0,0,38,14,1,0,0,0,39,40,7,0,0,0,40,16,1,0,0,0,41,
        42,7,1,0,0,42,18,1,0,0,0,43,49,3,15,7,0,44,48,3,15,7,0,45,48,3,17,
        8,0,46,48,5,95,0,0,47,44,1,0,0,0,47,45,1,0,0,0,47,46,1,0,0,0,48,
        51,1,0,0,0,49,47,1,0,0,0,49,50,1,0,0,0,50,20,1,0,0,0,51,49,1,0,0,
        0,52,53,7,2,0,0,53,22,1,0,0,0,54,55,7,3,0,0,55,56,1,0,0,0,56,57,
        6,11,0,0,57,24,1,0,0,0,3,0,47,49,1,6,0,0
    ]

class FactoryCLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    T__0 = 1
    T__1 = 2
    T__2 = 3
    T__3 = 4
    T__4 = 5
    T__5 = 6
    T__6 = 7
    VARNAME = 8
    BIT = 9
    WHITESPACE = 10

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "';'", "'!'", "'*'", "'&'", "'='", "'<'", "'>'" ]

    symbolicNames = [ "<INVALID>",
            "VARNAME", "BIT", "WHITESPACE" ]

    ruleNames = [ "T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", 
                  "ALPHA", "DIGIT", "VARNAME", "BIT", "WHITESPACE" ]

    grammarFileName = "FactoryC.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.12.0")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


