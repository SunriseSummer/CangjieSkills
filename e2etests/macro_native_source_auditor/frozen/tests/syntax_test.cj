package auditor_core.syntax

import auditor_core.model.AuditException

let widgetSource: String = "package demo\npublic class Widget {\n    public var count: Int64 = 0\n\n    public func render(): Unit {\n        return\n    }\n}\n\npublic func build(): Int64 {\n    let total = 1\n    return total\n}\n"
let tinySource: String = "package t\nfunc f(): Unit { let a = 1 }\n"

@Test
func indexSourceFunctionsTest(): Unit {
    @Expect(indexSource(widgetSource).functions, ["render", "build"])
    @Expect(indexSource(tinySource).functions, ["f"])
}

@Test
func indexSourceVariablesTest(): Unit {
    @Expect(indexSource(widgetSource).variables, ["count", "total"])
    @Expect(indexSource(tinySource).variables, ["a"])
}

@Test
func indexSourceClassesTest(): Unit {
    @Expect(indexSource(widgetSource).classes, ["Widget"])
    let empty: Array<String> = []
    @Expect(indexSource(tinySource).classes, empty)
}

@Test
func indexCountTest(): Unit {
    @Expect(indexSource(widgetSource).count(), 5)
    @Expect(indexSource(tinySource).count(), 2)
    @Expect(indexSource("package only\n").count(), 0)
}

@Test
func lexemeCountTest(): Unit {
    @Expect(lexemeCount(widgetSource), 52)
    @Expect(lexemeCount(tinySource), 16)
    @Expect(lexemeCount("a b c d e f"), 6)
    @Expect(lexemeCount("let a = 1"), 4)
}

@Test
func identifierLexemesTest(): Unit {
    @Expect(identifierLexemes(tinySource), ["t", "f", "a"])
    @Expect(identifierLexemes(widgetSource), ["demo", "Widget", "count", "render", "build", "total", "total"])
}

@Test
func sourceUnitTest(): Unit {
    let unit = SourceUnit("alpha_service.cj", tinySource)
    @Expect(unit.path, "alpha_service.cj")
    @Expect(unit.text, tinySource)
}

@Test
func indexSourceInvalidTest(): Unit {
    var caught = "none"
    try {
        let index = indexSource("this is not cangjie at all\n")
        caught = "${index.count()}"
    } catch (e: AuditException) {
        caught = e.message
    }
    @Expect(caught.startsWith("parse failed: "), true)
}
