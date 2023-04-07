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

    # Enter a parse tree produced by FactoryCParser#valueExpr.
    def enterValueExpr(self, ctx: FactoryCParser.ValueExprContext):
        node = ElementTree.SubElement(self.statements, "value")
        self.parent = node
        pass

    # Enter a parse tree produced by FactoryCParser#expr.
    def enterExpr(self, ctx: FactoryCParser.ExprContext):
        node = ElementTree.SubElement(self.statements, "expression")
        op = ""
        if (ctx.op is not None):
            op = ctx.op.text
        node.set("op", op)
        node.set("left", str(ctx.expr))
        node.set("right", str(ctx.valueExpr))
        self.parent = node
        pass

    # Enter a parse tree produced by FactoryCParser#declarationStmt.
    def enterDeclarationStmt(self, ctx: FactoryCParser.DeclarationStmtContext):
        node = ElementTree.SubElement(self.statements, "assignment")
        modifier = ""
        if (ctx.pointer is not None):
            modifier = "*"
        node.set("modifier", modifier)
        node.set("varname", str(ctx.VARNAME()))
        init = ""
        if (ctx.init is not None):
            init = str(ctx.init)
        node.set("init", init)
        self.parent = node

    def enterShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        node = ElementTree.SubElement(self.parent, 'shape')
        node.set("value", ctx.getToken())
        self.parent = node

