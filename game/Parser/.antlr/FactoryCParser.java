// Generated from /Users/jefferyyang/Documents/GitHub.nosync/pointers/game/Parser/FactoryC.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class FactoryCParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, VARNAME=9, 
		WHITESPACE=10, SQR=11, CIR=12, TLS=13, TRS=14, BLS=15, BRS=16, TLC=17, 
		TRC=18, BLC=19, BRC=20, COMMENT=21;
	public static final int
		RULE_statements = 0, RULE_statement = 1, RULE_shapeLiteral = 2, RULE_variableExpr = 3, 
		RULE_valueExpr = 4, RULE_expr = 5, RULE_assignmentStmt = 6, RULE_declarationStmt = 7;
	private static String[] makeRuleNames() {
		return new String[] {
			"statements", "statement", "shapeLiteral", "variableExpr", "valueExpr", 
			"expr", "assignmentStmt", "declarationStmt"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'*'", "'&'", "'+'", "'-'", "'='", "'nodirect'", "'shape'", 
			null, null, "'SQR'", "'CIR'", "'TLS'", "'TRS'", "'BLS'", "'BRS'", "'TLC'", 
			"'TRC'", "'BLC'", "'BRC'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, "VARNAME", "WHITESPACE", 
			"SQR", "CIR", "TLS", "TRS", "BLS", "BRS", "TLC", "TRC", "BLC", "BRC", 
			"COMMENT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "FactoryC.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public FactoryCParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class StatementsContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(FactoryCParser.EOF, 0); }
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public StatementsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statements; }
	}

	public final StatementsContext statements() throws RecognitionException {
		StatementsContext _localctx = new StatementsContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_statements);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(17); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(16);
				statement();
				}
				}
				setState(19); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__6) | (1L << T__7) | (1L << VARNAME))) != 0) );
			setState(21);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public AssignmentStmtContext assignmentStmt() {
			return getRuleContext(AssignmentStmtContext.class,0);
		}
		public DeclarationStmtContext declarationStmt() {
			return getRuleContext(DeclarationStmtContext.class,0);
		}
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_statement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(25);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__1:
			case VARNAME:
				{
				setState(23);
				assignmentStmt();
				}
				break;
			case T__6:
			case T__7:
				{
				setState(24);
				declarationStmt();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(27);
			match(T__0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ShapeLiteralContext extends ParserRuleContext {
		public TerminalNode SQR() { return getToken(FactoryCParser.SQR, 0); }
		public TerminalNode CIR() { return getToken(FactoryCParser.CIR, 0); }
		public TerminalNode TLS() { return getToken(FactoryCParser.TLS, 0); }
		public TerminalNode TRS() { return getToken(FactoryCParser.TRS, 0); }
		public TerminalNode BLS() { return getToken(FactoryCParser.BLS, 0); }
		public TerminalNode BRS() { return getToken(FactoryCParser.BRS, 0); }
		public TerminalNode TLC() { return getToken(FactoryCParser.TLC, 0); }
		public TerminalNode TRC() { return getToken(FactoryCParser.TRC, 0); }
		public TerminalNode BLC() { return getToken(FactoryCParser.BLC, 0); }
		public TerminalNode BRC() { return getToken(FactoryCParser.BRC, 0); }
		public ShapeLiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_shapeLiteral; }
	}

	public final ShapeLiteralContext shapeLiteral() throws RecognitionException {
		ShapeLiteralContext _localctx = new ShapeLiteralContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_shapeLiteral);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(29);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << SQR) | (1L << CIR) | (1L << TLS) | (1L << TRS) | (1L << BLS) | (1L << BRS) | (1L << TLC) | (1L << TRC) | (1L << BLC) | (1L << BRC))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableExprContext extends ParserRuleContext {
		public Token modifier;
		public TerminalNode VARNAME() { return getToken(FactoryCParser.VARNAME, 0); }
		public VariableExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableExpr; }
	}

	public final VariableExprContext variableExpr() throws RecognitionException {
		VariableExprContext _localctx = new VariableExprContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_variableExpr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(32);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__1 || _la==T__2) {
				{
				setState(31);
				((VariableExprContext)_localctx).modifier = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__1 || _la==T__2) ) {
					((VariableExprContext)_localctx).modifier = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
			}

			setState(34);
			match(VARNAME);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ValueExprContext extends ParserRuleContext {
		public ShapeLiteralContext shapeLiteral() {
			return getRuleContext(ShapeLiteralContext.class,0);
		}
		public VariableExprContext variableExpr() {
			return getRuleContext(VariableExprContext.class,0);
		}
		public ValueExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_valueExpr; }
	}

	public final ValueExprContext valueExpr() throws RecognitionException {
		ValueExprContext _localctx = new ValueExprContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_valueExpr);
		try {
			setState(38);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case SQR:
			case CIR:
			case TLS:
			case TRS:
			case BLS:
			case BRS:
			case TLC:
			case TRC:
			case BLC:
			case BRC:
				enterOuterAlt(_localctx, 1);
				{
				setState(36);
				shapeLiteral();
				}
				break;
			case T__1:
			case T__2:
			case VARNAME:
				enterOuterAlt(_localctx, 2);
				{
				setState(37);
				variableExpr();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public Token op;
		public ValueExprContext valueExpr() {
			return getRuleContext(ValueExprContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 10;
		enterRecursionRule(_localctx, 10, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(41);
			valueExpr();
			}
			_ctx.stop = _input.LT(-1);
			setState(48);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,4,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ExprContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_expr);
					setState(43);
					if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
					setState(44);
					((ExprContext)_localctx).op = _input.LT(1);
					_la = _input.LA(1);
					if ( !(_la==T__3 || _la==T__4) ) {
						((ExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(45);
					valueExpr();
					}
					} 
				}
				setState(50);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,4,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class AssignmentStmtContext extends ParserRuleContext {
		public Token deref;
		public TerminalNode VARNAME() { return getToken(FactoryCParser.VARNAME, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public AssignmentStmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignmentStmt; }
	}

	public final AssignmentStmtContext assignmentStmt() throws RecognitionException {
		AssignmentStmtContext _localctx = new AssignmentStmtContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_assignmentStmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(52);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__1) {
				{
				setState(51);
				((AssignmentStmtContext)_localctx).deref = match(T__1);
				}
			}

			setState(54);
			match(VARNAME);
			setState(55);
			match(T__5);
			setState(56);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DeclarationStmtContext extends ParserRuleContext {
		public Token protect;
		public Token pointer;
		public TerminalNode VARNAME() { return getToken(FactoryCParser.VARNAME, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public DeclarationStmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_declarationStmt; }
	}

	public final DeclarationStmtContext declarationStmt() throws RecognitionException {
		DeclarationStmtContext _localctx = new DeclarationStmtContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_declarationStmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(59);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__6) {
				{
				setState(58);
				((DeclarationStmtContext)_localctx).protect = match(T__6);
				}
			}

			setState(61);
			match(T__7);
			setState(63);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__1) {
				{
				setState(62);
				((DeclarationStmtContext)_localctx).pointer = match(T__1);
				}
			}

			setState(65);
			match(VARNAME);
			setState(68);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__5) {
				{
				setState(66);
				match(T__5);
				setState(67);
				expr(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 5:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 1);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\27I\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\3\2\6\2\24\n\2\r\2"+
		"\16\2\25\3\2\3\2\3\3\3\3\5\3\34\n\3\3\3\3\3\3\4\3\4\3\5\5\5#\n\5\3\5\3"+
		"\5\3\6\3\6\5\6)\n\6\3\7\3\7\3\7\3\7\3\7\3\7\7\7\61\n\7\f\7\16\7\64\13"+
		"\7\3\b\5\b\67\n\b\3\b\3\b\3\b\3\b\3\t\5\t>\n\t\3\t\3\t\5\tB\n\t\3\t\3"+
		"\t\3\t\5\tG\n\t\3\t\2\3\f\n\2\4\6\b\n\f\16\20\2\5\3\2\r\26\3\2\4\5\3\2"+
		"\6\7\2I\2\23\3\2\2\2\4\33\3\2\2\2\6\37\3\2\2\2\b\"\3\2\2\2\n(\3\2\2\2"+
		"\f*\3\2\2\2\16\66\3\2\2\2\20=\3\2\2\2\22\24\5\4\3\2\23\22\3\2\2\2\24\25"+
		"\3\2\2\2\25\23\3\2\2\2\25\26\3\2\2\2\26\27\3\2\2\2\27\30\7\2\2\3\30\3"+
		"\3\2\2\2\31\34\5\16\b\2\32\34\5\20\t\2\33\31\3\2\2\2\33\32\3\2\2\2\34"+
		"\35\3\2\2\2\35\36\7\3\2\2\36\5\3\2\2\2\37 \t\2\2\2 \7\3\2\2\2!#\t\3\2"+
		"\2\"!\3\2\2\2\"#\3\2\2\2#$\3\2\2\2$%\7\13\2\2%\t\3\2\2\2&)\5\6\4\2\')"+
		"\5\b\5\2(&\3\2\2\2(\'\3\2\2\2)\13\3\2\2\2*+\b\7\1\2+,\5\n\6\2,\62\3\2"+
		"\2\2-.\f\3\2\2./\t\4\2\2/\61\5\n\6\2\60-\3\2\2\2\61\64\3\2\2\2\62\60\3"+
		"\2\2\2\62\63\3\2\2\2\63\r\3\2\2\2\64\62\3\2\2\2\65\67\7\4\2\2\66\65\3"+
		"\2\2\2\66\67\3\2\2\2\678\3\2\2\289\7\13\2\29:\7\b\2\2:;\5\f\7\2;\17\3"+
		"\2\2\2<>\7\t\2\2=<\3\2\2\2=>\3\2\2\2>?\3\2\2\2?A\7\n\2\2@B\7\4\2\2A@\3"+
		"\2\2\2AB\3\2\2\2BC\3\2\2\2CF\7\13\2\2DE\7\b\2\2EG\5\f\7\2FD\3\2\2\2FG"+
		"\3\2\2\2G\21\3\2\2\2\13\25\33\"(\62\66=AF";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}