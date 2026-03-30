# 分块响应与 Trailer（Chunked Transfer-Encoding）

本文档详细介绍 HTTP 服务端的分块传输（Chunked）响应和 Trailer 功能。核心 HTTP 服务端用法请参阅 [README.md](./README.md)。

---

## 1. 概述

HTTP 分块传输编码（`Transfer-Encoding: chunked`）允许服务端在不预先知道响应体大小的情况下逐块发送数据。适用于：

- 流式数据响应（实时日志、事件流等）
- 大文件逐块传输
- 需要在响应体结束后附加 Trailer 头（如校验和、签名等）

---

## 2. HttpResponseWriter API

`HttpResponseWriter` 用于在 Handler 中逐块写入响应数据。

**构造函数：**

```
HttpResponseWriter(ctx: HttpContext)
```

**方法：**

| 方法 | 签名 | 说明 |
|------|------|------|
| `write` | `write(buf: Array<UInt8>): Unit` | 写入一个数据块，立即发送给客户端 |

使用 `HttpResponseWriter` 时，需通过 `responseBuilder` 预先设置 `transfer-encoding: chunked` 头。如需 Trailer，还需通过 `responseBuilder.header("trailer", ...)` 声明 Trailer 字段名。

---

## 3. Trailer 用法

Trailer 是在分块传输结束后附加的 HTTP 头部字段，常用于传递校验和、签名、摘要等只有在完整数据写入后才能计算的信息。

**使用步骤：**
1. 在响应头中声明 `trailer` 字段名：`responseBuilder.header("trailer", "checkSum")`
2. 使用 `HttpResponseWriter` 逐块写入数据
3. 数据写入完毕后，通过 `responseBuilder.trailer("checkSum", value)` 设置 Trailer 值

---

## 4. 完整示例：Chunked 响应 + Trailer

以下示例演示服务端逐块写入响应数据，并在结束后附加校验和 Trailer：

```cangjie
import stdx.net.http.*
import std.io.*

func checksum(chunk: Array<UInt8>): Int64 {
    var sum = 0
    for (i in chunk) {
        if (i == UInt8(UInt32(r'\n'))) {
            sum += 1
        }
    }
    return sum / 2
}

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(8080).build()
    server
        .distributor
        .register(
            "/index",
            {
                httpContext =>
                let responseBuilder = httpContext.responseBuilder
                responseBuilder.header("transfer-encoding", "chunked")
                responseBuilder.header("trailer", "checkSum")
                let writer = HttpResponseWriter(httpContext)
                var sum = 0
                for (_ in 0..10) {
                    let chunk = Array<UInt8>(10, repeat: 0)
                    sum += checksum(chunk)
                    writer.write(chunk)
                }
                responseBuilder.trailer("checkSum", "${sum}")
            }
        )
    server.serve()
}
```

**说明：**
- `HttpResponseWriter(httpContext)` 创建分块写入器
- 每次调用 `writer.write(chunk)` 会将数据块立即发送给客户端
- 循环写入 10 个数据块，每块 10 字节
- `checksum()` 函数计算每个块的校验值并累加
- Handler 返回后，Trailer `checkSum` 会作为最后一个分块的尾部发送

---

## 5. 批量设置 Trailer

除了使用 `responseBuilder.trailer(key, value)` 逐个设置，还可使用以下方法批量操作：

| 方法 | 签名 | 说明 |
|------|------|------|
| `addTrailers` | `addTrailers(HttpHeaders): HttpResponseBuilder` | 批量添加 Trailer |
| `setTrailers` | `setTrailers(HttpHeaders): HttpResponseBuilder` | 替换全部 Trailer |

---

## 6. 注意事项

- 分块传输仅适用于 HTTP/1.1 协议；HTTP/2 使用帧机制，不需要分块编码
- 客户端需支持 `Transfer-Encoding: chunked` 才能正确接收分块响应
- Trailer 字段名必须在响应头的 `trailer` 中预先声明，否则客户端可能忽略
- `HttpResponseWriter.write()` 调用后数据立即发送，无法撤回
