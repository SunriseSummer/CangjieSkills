package auditor_core

public import auditor_core.model.Analyzer
public import auditor_core.model.AuditException
public import auditor_core.model.Finding
public import auditor_core.model.FindingSet
public import auditor_core.model.Severity
public import auditor_core.model.Summarizable
public import auditor_core.native.NativeDigest
public import auditor_core.native.nativeAbiVersion
public import auditor_core.native.nativeCountByte
public import auditor_core.native.nativeDigest
public import auditor_core.native.nativeScale
public import auditor_core.rules.LegacyRule
public import auditor_core.rules.NamingRule
public import auditor_core.rules.RuleTag
public import auditor_core.rules.SizeRule
public import auditor_core.rules.TodoRule
public import auditor_core.rules.declarationBudget
public import auditor_core.rules.enabledRuleIds
public import auditor_core.rules.ruleCodes
public import auditor_core.rules.ruleRegistry
public import auditor_core.rules.tagOf
public import auditor_core.scan.auditAll
public import auditor_core.scan.listSourceFiles
public import auditor_core.scan.loadUnits
public import auditor_core.scan.markerHistogram
public import auditor_core.scan.readSource
public import auditor_core.scan.renderReport
public import auditor_core.scan.todoMarkers
public import auditor_core.syntax.DeclarationIndex
public import auditor_core.syntax.SourceUnit
public import auditor_core.syntax.identifierLexemes
public import auditor_core.syntax.indexSource
public import auditor_core.syntax.lexemeCount

public func auditorVersion(): String {
    return "1.0.5"
}

public func auditorTarget(): String {
    return "windows-x64-cjnative"
}
