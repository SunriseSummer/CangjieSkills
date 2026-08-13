package tcp_line_store

import std.collection.*
import std.net.*

@Test
class LineProtocolTests {
    @TestCase
    func encodeAddsNewline() {
        let encoded = LineProtocol.encode("PING")
        @Assert(encoded.size, 5)
        @Assert(encoded[4], 10)
    }

    @TestCase
    func encodePreservesUtf8() {
        let encoded = LineProtocol.encode("你好")
        @Assert(String.fromUtf8(encoded[..(encoded.size - 1)]), "你好")
    }

    @TestCase
    func validateAllowsTabs() {
        LineProtocol.validate("PUT\tkey\tvalue")
        @Assert(true)
    }

    @TestCase
    func validateRejectsLf() {
        try {
            LineProtocol.validate("bad\nline")
            @Fail("expected ProtocolException")
        } catch (_: ProtocolException) {
            @Assert(true)
        }
    }

    @TestCase
    func validateRejectsCr() {
        try {
            LineProtocol.validate("bad\rline")
            @Fail("expected ProtocolException")
        } catch (_: ProtocolException) {
            @Assert(true)
        }
    }
}

@Test
class ServerLifecycleTests {
    @TestCase
    func bindsEphemeralPort() {
        try (server = LocalStoreServer()) {
            @Assert(server.port > 0)
        }
    }

    @TestCase
    func startsOpenAndCloses() {
        let server = LocalStoreServer()
        @Assert(!server.isClosed())
        server.close()
        @Assert(server.isClosed())
    }

    @TestCase
    func closeIsIdempotent() {
        let server = LocalStoreServer()
        server.close()
        server.close()
        @Assert(server.isClosed())
    }

    @TestCase
    func rejectsNonPositiveClientCount() {
        try (server = LocalStoreServer()) {
            try {
                server.serve(0)
                @Fail("expected ProtocolException")
            } catch (_: ProtocolException) {
                @Assert(true)
            }
        }
    }

    @TestCase
    func serveMayOnlyStartOnce() {
        try (server = LocalStoreServer()) {
            let serving = server.serve(1)
            try {
                server.serve(1)
                @Fail("expected ProtocolException")
            } catch (_: ProtocolException) {
                @Assert(true)
            }
            try (client = LocalStoreClient(server.port, Duration.second)) {
                client.quit()
            }
            serving.get()
        }
    }
}

@Test
class StoreCommandTests {
    @TestCase
    func pingPong() {
        withClient({client => @Assert(client.ping())})
    }

    @TestCase
    func putThenGet() {
        withClient({client =>
            client.put("a", "one")
            @Assert(client.get("a").getOrThrow(), "one")
        })
    }

    @TestCase
    func putOverwrites() {
        withClient({client =>
            client.put("a", "one")
            client.put("a", "two")
            @Assert(client.get("a").getOrThrow(), "two")
            @Assert(client.size(), 1)
        })
    }

    @TestCase
    func missingGetReturnsNone() {
        withClient({client => @Assert(client.get("absent").isNone())})
    }

    @TestCase
    func deleteExistingReturnsTrue() {
        withClient({client =>
            client.put("a", "one")
            @Assert(client.delete("a"))
            @Assert(client.get("a").isNone())
        })
    }

    @TestCase
    func deleteMissingReturnsFalse() {
        withClient({client => @Assert(!client.delete("absent"))})
    }

    @TestCase
    func sizeCountsKeys() {
        withClient({client =>
            client.put("a", "one")
            client.put("b", "two")
            @Assert(client.size(), 2)
        })
    }

    @TestCase
    func supportsUnicode() {
        withClient({client =>
            client.put("语言", "仓颉")
            @Assert(client.get("语言").getOrThrow(), "仓颉")
        })
    }

    @TestCase
    func supportsEmptyValue() {
        withClient({client =>
            client.put("empty", "")
            @Assert(client.get("empty").getOrThrow(), "")
        })
    }

    @TestCase
    func rawUnknownCommandReturnsError() {
        withClient({client => @Assert(client.request("WAT"), "ERR\tunknown command")})
    }

    @TestCase
    func rawMalformedCommandReturnsError() {
        withClient({client => @Assert(client.request("PUT\tonly-key"), "ERR\tmalformed command")})
    }

    @TestCase
    func clientRejectsTabInField() {
        withClient({client =>
            try {
                client.put("bad\tkey", "value")
                @Fail("expected ProtocolException")
            } catch (_: ProtocolException) {
                @Assert(true)
            }
        })
    }

    @TestCase
    func quitReceivesBye() {
        try (server = LocalStoreServer()) {
            let serving = server.serve(1)
            let client = LocalStoreClient(server.port, Duration.second)
            client.quit()
            client.close()
            @Assert(client.isClosed())
            serving.get()
        }
    }
}

@Test
class ConcurrencyAndTimeoutTests {
    @TestCase
    func concurrentClientsShareStore() {
        try (server = LocalStoreServer()) {
            let serving = server.serve(8)
            let clients = ArrayList<Future<Unit>>()
            for (i in 0..8) {
                clients.add(spawn {
                    try (client = LocalStoreClient(server.port, Duration.second * 2)) {
                        client.put("k${i}", "v${i}")
                        client.quit()
                    }
                })
            }
            for (client in clients) {
                client.get()
            }
            serving.get()
        }
    }

    @TestCase
    func laterClientSeesEarlierWrite() {
        try (server = LocalStoreServer()) {
            let serving = server.serve(2)
            try (first = LocalStoreClient(server.port, Duration.second)) {
                first.put("shared", "visible")
                first.quit()
            }
            try (second = LocalStoreClient(server.port, Duration.second)) {
                @Assert(second.get("shared").getOrThrow(), "visible")
                second.quit()
            }
            serving.get()
        }
    }

    @TestCase
    func readTimeoutUsesGateNotSleep() {
        try (server = LocalStoreServer()) {
            let serving = server.serve(1)
            let client = LocalStoreClient(server.port, Duration.millisecond * 50)
            let timedRead = spawn {
                try {
                    client.hold()
                    "unexpected"
                } catch (_: SocketTimeoutException) {
                    "timeout"
                }
            }
            server.waitUntilHeld()
            @Assert(timedRead.get(), "timeout")
            server.releaseHeld()
            server.waitUntilHeldWritten()
            client.close()
            serving.get()
        }
    }
}

private func withClient(body: (LocalStoreClient) -> Unit): Unit {
    try (server = LocalStoreServer()) {
        let serving = server.serve(1)
        try (client = LocalStoreClient(server.port, Duration.second)) {
            body(client)
            client.quit()
        }
        serving.get()
    }
}
