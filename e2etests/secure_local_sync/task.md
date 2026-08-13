# 任务：secure_local_sync

用仓颉 `1.0.5 (cjnative)` 与 stdx `1.0.5.1` 实现一个**本机加密同步服务**的可执行 cjpm 工程。
服务把 JSON 记录经 TLS 推送到同一台机器上的 HTTPS 服务端，落入线程安全存储，并用 SHA-256 校验完整性。

工程必须通过：`cjpm clean` → `cjpm build` → `cjpm test` → `cjpm run`，**全过程 0 warning、0 error**。

## 1. 交付物

```
oracle/
├── cjpm.toml                        # package name 必须是 secure_local_sync，output-type = executable
└── src/
    ├── fixtures.cj                  # 已提供：内嵌的冻结 PEM 常量，禁止修改
    ├── secure_local_sync_test.cj    # 已提供：冻结测试，禁止修改
    └── <你的实现>.cj                # 自由拆分文件
```

- `src/fixtures.cj` 与 `src/secure_local_sync_test.cj` 是**冻结件**。它们的 SHA-256 记录在 `frozen-hashes.json`；提交前必须逐字节一致。
- 所有源码同属 `package secure_local_sync`。
- 用 `python <skill>/scripts/setup_stdx.py --project oracle` 安装并配置 stdx `1.0.5.1`；不要手写 `path-option`。

## 2. 硬性约束

| 约束 | 说明 |
|---|---|
| 仅 127.0.0.1 | 监听地址与请求 host 只能是 `127.0.0.1`。禁止任何公网地址、外部主机名、DNS 解析。 |
| 端口 0 | 服务端一律 `port(0)` 由系统分配。禁止硬编码端口，禁止端口扫描或重试固定端口。 |
| 不用系统根证书 | TLS 信任链只能来自 `fixtures.cj` 里的 PEM。禁止 `X509Certificate.systemRootCerts()`。 |
| 固定时间 | 证书校验、记录时间戳只能用冻结常量。禁止 `DateTime.now()`、`DateTime.nowUTC()` 或任何挂钟读取。 |
| 无随机验收 | 断言不得依赖随机数、迭代顺序、压缩字节序、端口号具体值或耗时。 |
| 资源释放 | 服务端与客户端都要可停止；`close()` 后端口必须被释放，且允许再次 `port(0)` 启动。 |
| 每轮超时 | 并发与启停稳定性测试的每一轮都要有显式超时上界。 |
| 总时长 | `cjpm test` 与 `cjpm run` 各自必须在 120 秒内结束。 |

## 3. 必须自然用到的能力

- `stdx.net.http`：本机 `Server`（`port(0)`、`afterBind`、`onShutdown`、`closeGracefully`）与 `Client`。
- `stdx.net.tls` + `stdx.crypto.x509`：`TlsServerConfig` / `TlsClientConfig`，显式 `CertificateVerifyMode.CustomCA`，固定校验时间与固定域名。
- `stdx.encoding.json`：请求与响应都是 JSON，读取侧必须先判 `JsonKind` 再窄化，缺字段与类型不符各自可区分。
- `stdx.compress.zlib` + `stdx.encoding.base64`：负载压缩后再传输。
- `stdx.crypto.digest`：SHA-256 完整性校验。
- `stdx.encoding.url` + `std.regex`：路径与查询参数校验。
- `std.time.DateTime`：固定时间常量。
- `std.sync`：`Mutex`、`AtomicInt64`、`SyncCounter` 至少用其中两种，且存储必须线程安全。
- 语言面：`interface`、泛型、`enum`、`struct`、`Option`、自定义异常、`Resource`、`spawn`。

## 4. 冻结 API 契约

冻结测试只依赖下列签名。名称、参数顺序、返回类型必须完全一致。

### 4.1 完整性与压缩

```cangjie
public func sha256Hex(data: Array<Byte>): String          // 小写十六进制，64 字符
public func sha256HexOfText(text: String): String         // 按 UTF-8 取字节后求摘要
public func deflateBytes(source: Array<Byte>): Array<Byte>
public func inflateBytes(source: Array<Byte>): Array<Byte>
public func packPayload(text: String): String             // UTF-8 → deflate → base64
public func unpackPayload(encoded: String): String         // base64 → inflate → UTF-8
```

`unpackPayload` 遇到非法 base64 或非法压缩流时抛 `SyncFault`。

### 4.2 领域模型

```cangjie
public class SyncFault <: Exception {                     // 协议 / 校验类错误
    public init(message: String)
}
public class TrustFault <: Exception {                     // 信任链类错误
    public init(message: String)
}

public enum SyncOp {                                       // 客户端意图
    | Put(String, String)                                  // key, payload
    | Get(String)
    | Drop(String)
    | Snapshot
}

public func opPath(op: SyncOp): String                     // SyncOp → 请求路径（含查询串）
public func opMethod(op: SyncOp): String                   // "PUT" / "GET" / "DELETE"

public struct SyncRecord {
    public let key: String
    public let payload: String
    public let digest: String                              // sha256HexOfText(payload)
    public let revision: Int64                             // 同 key 第 n 次写入，从 1 开始
    public let stampedAt: String                           // 固定时间戳文本
    public init(key: String, payload: String, digest: String, revision: Int64, stampedAt: String)
}

public interface Codec<T> {                                // 泛型编解码接口
    func encode(value: T): String
    func decode(text: String): T
}
public class RecordCodec <: Codec<SyncRecord> { public init() }
```

`RecordCodec.encode` 输出**键序固定**的规范 JSON（见 4.5），`decode` 严格校验后回填 `SyncRecord`；不合法输入抛 `SyncFault`。

### 4.3 校验与固定时间

```cangjie
public let FROZEN_STAMP: String = "2030-06-15T12:00:00Z"
public func frozenStamp(): DateTime                        // UTC 2030-06-15 12:00:00
public func isValidKey(key: String): Bool                  // 正则 ^[a-z][a-z0-9_-]{2,31}$
public func isValidSyncPath(path: String): Bool            // 正则 ^/sync/(entry|snapshot)$
public func requireText(root: JsonObject, field: String): String
public func requireInt(root: JsonObject, field: String): Int64
public func requireBool(root: JsonObject, field: String): Bool
public func parseLoopbackUrl(raw: String): (String, Option<String>)   // → (path, key 查询参数)
```

- `requireText` / `requireInt` / `requireBool`：字段缺失抛 `SyncFault("missing field: <name>")`，
  `JsonKind` 不符抛 `SyncFault("field type mismatch: <name>")`。
- `parseLoopbackUrl`：host 非 `127.0.0.1`、scheme 非 `https`、或路径未通过 `isValidSyncPath` 时抛 `SyncFault`。

### 4.4 信任链

```cangjie
public enum TrustVerdict {                                 // 可区分的失败原因
    | Trusted
    | OutsideValidity
    | NameMismatch
    | UntrustedIssuer
}
public func verdictName(verdict: TrustVerdict): String      // "trusted" / "outside-validity" / "name-mismatch" / "untrusted-issuer"
public func verifyLeaf(leafPem: String, rootPem: String, dnsName: String): TrustVerdict
public func trustedCaChain(): Array<X509Certificate>        // 来自 SYNC_CA_PEM
public func serverLeafChain(): Array<X509Certificate>       // 来自 SYNC_SERVER_PEM
```

`verifyLeaf` 用 `frozenStamp()` 作为校验时间，`rootPem` 作为唯一根，按
「有效期 → 名称 → 签发者」顺序判定，PEM 无法解析时抛 `TrustFault`。

### 4.5 存储

```cangjie
public interface RecordStore {
    func put(key: String, payload: String): SyncRecord
    func fetch(key: String): Option<SyncRecord>
    func drop(key: String): Bool
    func count(): Int64
    func writes(): Int64                                   // 累计成功写入次数
}
public class MutexRecordStore <: RecordStore & Resource {
    public init()
    public func isClosed(): Bool
    public func close(): Unit
}
```

`put` 对同一 key 覆盖并把 `revision` 加一，`count()` 不变。存储必须能承受多线程并发 `put`。

### 4.6 服务端与客户端

```cangjie
public class SyncServer <: Resource {
    public init(store: RecordStore)
    public prop port: UInt16                               // 绑定后的实际端口，必然 > 0
    public func start(): Unit                              // 阻塞直到 afterBind 完成
    public func handled(): Int64                            // 已处理请求数
    public func isClosed(): Bool
    public func close(): Unit                              // 优雅停止并等待 onShutdown
}
public class SyncClient <: Resource {
    public init(port: UInt16, domain: String, caPem: String)
    public func call(op: SyncOp): (UInt16, String)          // (HTTP 状态码, 响应体文本)
    public func callRaw(method: String, path: String, body: String): (UInt16, String)
    public func isClosed(): Bool
    public func close(): Unit
}
```

`SyncClient` 只连 `https://127.0.0.1:<port>`，`domain` 作为 SNI 与校验域名，`caPem` 作为唯一信任根。

### 4.7 线路协议

请求与响应都是 UTF-8 JSON，响应键序固定为下表顺序。

| 操作 | 方法与路径 | 请求体 | 成功响应 |
|---|---|---|---|
| 写入 | `PUT /sync/entry?key=<key>` | `{"payload":"<packPayload>","digest":"<sha256HexOfText(明文)>"}` | `200` `{"key":..,"digest":..,"revision":..,"stampedAt":..}` |
| 读取 | `GET /sync/entry?key=<key>` | 空 | `200` `{"key":..,"payload":"<packPayload>","digest":..,"revision":..,"stampedAt":..}` |
| 删除 | `DELETE /sync/entry?key=<key>` | 空 | `200` `{"key":..,"dropped":true|false}` |
| 快照 | `GET /sync/snapshot` | 空 | `200` `{"count":N,"writes":M,"handled":H,"stampedAt":..}` |

错误响应形如 `{"error":"<code>"}`，可再带一个上下文字段：

| 情形 | 状态码 | 错误码 |
|---|---|---|
| key 不满足 `isValidKey`，或缺 `key` 查询参数 | `400` | `bad-key` |
| 请求体不是合法 JSON 对象 | `400` | `bad-json` |
| 必需字段缺失或类型不符 | `400` | `bad-field`（附 `"field"`） |
| 读取的 key 不存在 | `404` | `absent` |
| 路径未注册 | `404` | `no-route` |
| `digest` 与解压后的明文摘要不一致 | `409` | `digest-mismatch` |

### 4.8 入口输出

`main(): Unit` 必须**完全确定**地输出下面 14 行，然后退出码 0。不得打印端口号、耗时或任何随机内容。

```
secure_local_sync 1.0.5/stdx-1.0.5.1
frozen-stamp=2030-06-15T12:00:00Z
trust:sync-leaf-under-sync-ca=trusted
trust:sync-leaf-under-rogue-ca=untrusted-issuer
trust:stale-leaf-under-sync-ca=outside-validity
trust:sync-leaf-wrong-name=name-mismatch
put:status=200 revision=1 digest=0e8142b193e5bc6c51d26be1853478cf5fa7093a3a9c9310ffb701530e252121
get:status=200 payload-match=true digest-match=true
get-absent:status=404 error=absent
bad-key:status=400 error=bad-key
digest-mismatch:status=409 error=digest-mismatch
no-route:status=404 error=no-route
snapshot:count=1 writes=1
concurrency:clients=6 ok=6 restarts=4 ports-fresh=true
released=true
```

其中 `put`/`get` 用 key `alpha-1` 与明文 `frozen-sync-payload`。

## 4.9 冻结的 PEM 常量

`src/fixtures.cj` 提供，不要重新生成：

| 常量 | 内容 | 关键字段 |
|---|---|---|
| `SYNC_CA_PEM` | 受信 CA | `CN=SecureLocalSync Trusted CA`，2020-01-01 ~ 2040-01-01 |
| `ROGUE_CA_PEM` | 无关 CA | `CN=SecureLocalSync Rogue CA`，仅用于负例 |
| `SYNC_SERVER_PEM` | 服务端叶证书 | `CN=127.0.0.1`，SAN `DNS:sync.local.test` + `IP:127.0.0.1`，2020 ~ 2040 |
| `SYNC_SERVER_KEY_PEM` | 叶证书私钥 | PKCS#1 RSA 2048 |
| `STALE_SERVER_PEM` | 过期叶证书 | 同 SAN，有效期 2020-01-01 ~ 2021-01-01 |

## 5. 验收

最终运行 `python accept.py --project oracle --skill-root <skill-root>`；该跨平台脚本校验冻结哈希、配置 stdx，并执行下列门禁：

1. `cjpm clean && cjpm build` 成功，输出无 `warning`。
2. `cjpm test` 全部通过（冻结测试共 52 个用例），120 秒内结束。
3. `cjpm run` 逐字节匹配 4.8 的 14 行输出，退出码 0。
4. `src/fixtures.cj`、`src/secure_local_sync_test.cj` 的 SHA-256 与 `frozen-hashes.json` 一致。
5. 全仓库搜索不到 `DateTime.now`、`systemRootCerts`、非 `127.0.0.1` 的地址常量。
