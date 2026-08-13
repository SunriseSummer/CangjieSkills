// FROZEN TEST -- secure_local_sync
// 52 deterministic cases. No wall clock, no randomised input, no fixed ports, no public network.
// Every network case binds 127.0.0.1 with port 0 and closes its server on all paths.
package secure_local_sync

import std.collection.ArrayList
import std.sync.AtomicInt64
import std.sync.Mutex
import stdx.encoding.json.JsonValue
import stdx.net.tls.TlsException

// ---------------------------------------------------------------- helpers

let ROUND_TIMEOUT: Duration = Duration.second * 20
let SYNC_KEY: String = "alpha-1"
let SYNC_TEXT: String = "frozen-sync-payload"
let SYNC_DIGEST: String = "0e8142b193e5bc6c51d26be1853478cf5fa7093a3a9c9310ffb701530e252121"

func field(body: String, name: String): String {
    let root = JsonValue.fromStr(body).asObject()
    return requireText(root, name)
}

func intField(body: String, name: String): Int64 {
    let root = JsonValue.fromStr(body).asObject()
    return requireInt(root, name)
}

func withService(block: (SyncServer, SyncClient) -> Unit): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let client = SyncClient(server.port, "127.0.0.1", SYNC_CA_PEM)
    try {
        block(server, client)
    } finally {
        client.close()
        server.close()
        store.close()
    }
}

// ---------------------------------------------------------------- A. integrity

@Test
func a01EmptyDigestTest(): Unit {
    @Expect(sha256HexOfText(""), "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
}

@Test
func a02AbcDigestTest(): Unit {
    @Expect(sha256HexOfText("abc"), "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
}

@Test
func a03NameDigestTest(): Unit {
    @Expect(
        sha256HexOfText("secure_local_sync"),
        "b5b7ada3b05f9121214cf781a5ebd79f040b8b7991bcfe643e82851765bbd85c"
    )
    @Expect(sha256Hex("secure_local_sync".toArray()), sha256HexOfText("secure_local_sync"))
}

@Test
func a04MultilineDigestTest(): Unit {
    @Expect(
        sha256HexOfText("line-1\nline-2\nline-3"),
        "f5d955ab868aa097081a696346395eae039f97653f7c357d4c5778004b936182"
    )
    @Expect(sha256HexOfText(SYNC_TEXT), SYNC_DIGEST)
}

@Test
func a05DeflateRoundTripTest(): Unit {
    let source = "the quick brown fox jumps over the lazy dog".toArray()
    @Expect(String.fromUtf8(inflateBytes(deflateBytes(source))), String.fromUtf8(source))
    @Expect(String.fromUtf8(inflateBytes(deflateBytes(Array<Byte>()))), "")
}

@Test
func a06PackRoundTripTest(): Unit {
    // Only the round trip is asserted: deflate byte layout is not a frozen contract.
    @Expect(unpackPayload(packPayload(SYNC_TEXT)), SYNC_TEXT)
    @Expect(unpackPayload(packPayload("line-1\nline-2\nline-3")), "line-1\nline-2\nline-3")
    @Expect(packPayload(SYNC_TEXT) == SYNC_TEXT, false)
}

@Test
func a07UnpackRejectsGarbageTest(): Unit {
    var faulted = false
    try {
        unpackPayload("!!! not base64 !!!")
    } catch (_: SyncFault) {
        faulted = true
    }
    @Expect(faulted, true)
}

// ---------------------------------------------------------------- B. validation

@Test
func b01ValidKeysTest(): Unit {
    @Expect(isValidKey("alpha-1"), true)
    @Expect(isValidKey("abc"), true)
    @Expect(isValidKey("a_b-c9"), true)
}

@Test
func b02InvalidKeysTest(): Unit {
    @Expect(isValidKey(""), false)
    @Expect(isValidKey("ab"), false)
    @Expect(isValidKey("Alpha"), false)
    @Expect(isValidKey("1alpha"), false)
    @Expect(isValidKey("alpha/beta"), false)
    @Expect(isValidKey("alpha..beta"), false)
}

@Test
func b03ValidPathsTest(): Unit {
    @Expect(isValidSyncPath("/sync/entry"), true)
    @Expect(isValidSyncPath("/sync/snapshot"), true)
}

@Test
func b04InvalidPathsTest(): Unit {
    @Expect(isValidSyncPath("/sync/entry/extra"), false)
    @Expect(isValidSyncPath("/sync/../etc/passwd"), false)
    @Expect(isValidSyncPath("/sync"), false)
    @Expect(isValidSyncPath("/admin"), false)
    @Expect(isValidSyncPath(""), false)
}

@Test
func b05FrozenStampTest(): Unit {
    let stamp = frozenStamp()
    @Expect(stamp.year, 2030)
    @Expect(stamp.month.toInteger(), 6)
    @Expect(stamp.dayOfMonth, 15)
    @Expect(stamp.hour, 12)
    @Expect(stamp.minute, 0)
    @Expect(FROZEN_STAMP, "2030-06-15T12:00:00Z")
}

@Test
func b06RequireTextTest(): Unit {
    let root = JsonValue.fromStr("{\"name\":\"ada\",\"count\":3}").asObject()
    @Expect(requireText(root, "name"), "ada")
    var missing = false
    try { requireText(root, "absent") } catch (_: SyncFault) { missing = true }
    @Expect(missing, true)
    var mismatch = false
    try { requireText(root, "count") } catch (_: SyncFault) { mismatch = true }
    @Expect(mismatch, true)
}

@Test
func b07RequireIntTest(): Unit {
    let root = JsonValue.fromStr("{\"count\":7,\"name\":\"ada\"}").asObject()
    @Expect(requireInt(root, "count"), 7)
    var mismatch = false
    try { requireInt(root, "name") } catch (_: SyncFault) { mismatch = true }
    @Expect(mismatch, true)
}

@Test
func b08RequireBoolTest(): Unit {
    let root = JsonValue.fromStr("{\"dropped\":true,\"count\":1}").asObject()
    @Expect(requireBool(root, "dropped"), true)
    var mismatch = false
    try { requireBool(root, "count") } catch (_: SyncFault) { mismatch = true }
    @Expect(mismatch, true)
}

@Test
func b09ParseLoopbackUrlTest(): Unit {
    let (path, key) = parseLoopbackUrl("https://127.0.0.1:8/sync/entry?key=alpha-1")
    @Expect(path, "/sync/entry")
    @Expect(key.isSome(), true)
    @Expect(key ?? "", "alpha-1")
    let (snapPath, snapKey) = parseLoopbackUrl("https://127.0.0.1:8/sync/snapshot")
    @Expect(snapPath, "/sync/snapshot")
    @Expect(snapKey.isNone(), true)
}

@Test
func b10ParseLoopbackUrlRejectsTest(): Unit {
    var offHost = false
    try { parseLoopbackUrl("https://example.com/sync/entry") } catch (_: SyncFault) { offHost = true }
    @Expect(offHost, true)
    var offScheme = false
    try { parseLoopbackUrl("http://127.0.0.1:8/sync/entry") } catch (_: SyncFault) { offScheme = true }
    @Expect(offScheme, true)
    var offPath = false
    try { parseLoopbackUrl("https://127.0.0.1:8/sync/../etc") } catch (_: SyncFault) { offPath = true }
    @Expect(offPath, true)
}

// ---------------------------------------------------------------- C. model & codec

@Test
func c01SyncOpRoutingTest(): Unit {
    @Expect(opMethod(SyncOp.Put(SYNC_KEY, SYNC_TEXT)), "PUT")
    @Expect(opMethod(SyncOp.Get(SYNC_KEY)), "GET")
    @Expect(opMethod(SyncOp.Drop(SYNC_KEY)), "DELETE")
    @Expect(opMethod(SyncOp.Snapshot), "GET")
    @Expect(opPath(SyncOp.Get(SYNC_KEY)), "/sync/entry?key=alpha-1")
    @Expect(opPath(SyncOp.Snapshot), "/sync/snapshot")
}

@Test
func c02SyncRecordFieldsTest(): Unit {
    let record = SyncRecord(SYNC_KEY, SYNC_TEXT, SYNC_DIGEST, 3, FROZEN_STAMP)
    @Expect(record.key, SYNC_KEY)
    @Expect(record.payload, SYNC_TEXT)
    @Expect(record.digest, SYNC_DIGEST)
    @Expect(record.revision, 3)
    @Expect(record.stampedAt, FROZEN_STAMP)
}

@Test
func c03RecordCodecRoundTripTest(): Unit {
    let codec = RecordCodec()
    let record = SyncRecord(SYNC_KEY, SYNC_TEXT, SYNC_DIGEST, 2, FROZEN_STAMP)
    let text = codec.encode(record)
    let back = codec.decode(text)
    @Expect(back.key, record.key)
    @Expect(back.payload, record.payload)
    @Expect(back.digest, record.digest)
    @Expect(back.revision, record.revision)
    @Expect(back.stampedAt, record.stampedAt)
}

@Test
func c04RecordCodecKeyOrderTest(): Unit {
    let codec = RecordCodec()
    let record = SyncRecord(SYNC_KEY, SYNC_TEXT, SYNC_DIGEST, 1, FROZEN_STAMP)
    let text = codec.encode(record)
    // canonical ordering is part of the wire contract, so it is asserted literally
    @Expect(text.contains("\"key\":\"alpha-1\""), true)
    @Expect(text.indexOf("\"key\"").getOrThrow() < text.indexOf("\"payload\"").getOrThrow(), true)
    @Expect(text.indexOf("\"payload\"").getOrThrow() < text.indexOf("\"digest\"").getOrThrow(), true)
    @Expect(text.indexOf("\"digest\"").getOrThrow() < text.indexOf("\"revision\"").getOrThrow(), true)
    @Expect(text.indexOf("\"revision\"").getOrThrow() < text.indexOf("\"stampedAt\"").getOrThrow(), true)
}

@Test
func c05RecordCodecRejectsTest(): Unit {
    let codec = RecordCodec()
    var badJson = false
    try { codec.decode("not json") } catch (_: SyncFault) { badJson = true }
    @Expect(badJson, true)
    var badField = false
    try { codec.decode("{\"key\":\"alpha-1\"}") } catch (_: SyncFault) { badField = true }
    @Expect(badField, true)
}

// ---------------------------------------------------------------- D. store

@Test
func d01StorePutFetchTest(): Unit {
    let store = MutexRecordStore()
    try {
        let record = store.put(SYNC_KEY, SYNC_TEXT)
        @Expect(record.revision, 1)
        @Expect(record.digest, SYNC_DIGEST)
        @Expect(record.stampedAt, FROZEN_STAMP)
        let found = store.fetch(SYNC_KEY)
        @Expect(found.isSome(), true)
        @Expect((found.getOrThrow()).payload, SYNC_TEXT)
        @Expect(store.count(), 1)
        @Expect(store.writes(), 1)
    } finally {
        store.close()
    }
}

@Test
func d02StoreMissingTest(): Unit {
    let store = MutexRecordStore()
    try {
        @Expect(store.fetch("absent-key").isNone(), true)
        @Expect(store.count(), 0)
        @Expect(store.drop("absent-key"), false)
    } finally {
        store.close()
    }
}

@Test
func d03StoreRevisionTest(): Unit {
    let store = MutexRecordStore()
    try {
        @Expect(store.put(SYNC_KEY, "v1").revision, 1)
        @Expect(store.put(SYNC_KEY, "v2").revision, 2)
        @Expect(store.put(SYNC_KEY, "v3").revision, 3)
        @Expect(store.count(), 1)
        @Expect(store.writes(), 3)
        @Expect((store.fetch(SYNC_KEY).getOrThrow()).payload, "v3")
    } finally {
        store.close()
    }
}

@Test
func d04StoreDropTest(): Unit {
    let store = MutexRecordStore()
    try {
        store.put("beta-1", "x")
        store.put("beta-2", "y")
        @Expect(store.count(), 2)
        @Expect(store.drop("beta-1"), true)
        @Expect(store.count(), 1)
        @Expect(store.fetch("beta-1").isNone(), true)
        @Expect(store.fetch("beta-2").isSome(), true)
    } finally {
        store.close()
    }
}

@Test
func d05StoreResourceTest(): Unit {
    let store = MutexRecordStore()
    @Expect(store.isClosed(), false)
    try (guarded = store) {
        guarded.put("gamma-1", "z")
    }
    @Expect(store.isClosed(), true)
    @Expect(store.count(), 0)
}

@Test
func d06StoreConcurrentPutsTest(): Unit {
    let store = MutexRecordStore()
    let guard = Mutex()
    let acks = AtomicInt64(0)
    let revisions = ArrayList<Int64>()
    let tasks = ArrayList<Future<Unit>>()
    try {
        for (index in 0..8) {
            tasks.add(spawn {
                =>
                let record = store.put("worker-${index}", "payload-${index}")
                acks.fetchAdd(1)
                guard.lock()
                try { revisions.add(record.revision) } finally { guard.unlock() }
            })
        }
        for (task in tasks) { task.get(ROUND_TIMEOUT) }
        @Expect(acks.load(), 8)
        @Expect(store.count(), 8)
        @Expect(store.writes(), 8)
        @Expect(revisions.size, 8)
        // distinct keys, so every first write is revision 1 regardless of interleaving
        for (revision in revisions) { @Expect(revision, 1) }
    } finally {
        store.close()
    }
}

@Test
func d07StoreConcurrentSameKeyTest(): Unit {
    let store = MutexRecordStore()
    let tasks = ArrayList<Future<Unit>>()
    try {
        for (index in 0..8) {
            tasks.add(spawn {=> store.put("shared-key", "payload-${index}")})
        }
        for (task in tasks) { task.get(ROUND_TIMEOUT) }
        @Expect(store.count(), 1)
        @Expect(store.writes(), 8)
        @Expect((store.fetch("shared-key").getOrThrow()).revision, 8)
    } finally {
        store.close()
    }
}

// ---------------------------------------------------------------- E. trust

@Test
func e01TrustedChainShapeTest(): Unit {
    let ca = trustedCaChain()
    @Expect(ca.size, 1)
    @Expect(ca[0].subject.commonName ?? "", "SecureLocalSync Trusted CA")
    let leaf = serverLeafChain()
    @Expect(leaf.size, 1)
    @Expect(leaf[0].subject.commonName ?? "", "127.0.0.1")
    @Expect(leaf[0].dnsNames.size, 1)
    @Expect(leaf[0].dnsNames[0], "sync.local.test")
    @Expect(leaf[0].IPAddresses.size, 1)
}

@Test
func e02LeafValidityWindowTest(): Unit {
    let leaf = serverLeafChain()[0]
    @Expect(leaf.notBefore.year, 2020)
    @Expect(leaf.notAfter.year, 2040)
    @Expect(leaf.notBefore < frozenStamp(), true)
    @Expect(frozenStamp() < leaf.notAfter, true)
}

@Test
func e03TrustedVerdictTest(): Unit {
    @Expect(verdictName(verifyLeaf(SYNC_SERVER_PEM, SYNC_CA_PEM, "sync.local.test")), "trusted")
    @Expect(verdictName(verifyLeaf(SYNC_SERVER_PEM, SYNC_CA_PEM, "127.0.0.1")), "trusted")
}

@Test
func e04UntrustedIssuerVerdictTest(): Unit {
    @Expect(verdictName(verifyLeaf(SYNC_SERVER_PEM, ROGUE_CA_PEM, "sync.local.test")), "untrusted-issuer")
}

@Test
func e05OutsideValidityVerdictTest(): Unit {
    @Expect(verdictName(verifyLeaf(STALE_SERVER_PEM, SYNC_CA_PEM, "sync.local.test")), "outside-validity")
}

@Test
func e06NameMismatchVerdictTest(): Unit {
    @Expect(verdictName(verifyLeaf(SYNC_SERVER_PEM, SYNC_CA_PEM, "evil.example")), "name-mismatch")
}

@Test
func e07TrustFaultTest(): Unit {
    var faulted = false
    try { verifyLeaf("-----BEGIN CERTIFICATE-----\nnope\n-----END CERTIFICATE-----\n", SYNC_CA_PEM, "x") }
    catch (_: TrustFault) { faulted = true }
    @Expect(faulted, true)
}

// ---------------------------------------------------------------- F. HTTPS round trips

@Test
func f01PutRoundTripTest(): Unit {
    withService({
        _, client =>
        let (status, body) = client.call(SyncOp.Put(SYNC_KEY, SYNC_TEXT))
        @Expect(status, 200)
        @Expect(field(body, "key"), SYNC_KEY)
        @Expect(field(body, "digest"), SYNC_DIGEST)
        @Expect(intField(body, "revision"), 1)
        @Expect(field(body, "stampedAt"), FROZEN_STAMP)
    })
}

@Test
func f02GetRoundTripTest(): Unit {
    withService({
        _, client =>
        client.call(SyncOp.Put(SYNC_KEY, SYNC_TEXT))
        let (status, body) = client.call(SyncOp.Get(SYNC_KEY))
        @Expect(status, 200)
        @Expect(unpackPayload(field(body, "payload")), SYNC_TEXT)
        @Expect(field(body, "digest"), SYNC_DIGEST)
        @Expect(intField(body, "revision"), 1)
    })
}

@Test
func f03GetAbsentTest(): Unit {
    withService({
        _, client =>
        let (status, body) = client.call(SyncOp.Get("nothing-here"))
        @Expect(status, 404)
        @Expect(field(body, "error"), "absent")
    })
}

@Test
func f04BadKeyTest(): Unit {
    withService({
        _, client =>
        let (status, body) = client.callRaw("GET", "/sync/entry?key=Bad_KEY", "")
        @Expect(status, 400)
        @Expect(field(body, "error"), "bad-key")
        let (noKeyStatus, noKeyBody) = client.callRaw("GET", "/sync/entry", "")
        @Expect(noKeyStatus, 400)
        @Expect(field(noKeyBody, "error"), "bad-key")
    })
}

@Test
func f05BadJsonAndFieldTest(): Unit {
    withService({
        _, client =>
        let (badJson, badJsonBody) = client.callRaw("PUT", "/sync/entry?key=alpha-1", "not json")
        @Expect(badJson, 400)
        @Expect(field(badJsonBody, "error"), "bad-json")
        let (badField, badFieldBody) = client.callRaw("PUT", "/sync/entry?key=alpha-1", "{\"payload\":\"x\"}")
        @Expect(badField, 400)
        @Expect(field(badFieldBody, "error"), "bad-field")
        @Expect(field(badFieldBody, "field"), "digest")
    })
}

@Test
func f06DigestMismatchTest(): Unit {
    withService({
        _, client =>
        let tampered = "{\"payload\":\"${packPayload(SYNC_TEXT)}\",\"digest\":\"${sha256HexOfText("other")}\"}"
        let (status, body) = client.callRaw("PUT", "/sync/entry?key=alpha-1", tampered)
        @Expect(status, 409)
        @Expect(field(body, "error"), "digest-mismatch")
    })
}

@Test
func f07NoRouteTest(): Unit {
    withService({
        _, client =>
        let (status, body) = client.callRaw("GET", "/admin/secrets", "")
        @Expect(status, 404)
        @Expect(field(body, "error"), "no-route")
    })
}

@Test
func f08DropTest(): Unit {
    withService({
        _, client =>
        client.call(SyncOp.Put(SYNC_KEY, SYNC_TEXT))
        let (status, body) = client.call(SyncOp.Drop(SYNC_KEY))
        @Expect(status, 200)
        @Expect(requireBool(JsonValue.fromStr(body).asObject(), "dropped"), true)
        let (again, againBody) = client.call(SyncOp.Drop(SYNC_KEY))
        @Expect(again, 200)
        @Expect(requireBool(JsonValue.fromStr(againBody).asObject(), "dropped"), false)
    })
}

@Test
func f09SnapshotTest(): Unit {
    withService({
        _, client =>
        client.call(SyncOp.Put("alpha-1", "one"))
        client.call(SyncOp.Put("alpha-2", "two"))
        client.call(SyncOp.Put("alpha-2", "two-again"))
        let (status, body) = client.call(SyncOp.Snapshot)
        @Expect(status, 200)
        @Expect(intField(body, "count"), 2)
        @Expect(intField(body, "writes"), 3)
        @Expect(field(body, "stampedAt"), FROZEN_STAMP)
    })
}

@Test
func f10EphemeralPortTest(): Unit {
    withService({
        server, _ =>
        @Expect(server.port > 0, true)
        @Expect(server.isClosed(), false)
    })
}

// ---------------------------------------------------------------- G. transport trust

@Test
func g01RogueCaRejectedTest(): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let client = SyncClient(server.port, "127.0.0.1", ROGUE_CA_PEM)
    var rejected = false
    try {
        client.call(SyncOp.Snapshot)
    } catch (_: TlsException) {
        rejected = true
    } catch (_: Exception) {
        rejected = true
    } finally {
        client.close()
        server.close()
        store.close()
    }
    @Expect(rejected, true)
}

@Test
func g02DnsSanAcceptedTest(): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let client = SyncClient(server.port, "sync.local.test", SYNC_CA_PEM)
    try {
        let (status, _) = client.call(SyncOp.Snapshot)
        @Expect(status, 200)
    } finally {
        client.close()
        server.close()
        store.close()
    }
}

// ---------------------------------------------------------------- H. stability

@Test
func h01ConcurrentClientsTest(): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let port = server.port
    let ok = AtomicInt64(0)
    let tasks = ArrayList<Future<Unit>>()
    try {
        for (index in 0..6) {
            tasks.add(spawn {
                =>
                let client = SyncClient(port, "127.0.0.1", SYNC_CA_PEM)
                try {
                    let key = "client-${index}"
                    let text = "payload-${index}"
                    let (putStatus, _) = client.call(SyncOp.Put(key, text))
                    let (getStatus, getBody) = client.call(SyncOp.Get(key))
                    if (putStatus == 200 && getStatus == 200 && unpackPayload(field(getBody, "payload")) == text) {
                        ok.fetchAdd(1)
                    }
                } finally {
                    client.close()
                }
            })
        }
        for (task in tasks) { task.get(ROUND_TIMEOUT) }
        @Expect(ok.load(), 6)
        @Expect(store.count(), 6)
        @Expect(store.writes(), 6)
        @Expect(server.handled(), 12)
    } finally {
        server.close()
        store.close()
    }
}

@Test
func h02RestartCyclesTest(): Unit {
    let ports = ArrayList<UInt16>()
    for (round in 0..4) {
        let store = MutexRecordStore()
        let server = SyncServer(store)
        server.start()
        ports.add(server.port)
        let client = SyncClient(server.port, "127.0.0.1", SYNC_CA_PEM)
        let task = spawn {
            =>
            let (status, body) = client.call(SyncOp.Put("round-${round}", "payload-${round}"))
            return status == 200 && intField(body, "revision") == 1
        }
        try {
            @Expect(task.get(ROUND_TIMEOUT), true)
            @Expect(store.count(), 1)
        } finally {
            client.close()
            server.close()
            store.close()
        }
        @Expect(server.isClosed(), true)
    }
    @Expect(ports.size, 4)
    for (port in ports) { @Expect(port > 0, true) }
}

@Test
func h03ReleaseAfterCloseTest(): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let port = server.port
    let warm = SyncClient(port, "127.0.0.1", SYNC_CA_PEM)
    try {
        @Expect((warm.call(SyncOp.Snapshot))[0], 200)
    } finally {
        warm.close()
    }
    server.close()
    store.close()
    @Expect(server.isClosed(), true)

    let cold = SyncClient(port, "127.0.0.1", SYNC_CA_PEM)
    var refused = false
    let probe = spawn {
        =>
        try {
            cold.call(SyncOp.Snapshot)
            return false
        } catch (_: Exception) {
            return true
        }
    }
    try {
        refused = probe.get(ROUND_TIMEOUT)
    } finally {
        cold.close()
    }
    @Expect(refused, true)
}

@Test
func h04ClientResourceTest(): Unit {
    let store = MutexRecordStore()
    let server = SyncServer(store)
    server.start()
    let client = SyncClient(server.port, "127.0.0.1", SYNC_CA_PEM)
    @Expect(client.isClosed(), false)
    try (guarded = client) {
        @Expect((guarded.call(SyncOp.Snapshot))[0], 200)
    }
    @Expect(client.isClosed(), true)
    server.close()
    store.close()
}
