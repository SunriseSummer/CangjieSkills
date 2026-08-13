<!-- cj-doc kind="example-leaf" level="4" id="examples.network.compressed-json-http-roundtrip" parent="examples.network" -->
# 通过 HTTP 传输 Deflate 压缩 JSON

[← HTTP、URL 与 WebSocket](index.md)

按 JSON UTF-8 → 压缩 → Base64 文本的对称管线完成本机往返。

## 核心指导

这个端到端示例把三个边界串成一条可验证管线：客户端按 `JSON UTF-8 → Deflate → Base64` 发送，服务端按相反顺序恢复并用 `JsonValue` 规范化。Base64 让二进制压缩数据可以安全承载在文本请求体中；若协议允许二进制 body，则无需这一层。

服务端使用动态端口和 `afterBind` 消除启动竞争；客户端、压缩流和服务端都在确定路径关闭。仓颉/stdx 1.0.5.1 中 `DeflateFormat` 不能单独精确导入，因此唯一保留的通配导入是 `stdx.compress.zlib.*`。

```cangjie cjtest=run id=app.stdx.compressed.json.http.roundtrip.run form=unit requires=stdx timeout=90s
package compressed_json_http_roundtrip

import std.collection.ArrayList
import std.io.ByteBuffer
import std.io.StringReader
import std.sync.SyncCounter
import stdx.compress.zlib.*
import stdx.encoding.base64.fromBase64String
import stdx.encoding.base64.toBase64String
import stdx.encoding.json.JsonValue
import stdx.log.NoopLogger
import stdx.net.http.ClientBuilder
import stdx.net.http.HttpRequestBuilder
import stdx.net.http.ServerBuilder

func deflate(source: Array<Byte>): Array<Byte> {
    let output = ByteBuffer()
    let encoder = CompressOutputStream(output, wrap: DeflateFormat)
    try {
        encoder.write(source)
    } finally {
        encoder.close()
    }
    return output.bytes()
}

func inflate(source: Array<Byte>): Array<Byte> {
    let decoder = DecompressInputStream(ByteBuffer(source), wrap: DeflateFormat)
    let restored = ArrayList<Byte>()
    let buffer = Array<Byte>(128, repeat: 0)
    try {
        var size = decoder.read(buffer)
        while (size > 0) {
            restored.add(all: buffer[..size])
            size = decoder.read(buffer)
        }
    } finally {
        decoder.close()
    }
    return restored.toArray()
}

main(): Unit {
    let ready = SyncCounter(1)
    let logger = NoopLogger()
    let server = ServerBuilder().addr("127.0.0.1").port(0).logger(logger).build()

    server.distributor.register(
        "/normalize",
        {
            context =>
                let encoded = StringReader(context.request.body).readToEnd()
                let compressed = fromBase64String(encoded).getOrThrow()
                let jsonText = String.fromUtf8(inflate(compressed))
                let canonical = JsonValue.fromStr(jsonText).toString()
                context
                    .responseBuilder
                    .header("Content-Type", "application/json")
                    .header("Connection", "close")
                    .body(canonical)
        }
    )
    server.afterBind({=> ready.dec()})
    let stopped = SyncCounter(1)
    server.onShutdown({=> stopped.dec()})
    spawn {server.serve()}
    ready.waitUntilZero()

    let client = ClientBuilder().noProxy().logger(logger).build()
    try {
        let source = "{\"message\": \"hello\", \"items\": [3, 1, 2], \"active\": true}"
        let payload = toBase64String(deflate(source.toArray()))
        let request = HttpRequestBuilder()
            .post()
            .url("http://127.0.0.1:${server.port}/normalize")
            .header("Content-Type", "text/plain")
            .body(payload)
            .build()
        let response = client.send(request)
        println("status=${response.status}")
        println("json=${StringReader(response.body).readToEnd()}")
    } finally {
        client.close()
        server.closeGracefully()
        stopped.waitUntilZero()
    }
    println("shutdown=true")
}
```

预期标准输出：

```text cjtest=expect for=app.stdx.compressed.json.http.roundtrip.run stream=stdout match=exact
status=200
json={"message":"hello","items":[3,1,2],"active":true}
shutdown=true
```
