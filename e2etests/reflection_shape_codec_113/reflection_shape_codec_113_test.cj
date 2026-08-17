package reflection_shape_codec_113

import std.reflect.InvocationTargetException
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ReflectionShapeCodec113Tests {
    @TestCase
    func rebuildsAndDescribesEnumConstructors(): Unit {
        let pair = rebuildWire("Pair", ["jobs", 3])
        @Assert(pair.toString(), "Pair(jobs,3)")
        @Assert(describeWire(pair), "Pair|jobs|3")
        @Assert(describeWire(rebuildWire("Flag", [true])), "Flag|true")
        @Assert(describeWire(rebuildWire("Count", [7])), "Count|7")
    }

    @TestCase
    func rejectsWrongAssociatedValueTypes(): Unit {
        var rejected = false
        try {
            let _ = rebuildWire("Pair", [9, "wrong"])
        } catch (_: InvocationTargetException) {
            rejected = true
        }
        @Assert(rejected)
    }

    @TestCase
    func rebuildsTupleThroughRuntimeMetadata(): Unit {
        let rebuilt = rebuildTuple(("ready", 8, true))
        @Assert(rebuilt[0], "ready")
        @Assert(rebuilt[1], 8)
        @Assert(rebuilt[2], true)
    }

    @TestCase
    func inspectsAndInvokesFunctionValues(): Unit {
        let predicate = {name: String, count: Int64 => name.size == count}
        @Assert(functionShape(predicate), "String,Int64->Bool")
        @Assert(invokePredicate(predicate, "four", 4))
        @Assert(!invokePredicate(predicate, "four", 3))
    }
}
