package quality_gate_expression_vm

private func expectVm(expr: Expr, message: String): Unit {
    try { evaluate(expr); @Fail("expected VmException") } catch (error: VmException) { @Assert(error.message, message) }
}

@Test
class ExpressionVmTests {
    @TestCase func number(): Unit { @Assert(evaluate(Num(7)), 7) }
    @TestCase func addition(): Unit { @Assert(evaluate(Add(Num(2), Num(3))), 5) }
    @TestCase func subtraction(): Unit { @Assert(evaluate(Sub(Num(9), Num(4))), 5) }
    @TestCase func multiplication(): Unit { @Assert(evaluate(Mul(Num(6), Num(7))), 42) }
    @TestCase func division(): Unit { @Assert(evaluate(Div(Num(9), Num(2))), 4) }
    @TestCase func negation(): Unit { @Assert(evaluate(Neg(Num(8))), -8) }
    @TestCase func nestedArithmetic(): Unit { @Assert(evaluate(Mul(Add(Num(2), Num(3)), Sub(Num(10), Num(4)))), 30) }
    @TestCase func environmentContains(): Unit { @Assert(Environment().put("x", 1).contains("x"), true) }
    @TestCase func environmentMissing(): Unit { @Assert(Environment().contains("x"), false) }
    @TestCase func environmentOverwrites(): Unit { @Assert(Environment().put("x", 1).put("x", 2).value("x"), 2) }
    @TestCase func variableEvaluation(): Unit { @Assert(evaluate(Add(Var("x"), Num(1)), env: Environment().put("x", 4)), 5) }
    @TestCase func missingVariable(): Unit { expectVm(Var("lost"), "undefined variable: lost") }
    @TestCase func divisionByZero(): Unit { expectVm(Div(Num(1), Num(0)), "division by zero") }
    @TestCase func ifZeroYes(): Unit { @Assert(evaluate(IfZero(Num(0), Num(1), Num(2))), 1) }
    @TestCase func ifZeroNo(): Unit { @Assert(evaluate(IfZero(Num(3), Num(1), Num(2))), 2) }
    @TestCase func ifZeroIsLazy(): Unit { @Assert(evaluate(IfZero(Num(0), Num(9), Div(Num(1), Num(0)))), 9) }
    @TestCase func countLeaf(): Unit { @Assert(nodeCount(Num(1)), 1) }
    @TestCase func countTree(): Unit { @Assert(nodeCount(Add(Num(1), Neg(Num(2)))), 4) }
    @TestCase func depthLeaf(): Unit { @Assert(depth(Var("x")), 1) }
    @TestCase func depthTree(): Unit { @Assert(depth(Add(Num(1), Neg(Num(2)))), 3) }
    @TestCase func renderLeaf(): Unit { @Assert(render(Var("count")), "count") }
    @TestCase func renderArithmetic(): Unit { @Assert(render(Mul(Add(Num(1), Num(2)), Neg(Var("x")))), "((1 + 2) * (-x))") }
    @TestCase func renderIfZero(): Unit { @Assert(render(IfZero(Var("x"), Num(1), Num(2))), "(if0 x then 1 else 2)") }
}
