import sys
from antlr4 import *
from FactoryCLexer import FactoryCLexer
from FactoryCParser import FactoryCParser
from XmlConverter import XmlConverter
from xml.etree import ElementTree
import xml.dom.minidom
 
def main(argv):
    input_stream = FileStream(argv[1])
    lexer = FactoryCLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = FactoryCParser(stream)
    tree = parser.statements()
    converter = XmlConverter()
    walker = ParseTreeWalker()
    walker.walk(converter, tree)

    # Display XML
    xmlStr = ElementTree.tostring(converter.statements)
    xmlStr = xmlStr.decode()
    #temp = xml.dom.minidom.parseString(xmlStr)
    #xmlStr = temp.toprettyxml();
    print(xmlStr)

 
if __name__ == '__main__':
    main(sys.argv)
