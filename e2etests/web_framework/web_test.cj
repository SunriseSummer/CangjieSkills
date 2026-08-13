package web

import std.collection.*

// ===== Test helper services =====

class CounterService {
    var count: Int64 = 0
    public func increment(): Unit { count++ }
    public func getCount(): Int64 { return count }
}

class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====

@Test
class TestServiceContainer {
    @TestCase
    func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let service = container.resolve("counter")
        @Assert(service is CounterService)
    }

    @TestCase
    func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 2)
    }

    @TestCase
    func testTransientCreatesNewInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Transient)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }

    @TestCase
    func testResolveUnknownThrows() {
        let container = ServiceContainer()
        try {
            container.resolve("unknown")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }

    @TestCase
    func testResolveOrNone() {
        let container = ServiceContainer()
        @Assert(container.resolveOrNone("unknown").isNone())
        container.register("msg", { => MessageService("hi") })
        @Assert(!container.resolveOrNone("msg").isNone())
    }

    @TestCase
    func testContainsRegistered() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        @Assert(container.contains("counter"))
    }

    @TestCase
    func testContainsUnregistered() {
        let container = ServiceContainer()
        @Assert(!container.contains("unknown"))
    }

    @TestCase
    func testOverrideRegistration() {
        let container = ServiceContainer()
        container.register("msg", { => MessageService("old") }, lifetime: Singleton)
        let s1 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s1.getMessage(), "old")
        container.register("msg", { => MessageService("new") }, lifetime: Singleton)
        let s2 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s2.getMessage(), "new")
    }

    @TestCase
    func testMultipleServices() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        container.register("msg", { => MessageService("hello") })
        @Assert(container.contains("counter"))
        @Assert(container.contains("msg"))
        @Assert(container.resolve("counter") is CounterService)
        @Assert((container.resolve("msg") as MessageService).getOrThrow().getMessage(), "hello")
    }

    @TestCase
    func testSingletonIsLazy() {
        let counter = CounterService()
        let container = ServiceContainer()
        container.register("svc", { =>
            counter.increment()
            MessageService("test")
        }, lifetime: Singleton)
        @Assert(counter.getCount(), 0)
        container.resolve("svc")
        @Assert(counter.getCount(), 1)
        container.resolve("svc")
        @Assert(counter.getCount(), 1)
    }

    @TestCase
    func testDefaultLifetimeIsTransient() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }
}

// ===== HttpMethod Tests =====

@Test
class TestHttpMethod {
    @TestCase
    func testMethodToString() {
        @Assert(HttpMethod.GET.toString(), "GET")
        @Assert(HttpMethod.POST.toString(), "POST")
        @Assert(HttpMethod.PUT.toString(), "PUT")
        @Assert(HttpMethod.DELETE.toString(), "DELETE")
        @Assert(HttpMethod.PATCH.toString(), "PATCH")
    }

    @TestCase
    func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("POST") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("PUT") == HttpMethod.PUT)
        @Assert(HttpMethod.fromString("DELETE") == HttpMethod.DELETE)
        @Assert(HttpMethod.fromString("PATCH") == HttpMethod.PATCH)
    }

    @TestCase
    func testFromStringCaseInsensitive() {
        @Assert(HttpMethod.fromString("get") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("Post") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("pUt") == HttpMethod.PUT)
    }

    @TestCase
    func testFromStringInvalid() {
        try {
            HttpMethod.fromString("INVALID")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }
}

// ===== Request Tests =====

@Test
class TestRequest {
    @TestCase
    func testCreateGetRequest() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.method == HttpMethod.GET)
        @Assert(req.path, "/hello")
        @Assert(req.body, "")
    }

    @TestCase
    func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
        @Assert(req.path, "/api")
        @Assert(req.body, "data")
    }

    @TestCase
    func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
        req.headers["Content-Type"] = "application/json"
        @Assert(req.header("Content-Type").getOrThrow(), "application/json")
    }

    @TestCase
    func testQueryStringParsing() {
        let req = Request(HttpMethod.GET, "/search?q=hello&page=1")
        @Assert(req.path, "/search")
        @Assert(req.query("q").getOrThrow(), "hello")
        @Assert(req.query("page").getOrThrow(), "1")
    }

    @TestCase
    func testQueryStringMultipleParams() {
        let req = Request(HttpMethod.GET, "/api?a=1&b=2&c=3")
        @Assert(req.path, "/api")
        @Assert(req.query("a").getOrThrow(), "1")
        @Assert(req.query("b").getOrThrow(), "2")
        @Assert(req.query("c").getOrThrow(), "3")
    }

    @TestCase
    func testQueryStringEmptyValue() {
        let req = Request(HttpMethod.GET, "/path?key=")
        @Assert(req.path, "/path")
        @Assert(req.query("key").getOrThrow(), "")
    }

    @TestCase
    func testPathWithoutQueryString() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.path, "/hello")
        @Assert(req.query("anything").isNone())
    }

    @TestCase
    func testConvenienceMethods() {
        let req = Request(HttpMethod.GET, "/users/42?format=json")
        req.pathParams["id"] = "42"
        req.headers["Accept"] = "text/html"
        @Assert(req.param("id").getOrThrow(), "42")
        @Assert(req.query("format").getOrThrow(), "json")
        @Assert(req.header("Accept").getOrThrow(), "text/html")
        @Assert(req.param("missing").isNone())
    }
}

// ===== Response Tests =====

@Test
class TestResponse {
    @TestCase
    func testDefaultResponse() {
        let resp = Response()
        @Assert(resp.statusCode, 200)
        @Assert(resp.body, "")
    }

    @TestCase
    func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
    }

    @TestCase
    func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
    }

    @TestCase
    func testSetHeader() {
        let resp = Response()
        resp.setHeader("X-Custom", "value")
        @Assert(resp.headers.get("X-Custom").getOrThrow(), "value")
    }

    @TestCase
    func testStatusChaining() {
        let resp = Response()
        let r = resp.status(201)
        @Assert(r.statusCode, 201)
        r.body = "test"
        @Assert(resp.body, "test")
    }

    @TestCase
    func testJsonHelper() {
        let resp = Response()
        resp.json("{\"key\":\"value\"}")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "application/json")
        @Assert(resp.body, "{\"key\":\"value\"}")
    }

    @TestCase
    func testTextHelper() {
        let resp = Response()
        resp.text("plain text")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/plain")
        @Assert(resp.body, "plain text")
    }

    @TestCase
    func testHtmlHelper() {
        let resp = Response()
        resp.html("<h1>Hello</h1>")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/html")
        @Assert(resp.body, "<h1>Hello</h1>")
    }
}

// ===== Router Tests =====

@Test
class TestRouter {
    @TestCase
    func testExactPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/hello")
        @Assert(!result.isNone())
    }

    @TestCase
    func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/42")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("id").getOrThrow(), "42")
    }

    @TestCase
    func testMultiplePathParams() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:userId/posts/:postId", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/1/posts/99")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("userId").getOrThrow(), "1")
        @Assert(rm.params.get("postId").getOrThrow(), "99")
    }

    @TestCase
    func testNoMatchReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/world")
        @Assert(result.isNone())
    }

    @TestCase
    func testWrongMethodReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.POST, "/hello")
        @Assert(result.isNone())
    }

    @TestCase
    func testRootPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/")
        @Assert(!result.isNone())
    }

    @TestCase
    func testMultipleRoutes() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a", { ctx: HttpContext =>
            ctx.response.body = "a"
        })
        router.addRoute(HttpMethod.GET, "/b", { ctx: HttpContext =>
            ctx.response.body = "b"
        })
        @Assert(!router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(!router.findRoute(HttpMethod.GET, "/b").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/c").isNone())
    }

    @TestCase
    func testMethodRouting() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/data", { _: HttpContext => })
        router.addRoute(HttpMethod.POST, "/data", { _: HttpContext => })
        @Assert(!router.findRoute(HttpMethod.GET, "/data").isNone())
        @Assert(!router.findRoute(HttpMethod.POST, "/data").isNone())
    }

    @TestCase
    func testStaticAndParamMixed() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/api/users/:id/profile", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/api/users/5/profile")
        @Assert(!result.isNone())
        @Assert(result.getOrThrow().params.get("id").getOrThrow(), "5")
    }

    @TestCase
    func testNoMatchDifferentDepth() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a/b", { _: HttpContext => })
        @Assert(router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/a/b/c").isNone())
    }
}

// ===== Route Group Tests =====

@Test
class TestRouteGroup {
    @TestCase
    func testGroupPrefixGet() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext =>
            ctx.response.body = "user list"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user list")
    }

    @TestCase
    func testGroupPrefixPost() {
        let app = WebApp()
        let api = app.group("/api")
        api.post("/users", { ctx: HttpContext =>
            ctx.response.body = "created"
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "created")
    }

    @TestCase
    func testGroupMultipleRoutes() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/items", { ctx: HttpContext => ctx.response.body = "items" })
        api.post("/items", { ctx: HttpContext => ctx.response.body = "item created" })
        api.delete("/items/:id", { ctx: HttpContext => ctx.response.body = "deleted" })

        let ctx1 = HttpContext(Request(HttpMethod.GET, "/api/v1/items"), Response(), app.services)
        app.handleRequest(ctx1)
        @Assert(ctx1.response.body, "items")

        let ctx2 = HttpContext(Request(HttpMethod.POST, "/api/v1/items"), Response(), app.services)
        app.handleRequest(ctx2)
        @Assert(ctx2.response.body, "item created")
    }

    @TestCase
    func testGroupWithPathParams() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "user:${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user:42")
    }

    @TestCase
    func testGroupNoMatchWithoutPrefix() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext => ctx.response.body = "users" })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
    }
}

// ===== Middleware Tests =====

@Test
class TestMiddleware {
    @TestCase
    func testSingleMiddleware() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Middleware", "applied")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.headers.get("X-Middleware").getOrThrow(), "applied")
        @Assert(ctx.response.body, "ok")
    }

    @TestCase
    func testMiddlewareOrder() {
        let app = WebApp()
        let order = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("first-before")
            next()
            order.add("first-after")
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("second-before")
            next()
            order.add("second-after")
        })
        app.get("/test", { _: HttpContext =>
            order.add("handler")
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(order.size, 5)
        @Assert(order[0], "first-before")
        @Assert(order[1], "second-before")
        @Assert(order[2], "handler")
        @Assert(order[3], "second-after")
        @Assert(order[4], "first-after")
    }

    @TestCase
    func testMiddlewareModifyResponse() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            next()
            ctx.response.setHeader("X-After", "true")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "ok")
        @Assert(ctx.response.headers.get("X-After").getOrThrow(), "true")
    }

    @TestCase
    func testMiddlewareShortCircuit() {
        let app = WebApp()
        app.use({ ctx: HttpContext, _next: () -> Unit =>
            ctx.response.statusCode = 403
            ctx.response.body = "Forbidden"
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "should not reach"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 403)
        @Assert(ctx.response.body, "Forbidden")
    }

    @TestCase
    func testMiddlewareChain() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-1", "a")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-2", "b")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-3", "c")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.headers.get("X-1").getOrThrow(), "a")
        @Assert(ctx.response.headers.get("X-2").getOrThrow(), "b")
        @Assert(ctx.response.headers.get("X-3").getOrThrow(), "c")
        @Assert(ctx.response.body, "ok")
    }

    @TestCase
    func testNoMiddleware() {
        let app = WebApp()
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "direct"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "direct")
    }

    @TestCase
    func testMiddlewareBeforeAndAfter() {
        let app = WebApp()
        let log = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            log.add("before:${ctx.request.path}")
            next()
            log.add("after:${ctx.response.statusCode}")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.statusCode = 201
            ctx.response.body = "created"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(log[0], "before:/test")
        @Assert(log[1], "after:201")
    }

    @TestCase
    func testMiddlewareErrorRecovery() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            try {
                next()
            } catch (_: Exception) {
                ctx.response.statusCode = 500
                ctx.response.body = "Internal Server Error"
            }
        })
        app.get("/fail", { _: HttpContext =>
            throw WebException("test error")
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/fail"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 500)
        @Assert(ctx.response.body, "Internal Server Error")
    }
}

// ===== WebApp Integration Tests =====

@Test
class TestWebApp {
    @TestCase
    func testSimpleGetRequest() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello, World!"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 200)
        @Assert(ctx.response.body, "Hello, World!")
    }

    @TestCase
    func testPostWithBody() {
        let app = WebApp()
        app.post("/echo", { ctx: HttpContext =>
            ctx.response.body = ctx.request.body
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/echo", "test data"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "test data")
    }

    @TestCase
    func testRouteNotFound() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/unknown"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
        @Assert(ctx.response.body, "Not Found")
    }

    @TestCase
    func testPathParams() {
        let app = WebApp()
        app.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "User ${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "User 42")
    }

    @TestCase
    func testQueryParamsInRoute() {
        let app = WebApp()
        app.get("/search", { ctx: HttpContext =>
            let q = ctx.request.query("q") ?? ""
            ctx.response.body = "search:${q}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/search?q=hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "search:hello")
    }

    @TestCase
    func testMiddlewareApplied() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Powered-By", "WebFramework")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "ok")
        @Assert(ctx.response.headers.get("X-Powered-By").getOrThrow(), "WebFramework")
    }

    @TestCase
    func testServiceInjection() {
        let app = WebApp()
        app.services.register("msg", { => MessageService("hello") }, lifetime: Singleton)
        app.get("/msg", { ctx: HttpContext =>
            let msg = (ctx.services.resolve("msg") as MessageService).getOrThrow()
            ctx.response.body = msg.getMessage()
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/msg"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "hello")
    }

    @TestCase
    func testGroupRouting() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/status", { ctx: HttpContext =>
            ctx.response.json("{\"ok\":true}")
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/v1/status"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "{\"ok\":true}")
        @Assert(ctx.response.headers.get("Content-Type").getOrThrow(), "application/json")
    }

    @TestCase
    func testFullRestPipeline() {
        let app = WebApp()
        app.services.register("counter", { => CounterService() }, lifetime: Singleton)

        app.use({ ctx: HttpContext, next: () -> Unit =>
            let counter = (ctx.services.resolve("counter") as CounterService).getOrThrow()
            counter.increment()
            next()
            ctx.response.setHeader("X-Request-Count", "${counter.getCount()}")
        })

        let api = app.group("/api")
        api.get("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "unknown"
            ctx.response.json("{\"id\":\"${id}\"}")
        })

        let ctx1 = HttpContext(Request(HttpMethod.GET, "/api/items/42"), Response(), app.services)
        app.handleRequest(ctx1)
        @Assert(ctx1.response.body, "{\"id\":\"42\"}")
        @Assert(ctx1.response.headers.get("Content-Type").getOrThrow(), "application/json")
        @Assert(ctx1.response.headers.get("X-Request-Count").getOrThrow(), "1")

        let ctx2 = HttpContext(Request(HttpMethod.GET, "/api/items/7"), Response(), app.services)
        app.handleRequest(ctx2)
        @Assert(ctx2.response.headers.get("X-Request-Count").getOrThrow(), "2")
    }

    @TestCase
    func testPutAndDelete() {
        let app = WebApp()
        app.put("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Updated ${id}"
        })
        app.delete("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Deleted ${id}"
        })

        let ctx1 = HttpContext(Request(HttpMethod.PUT, "/items/1"), Response(), app.services)
        app.handleRequest(ctx1)
        @Assert(ctx1.response.body, "Updated 1")

        let ctx2 = HttpContext(Request(HttpMethod.DELETE, "/items/2"), Response(), app.services)
        app.handleRequest(ctx2)
        @Assert(ctx2.response.body, "Deleted 2")
    }
}
