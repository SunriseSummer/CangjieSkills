# 仓颉语言 Web 服务端框架开发任务书

## 1. 任务目标

使用仓颉（Cangjie）编程语言，实现一个基础的 **Web 服务端框架**，采用现代软件工程和先进 Web 架构设计，支持：

- **依赖注入**（IoC）：提供 `ServiceContainer`，支持 Singleton 和 Transient 生命周期管理
- **中间件管道**（Middleware Pipeline）：洋葱模型中间件链，支持请求前/后处理、短路、异常恢复等
- **路由匹配**（Router）：支持静态路径和带参数的动态路径（如 `/users/:id`）
- **路由分组**（Route Group）：通过公共前缀组织路由（如 `/api/v1`）
- **查询字符串解析**：自动从 URL 中解析 `?key=value&...` 参数
- **响应辅助方法**：`json()`、`text()`、`html()` 快速设置 Content-Type 和响应体
- **应用框架**（WebApp）：将 IoC、路由、中间件组合为统一的请求处理管道

在框架基础上，还需提供一个 **REST API 使用示例**（Todo CRUD 应用），演示框架的各项功能。

> **注意**：本框架的测试采用纯单元测试方式，通过直接构造 `Request`/`Response` 对象并调用 `handleRequest` 来验证，无需启动实际 HTTP 服务器。

---

## 2. 项目结构

```
web/
├── cjpm.toml                  # 项目配置
├── src/
│   ├── main.cj                # 入口文件（Todo REST API 示例）
│   ├── context.cj             # 异常 + HTTP 方法枚举 + Request/Response/HttpContext + 查询解析
│   ├── container.cj           # IoC 容器（ServiceContainer）
│   ├── router.cj              # 路由器（Router）+ 路由分组（RouteGroup）
│   ├── web_app.cj             # Web 应用框架（WebApp）
│   └── web_test.cj            # 单元测试（已经给定）
```

### 2.1 cjpm.toml 配置

```toml
[package]
  cjc-version = "1.0.5"
  name = "web"
  version = "1.0.0"
  output-type = "executable"
```

---

## 3. API 设计规格

### 3.1 异常类型

```
WebException <: Exception
  - init(message: String)
```

所有框架错误（如服务未注册、未知 HTTP 方法）均抛出 `WebException`。

### 3.2 HTTP 方法枚举

```
enum HttpMethod <: Equatable<HttpMethod> & ToString
  GET | POST | PUT | DELETE | PATCH
```

| 方法 | 说明 |
|------|------|
| `operator func ==(other: HttpMethod): Bool` | 等值比较 |
| `operator func !=(other: HttpMethod): Bool` | 不等比较 |
| `func toString(): String` | 返回方法名称字符串，如 `"GET"`、`"POST"` |
| `static func fromString(s: String): HttpMethod` | 从字符串解析（不区分大小写），未知方法抛 `WebException` |

### 3.3 Request（HTTP 请求）

```
class Request
  公开属性：method, path, headers, body, pathParams, queryParams
  - init(method: HttpMethod, path: String)
  - init(method: HttpMethod, path: String, body: String)
  - func param(name: String): ?String
  - func query(name: String): ?String
  - func header(name: String): ?String
```

| 属性/方法 | 类型 | 说明 |
|-----------|------|------|
| `method` | `HttpMethod` | HTTP 方法 |
| `path` | `String` | 请求路径（已去除查询字符串部分） |
| `headers` | `HashMap<String, String>` | 请求头，初始为空 |
| `body` | `String` | 请求体，默认为空字符串 |
| `pathParams` | `HashMap<String, String>` | 路径参数（由路由器填充），初始为空 |
| `queryParams` | `HashMap<String, String>` | 查询参数（构造时自动从 URL 解析） |
| `param(name)` | `?String` | 便捷方法：获取路径参数 |
| `query(name)` | `?String` | 便捷方法：获取查询参数 |
| `header(name)` | `?String` | 便捷方法：获取请求头 |

**查询字符串自动解析**：

构造 `Request` 时，如果 `path` 包含 `?`，自动解析查询参数并将纯路径存入 `path` 属性：

```
"/search?q=hello&page=1" → path="/search", queryParams={q: "hello", page: "1"}
"/path?key="             → path="/path", queryParams={key: ""}
"/path?key"              → path="/path", queryParams={key: ""}
"/hello"                 → path="/hello", queryParams={}
```

### 3.4 Response（HTTP 响应）

```
class Response
  公开属性：statusCode, headers, body
  - init()
  - func setHeader(name: String, value: String): Unit
  - func status(code: Int64): Response
  - func json(data: String): Unit
  - func text(data: String): Unit
  - func html(data: String): Unit
```

| 方法 | 说明 |
|------|------|
| `setHeader` | 设置响应头（覆盖已有同名头） |
| `status(code)` | 设置状态码并返回 `this`，支持链式调用 |
| `json(data)` | 设置 Content-Type 为 `application/json`，设置响应体 |
| `text(data)` | 设置 Content-Type 为 `text/plain`，设置响应体 |
| `html(data)` | 设置 Content-Type 为 `text/html`，设置响应体 |

**链式调用示例**：

```cangjie
ctx.response.status(201).json("{\"id\":1}")
ctx.response.status(404).json("{\"error\":\"Not found\"}")
```

### 3.5 HttpContext（请求上下文）

```
class HttpContext
  公开属性（let 绑定）：request, response, services
  - init(request: Request, response: Response, services: ServiceContainer)
```

---

## 4. IoC 容器规格

### 4.1 ServiceLifetime 枚举

```
enum ServiceLifetime
  Singleton | Transient
```

- **Singleton**：首次 `resolve` 时创建实例，后续 `resolve` 返回同一实例（懒创建）
- **Transient**：每次 `resolve` 都创建新实例

### 4.2 ServiceContainer

```
class ServiceContainer
  - init()
  - func register(name: String, factory: () -> Object, lifetime!: ServiceLifetime = Transient): Unit
  - func resolve(name: String): Object
  - func resolveOrNone(name: String): ?Object
  - func contains(name: String): Bool
```

| 方法 | 说明 |
|------|------|
| `register` | 注册服务工厂函数。`lifetime` 为命名参数，默认 `Transient`。重复注册同名服务时覆盖旧定义并清除已缓存的 Singleton 实例 |
| `resolve` | 按名称解析服务。未注册时抛出 `WebException` |
| `resolveOrNone` | 安全解析：未注册时返回 `None` 而非抛异常 |
| `contains` | 检查指定名称的服务是否已注册 |

**使用方式**：

```cangjie
container.register("userService", { => UserService() }, lifetime: Singleton)
let svc = (container.resolve("userService") as UserService).getOrThrow()
```

---

## 5. 路由器规格

### 5.1 RouteMatch

```
class RouteMatch
  公开属性：handler, params
  - init(handler: (HttpContext) -> Unit, params: HashMap<String, String>)
```

### 5.2 Router

```
class Router
  - init()
  - func addRoute(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit
  - func findRoute(method: HttpMethod, path: String): ?RouteMatch
```

### 5.3 RouteGroup（路由分组）

```
class RouteGroup
  - init(router: Router, prefix: String)     // 包级可见
  - func get(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func post(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func put(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func delete(pattern: String, handler: (HttpContext) -> Unit): Unit
```

路由分组将公共前缀与路由模式拼接后注册到路由器：

```cangjie
let api = app.group("/api/v1")
api.get("/users", handler)      // 实际注册 "/api/v1/users"
api.get("/users/:id", handler)  // 实际注册 "/api/v1/users/:id"
```

### 5.4 路径匹配规则

| 模式（Pattern） | 请求路径 | 匹配结果 | 提取的参数 |
|------------------|----------|----------|------------|
| `/hello` | `/hello` | ✅ 匹配 | 无 |
| `/hello` | `/world` | ❌ 不匹配 | — |
| `/users/:id` | `/users/42` | ✅ 匹配 | `id = "42"` |
| `/users/:userId/posts/:postId` | `/users/1/posts/99` | ✅ 匹配 | `userId = "1"`, `postId = "99"` |
| `/api/users/:id/profile` | `/api/users/5/profile` | ✅ 匹配 | `id = "5"` |
| `/a/b` | `/a` | ❌ 不匹配（深度不同） | — |
| `/a/b` | `/a/b/c` | ❌ 不匹配（深度不同） | — |
| `/` | `/` | ✅ 匹配 | 无 |

**匹配算法**：

1. 将 `pattern` 和 `path` 按 `"/"` 分割，过滤空段（`split("/", removeEmpty: true)`）
2. 段数不同则不匹配
3. 逐段比较：以 `:` 开头的段为参数段（用 `segment[1..segment.size]` 提取参数名并捕获值），否则要求精确匹配
4. 按注册顺序，第一个匹配的路由生效
5. HTTP 方法必须一致

---

## 6. 中间件规格

### 6.1 函数签名

```cangjie
(HttpContext, () -> Unit) -> Unit
```

### 6.2 执行模型（洋葱模型）

中间件按注册顺序形成嵌套管道，每个中间件可以：

1. 在调用 `next()` 之前执行**请求前处理**
2. 调用 `next()` 将控制权传递给下一个中间件/最终处理函数
3. 在 `next()` 返回后执行**响应后处理**
4. **不调用** `next()` 实现短路（如权限校验失败直接返回 403）
5. 用 `try-catch` 包裹 `next()` 实现**异常恢复**（如全局错误处理返回 500）

**执行顺序示例**：

```
注册顺序：middleware1 → middleware2 → handler

执行流程：
  middleware1 前处理
    → middleware2 前处理
      → handler 执行
    ← middleware2 后处理
  ← middleware1 后处理
```

**错误处理中间件示例**：

```cangjie
app.use({ ctx: HttpContext, next: () -> Unit =>
    try {
        next()
    } catch (_: Exception) {
        ctx.response.statusCode = 500
        ctx.response.json("{\"error\":\"Internal Server Error\"}")
    }
})
```

---

## 7. WebApp 规格

### 7.1 WebApp 类

```
class WebApp
  公开属性：services: ServiceContainer
  - init()
  - func use(middleware: (HttpContext, () -> Unit) -> Unit): Unit
  - func route(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit
  - func get(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func post(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func put(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func delete(pattern: String, handler: (HttpContext) -> Unit): Unit
  - func group(prefix: String): RouteGroup
  - func handleRequest(ctx: HttpContext): Unit
```

| 方法 | 说明 |
|------|------|
| `use` | 注册中间件，按注册顺序执行 |
| `route` | 注册任意 HTTP 方法的路由处理函数 |
| `get/post/put/delete` | 注册对应 HTTP 方法的路由（委托给 `route`） |
| `group` | 创建路由分组，共享路径前缀 |
| `handleRequest` | 处理请求：路由匹配 → 填充路径参数 → 构建中间件链 → 执行 |

### 7.2 handleRequest 处理流程

1. 使用 `Router.findRoute` 匹配路由
2. **匹配成功**：将路径参数写入 `ctx.request.pathParams`，使用匹配到的 handler
3. **匹配失败**：使用默认 404 handler（设置 `statusCode = 404`，`body = "Not Found"`）
4. 将所有注册的中间件和 handler 构建为洋葱模型执行链
5. 执行链处理请求

---

## 8. 单元测试要求

测试文件已经给定为 `web_test.cj`，**不要做修改**，直接引入项目并使用仓颉单元测试框架测试。

测试覆盖以下八大类：

| 测试类 | 测试数量 | 覆盖内容 |
|--------|----------|----------|
| `TestServiceContainer` | 11 | 注册/解析、Singleton/Transient、懒创建、覆盖、resolveOrNone、异常 |
| `TestHttpMethod` | 4 | toString、fromString、大小写不敏感、无效方法异常 |
| `TestRequest` | 8 | 构造、headers、查询字符串自动解析、便捷方法（param/query/header） |
| `TestResponse` | 8 | 默认值、状态码、json/text/html 辅助方法、status 链式调用 |
| `TestRouter` | 10 | 精确匹配、参数提取、多参数、方法过滤、根路径、深度不同 |
| `TestRouteGroup` | 5 | 前缀路由、多路由、路径参数、无前缀不匹配 |
| `TestMiddleware` | 8 | 单中间件、执行顺序、响应修改、短路、链式、异常恢复 |
| `TestWebApp` | 10 | REST 请求、404、路径参数、查询参数、服务注入、分组路由、完整管道 |

**合计**：64 个测试用例。

---

## 9. 入口文件（main.cj）

实现一个 **Todo REST API** 应用，演示框架全部核心功能：

- **领域模型**：`Todo` 类（id、title、completed 属性，带 `toJson()` 方法）
- **服务层**：`TodoService` 类（findAll、findById、create、deleteById）
- **IoC 注册**：将 `TodoService` 注册为 Singleton
- **中间件**：日志中间件 + 错误处理中间件
- **路由分组**：所有 API 路由挂载在 `/api` 前缀下
- **模拟请求**：通过构造 Request/Response 对象模拟 HTTP 请求

```cangjie
// 路由定义示例
let api = app.group("/api")
api.get("/todos", listHandler)        // 列出所有 Todo
api.get("/todos/:id", getHandler)     // 按 ID 查询
api.post("/todos", createHandler)     // 创建 Todo（body 为标题）
api.delete("/todos/:id", deleteHandler) // 删除 Todo
app.get("/health", healthHandler)     // 健康检查
```

期望输出：

```
=== Todo REST API Demo ===

[POST] /api/todos
  -> 201
  Body: {"id":1,"title":"Buy groceries","completed":false}

[POST] /api/todos
  -> 201
  Body: {"id":2,"title":"Read a book","completed":false}

[GET] /api/todos
  -> 200
  Body: [{"id":1,"title":"Buy groceries","completed":false},{"id":2,"title":"Read a book","completed":false}]

[GET] /api/todos/1
  -> 200
  Body: {"id":1,"title":"Buy groceries","completed":false}

[DELETE] /api/todos/1
  -> 204
  Body: 

[GET] /api/todos
  -> 200
  Body: [{"id":2,"title":"Read a book","completed":false}]

[GET] /api/todos/999
  -> 404
  Body: {"error":"Todo not found"}

[GET] /health
  -> 200
  Body: {"status":"ok"}
```

---

## 10. 实现提示

### 10.1 仓颉语言注意事项

- `match` 是关键字，不能用作方法名（路由器方法建议命名为 `findRoute`）
- `HashMap` 使用 `map[key] = value` 赋值，`map.get(key)` 返回 `Option<V>`，`map.contains(key)` 检查存在性
- `match` 表达式的分支体 `{ ... }` 会被解析为 Lambda；多语句的分支逻辑建议提取为独立方法
- 闭包捕获：在 `while` 循环中构建中间件链时，用 `let` 绑定当前值确保每次迭代捕获正确的引用
- 枚举需显式实现 `Equatable` 接口才能使用 `==` / `!=` 运算符
- 类型转换使用 `(obj as TargetType).getOrThrow()`
- 字符串切片 `s[start..end]` 基于字节索引，对 ASCII 内容安全
- `ArrayList.remove()` 接受 `Range<Int64>` 参数，删除单个元素用 `list.remove(i..(i+1))`
- `Int64.parse(s)` 需要 `import std.convert.*`

### 10.2 查询字符串解析建议

```cangjie
// 用 indexOf("?") 定位分隔符，用字符串切片分离路径和查询串
if (let Some(idx) <- rawPath.indexOf("?")) {
    let cleanPath = rawPath[0..idx]
    let queryStr = rawPath[(idx + 1)..rawPath.size]
    // 按 "&" 分割，再按 "=" 分割键值对
}
```

### 10.3 建议的文件划分

| 文件 | 内容 |
|------|------|
| `context.cj` | `WebException`、`HttpMethod`（含 fromString）、`Request`（含查询解析）、`Response`（含 json/text/html）、`HttpContext`、查询解析辅助函数 |
| `container.cj` | `ServiceLifetime`、`ServiceContainer`（含 resolveOrNone） |
| `router.cj` | `RouteMatch`、`Router`、`RouteGroup`（及内部辅助类 `RouteEntry`） |
| `web_app.cj` | `WebApp`（含 group、route 方法） |
| `main.cj` | `Todo`、`TodoService`、入口函数和 REST API 示例 |

---

## 11. 验收标准

1. `cjpm build` 编译成功，无错误，无警告
2. `cjpm run` 正确输出 Todo REST API 示例的处理结果
3. `cjpm test` 全部测试通过（64 个测试用例，0 失败）
4. 代码结构清晰，文件划分合理
