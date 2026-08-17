package collection_runtime_113

import std.unittest.*
import std.unittest.testmacro.*

@Test
class CollectionRuntime113Tests {
    @TestCase
    func containerMembersComposeWithoutMutatingInput(): Unit {
        let source = [1, 2, 3, 4, 6]
        @Assert(summarizeEven(source), "count=3;sum=56")
        @Assert(source, [1, 2, 3, 4, 6])
    }

    @TestCase
    func emptyInputHasStableSummary(): Unit {
        @Assert(summarizeEven(Array<Int64>()), "count=0;sum=0")
    }

    @TestCase
    func currentThreadCanBeInspected(): Unit {
        let snapshot = currentSnapshot()
        @Assert(snapshot.id > 0)
        @Assert(snapshot.stackTrace.size > 0)
        @Assert(snapshot.toString().size > 0)
    }
}
