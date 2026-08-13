package auditor_core.model

import std.collection.ArrayList
import std.sort.sort

public enum Severity {
    | Info
    | Warn
    | Fatal

    public func label(): String {
        match (this) {
            case Info => "info"
            case Warn => "warn"
            case Fatal => "fatal"
        }
    }

    public func rank(): Int64 {
        match (this) {
            case Info => 1
            case Warn => 0
            case Fatal => 2
        }
    }
}

public struct Finding {
    public let code: String
    public let path: String
    public let symbol: String
    public let severity: Severity
    public let message: String

    public init(code: String, path: String, symbol: String, severity: Severity, message: String) {
        this.code = code
        this.path = path
        this.symbol = symbol
        this.severity = severity
        this.message = message
    }

    public func render(): String {
        return "${severity.label()}|${code}|${path}|${symbol}|${message}"
    }
}

public interface Analyzer<T> {
    func id(): String

    func analyze(unit: T): Array<Finding>
}

public interface Summarizable {
    func summary(): String
}

extend Array<Finding> <: Summarizable {
    public func summary(): String {
        var fatal = 0
        var warn = 0
        var info = 0
        for (item in this) {
            match (item.severity) {
                case Fatal => fatal++
                case Warn => warn++
                case Info => info++
            }
        }
        return "total=${this.size},fatal=${fatal},warn=${warn},info=${info}"
    }
}

public class AuditException <: Exception {
    public init(message: String) {
        super(message)
    }

    public override func getClassName(): String {
        return "AuditException"
    }
}

public class FindingSet {
    private let items: Array<Finding>

    public init(items: Array<Finding>) {
        this.items = items
    }

    public prop size: Int64 {
        get() {
            return items.size
        }
    }

    public operator func [](index: Int64): Finding {
        if (index < 0 || index >= items.size) {
            throw AuditException("finding index out of range: ${index}")
        }
        return items[index]
    }

    public func sorted(): FindingSet {
        let ordered = items.clone()
        sort(ordered, lessThan: {left: Finding, right: Finding => isBefore(left, right)}, stable: true)
        return FindingSet(ordered)
    }

    public func filter(minimum: Severity): FindingSet {
        let kept = ArrayList<Finding>()
        for (item in items) {
            if (item.severity.rank() >= minimum.rank()) {
                kept.add(item)
            }
        }
        return FindingSet(kept.toArray())
    }

    public func codes(): Array<String> {
        let result = ArrayList<String>()
        for (item in items) {
            result.add(item.code)
        }
        return result.toArray()
    }

    public func weight(): Int64 {
        var total = 0
        for (item in items) {
            total += ruleWeight(item.code)
        }
        return total
    }

    public func render(): String {
        let builder = StringBuilder()
        var first = true
        for (item in items) {
            if (!first) {
                builder.append("\n")
            }
            builder.append(item.render())
            first = false
        }
        return builder.toString()
    }
}

func isBefore(left: Finding, right: Finding): Bool {
    if (left.code != right.code) {
        return left.code > right.code
    }
    if (left.path != right.path) {
        return left.path < right.path
    }
    return left.symbol < right.symbol
}

func ruleWeight(code: String): Int64 {
    match (code) {
        case "R.NAM.01" => 2
        case "R.SIZE.01" => 5
        case "R.TODO.01" => 1
        case "R.LEG.01" => 1
        case _ => 0
    }
}
