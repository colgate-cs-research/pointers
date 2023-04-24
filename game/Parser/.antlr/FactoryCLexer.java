// Generated from /Users/jefferyyang/Documents/GitHub.nosync/pointers/game/Parser/FactoryC.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class FactoryCLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, ALL=9, 
		NON=10, SQR=11, CIR=12, TLS=13, TRS=14, BLS=15, BRS=16, TLC=17, TRC=18, 
		BLC=19, BRC=20, FUNCNAME=21, VARNAME=22, WHITESPACE=23, COMMENT=24;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "ALL", 
			"NON", "SQR", "CIR", "TLS", "TRS", "BLS", "BRS", "TLC", "TRC", "BLC", 
			"BRC", "ALPHA", "DIGIT", "FUNCNAME", "VARNAME", "WHITESPACE", "COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'*'", "'&'", "'+'", "'-'", "'='", "'nodirect'", "'shape'", 
			"'ALL'", "'NON'", "'SQR'", "'CIR'", "'TLS'", "'TRS'", "'BLS'", "'BRS'", 
			"'TLC'", "'TRC'", "'BLC'", "'BRC'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, "ALL", "NON", "SQR", 
			"CIR", "TLS", "TRS", "BLS", "BRS", "TLC", "TRC", "BLC", "BRC", "FUNCNAME", 
			"VARNAME", "WHITESPACE", "COMMENT"
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


	public FactoryCLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "FactoryC.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\32\u00aa\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\3\2\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7"+
		"\3\7\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3"+
		"\n\3\n\3\n\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\16\3"+
		"\16\3\16\3\16\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3"+
		"\21\3\22\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\25\3"+
		"\25\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\30\3\30\7\30\u008b\n\30"+
		"\f\30\16\30\u008e\13\30\3\30\3\30\3\30\3\31\3\31\3\31\3\31\7\31\u0097"+
		"\n\31\f\31\16\31\u009a\13\31\3\32\3\32\3\32\3\32\3\33\3\33\3\33\3\33\7"+
		"\33\u00a4\n\33\f\33\16\33\u00a7\13\33\3\33\3\33\2\2\34\3\3\5\4\7\5\t\6"+
		"\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24"+
		"\'\25)\26+\2-\2/\27\61\30\63\31\65\32\3\2\6\4\2C\\c|\3\2\62;\5\2\13\f"+
		"\17\17\"\"\4\2\f\f\17\17\2\u00ae\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2"+
		"\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2"+
		"\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2"+
		"\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2"+
		"\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\3\67\3\2\2\2\59\3\2"+
		"\2\2\7;\3\2\2\2\t=\3\2\2\2\13?\3\2\2\2\rA\3\2\2\2\17C\3\2\2\2\21L\3\2"+
		"\2\2\23R\3\2\2\2\25V\3\2\2\2\27Z\3\2\2\2\31^\3\2\2\2\33b\3\2\2\2\35f\3"+
		"\2\2\2\37j\3\2\2\2!n\3\2\2\2#r\3\2\2\2%v\3\2\2\2\'z\3\2\2\2)~\3\2\2\2"+
		"+\u0082\3\2\2\2-\u0084\3\2\2\2/\u0086\3\2\2\2\61\u0092\3\2\2\2\63\u009b"+
		"\3\2\2\2\65\u009f\3\2\2\2\678\7=\2\28\4\3\2\2\29:\7,\2\2:\6\3\2\2\2;<"+
		"\7(\2\2<\b\3\2\2\2=>\7-\2\2>\n\3\2\2\2?@\7/\2\2@\f\3\2\2\2AB\7?\2\2B\16"+
		"\3\2\2\2CD\7p\2\2DE\7q\2\2EF\7f\2\2FG\7k\2\2GH\7t\2\2HI\7g\2\2IJ\7e\2"+
		"\2JK\7v\2\2K\20\3\2\2\2LM\7u\2\2MN\7j\2\2NO\7c\2\2OP\7r\2\2PQ\7g\2\2Q"+
		"\22\3\2\2\2RS\7C\2\2ST\7N\2\2TU\7N\2\2U\24\3\2\2\2VW\7P\2\2WX\7Q\2\2X"+
		"Y\7P\2\2Y\26\3\2\2\2Z[\7U\2\2[\\\7S\2\2\\]\7T\2\2]\30\3\2\2\2^_\7E\2\2"+
		"_`\7K\2\2`a\7T\2\2a\32\3\2\2\2bc\7V\2\2cd\7N\2\2de\7U\2\2e\34\3\2\2\2"+
		"fg\7V\2\2gh\7T\2\2hi\7U\2\2i\36\3\2\2\2jk\7D\2\2kl\7N\2\2lm\7U\2\2m \3"+
		"\2\2\2no\7D\2\2op\7T\2\2pq\7U\2\2q\"\3\2\2\2rs\7V\2\2st\7N\2\2tu\7E\2"+
		"\2u$\3\2\2\2vw\7V\2\2wx\7T\2\2xy\7E\2\2y&\3\2\2\2z{\7D\2\2{|\7N\2\2|}"+
		"\7E\2\2}(\3\2\2\2~\177\7D\2\2\177\u0080\7T\2\2\u0080\u0081\7E\2\2\u0081"+
		"*\3\2\2\2\u0082\u0083\t\2\2\2\u0083,\3\2\2\2\u0084\u0085\t\3\2\2\u0085"+
		".\3\2\2\2\u0086\u008c\5+\26\2\u0087\u008b\5+\26\2\u0088\u008b\5-\27\2"+
		"\u0089\u008b\7a\2\2\u008a\u0087\3\2\2\2\u008a\u0088\3\2\2\2\u008a\u0089"+
		"\3\2\2\2\u008b\u008e\3\2\2\2\u008c\u008a\3\2\2\2\u008c\u008d\3\2\2\2\u008d"+
		"\u008f\3\2\2\2\u008e\u008c\3\2\2\2\u008f\u0090\7*\2\2\u0090\u0091\7+\2"+
		"\2\u0091\60\3\2\2\2\u0092\u0098\5+\26\2\u0093\u0097\5+\26\2\u0094\u0097"+
		"\5-\27\2\u0095\u0097\7a\2\2\u0096\u0093\3\2\2\2\u0096\u0094\3\2\2\2\u0096"+
		"\u0095\3\2\2\2\u0097\u009a\3\2\2\2\u0098\u0096\3\2\2\2\u0098\u0099\3\2"+
		"\2\2\u0099\62\3\2\2\2\u009a\u0098\3\2\2\2\u009b\u009c\t\4\2\2\u009c\u009d"+
		"\3\2\2\2\u009d\u009e\b\32\2\2\u009e\64\3\2\2\2\u009f\u00a0\7\61\2\2\u00a0"+
		"\u00a1\7\61\2\2\u00a1\u00a5\3\2\2\2\u00a2\u00a4\n\5\2\2\u00a3\u00a2\3"+
		"\2\2\2\u00a4\u00a7\3\2\2\2\u00a5\u00a3\3\2\2\2\u00a5\u00a6\3\2\2\2\u00a6"+
		"\u00a8\3\2\2\2\u00a7\u00a5\3\2\2\2\u00a8\u00a9\b\33\2\2\u00a9\66\3\2\2"+
		"\2\b\2\u008a\u008c\u0096\u0098\u00a5\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}