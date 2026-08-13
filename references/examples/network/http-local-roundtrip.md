<!-- cj-doc kind="example-leaf" level="4" id="examples.network.http-local-roundtrip" parent="examples.network" -->
# 完成本机 HTTP JSON 往返

[← HTTP、URL 与 WebSocket](index.md)

用 `spawn { server.serve() }` 后台启动，以 `afterBind` 等待绑定，结束时调用 `closeGracefully()` 并通过 `onShutdown` 确认完成。

## 已验证的本机往返

服务端用端口 `0` 由系统分配空闲端口，`afterBind` 消除启动竞态；客户端读完响应体后在 `finally` 中关闭，再优雅停止服务并等待 `onShutdown`。`NoopLogger` 仅用于使自测输出确定。

```cangjie cjtest=run id=stdx.http-local-roundtrip.run form=unit requires=stdx timeout=60s
package http_local_roundtrip_example

import std.io.StringReader
import std.sync.SyncCounter
import stdx.encoding.json.JsonValue
import stdx.log.NoopLogger
import stdx.net.http.*

main(): Unit {
    let ready = SyncCounter(1)
    let stopped = SyncCounter(1)
    let logger = NoopLogger()
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .logger(logger)
        .build()

    server.distributor.register("/echo", {
        context =>
        let requestText = StringReader(context.request.body).readToEnd()
        let canonical = JsonValue.fromStr(requestText).toString()
        context.responseBuilder
            .header("Content-Type", "application/json")
            .header("Connection", "close")
            .body(canonical)
    })
    server.afterBind({ => ready.dec() })
    server.onShutdown({ => stopped.dec() })
    spawn { server.serve() }
    ready.waitUntilZero()

    let client = ClientBuilder().noProxy().logger(logger).build()
    try {
        let request = HttpRequestBuilder()
            .post()
            .url("http://127.0.0.1:${server.port}/echo")
            .header("Content-Type", "application/json")
            .body("{\"value\":7}")
            .build()
        let response = client.send(request)
        let responseText = StringReader(response.body).readToEnd()
        println("${response.status}|${responseText}")
    } finally {
        client.close()
        server.closeGracefully()
        stopped.waitUntilZero()
    }
    println("shutdown=true")
}
```

预期标准输出：

```text cjtest=expect for=stdx.http-local-roundtrip.run stream=stdout match=exact
200|{"value":7}
shutdown=true
```
