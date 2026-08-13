package auditor_core.scan

import auditor_core.model.AuditException
import auditor_core.model.Finding
import auditor_core.model.FindingSet
import auditor_core.model.Severity
import auditor_core.native.nativeAbiVersion
import auditor_core.native.nativeDigest
import auditor_core.rules.ruleCodes
import auditor_core.rules.ruleRegistry
import auditor_core.syntax.SourceUnit
import auditor_core.syntax.auditorTargetText
import auditor_core.syntax.auditorVersionText
import auditor_core.syntax.extractTodoMarkers
import auditor_core.syntax.indexSource
import auditor_core.syntax.lexemeCount
import std.collection.ArrayList
import std.collection.HashMap
import std.fs.Directory
import std.fs.File
import std.fs.Path
import std.fs.exists
import std.sort.sort

public func listSourceFiles(root: String): Array<String> {
    if (!exists(root)) {
        throw AuditException("missing root: ${root}")
    }
    let names = ArrayList<String>()
    for (entry in Directory.readFrom(root)) {
        if (entry.name.endsWith(".cj")) {
            names.add(entry.name)
        }
    }
    let result = names.toArray()
    sort(result, lessThan: {left: String, right: String => left < right}, stable: true)
    return result
}

public func readSource(root: String, name: String): SourceUnit {
    return SourceUnit(name, String.fromUtf8(File.readFrom(Path(root).join(name))))
}

public func loadUnits(root: String): Array<SourceUnit> {
    let units = ArrayList<SourceUnit>()
    for (name in listSourceFiles(root)) {
        units.add(readSource(root, name))
    }
    return units.toArray()
}

public func todoMarkers(text: String): Array<String> {
    return extractTodoMarkers(text)
}

public func markerHistogram(units: Array<SourceUnit>): Array<(String, Int64)> {
    let counters = HashMap<String, Int64>()
    let names = ArrayList<String>()
    for (unit in units) {
        for (marker in todoMarkers(unit.text)) {
            match (counters.get(marker)) {
                case Some(current) => counters[marker] = current + 1
                case None =>
                    counters[marker] = 1
                    names.add(marker)
            }
        }
    }
    let ordered = names.toArray()
    sort(ordered, lessThan: {left: String, right: String => left < right}, stable: true)
    let histogram = ArrayList<(String, Int64)>()
    for (name in ordered) {
        histogram.add((name, counters[name]))
    }
    return histogram.toArray()
}

public func auditAll(units: Array<SourceUnit>): FindingSet {
    let collected = ArrayList<Finding>()
    for (rule in ruleRegistry()) {
        for (unit in units) {
            for (finding in rule.analyze(unit)) {
                collected.add(finding)
            }
        }
    }
    return FindingSet(collected.toArray()).sorted()
}

public func renderReport(root: String): String {
    let units = loadUnits(root)
    let findings = auditAll(units)
    let report = StringBuilder()
    report.append("auditor ${auditorVersionText()} ${auditorTargetText()}\n")
    report.append("abi ${nativeAbiVersion()}\n")
    report.append("rules ${joinWithComma(ruleCodes())}\n")
    report.append("units ${units.size}\n")
    for (unit in units) {
        let index = indexSource(unit.text)
        report.append("unit ${unit.path} digest=${nativeDigest(unit.text.toArray())}")
        report.append(" lex=${lexemeCount(unit.text)} funcs=${index.functions.size}")
        report.append(" vars=${index.variables.size} classes=${index.classes.size}")
        report.append(" decls=${index.count()}\n")
    }
    for (i in 0..findings.size) {
        report.append("finding ${findings[i].render()}\n")
    }
    for (entry in markerHistogram(units)) {
        report.append("marker ${entry[0]}=${entry[1]}\n")
    }
    report.append("summary ${summaryLine(findings)}\n")
    return report.toString()
}

func joinWithComma(values: Array<String>): String {
    let joined = StringBuilder()
    var first = true
    for (value in values) {
        if (!first) {
            joined.append(",")
        }
        joined.append(value)
        first = false
    }
    return joined.toString()
}

func summaryLine(findings: FindingSet): String {
    let fatal = findings.filter(Severity.Fatal).size
    let warn = findings.filter(Severity.Warn).size - fatal
    let info = findings.size - fatal - warn
    return "total=${findings.size} fatal=${fatal} warn=${warn} info=${info} weight=${findings.weight()}"
}
