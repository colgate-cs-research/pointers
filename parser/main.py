import sys
from antlr4 import *
from PsuedoCLexer import PsuedoCLexer
from PsuedoCParser import PsuedoCParser
from XmlConverter import XmlConverter
from xml.etree import ElementTree
 
def main(argv):
    input_stream = FileStream(argv[1])
    lexer = PsuedoCLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = PsuedoCParser(stream)
    tree = parser.statements()
    converter = XmlConverter()
    walker = ParseTreeWalker()
    walker.walk(converter, tree)
    xml = ElementTree.tostring(converter.statements)
    print(xml.decode())

 
if __name__ == '__main__':
    main(sys.argv)
