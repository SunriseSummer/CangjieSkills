package source_metrics

import std.ast.*

private func source(body: String): String {
    return "package sample.metrics\n" + body
}

private class DeclCounter <: DeclRule<Int64> {
    public func seed(): Int64 { 0 }
    public func measure(_: Decl): Int64 { 1 }
    public func combine(left: Int64, right: Int64): Int64 { left + right }
}

private class NameLengthRule <: DeclRule<Int64> {
    public func seed(): Int64 { 0 }
    public func measure(decl: Decl): Int64 { decl.identifier.value.size }
    public func combine(left: Int64, right: Int64): Int64 { left + right }
}

@Test
class SourceMetricsTests {
    @TestCase
    func packageNameIsQualified(): Unit {
        @Assert(analyzeSource(source("")).packageName, "sample.metrics")
    }

    @TestCase
    func countsImports(): Unit {
        let code = "package p\nimport std.collection.*\nimport std.ast.Token\n"
        @Assert(analyzeSource(code).importCount, 2)
    }

    @TestCase
    func countsTopLevelFunction(): Unit {
        @Assert(analyzeSource(source("func f(): Unit {}\n")).functionCount, 1)
    }

    @TestCase
    func countsMemberFunctions(): Unit {
        let metrics = analyzeSource(source("class C {\nfunc a(): Unit {}\nfunc b(): Unit {}\n}"))
        @Assert(metrics.functionCount, 2)
    }

    @TestCase
    func countsFourTypeDeclarations(): Unit {
        let code = "class C {}\nstruct S {}\ninterface I {}\nenum E { | A }"
        @Assert(analyzeSource(source(code)).typeCount, 4)
    }

    @TestCase
    func countsVariablesWithoutParameters(): Unit {
        let code = "let top = 1\nfunc f(arg: Int64): Unit { let local = arg }"
        @Assert(analyzeSource(source(code)).variableCount, 2)
    }

    @TestCase
    func countsTypeAliases(): Unit {
        @Assert(analyzeSource(source("type Names = Array<String>\n")).typeAliasCount, 1)
    }

    @TestCase
    func countsExtensions(): Unit {
        @Assert(analyzeSource(source("extend String { func twice(): String { this + this } }")).extensionCount, 1)
    }

    @TestCase
    func countsGenericConstraints(): Unit {
        let code = "interface Sized {}\nfunc use<T>(x: T): Unit where T <: Sized {}"
        @Assert(analyzeSource(source(code)).genericConstraintCount, 1)
    }

    @TestCase
    func countsLoopKinds(): Unit {
        let code = "func loops(xs: Array<Int64>): Unit {\nfor (x in xs) {}\nwhile (false) {}\ndo {} while (false)\n}"
        @Assert(analyzeSource(source(code)).loopCount, 3)
    }

    @TestCase
    func countsIfExpressions(): Unit {
        let code = "func choose(x: Bool): Int64 { if (x) { 1 } else { 2 } }"
        @Assert(analyzeSource(source(code)).ifCount, 1)
    }

    @TestCase
    func countsMatchExpressions(): Unit {
        let code = "func choose(x: Bool): Int64 { match (x) { case true => 1 case false => 0 } }"
        @Assert(analyzeSource(source(code)).matchCount, 1)
    }

    @TestCase
    func countsCalls(): Unit {
        let code = "func a(): Unit {}\nfunc b(): Unit { a(); a() }"
        @Assert(analyzeSource(source(code)).callCount, 2)
    }

    @TestCase
    func findsDirectRecursion(): Unit {
        let code = "func fact(n: Int64): Int64 { if (n <= 1) { 1 } else { n * fact(n - 1) } }"
        let names = findRecursiveFunctions(source(code))
        @Assert(names.size, 1)
        @Assert(names[0], "fact")
    }

    @TestCase
    func doesNotReportOrdinaryCallsAsRecursion(): Unit {
        let code = "func a(): Unit {}\nfunc b(): Unit { a() }"
        @Assert(findRecursiveFunctions(source(code)).size, 0)
    }

    @TestCase
    func reportsRecursiveMethod(): Unit {
        let code = "class C { func walk(n: Int64): Int64 { if (n == 0) { 0 } else { walk(n - 1) } } }"
        @Assert(findRecursiveFunctions(source(code))[0], "walk")
    }

    @TestCase
    func countsPublicDeclarations(): Unit {
        let code = "public class C { public func f(): Unit {} }"
        @Assert(analyzeSource(source(code)).publicDeclarationCount, 2)
    }

    @TestCase
    func countsPrivateDeclarations(): Unit {
        let code = "class C {\nprivate let x = 1\nprivate func f(): Unit {}\n}"
        @Assert(analyzeSource(source(code)).privateDeclarationCount, 2)
    }

    @TestCase
    func countsProtectedDeclarations(): Unit {
        let code = "open class C { protected func f(): Unit {} }"
        @Assert(analyzeSource(source(code)).protectedDeclarationCount, 1)
    }

    @TestCase
    func countsInternalDeclarations(): Unit {
        @Assert(analyzeSource(source("internal class C {}\n")).internalDeclarationCount, 1)
    }

    @TestCase
    func countsDefaultVisibility(): Unit {
        let metrics = analyzeSource(source("class C {}\nfunc f(): Unit {}"))
        @Assert(metrics.defaultDeclarationCount, 2)
    }

    @TestCase
    func classifiesDeclarationsWithTypePatterns(): Unit {
        let function = parseDecl(cangjieLex("func f(): Unit {}"))
        let alias = parseDecl(cangjieLex("type Id = Int64"))
        @Assert(match (classify(function)) {
            case DeclKind.Function => true
            case _ => false
        })
        @Assert(match (classify(alias)) {
            case DeclKind.TypeAlias => true
            case _ => false
        })
    }

    @TestCase
    func foldsTopLevelDeclarationsGenerically(): Unit {
        let code = source("class A {}\nfunc bb(): Unit {}\nlet ccc = 3")
        @Assert(foldTopLevel(code, DeclCounter()), 3)
    }

    @TestCase
    func genericFoldUsesRuleResultType(): Unit {
        let code = source("class A {}\nfunc bb(): Unit {}\nlet ccc = 3")
        @Assert(foldTopLevel(code, NameLengthRule()), 6)
    }

    @TestCase
    func invalidSourceHasStableException(): Unit {
        try {
            analyzeSource("package broken\nfunc")
            @Fail("expected AnalysisException")
        } catch (error: AnalysisException) {
            @Assert(error.getClassName(), "AnalysisException")
            @Assert(error.message, "source cannot be parsed")
        }
    }
}
