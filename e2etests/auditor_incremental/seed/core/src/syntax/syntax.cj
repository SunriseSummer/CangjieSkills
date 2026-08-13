package auditor_core.syntax

import auditor_core.model.AuditException
import std.ast.ClassDecl
import std.ast.FuncDecl
import std.ast.TokenKind
import std.ast.VarDecl
import std.ast.Visitor
import std.ast.cangjieLex
import std.ast.parseProgram
import std.collection.ArrayList
import std.regex.Regex

let markerPattern = Regex("TODO\\(([A-Z]+)\\)")

protected func extractTodoMarkers(text: String): Array<String> {
    let markers = ArrayList<String>()
    for (item in markerPattern.findAll(text, group: true)) {
        markers.add(item.matchString(1))
    }
    return markers.toArray()
}

protected func auditorVersionText(): String {
    return "1.0.5"
}

protected func auditorTargetText(): String {
    return "windows-x64-cjnative"
}

public struct SourceUnit {
    public let path: String
    public let text: String

    public init(path: String, text: String) {
        this.path = path
        this.text = text
    }
}

public class DeclarationIndex {
    private let functionNames: Array<String>
    private let variableNames: Array<String>
    private let classNames: Array<String>

    init(functionNames: Array<String>, variableNames: Array<String>, classNames: Array<String>) {
        this.functionNames = functionNames
        this.variableNames = variableNames
        this.classNames = classNames
    }

    public prop functions: Array<String> {
        get() {
            return functionNames
        }
    }

    public prop variables: Array<String> {
        get() {
            return variableNames
        }
    }

    public prop classes: Array<String> {
        get() {
            return classNames
        }
    }

    public func count(): Int64 {
        return functionNames.size + variableNames.size + classNames.size
    }
}

class DeclarationCollector <: Visitor {
    let functionNames = ArrayList<String>()
    let variableNames = ArrayList<String>()
    let classNames = ArrayList<String>()

    public override func visit(decl: FuncDecl): Unit {
        functionNames.add(decl.identifier.value)
    }

    public override func visit(decl: VarDecl): Unit {
        variableNames.add(decl.identifier.value)
    }

    public override func visit(decl: ClassDecl): Unit {
        classNames.add(decl.identifier.value)
    }
}

public func indexSource(text: String): DeclarationIndex {
    let collector = DeclarationCollector()
    try {
        parseProgram(cangjieLex(text)).traverse(collector)
    } catch (e: Exception) {
        throw AuditException("parse failed: ${e.message}")
    }
    return DeclarationIndex(
        collector.functionNames.toArray(),
        collector.variableNames.toArray(),
        collector.classNames.toArray()
    )
}

public func lexemeCount(text: String): Int64 {
    return cangjieLex(text).size
}

public func identifierLexemes(text: String): Array<String> {
    let names = ArrayList<String>()
    for (token in cangjieLex(text)) {
        match (token.kind) {
            case IDENTIFIER => names.add(token.value)
            case _ => ()
        }
    }
    return names.toArray()
}
