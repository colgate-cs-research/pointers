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
        node.set("modifier", modifier)
        node.set("varname", str(ctx.VARNAME()))
        self.parent = node

    # Enter a parse tree produced by FactoryCParser#valueExpr.
    def enterValueExpr(self, ctx: FactoryCParser.ValueExprContext):
        node = ElementTree.SubElement(self.parent, "value")
        self.parent = node
        pass

    # Enter a parse tree produced by FactoryCParser#expr.
    def enterExpr(self, ctx: FactoryCParser.ExprContext):
        node = ElementTree.SubElement(self.parent, "expression")
        op = ""
        if (ctx.op is not None):
            op = ctx.op.text
            node.set("op", op)
        self.parent = node
        pass

    # Enter a parse tree produced by FactoryCParser#declarationStmt.
    def enterDeclarationStmt(self, ctx: FactoryCParser.DeclarationStmtContext):
        node = ElementTree.SubElement(self.statements, "declaration")
        modifier = ""
        if (ctx.pointer is not None):
            modifier = "*"
        protected = "False"
        if (ctx.protect is not None):
            protected = "True"
        node.set("modifier", modifier)
        node.set("protect", protected)
        node.set("varname", str(ctx.VARNAME()))
        self.parent = node

    def enterShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        node = ElementTree.SubElement(self.parent, 'shape')
        node.set("value", ctx.getText())
        self.parent = node

    def enterFunctionExpr(self, ctx: FactoryCParser.FunctionExprContext):
        node = ElementTree.SubElement(self.parent, 'function')
        node.set("funcname", str(ctx.FUNCNAME()))
        self.parent = node
