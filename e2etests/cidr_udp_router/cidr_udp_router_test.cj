package cidr_udp_router

private func expectRouterError(action: () -> Unit): Unit { try { action(); @Fail("expected RouterException") } catch (_: RouterException) { @Assert(true) } }
private func selectedLabel(table: RouteTable, address: String): String { match (table.lookup(address)) { case Some(route) => route.label; case None => "" } }

@Test
class TestPrefixOperations {
    @TestCase func canonicalMasksHostBits() { @Assert(describePrefix("192.168.12.34/16").canonical, "192.168.0.0/16") }
    @TestCase func ipv4Network() { @Assert(describePrefix("192.168.12.34/24").network, "192.168.12.0") }
    @TestCase func ipv4Netmask() { @Assert(describePrefix("192.168.12.34/24").netmask, "255.255.255.0") }
    @TestCase func ipv4Hostmask() { @Assert(describePrefix("192.168.12.34/24").hostmask, "0.0.0.255") }
    @TestCase func ipv4Broadcast() { @Assert(describePrefix("192.168.12.34/24").broadcast, Some("192.168.12.255")) }
    @TestCase func ipv6Canonical() { @Assert(describePrefix("fc00::1:2:3:4/16").canonical, "fc00::/16") }
    @TestCase func ipv6HasNoBroadcast() { @Assert(describePrefix("2001:db8::1/64").broadcast, None) }
    @TestCase func containsAddress() { @Assert(prefixContains("10.0.0.0/8", "10.9.8.7")) }
    @TestCase func excludesAddress() { @Assert(!prefixContains("10.0.0.0/8", "11.0.0.1")) }
    @TestCase func overlapsNestedPrefixes() { @Assert(prefixesOverlap("10.0.0.0/8", "10.2.0.0/16")) }
    @TestCase func disjointPrefixes() { @Assert(!prefixesOverlap("10.0.0.0/8", "11.0.0.0/8")) }
    @TestCase func ipv4BigEndianRoundTrip() { @Assert(addressBigEndianRoundTrip("127.0.0.1"), "127.0.0.1") }
    @TestCase func ipv6BigEndianRoundTrip() { @Assert(addressBigEndianRoundTrip("2001:db8::1"), "2001:db8::1") }
    @TestCase func rejectsInvalidPrefix() { expectRouterError { => describePrefix("10.0.0.0/99") } }
    @TestCase func rejectsInvalidAddress() { expectRouterError { => prefixContains("10.0.0.0/8", "not-an-ip") } }
}

@Test
class TestRouteSelection {
    @TestCase func emptyTableHasNoMatch() { @Assert(selectedLabel(RouteTable(), "10.0.0.1"), "") }
    @TestCase func addIncrementsSize() { let table = RouteTable(); table.add("10.0.0.0/8", "a"); @Assert(table.size, 1) }
    @TestCase func exactRoute() { let table = RouteTable(); table.add("10.0.0.0/8", "private"); @Assert(selectedLabel(table, "10.2.3.4"), "private") }
    @TestCase func longestPrefixWins() { let table = RouteTable(); table.add("10.0.0.0/8", "wide"); table.add("10.1.0.0/16", "narrow"); @Assert(selectedLabel(table, "10.1.2.3"), "narrow") }
    @TestCase func lowerMetricWinsEqualPrefix() { let table = RouteTable(); table.add("10.0.0.0/8", "slow", metric: 9); table.add("10.0.0.0/8", "fast", metric: 1); @Assert(selectedLabel(table, "10.2.3.4"), "fast") }
    @TestCase func insertionOrderBreaksFullTie() { let table = RouteTable(); table.add("10.0.0.0/8", "first", metric: 1); table.add("10.0.0.0/8", "second", metric: 1); @Assert(selectedLabel(table, "10.2.3.4"), "first") }
    @TestCase func defaultRouteMatches() { let table = RouteTable(); table.add("0.0.0.0/0", "default"); @Assert(selectedLabel(table, "203.0.113.8"), "default") }
    @TestCase func hostRouteIsExact() { let table = RouteTable(); table.add("192.0.2.4/32", "host"); @Assert(selectedLabel(table, "192.0.2.4"), "host"); @Assert(selectedLabel(table, "192.0.2.5"), "") }
    @TestCase func ipv6Route() { let table = RouteTable(); table.add("2001:db8::/32", "docs"); @Assert(selectedLabel(table, "2001:db8::42"), "docs") }
    @TestCase func mixedFamiliesDoNotMatch() { let table = RouteTable(); table.add("2001:db8::/32", "v6"); @Assert(selectedLabel(table, "10.0.0.1"), "") }
    @TestCase func rejectsEmptyLabel() { let table = RouteTable(); expectRouterError { => table.add("10.0.0.0/8", "") } }
    @TestCase func rejectsNegativeMetric() { let table = RouteTable(); expectRouterError { => table.add("10.0.0.0/8", "x", metric: -1) } }
    @TestCase func rejectsBadLookupAddress() { let table = RouteTable(); expectRouterError { => table.lookup("localhost") } }
}

@Test
class TestUdpLoopback {
    @TestCase func datagramTextRoundTrip() { @Assert(String.fromUtf8(udpEcho("hello".toArray())), "hello") }
    @TestCase func datagramBinaryRoundTrip() { let data: Array<Byte> = [0, 1, 2, 127, 255]; @Assert(udpEcho(data), data) }
    @TestCase func connectedTextRoundTrip() { @Assert(String.fromUtf8(udpConnectedEcho("connected".toArray())), "connected") }
    @TestCase func connectedBinaryRoundTrip() { let data: Array<Byte> = [255, 0, 42, 42]; @Assert(udpConnectedEcho(data), data) }
    @TestCase func repeatedCallsReleasePorts() { let one: Array<Byte> = [1, 2]; let two: Array<Byte> = [3, 4]; @Assert(udpEcho(one), one); @Assert(udpEcho(two), two) }
}
