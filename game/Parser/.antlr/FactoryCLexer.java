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
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, VARNAME=8, WHITESPACE=9, 
		SQR=10, CIR=11, TLS=12, TRS=13, BLS=14, BRS=15, TLC=16, TRC=17, BLC=18, 
		BRC=19, COMMENT=20;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "ALPHA", "DIGIT", 
			"VARNAME", "WHITESPACE", "SQR", "CIR", "TLS", "TRS", "BLS", "BRS", "TLC", 
			"TRC", "BLC", "BRC", "COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'*'", "'&'", "'+'", "'-'", "'='", "'shape'", null, null, 
			"'SQR'", "'CIR'", "'TLS'", "'TRS'", "'BLS'", "'BRS'", "'TLC'", "'TRC'", 
			"'BLC'", "'BRC'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, "VARNAME", "WHITESPACE", 
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\26\u0085\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\3\2\3\2\3\3\3"+
		"\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\n"+
		"\3\n\3\13\3\13\3\13\3\13\7\13J\n\13\f\13\16\13M\13\13\3\f\3\f\3\f\3\f"+
		"\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3\20\3\20\3\20"+
		"\3\20\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\24"+
		"\3\24\3\24\3\24\3\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\27\3\27\3\27"+
		"\3\27\7\27\177\n\27\f\27\16\27\u0082\13\27\3\27\3\27\2\2\30\3\3\5\4\7"+
		"\5\t\6\13\7\r\b\17\t\21\2\23\2\25\n\27\13\31\f\33\r\35\16\37\17!\20#\21"+
		"%\22\'\23)\24+\25-\26\3\2\6\4\2C\\c|\3\2\62;\5\2\13\f\17\17\"\"\5\2\f"+
		"\f\17\17\"\"\2\u0086\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2"+
		"\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3"+
		"\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2"+
		"%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\3/\3\2\2\2\5\61"+
		"\3\2\2\2\7\63\3\2\2\2\t\65\3\2\2\2\13\67\3\2\2\2\r9\3\2\2\2\17;\3\2\2"+
		"\2\21A\3\2\2\2\23C\3\2\2\2\25E\3\2\2\2\27N\3\2\2\2\31R\3\2\2\2\33V\3\2"+
		"\2\2\35Z\3\2\2\2\37^\3\2\2\2!b\3\2\2\2#f\3\2\2\2%j\3\2\2\2\'n\3\2\2\2"+
		")r\3\2\2\2+v\3\2\2\2-z\3\2\2\2/\60\7=\2\2\60\4\3\2\2\2\61\62\7,\2\2\62"+
		"\6\3\2\2\2\63\64\7(\2\2\64\b\3\2\2\2\65\66\7-\2\2\66\n\3\2\2\2\678\7/"+
		"\2\28\f\3\2\2\29:\7?\2\2:\16\3\2\2\2;<\7u\2\2<=\7j\2\2=>\7c\2\2>?\7r\2"+
		"\2?@\7g\2\2@\20\3\2\2\2AB\t\2\2\2B\22\3\2\2\2CD\t\3\2\2D\24\3\2\2\2EK"+
		"\5\21\t\2FJ\5\21\t\2GJ\5\23\n\2HJ\7a\2\2IF\3\2\2\2IG\3\2\2\2IH\3\2\2\2"+
		"JM\3\2\2\2KI\3\2\2\2KL\3\2\2\2L\26\3\2\2\2MK\3\2\2\2NO\t\4\2\2OP\3\2\2"+
		"\2PQ\b\f\2\2Q\30\3\2\2\2RS\7U\2\2ST\7S\2\2TU\7T\2\2U\32\3\2\2\2VW\7E\2"+
		"\2WX\7K\2\2XY\7T\2\2Y\34\3\2\2\2Z[\7V\2\2[\\\7N\2\2\\]\7U\2\2]\36\3\2"+
		"\2\2^_\7V\2\2_`\7T\2\2`a\7U\2\2a \3\2\2\2bc\7D\2\2cd\7N\2\2de\7U\2\2e"+
		"\"\3\2\2\2fg\7D\2\2gh\7T\2\2hi\7U\2\2i$\3\2\2\2jk\7V\2\2kl\7N\2\2lm\7"+
		"E\2\2m&\3\2\2\2no\7V\2\2op\7T\2\2pq\7E\2\2q(\3\2\2\2rs\7D\2\2st\7N\2\2"+
		"tu\7E\2\2u*\3\2\2\2vw\7D\2\2wx\7T\2\2xy\7E\2\2y,\3\2\2\2z{\7\61\2\2{|"+
		"\7\61\2\2|\u0080\3\2\2\2}\177\n\5\2\2~}\3\2\2\2\177\u0082\3\2\2\2\u0080"+
		"~\3\2\2\2\u0080\u0081\3\2\2\2\u0081\u0083\3\2\2\2\u0082\u0080\3\2\2\2"+
		"\u0083\u0084\b\27\2\2\u0084.\3\2\2\2\6\2IK\u0080\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}