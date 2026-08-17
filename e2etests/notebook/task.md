# 仓颉语言 notebook 服务开发任务书

## 1. 任务目标

使用仓颉（Cangjie）编程语言和**扩展标准库 stdx**，实现一个**笔记管理 REST API 服务**，同时支持 HTTP 和 **HTTPS** 通信，包含服务端和客户端，支持：

- **数据模型**：定义笔记（Note）数据结构，使用 `stdx.encoding.json` 进行 JSON 序列化和反序列化
- **业务逻辑**：内存存储的笔记增删改查（CRUD）和按标签过滤、统计功能
- **HTTP/HTTPS 服务端**：使用 `stdx.net.http` 和 `stdx.net.tls` 提供 RESTful API 端点，支持 TLS 加密通信
- **HTTP/HTTPS 客户端**：使用 `stdx.net.http` 和 `stdx.net.tls` 的 Client 消费 API 实现交互

---

## 2. 项目结构

```
notebook/
├── cjpm.toml                  # 项目配置（需配置 stdx 依赖）
├── certs/                     # TLS 证书目录
│   ├── ca.crt                 # CA 证书
│   ├── ca.key                 # CA 私钥
│   ├── server.crt             # 服务端证书（CA 签发，SAN 含 IP:127.0.0.1）
│   └── server.key             # 服务端私钥
├── src/
│   ├── main.cj                # 入口文件（演示 HTTPS 服务端/客户端交互）
│   ├── note.cj                # Note 数据模型 + JSON 序列化/反序列化
│   ├── note_service.cj        # NoteService 业务逻辑（内存存储）
│   ├── note_server.cj         # NoteServer HTTP/HTTPS 服务端（路由 + 处理器）
│   └── notebook_test.cj       # 单元测试（已给定，不可修改）
```

### 2.1 项目初始化

```bash
cjpm init --name notebook --type=executable
```

### 2.2 cjpm.toml 配置

需要配置 stdx 依赖路径。以 Linux x86_64 动态库为例：

```toml
[package]
  cjc-version = "1.1.3"
  name = "notebook"
  version = "1.0.0"
  output-type = "executable"

[dependencies]

# 注意：path-option 需替换为实际的 stdx 动态库路径
[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["<STDX_PATH>/dynamic/stdx"]
```

> **注意**：`<STDX_PATH>` 需替换为实际解压后的 stdx 目录。

### 2.3 TLS 证书生成

测试所需的自签名证书，放在 `certs/` 目录下：

```bash
mkdir -p certs && cd certs

# 生成 CA
openssl req -x509 -newkey rsa:2048 -keyout ca.key -out ca.crt -days 3650 -nodes -subj "/CN=TestCA"

# 生成服务端证书（需包含 SAN: IP:127.0.0.1）
openssl req -newkey rsa:2048 -keyout server.key -out server.csr -nodes -subj "/CN=127.0.0.1"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 \
  -extfile <(echo -e "subjectAltName=IP:127.0.0.1\nkeyUsage=digitalSignature,keyEncipherment\nextendedKeyUsage=serverAuth")
rm -f server.csr ca.srl
```

### 2.4 依赖的 stdx 包

| 包 | 用途 |
|---|---|
| `stdx.net.http` | HTTP 服务端（ServerBuilder/Server）和客户端（ClientBuilder/Client） |
| `stdx.net.tls` | TLS 配置（TlsServerConfig/TlsClientConfig）|
| `stdx.crypto.x509` | X509 证书和私钥解析（X509Certificate/PrivateKey） |
| `stdx.encoding.json` | JSON 值类型（JsonObject/JsonArray/JsonString/JsonInt/JsonBool 等）及解析 |

---

## 3. API 设计规格

### 3.1 Note 数据模型（note.cj）

```cangjie
public class Note {
    public var id: Int64
    public var title: String
    public var content: String
    public var tags: ArrayList<String>

    public init(id: Int64, title: String, content: String, tags: ArrayList<String>)
    public func toJsonValue(): JsonValue        // 序列化为 stdx JsonValue (JsonObject)
    public static func fromJsonValue(jv: JsonValue): Note  // 从 JsonValue 反序列化
}
```

**JSON 格式**：

```json
{"id":1,"title":"Meeting Notes","content":"Discuss project plan","tags":["work","urgent"]}
```

**字段映射**：

| 字段 | JSON 键 | JSON 类型 | 说明 |
|------|---------|-----------|------|
| `id` | `"id"` | `JsonInt` | 笔记唯一标识 |
| `title` | `"title"` | `JsonString` | 标题 |
| `content` | `"content"` | `JsonString` | 内容 |
| `tags` | `"tags"` | `JsonArray`（元素为 `JsonString`） | 标签列表 |

**序列化要求**：
- `toJsonValue()` 返回包含以上四个字段的 `JsonObject`
- `fromJsonValue(jv)` 从 `JsonValue`（须为 `JsonObject`）中提取所有字段构造 `Note`
- 往返一致性：`Note → toJsonValue().toString() → JsonValue.fromStr() → fromJsonValue() → Note` 应保持数据一致

### 3.2 NoteService 业务逻辑（note_service.cj）

```cangjie
public class NoteService {
    public init()

    public func createNote(title: String, content: String, tags: ArrayList<String>): Note
    public func getNote(id: Int64): ?Note
    public func getAllNotes(): ArrayList<Note>
    public func getNotesByTag(tag: String): ArrayList<Note>
    public func updateNote(id: Int64, title: String, content: String, tags: ArrayList<String>): ?Note
    public func deleteNote(id: Int64): Bool
    public func getStats(): JsonValue
}
```

| 方法 | 说明 |
|------|------|
| `createNote` | 创建笔记，自动分配递增 ID（从 1 开始），返回创建的 Note |
| `getNote` | 按 ID 查找，找到返回 `Some(note)`，否则 `None` |
| `getAllNotes` | 返回所有笔记的列表 |
| `getNotesByTag` | 返回包含指定标签的所有笔记（笔记的任一 tag 匹配即可） |
| `updateNote` | 按 ID 更新笔记的 title、content、tags；成功返回 `Some(note)`，ID 不存在返回 `None` |
| `deleteNote` | 按 ID 删除笔记；成功返回 `true`，不存在返回 `false` |
| `getStats` | 返回统计信息的 `JsonValue`（见下方格式） |

**getStats() 返回格式**：

```json
{"total_notes":3,"tag_counts":{"work":2,"meeting":1,"personal":1}}
```

| 字段 | 类型 | 说明 |
|------|------|------|
| `total_notes` | `JsonInt` | 当前笔记总数 |
| `tag_counts` | `JsonObject`（键为标签名，值为 `JsonInt`） | 各标签出现次数 |

### 3.3 NoteServer HTTP/HTTPS 服务端（note_server.cj）

```cangjie
public class NoteServer {
    public init(service: NoteService)
    public func start(addr: String, port: UInt16): Unit       // HTTP 非阻塞启动
    public func startTls(addr: String, port: UInt16,           // HTTPS 非阻塞启动
                         certPem: String, keyPem: String): Unit
    public func stop(): Unit                                   // 关闭服务器
    public func getPort(): UInt16                              // 获取实际监听端口
}
```

**架构要求**（降低圈复杂度）：
- 路由分发方法（`handleNotes`、`handleNote`）仅做方法分派，每个 HTTP 方法对应独立的处理方法
- 提取公共的响应辅助方法：`respondJson(ctx, status, body)` 和 `respondError(ctx, status, message)`
- 提取公共的 JSON 数组解析方法：`parseTagsArray(jsonTags)`

```cangjie
// 路由分发示例（低圈复杂度）
private func handleNotes(ctx: HttpContext): Unit {
    let method = ctx.request.method
    if (method == "POST") {
        handleCreateNote(ctx)
    } else if (method == "GET") {
        handleListNotes(ctx)
    } else {
        respondError(ctx, 405, "Method not allowed")
    }
}

// 响应辅助方法
private func respondJson(ctx: HttpContext, status: UInt16, body: String): Unit
private func respondError(ctx: HttpContext, status: UInt16, message: String): Unit
```

**启动机制**：
- 使用 `ServerBuilder` 创建 HTTP/HTTPS 服务器
- HTTPS 模式需配置 `TlsServerConfig`，加载证书和私钥
- 使用 `spawn` 在后台线程运行 `server.serve()`
- 使用 `SyncCounter` + `afterBind` 等待服务器绑定完成
- 端口传入 `0` 时由系统分配随机端口，通过 `getPort()` 获取实际端口

**辅助函数**：

```cangjie
func getQueryParam(rawQuery: String, name: String): ?String
func parseTagsArray(jsonTags: JsonArray): ArrayList<String>
```

---

## 4. HTTP API 端点规格

所有请求和响应的 Body 均为 JSON 格式，响应须设置 `Content-Type: application/json`。

### 4.1 创建笔记

```
POST /api/notes
```

**请求体**：

```json
{"title":"Meeting Notes","content":"Discuss project plan","tags":["work","urgent"]}
```

**成功响应**（200）：

```json
{"id":1,"title":"Meeting Notes","content":"Discuss project plan","tags":["work","urgent"]}
```

**错误响应**（400）：请求体不是合法 JSON 时返回

```json
{"error":"Invalid request body"}
```

### 4.2 列出笔记

```
GET /api/notes              # 列出所有笔记
GET /api/notes?tag=work     # 按标签过滤
```

**成功响应**（200）：

```json
{"notes":[{"id":1,...},{"id":2,...}],"total":2}
```

| 字段 | 类型 | 说明 |
|------|------|------|
| `notes` | `JsonArray` | 笔记列表（每个元素为 Note 的 JSON 表示） |
| `total` | `JsonInt` | 返回的笔记数量 |

### 4.3 获取单个笔记

```
GET /api/note?id=1
```

**成功响应**（200）：Note 的 JSON 表示

**错误响应**：
- 404：`{"error":"Note not found"}` — ID 不存在
- 400：`{"error":"Missing id parameter"}` — 未提供 id 参数

### 4.4 更新笔记

```
PUT /api/note
```

**请求体**：

```json
{"id":1,"title":"Updated Title","content":"New content","tags":["updated"]}
```

**成功响应**（200）：更新后的 Note JSON

**错误响应**：
- 404：`{"error":"Note not found"}` — ID 不存在
- 400：`{"error":"Invalid request body"}` — 请求体格式错误

### 4.5 删除笔记

```
DELETE /api/note?id=1
```

**成功响应**（200）：

```json
{"success":true}
```

**错误响应**：
- 404：`{"error":"Note not found"}` — ID 不存在
- 400：`{"error":"Missing id parameter"}` — 未提供 id 参数

### 4.6 获取统计信息

```
GET /api/stats
```

**成功响应**（200）：

```json
{"total_notes":3,"tag_counts":{"work":2,"meeting":1}}
```

---

## 5. 关键实现要点

### 5.1 JSON 操作（stdx.encoding.json）

使用 stdx 提供的 JSON 类型构建和解析 JSON 数据：

```cangjie
import stdx.encoding.json.*

// 构建 JSON
let obj = JsonObject()
obj.put("name", JsonString("Alice"))
obj.put("age", JsonInt(30))

// 解析 JSON
let jv = JsonValue.fromStr(##"{"name":"Alice","age":30}"##)
let name = jv.asObject()["name"].asString().getValue()

// 序列化
let jsonStr = obj.toString()  // 紧凑格式
```

### 5.2 HTTPS 服务端（stdx.net.http + stdx.net.tls）

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import std.sync.*

// 加载证书
var tlsConfig = TlsServerConfig(
    X509Certificate.decodeFromPem(certPem),
    PrivateKey.decodeFromPem(keyPem)
)
tlsConfig.supportedAlpnProtocols = ["http/1.1"]

// 构建并启动 HTTPS 服务器
let svr = ServerBuilder()
    .addr("127.0.0.1")
    .port(0)
    .tlsConfig(tlsConfig)
    .build()

svr.distributor.register("/api/path", FuncHandler({ ctx =>
    ctx.responseBuilder
        .status(200)
        .header("Content-Type", "application/json")
        .body(responseJson)
}))

let ready = SyncCounter(1)
svr.afterBind({ => ready.dec() })
spawn { svr.serve() }
ready.waitUntilZero()
```

### 5.3 HTTPS 客户端（stdx.net.http + stdx.net.tls）

```cangjie
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.{StringReader}

// 配置 TLS（使用自定义 CA 验证服务端证书）
var tlsConfig = TlsClientConfig()
tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))

let client = ClientBuilder().tlsConfig(tlsConfig).build()

// GET
let resp = client.get("https://127.0.0.1:8443/api/notes")
let body = StringReader(resp.body).readToEnd()

// POST
let resp = client.post("https://127.0.0.1:8443/api/notes", jsonBody)
let body = StringReader(resp.body).readToEnd()

// PUT（使用 HttpRequestBuilder）
let req = HttpRequestBuilder()
    .put()
    .url("https://127.0.0.1:8443/api/note")
    .header("Content-Type", "application/json")
    .body(jsonBody)
    .build()
let resp = client.send(req)

// DELETE
let resp = client.delete("https://127.0.0.1:8443/api/note?id=1")

client.close()
```

### 5.4 需导入的包

```cangjie
import stdx.net.http.*           // HTTP 服务端和客户端
import stdx.net.tls.*            // TLS 配置（TlsServerConfig/TlsClientConfig）
import stdx.crypto.x509.{X509Certificate, PrivateKey}  // 证书和私钥
import stdx.encoding.json.*      // JSON 类型和解析
import std.collection.*          // ArrayList
import std.convert.*             // Int64.parse 等类型转换
import std.io.*                  // StringReader, readToEnd, File
import std.fs.*                  // File 操作
import std.sync.*                // SyncCounter 同步原语
```

### 5.5 注意事项

| 要点 | 说明 |
|------|------|
| `rawQuery` 类型 | `req.url.rawQuery` 返回 `?String`，需用 `?? ""` 处理 |
| 响应体读取 | HTTP/1.1 的 body 必须完全读取后连接才能被复用 |
| 端口随机分配 | 使用 `port(0)` 让系统分配端口，通过 `server.port` 获取 |
| 非阻塞启动 | `serve()` 是阻塞调用，需用 `spawn` 在后台线程运行 |
| 路由注册 | 默认分发器非线程安全，须在 `serve()` 之前注册所有路由 |
| ArrayList 删除 | `ArrayList.remove()` 接受 `Range<Int64>` 参数，删除单个元素用 `remove(i..(i+1))` |
| TLS 证书 | 服务端证书需包含 `subjectAltName=IP:127.0.0.1` |
| HTTPS 客户端 | 使用 `CustomCA` 模式验证自签名证书，不要在生产中使用 `TrustAll` |
| ALPN 协议 | 服务端设置 `supportedAlpnProtocols = ["http/1.1"]` 启用 HTTPS |
| OpenSSL 依赖 | 运行时需要系统安装 OpenSSL 3 |
| 圈复杂度 | 路由处理器应拆分为独立方法，避免深层嵌套 |

---

## 6. 单元测试要求

测试文件已给定为 `notebook_test.cj`，**不要做修改**，直接引入项目并使用仓颉单元测试框架测试。

测试运行时需要 `certs/` 目录下的证书文件（HTTPS 测试使用）。

测试覆盖四个层次：

| 测试类 | 测试数量 | 测试内容 |
|--------|---------|---------|
| `TestNoteModel` | 9 | Note 模型的 JSON 序列化/反序列化、往返一致性、特殊字符、中文、字段完整性 |
| `TestNoteService` | 15 | NoteService 的 CRUD 操作、按标签过滤、统计、批量删除、更新保持 ID 不变 |
| `TestNoteAPI` | 13 | HTTP API 端点集成测试，包含完整 CRUD 工作流、无效 JSON 请求处理 |
| `TestNoteHTTPSAPI` | 7 | HTTPS API 端点集成测试，验证 TLS 加密通信下的 CRUD 完整工作流 |

---

## 7. 入口文件（main.cj）

```cangjie
package notebook

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.io.*
import std.fs.*

main(): Int64 {
    // Load TLS certificates
    let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
    let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
    let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

    // Start HTTPS server
    let service = NoteService()
    let server = NoteServer(service)
    server.startTls("127.0.0.1", 0, certPem, keyPem)
    let port = server.getPort()
    let baseUrl = "https://127.0.0.1:${port}"
    println("HTTPS server started on port ${port}")

    // Create HTTPS client (trust our CA)
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))
    let client = ClientBuilder().tlsConfig(tlsConfig).build()

    // Create a note
    let createBody = ##"{"title":"Hello Cangjie","content":"Welcome to Cangjie HTTPS web programming!","tags":["cangjie","tutorial"]}"##
    let createResp = client.post("${baseUrl}/api/notes", createBody)
    let createResult = StringReader(createResp.body).readToEnd()
    println("Created: ${createResult}")

    // Create another note
    let createBody2 = ##"{"title":"Learning Notes","content":"Studying stdx.net.http and stdx.encoding.json over TLS","tags":["cangjie","study"]}"##
    let createResp2 = client.post("${baseUrl}/api/notes", createBody2)
    let createResult2 = StringReader(createResp2.body).readToEnd()
    println("Created: ${createResult2}")

    // List all notes
    let listResp = client.get("${baseUrl}/api/notes")
    let listResult = StringReader(listResp.body).readToEnd()
    println("All notes: ${listResult}")

    // Filter by tag
    let filterResp = client.get("${baseUrl}/api/notes?tag=study")
    let filterResult = StringReader(filterResp.body).readToEnd()
    println("Notes with 'study' tag: ${filterResult}")

    // Get statistics
    let statsResp = client.get("${baseUrl}/api/stats")
    let statsResult = StringReader(statsResp.body).readToEnd()
    println("Stats: ${statsResult}")

    client.close()
    server.stop()
    return 0
}
```

**期望输出**：

```
HTTPS server started on port <随机端口>
Created: {"id":1,"title":"Hello Cangjie","content":"Welcome to Cangjie HTTPS web programming!","tags":["cangjie","tutorial"]}
Created: {"id":2,"title":"Learning Notes","content":"Studying stdx.net.http and stdx.encoding.json over TLS","tags":["cangjie","study"]}
All notes: {"notes":[{"id":1,"title":"Hello Cangjie","content":"Welcome to Cangjie HTTPS web programming!","tags":["cangjie","tutorial"]},{"id":2,"title":"Learning Notes","content":"Studying stdx.net.http and stdx.encoding.json over TLS","tags":["cangjie","study"]}],"total":2}
Notes with 'study' tag: {"notes":[{"id":2,"title":"Learning Notes","content":"Studying stdx.net.http and stdx.encoding.json over TLS","tags":["cangjie","study"]}],"total":1}
Stats: {"total_notes":2,"tag_counts":{"cangjie":2,"tutorial":1,"study":1}}
```

---

## 8. 验收标准

1. `cjpm build` 编译成功，无错误，无警告
2. `cjpm run` 正确输出 HTTPS 服务端/客户端交互结果
3. `cjpm test` 全部测试通过（44 个测试用例，0 失败）
4. 代码结构清晰，文件划分合理，路由处理器圈复杂度低
