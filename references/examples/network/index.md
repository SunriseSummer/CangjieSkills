<!-- cj-doc kind="example-category" level="3" id="examples.network" parent="examples" -->
# HTTP、URL 与 WebSocket

[← 应用示例](../index.md)

解析 URL，构造 HTTP 请求，并管理本机 HTTP/WebSocket 往返的启动、关闭和资源回收。

| 示例 | 教学目标 |
|---|---|
| [解析并检查 URL](url-parse.md) | 从字符串构造 URL，并读取 scheme、host、port 和 path 等结构化字段。 |
| [构造 HTTP 请求](http-request.md) | 用 builder 明确方法、URL、头和 body，再生成不可变请求对象。 |
| [完成本机 HTTP JSON 往返](http-local-roundtrip.md) | 用 `spawn { server.serve() }` 后台启动，以 `afterBind` 等待绑定，结束时调用 `closeGracefully()` 并通过 `onShutdown` 确认完成。 |
| [通过 HTTP 传输 Deflate 压缩 JSON](compressed-json-http-roundtrip.md) | 按 JSON UTF-8 → 压缩 → Base64 文本的对称管线完成本机往返。 |
| [完成本机 WebSocket 收发与关闭](websocket-local-roundtrip.md) | 关闭发起方发送 Close 后读取确认；响应方回写收到的 Close payload；最后 `closeConn`，并显式管理阻塞读取和服务生命周期。 |
