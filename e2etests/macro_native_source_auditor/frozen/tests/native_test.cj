package auditor_core.native

import auditor_core.model.AuditException

@Test
func nativeAbiVersionTest(): Unit {
    @Expect(nativeAbiVersion(), 10005)
}

@Test
func nativeDigestEmptyTest(): Unit {
    let empty: Array<UInt8> = []
    @Expect(nativeDigest(empty), 0)
}

@Test
func nativeDigestKnownTest(): Unit {
    @Expect(nativeDigest("abc".toArray()), 1677554)
    @Expect(nativeDigest("a".toArray()), 97)
    @Expect(nativeDigest("ab".toArray()), 12805)
}

@Test
func nativeDigestStabilityTest(): Unit {
    let text = "package sample.epsilon\n"
    @Expect(nativeDigest(text.toArray()), nativeDigest(text.toArray()))
}

@Test
func nativeCountByteTest(): Unit {
    @Expect(nativeCountByte("banana".toArray(), 97), 3)
    @Expect(nativeCountByte("banana".toArray(), 122), 0)
    let empty: Array<UInt8> = []
    @Expect(nativeCountByte(empty, 97), 0)
}

@Test
func nativeScaleInPlaceTest(): Unit {
    let values: Array<Int64> = [2, 4, 6, 8]
    let total = nativeScale(values, 3)
    @Expect(total, 60)
    @Expect(values, [6, 12, 18, 24])
}

@Test
func nativeDigestResourceTest(): Unit {
    var streamed = -1
    try (digest = NativeDigest()) {
        digest.update("ab".toArray())
        digest.update("c".toArray())
        streamed = digest.value()
    }
    @Expect(streamed, 1677554)
    @Expect(streamed, nativeDigest("abc".toArray()))
}

@Test
func nativeDigestClosedTest(): Unit {
    let digest = NativeDigest()
    @Expect(digest.isClosed(), false)
    digest.update("abc".toArray())
    digest.close()
    @Expect(digest.isClosed(), true)
    var caught = "none"
    try {
        digest.update("d".toArray())
    } catch (e: AuditException) {
        caught = "audit"
    }
    @Expect(caught, "audit")
}
