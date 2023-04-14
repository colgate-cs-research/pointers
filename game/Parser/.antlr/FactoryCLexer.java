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
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, VARNAME=9, 
		WHITESPACE=10, SQR=11, CIR=12, TLS=13, TRS=14, BLS=15, BRS=16, TLC=17, 
		TRC=18, BLC=19, BRC=20, COMMENT=21;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "ALPHA", 
			"DIGIT", "VARNAME", "WHITESPACE", "SQR", "CIR", "TLS", "TRS", "BLS", 
			"BRS", "TLC", "TRC", "BLC", "BRC", "COMMENT"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\27\u0090\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\3\2"+
		"\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3\b\3"+
		"\b\3\b\3\b\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\f\3\f\7"+
		"\fU\n\f\f\f\16\fX\13\f\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\17\3\17\3"+
		"\17\3\17\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3"+
		"\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\25\3\25\3\25\3\25\3\26\3\26\3"+
		"\26\3\26\3\27\3\27\3\27\3\27\3\30\3\30\3\30\3\30\7\30\u008a\n\30\f\30"+
		"\16\30\u008d\13\30\3\30\3\30\2\2\31\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n"+
		"\23\2\25\2\27\13\31\f\33\r\35\16\37\17!\20#\21%\22\'\23)\24+\25-\26/\27"+
		"\3\2\6\4\2C\\c|\3\2\62;\5\2\13\f\17\17\"\"\4\2\f\f\17\17\2\u0091\2\3\3"+
		"\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2"+
		"\17\3\2\2\2\2\21\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3"+
		"\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3"+
		"\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\3\61\3\2\2\2\5\63\3\2\2\2\7\65"+
		"\3\2\2\2\t\67\3\2\2\2\139\3\2\2\2\r;\3\2\2\2\17=\3\2\2\2\21F\3\2\2\2\23"+
		"L\3\2\2\2\25N\3\2\2\2\27P\3\2\2\2\31Y\3\2\2\2\33]\3\2\2\2\35a\3\2\2\2"+
		"\37e\3\2\2\2!i\3\2\2\2#m\3\2\2\2%q\3\2\2\2\'u\3\2\2\2)y\3\2\2\2+}\3\2"+
		"\2\2-\u0081\3\2\2\2/\u0085\3\2\2\2\61\62\7=\2\2\62\4\3\2\2\2\63\64\7,"+
		"\2\2\64\6\3\2\2\2\65\66\7(\2\2\66\b\3\2\2\2\678\7-\2\28\n\3\2\2\29:\7"+
		"/\2\2:\f\3\2\2\2;<\7?\2\2<\16\3\2\2\2=>\7p\2\2>?\7q\2\2?@\7f\2\2@A\7k"+
		"\2\2AB\7t\2\2BC\7g\2\2CD\7e\2\2DE\7v\2\2E\20\3\2\2\2FG\7u\2\2GH\7j\2\2"+
		"HI\7c\2\2IJ\7r\2\2JK\7g\2\2K\22\3\2\2\2LM\t\2\2\2M\24\3\2\2\2NO\t\3\2"+
		"\2O\26\3\2\2\2PV\5\23\n\2QU\5\23\n\2RU\5\25\13\2SU\7a\2\2TQ\3\2\2\2TR"+
		"\3\2\2\2TS\3\2\2\2UX\3\2\2\2VT\3\2\2\2VW\3\2\2\2W\30\3\2\2\2XV\3\2\2\2"+
		"YZ\t\4\2\2Z[\3\2\2\2[\\\b\r\2\2\\\32\3\2\2\2]^\7U\2\2^_\7S\2\2_`\7T\2"+
		"\2`\34\3\2\2\2ab\7E\2\2bc\7K\2\2cd\7T\2\2d\36\3\2\2\2ef\7V\2\2fg\7N\2"+
		"\2gh\7U\2\2h \3\2\2\2ij\7V\2\2jk\7T\2\2kl\7U\2\2l\"\3\2\2\2mn\7D\2\2n"+
		"o\7N\2\2op\7U\2\2p$\3\2\2\2qr\7D\2\2rs\7T\2\2st\7U\2\2t&\3\2\2\2uv\7V"+
		"\2\2vw\7N\2\2wx\7E\2\2x(\3\2\2\2yz\7V\2\2z{\7T\2\2{|\7E\2\2|*\3\2\2\2"+
		"}~\7D\2\2~\177\7N\2\2\177\u0080\7E\2\2\u0080,\3\2\2\2\u0081\u0082\7D\2"+
		"\2\u0082\u0083\7T\2\2\u0083\u0084\7E\2\2\u0084.\3\2\2\2\u0085\u0086\7"+
		"\61\2\2\u0086\u0087\7\61\2\2\u0087\u008b\3\2\2\2\u0088\u008a\n\5\2\2\u0089"+
		"\u0088\3\2\2\2\u008a\u008d\3\2\2\2\u008b\u0089\3\2\2\2\u008b\u008c\3\2"+
		"\2\2\u008c\u008e\3\2\2\2\u008d\u008b\3\2\2\2\u008e\u008f\b\30\2\2\u008f"+
		"\60\3\2\2\2\6\2TV\u008b\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}