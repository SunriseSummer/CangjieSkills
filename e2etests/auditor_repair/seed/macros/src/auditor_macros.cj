/*
 * auditor_macros - compile-time helpers for the Cangjie source auditor.
 *
 * @Rule injects the code/severity/weight contract into an analyzer class.
 * @LexCount evaluates cangjieLex at expansion time and yields a literal.
 */
macro package auditor_macros

import std.ast.ClassDecl
import std.ast.DiagReportLevel
import std.ast.ToTokens
import std.ast.Token
import std.ast.Tokens
import std.ast.cangjieLex
import std.ast.diagReport
import std.ast.parseDecl

public macro Rule(attr: Tokens, input: Tokens): Tokens {
    if (attr.size != 5) {
        diagReport(
            DiagReportLevel.ERROR,
            attr,
            "@Rule expects 5 attribute tokens: code, severity, weight",
            "received ${attr.size} attribute token(s)"
        )
        return input
    }
    let declaration = parseDecl(input)
    let target = match (declaration as ClassDecl) {
        case Some(value) => value
        case None =>
            diagReport(DiagReportLevel.ERROR, input, "@Rule only applies to a class declaration", "not a class")
            return input
    }
    let code = attr[0]
    let severity = attr[2]
    let weight = attr[4]
    target.body.decls.add(parseDecl(quote(public func code(): String { $(code) })))
    target.body.decls.add(parseDecl(quote(public func severity(): Severity { Severity.$(severity) })))
    target.body.decls.add(parseDecl(quote(public func weight(): Int64 { $(weight) })))
    return target.toTokens()
}

public macro LexCount(input: Tokens): Tokens {
    if (input.size != 1) {
        diagReport(
            DiagReportLevel.ERROR,
            input,
            "@LexCount expects a single string literal",
            "received ${input.size} token(s)"
        )
        return quote(0)
    }
    let total = cangjieLex(input[0].value).size
    return quote($(total))
}
