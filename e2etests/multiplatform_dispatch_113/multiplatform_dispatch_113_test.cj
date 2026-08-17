features {user.multiplatform_dispatch_113.windows}

package multiplatform_dispatch_113

import std.unittest.*
import std.unittest.testmacro.*

@Test
class MultiplatformDispatch113Tests {
    @TestCase
    func selectsSpecificImplementation(): Unit {
        @Assert(platformName(), "windows")
        @Assert(commonBanner(platformName()), "cangjie:windows")
    }

    @TestCase
    func formatsValuesInProductSourceSet(): Unit {
        let formatter = PlatformFormatter()
        @Assert(formatter.format([1, 2, 3]), "win[1,2,3]")
        @Assert(formatter.format([-4, 0, 9]), "win[-4,0,9]")
    }

    @TestCase
    func emptyInputIsStable(): Unit {
        @Assert(PlatformFormatter().format(Array<Int64>()), "win[]")
    }
}

