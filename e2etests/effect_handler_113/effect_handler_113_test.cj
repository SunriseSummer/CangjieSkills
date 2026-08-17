package effect_handler_113

import std.sync.AtomicInt64
import std.unittest.*
import std.unittest.testmacro.*

@Test
class EffectHandler113Tests {
    @TestCase
    func handlerResolvesEveryPerformedCommand(): Unit {
        let calls = AtomicInt64(0)
        let rendered = requestPair("region", "tier", {key =>
            let _ = calls.fetchAdd(1)
            match (key) {
                case "region" => "cn"
                case "tier" => "prod"
                case _ => "unexpected"
            }
        })
        @Assert(rendered, "cn|prod")
        @Assert(calls.load(), 2)
    }

    @TestCase
    func defaultsRunWithoutHandler(): Unit {
        @Assert(requestPairWithDefaults("region", "tier"), "missing:region|missing:tier")
    }

    @TestCase
    func repeatedKeysStillPerformTwice(): Unit {
        let calls = AtomicInt64(0)
        @Assert(requestPair("x", "x", {key =>
            let sequence = calls.fetchAdd(1)
            "${key}${sequence}"
        }), "x0|x1")
        @Assert(calls.load(), 2)
    }
}

