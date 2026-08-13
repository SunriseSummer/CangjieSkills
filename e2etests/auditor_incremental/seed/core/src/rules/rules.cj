package auditor_core.rules

import auditor_core.model.Analyzer
import auditor_core.model.AuditException
import auditor_core.model.Finding
import auditor_core.model.Severity
import auditor_core.syntax.SourceUnit
import auditor_core.syntax.extractTodoMarkers
import auditor_core.syntax.indexSource
import auditor_macros.LexCount
import auditor_macros.Rule
import std.collection.ArrayList
import std.reflect.ClassTypeInfo
import std.sort.sort

@Annotation[target: [Type]]
public class RuleTag {
    public let id: String
    public let enabled: Bool

    public const init(id: String, enabled: Bool) {
        this.id = id
        this.enabled = enabled
    }
}

@RuleTag["naming", true]
@Rule["R.NAM.01", Warn, 2]
public class NamingRule <: Analyzer<SourceUnit> {
    public func id(): String {
        return tagFor(this).id
    }

    public func analyze(unit: SourceUnit): Array<Finding> {
        let findings = ArrayList<Finding>()
        for (name in indexSource(unit.text).functions) {
            if (!isLowerCamelCase(name)) {
                findings.add(Finding(code(), unit.path, name, severity(), "expected lowerCamelCase"))
            }
        }
        return findings.toArray()
    }
}

@RuleTag["size", true]
@Rule["R.SIZE.01", Fatal, 5]
public class SizeRule <: Analyzer<SourceUnit> {
    public func id(): String {
        return tagFor(this).id
    }

    public func analyze(unit: SourceUnit): Array<Finding> {
        if (indexSource(unit.text).count() > declarationBudget()) {
            return [Finding(code(), unit.path, "unit", severity(), "declaration budget exceeded")]
        }
        return []
    }
}

@RuleTag["todo", true]
@Rule["R.TODO.01", Info, 1]
public class TodoRule <: Analyzer<SourceUnit> {
    public func id(): String {
        return tagFor(this).id
    }

    public func analyze(unit: SourceUnit): Array<Finding> {
        let findings = ArrayList<Finding>()
        for (marker in extractTodoMarkers(unit.text)) {
            findings.add(Finding(code(), unit.path, marker, severity(), "unresolved marker"))
        }
        return findings.toArray()
    }
}

@RuleTag["legacy", false]
@Rule["R.LEG.01", Info, 1]
public class LegacyRule <: Analyzer<SourceUnit> {
    public func id(): String {
        return tagFor(this).id
    }

    public func analyze(unit: SourceUnit): Array<Finding> {
        let ignored: Array<Finding> = []
        if (unit.path.isEmpty()) {
            return ignored
        }
        return ignored
    }
}

public func ruleRegistry(): Array<Analyzer<SourceUnit>> {
    let enabled = ArrayList<Analyzer<SourceUnit>>()
    for (rule in allRules()) {
        if (tagFor(rule).enabled) {
            enabled.add(rule)
        }
    }
    let result = enabled.toArray()
    sort(result, lessThan: {left: Analyzer<SourceUnit>, right: Analyzer<SourceUnit> => left.id() < right.id()},
        stable: true)
    return result
}

public func ruleCodes(): Array<String> {
    let codes = ArrayList<String>()
    for (rule in allRules()) {
        if (tagFor(rule).enabled) {
            codes.add(ruleCode(rule))
        }
    }
    let result = codes.toArray()
    sort(result, lessThan: {left: String, right: String => left < right}, stable: true)
    return result
}

public func enabledRuleIds(): Array<String> {
    let ids = ArrayList<String>()
    for (rule in allRules()) {
        let tag = tagFor(rule)
        if (tag.enabled) {
            ids.add(tag.id)
        }
    }
    let result = ids.toArray()
    sort(result, lessThan: {left: String, right: String => left < right}, stable: true)
    return result
}

public func tagOf(ruleId: String): RuleTag {
    for (rule in allRules()) {
        let tag = tagFor(rule)
        if (tag.id == ruleId) {
            return tag
        }
    }
    throw AuditException("unknown rule id: ${ruleId}")
}

public func declarationBudget(): Int64 {
    return @LexCount("a b c d e f")
}

func allRules(): Array<Analyzer<SourceUnit>> {
    return [NamingRule(), SizeRule(), TodoRule(), LegacyRule()]
}

func ruleCode(rule: Analyzer<SourceUnit>): String {
    match (rule) {
        case naming: NamingRule => naming.code()
        case size: SizeRule => size.code()
        case todo: TodoRule => todo.code()
        case legacy: LegacyRule => legacy.code()
        case _ => throw AuditException("unknown rule: ${rule.id()}")
    }
}

func tagFor(rule: Analyzer<SourceUnit>): RuleTag {
    match (ClassTypeInfo.of(rule).findAnnotation<RuleTag>()) {
        case Some(tag) => tag
        case None => throw AuditException("rule is not tagged with RuleTag")
    }
}

func isLowerCamelCase(name: String): Bool {
    if (name.isEmpty()) {
        return false
    }
    let first = name[0]
    if (first < 97 || first > 122) {
        return false
    }
    return !name.contains("_")
}
