package command_router

import std.collection.*

private func expectRouteError(action: () -> Unit): Unit { try { action(); @Fail("expected RouteException") } catch (_: RouteException) { @Assert(true) } }

@Test
class CommandRouterTests {
    @TestCase func matchesStaticRouteIgnoringMethodCase() { let r = CommandRouter(); r.add("get", "/health") { ctx => ctx.body = "ok" }; let c = r.dispatch("GET", "/health"); @Assert(c.status, 200); @Assert(c.body, "ok") }
    @TestCase func extractsPathParameter() { let r = CommandRouter(); r.add("GET", "/users/:id") { ctx => ctx.body = ctx.params.get("id").getOrThrow() }; let c = r.dispatch("get", "/users/42"); @Assert(c.body, "42"); @Assert(c.params.get("id").getOrThrow(), "42") }
    @TestCase func staticRouteBeatsParameterRoute() { let r = CommandRouter(); r.add("GET", "/users/:id") { ctx => ctx.body = "param" }; r.add("GET", "/users/me") { ctx => ctx.body = "static" }; @Assert(r.dispatch("GET", "/users/me").body, "static") }
    @TestCase func querySupportsFlagAndOverwrite() { let r = CommandRouter(); r.add("GET", "/search") { ctx => ctx.body = ctx.query.get("q").getOrThrow() + ":" + ctx.query.get("flag").getOrThrow() }; let c = r.dispatch("GET", "/search?q=one&flag&q=two&&"); @Assert(c.body, "two:") }
    @TestCase func missingRouteReturns404() { let r = CommandRouter(); let c = r.dispatch("POST", "/none"); @Assert(c.status, 404); @Assert(c.body, "not found"); @Assert(c.params.size, 0) }
    @TestCase func middlewareWrapsInOrder() { let r = CommandRouter(); let log = ArrayList<String>(); r.use { _, next => log.add("a>"); next(); log.add("<a") }; r.use { _, next => log.add("b>"); next(); log.add("<b") }; r.add("GET", "/x") { _ => log.add("h") }; r.dispatch("GET", "/x"); @Assert(log.toArray(), ["a>", "b>", "h", "<b", "<a"]) }
    @TestCase func middlewareMayShortCircuit() { let r = CommandRouter(); r.use { ctx, _ => ctx.status = 403; ctx.body = "denied" }; r.add("GET", "/x") { ctx => ctx.body = "handler" }; let c = r.dispatch("GET", "/x"); @Assert(c.status, 403); @Assert(c.body, "denied") }
    @TestCase func middlewareCanRecoverException() { let r = CommandRouter(); r.use { ctx, next => try { next() } catch (_: IllegalArgumentException) { ctx.status = 500; ctx.body = "recovered" } }; r.add("GET", "/x") { _ => throw IllegalArgumentException("boom") }; let c = r.dispatch("GET", "/x"); @Assert(c.status, 500); @Assert(c.body, "recovered") }
    @TestCase func unhandledExceptionEscapes() { let r = CommandRouter(); r.add("GET", "/x") { _ => throw IllegalArgumentException("boom") }; try { r.dispatch("GET", "/x"); @Fail("expected") } catch (_: IllegalArgumentException) { @Assert(true) } }
    @TestCase func eachDispatchGetsIndependentMaps() { let r = CommandRouter(); r.add("GET", "/x/:id") { _ => () }; let a = r.dispatch("GET", "/x/1?q=a"); let b = r.dispatch("GET", "/x/2?q=b"); @Assert(a.params.get("id").getOrThrow(), "1"); @Assert(b.params.get("id").getOrThrow(), "2"); @Assert(a.query.get("q").getOrThrow(), "a") }
    @TestCase func rejectsInvalidPatternsAtomically() { let r = CommandRouter(); r.add("GET", "/ok") { ctx => ctx.body = "ok" }; expectRouteError { => r.add("", "/bad") { _ => () }; () }; expectRouteError { => r.add("GET", "bad") { _ => () }; () }; expectRouteError { => r.add("GET", "/:id/:id") { _ => () }; () }; @Assert(r.dispatch("GET", "/ok").body, "ok") }
    @TestCase func rejectsEmptyQueryKey() { let r = CommandRouter(); r.add("GET", "/x") { _ => () }; expectRouteError { => r.dispatch("GET", "/x?=bad"); () } }
}
