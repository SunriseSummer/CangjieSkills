package annotated_registry

private func expectIllegalId(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected IllegalArgumentException")
    } catch (_: IllegalArgumentException) {
        @Assert(true)
    }
}

@Test
class ProfileRegistryTests {
    @TestCase func startsEmpty() {
        let registry = ProfileRegistry()
        @Assert(registry.size, 0)
        @Assert(registry.liveIds(), [])
    }

    @TestCase func putAndGet() {
        let registry = ProfileRegistry()
        let profile = Profile("Ada", "EU")
        registry.put("a", profile)
        @Assert(registry.get("a").getOrThrow().name, "Ada")
    }

    @TestCase func rejectsEmptyId() {
        expectIllegalId { => ProfileRegistry().put("", Profile("Ada", "EU")) }
    }

    @TestCase func unknownReturnsNone() {
        @Assert(ProfileRegistry().get("missing").isNone())
    }

    @TestCase func putOverwritesExistingId() {
        let registry = ProfileRegistry()
        let first = Profile("Ada", "EU")
        let second = Profile("Grace", "US")
        registry.put("same", first)
        registry.put("same", second)
        @Assert(registry.size, 1)
        @Assert(registry.get("same").getOrThrow().name, "Grace")
    }

    @TestCase func clearMakesReferenceEmpty() {
        let registry = ProfileRegistry()
        let profile = Profile("Ada", "EU")
        registry.put("a", profile)
        registry.clear("a")
        @Assert(registry.get("a").isNone())
        @Assert(registry.size, 0)
    }

    @TestCase func clearingUnknownIdIsNoOp() {
        let registry = ProfileRegistry()
        registry.clear("missing")
        @Assert(registry.size, 0)
    }

    @TestCase func liveIdsAreSortedAndExcludeCleared() {
        let registry = ProfileRegistry()
        let z = Profile("Z", "Z")
        let a = Profile("A", "A")
        let m = Profile("M", "M")
        registry.put("z", z)
        registry.put("a", a)
        registry.put("m", m)
        registry.clear("m")
        @Assert(registry.liveIds(), ["a", "z"])
    }

    @TestCase func describeUsesAnnotationsAndStableOrder() {
        let registry = ProfileRegistry()
        let profile = Profile("Ada", "EU", internalNote: "secret")
        registry.put("a", profile)
        @Assert(registry.describe("a").getOrThrow(), "display_name=Ada;region=EU")
    }

    @TestCase func describeReflectsCurrentValues() {
        let registry = ProfileRegistry()
        let profile = Profile("Ada", "EU")
        registry.put("a", profile)
        profile.name = "Grace"
        @Assert(registry.describe("a").getOrThrow(), "display_name=Grace;region=EU")
    }

    @TestCase func describeUnknownOrClearedIsNone() {
        let registry = ProfileRegistry()
        @Assert(registry.describe("x").isNone())
        let profile = Profile("Ada", "EU")
        registry.put("x", profile)
        registry.clear("x")
        @Assert(registry.describe("x").isNone())
    }
}
