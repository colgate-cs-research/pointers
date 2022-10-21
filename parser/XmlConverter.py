from PsuedoCListener import PsuedoCListener
from PsuedoCParser import PsuedoCParser
from xml.etree import ElementTree

class XmlConverter(PsuedoCListener):
    def enterStatements(self, ctx:PsuedoCParser.StatementsContext):
        self.statements = ElementTree.Element('statements')

    def enterDeclarationStmt(self, ctx:PsuedoCParser.DeclarationStmtContext):
        node = ElementTree.SubElement(self.statements, "declaration")
        node.set("type", ctx.type_().typename.text)
        node.set("varname", str(ctx.VARNAME()))

    def enterAssignmentStmt(self, ctx:PsuedoCParser.AssignmentStmtContext):
        node = ElementTree.SubElement(self.statements, "assignment")
        if (ctx.deref is not None):
            node.set("deref", True)
        node.set("varname", str(ctx.VARNAME()))

    def enterLiteralExpr(self, ctx:PsuedoCParser.LiteralExprContext):
        node = ElementTree.Element('literal')
        node.set("value", str(ctx.INT()))
        print(node)
