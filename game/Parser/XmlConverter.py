from FactoryCListener import FactoryCListener
from FactoryCParser import FactoryCParser
from xml.etree import ElementTree

class XmlConverter(FactoryCListener):
    def enterStatements(self, ctx:FactoryCParser.StatementsContext):
        self.statements = ElementTree.Element('statements')

    def enterAssignmentStmt(self, ctx:FactoryCParser.AssignmentStmtContext):
        node = ElementTree.SubElement(self.statements, "assignment")
        modifier = ""
        if (ctx.deref is not None):
            modifier = "*"
        node.set("modifier", modifier)
        node.set("varname", str(ctx.VARNAME()))
        self.parent = node

    def enterVariableExpr(self, ctx:FactoryCParser.VariableExprContext):
        node = ElementTree.SubElement(self.parent, 'variable')
        modifier = ""
        if (ctx.modifier is not None):
            modifier = ctx.modifier.text
#            if (modifier == '&'):
#                modifier = '@'
        node.set("modifier", modifier)
        node.set("name", str(ctx.VARNAME()))
        self.parent = node

    def enterModifyStmt(self, ctx:FactoryCParser.ModifyStmtContext):
        node = ElementTree.SubElement(self.statements, "modification")
        node.set("op", ctx.op.text)
        node.set("varname", str(ctx.VARNAME()))
        self.parent = node

    def enterShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        node = ElementTree.SubElement(self.parent, 'shape')
        for i in range(0, 8):
            node.set("bit" + str(i), str(ctx.BIT()[i]))
        self.parent = node

