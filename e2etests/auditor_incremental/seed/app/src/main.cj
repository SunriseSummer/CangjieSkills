package auditor_app

import auditor_core.FindingSet
import auditor_core.Severity
import auditor_core.auditAll
import auditor_core.loadUnits
import auditor_core.renderReport
import std.fs.exists

public func auditExitCode(findings: FindingSet): Int64 {
    if (findings.filter(Severity.Fatal).size > 0) {
        return 4
    }
    return 0
}

main(argv: Array<String>): Int64 {
    if (argv.size != 1) {
        println("error usage: auditor <sources-dir>")
        return 2
    }
    let root = argv[0]
    if (!exists(root)) {
        println("error missing-root ${root}")
        return 3
    }
    print(renderReport(root))
    return auditExitCode(auditAll(loadUnits(root)))
}
