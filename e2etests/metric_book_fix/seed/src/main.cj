package metric_book_fix

import std.collection.*
import std.collection.concurrent.*
import std.sort.*
import std.sync.*

public class MetricBook {
    private let values = ConcurrentHashMap<String, AtomicInt64>()

    public init() {}

    public func record(name: String, delta: Int64): Unit {
        let candidate = AtomicInt64(0)
        values.addIfAbsent(name, candidate)
        candidate.fetchAdd(delta)
    }

    public func get(name: String): Int64 {
        match (values.get(name)) {
            case Some(counter) => counter.load()
            case None => 0
        }
    }

    public func total(): Int64 {
        var result = 0
        for ((_, counter) in values) { result += counter.load() }
        return result
    }

    public func snapshot(): Array<(String, Int64)> {
        let result = ArrayList<(String, Int64)>()
        for ((name, counter) in values) { result.add((name, counter.load())) }
        return result.toArray()
    }
}

main(): Unit {
    let book = MetricBook()
    book.record("requests", 5)
    book.record("errors", 2)
    println("errors=${book.get("errors")}")
    println("requests=${book.get("requests")}")
    println("total=${book.total()}")
    println("snapshot=${String.join(book.snapshot().map({item => "${item[0]}:${item[1]}"}), delimiter: ",")}")
}
