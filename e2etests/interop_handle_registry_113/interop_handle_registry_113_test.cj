package interop_handle_registry_113

import std.unittest.*
import std.unittest.testmacro.*

@Test
class InteropHandleRegistry113Tests {
    @TestCase
    func publishedHandleResolvesEvenWhenItsNumericValueIsZero(): Unit {
        let registry = ExportRegistry()
        let handle = registry.publish("first")
        @Assert(registry.resolve(handle), Some("first"))
    }

    @TestCase
    func activeExportsHaveIndependentHandles(): Unit {
        let registry = ExportRegistry()
        let first = registry.publish("alpha")
        let second = registry.publish("仓颉")
        @Assert(first != second)
        @Assert(registry.resolve(first), Some("alpha"))
        @Assert(registry.resolve(second), Some("仓颉"))
    }

    @TestCase
    func removalInvalidatesExactlyOnce(): Unit {
        let registry = ExportRegistry()
        let handle = registry.publish("temporary")
        @Assert(registry.remove(handle))
        @Assert(registry.resolve(handle).isNone())
        @Assert(!registry.remove(handle))
    }

    @TestCase
    func unknownHandleIsAbsent(): Unit {
        let registry = ExportRegistry()
        @Assert(registry.resolve(999999999u64).isNone())
        @Assert(!registry.remove(999999999u64))
    }
}

