# 可组合命令路由器

使用仓颉 `1.1.3 (cjnative)` 创建可执行 cjpm 项目 `command_router`，仅使用标准库，实现支持路径参数、查询参数和中间件的内存命令路由器。不得修改给定测试。

## 公开 API

```cangjie
public class RouteException <: Exception { public init(message: String) }

public class CommandContext {
    public let method: String
    public let path: String
    public let params: HashMap<String, String>
    public let query: HashMap<String, String>
    public var status: Int64
    public var body: String
    public init(method: String, target: String)
}

public type Handler = (CommandContext) -> Unit
public type Middleware = (CommandContext, () -> Unit) -> Unit

public class CommandRouter {
    public init()
    public func use(middleware: Middleware): Unit
    public func add(method: String, pattern: String, handler: Handler): Unit
    public func dispatch(method: String, target: String): CommandContext
}
```

## 规则

- 方法名按 ASCII 大小写不敏感匹配；注册时保存规范化大写形式。
- pattern 必须以 `/` 开头。以 `:` 开头的完整路径段是参数段，如 `/users/:id`；参数名不可为空、不可重复。静态路由优先于参数路由；同等具体度按注册顺序选择。
- target 由路径和可选查询串组成。查询形如 `?key=value&flag`；无 `=` 的键值为空串，重复键以后者覆盖。忽略空查询片段；键不可为空。无需 URL 百分号解码。
- 每次 dispatch 创建新 context。命中后填充 params；未命中返回 status `404`、body `not found`。
- 中间件按注册顺序包裹处理器。中间件可以不调用 `next()` 实现短路；异常可以由外层中间件捕获。若异常最终逸出 dispatch，不得吞掉或改写类型。
- `add` 的非法 method/pattern/参数规则抛 `RouteException`；失败注册不得影响已有路由。
- `main()` 注册至少一个参数路由和两个中间件，分行输出状态、正文和提取到的参数。

## 工程与验收

- 将 `command_router_test.cj` 原样复制到 `src/`，不得修改或绕过。
- 合理拆分 context、route、router 等生产代码；禁止针对测试常量硬编码。
- 执行 `cjpm build`、`cjpm test --no-color`、`cjpm run`，全部成功且没有 warning。
