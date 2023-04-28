from FactoryCListener import FactoryCListener
from FactoryCParser import FactoryCParser
from xml.etree import ElementTree

class XmlConverter(FactoryCListener):
    def __init__(self):
        self.nodes = []

    def enterStatements(self, ctx:FactoryCParser.StatementsContext):
        self.statements = ElementTree.Element('statements')

    def enterAssignmentStmt(self, ctx:FactoryCParser.AssignmentStmtContext):
        node = ElementTree.SubElement(self.statements, "assignment")
        modifier = ""
        if (ctx.deref is not None):
            modifier = "*"
        node.set("modifier", modifier)
        node.set("varname", str(ctx.VARNAME()))
        self.nodes.append(node)
    
    def exitAssignmentStmt(self, ctx:FactoryCParser.AssignmentStmtContext):
        self.nodes.pop()

    def enterVariableExpr(self, ctx:FactoryCParser.VariableExprContext):
        node = ElementTree.SubElement(self.nodes[-1], 'variable')
        modifier = ""
        if (ctx.modifier is not None):
            modifier = ctx.modifier.text
        node.set("modifier", modifier)
        node.set("varname", str(ctx.VARNAME()))

    # Enter a parse tree produced by FactoryCParser#expr.
    def enterExpr(self, ctx: FactoryCParser.ExprContext):
        node = ElementTree.SubElement(self.nodes[-1], "expression")
        op = ""
        if (ctx.op is not None):
            op = ctx.op.text
            node.set("op", op)
        self.nodes.append(node)

    def exitExpr(self, ctx: FactoryCParser.ExprContext):
        self.nodes.pop()

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
        self.nodes.append(node)
    
    def exitDeclarationStmt(self, ctx: FactoryCParser.DeclarationStmtContext):
        self.nodes.pop()

    def enterShapeLiteral(self, ctx:FactoryCParser.ShapeLiteralContext):
        node = ElementTree.SubElement(self.nodes[-1], 'shape')
        node.set("value", ctx.getText())

    def enterFunctionExpr(self, ctx: FactoryCParser.FunctionExprContext):
        node = ElementTree.SubElement(self.nodes[-1], 'function')
        node.set("funcname", str(ctx.FUNCNAME()))
