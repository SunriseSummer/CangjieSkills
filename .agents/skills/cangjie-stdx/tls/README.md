# 仓颉语言 TLS 安全通信（stdx.net.tls）

## 1. 概述

`stdx.net.tls` 包提供 TLS（Transport Layer Security）安全加密网络通信能力：

- 支持 **TLS 1.2** 和 **TLS 1.3** 协议
- 基于 `TlsSocket` 在客户端和服务端之间建立加密传输通道
- 支持证书验证、会话恢复、ALPN 协议协商、双向认证等
- 依赖 **OpenSSL 3** 动态库
- 通常与 HTTP 模块（`stdx.net.http`）集成使用（详见 `cangjie-stdx` Skill 下的 http_client/http_server 文档），也可独立用于 TCP 层 TLS 加密

---

## 2. OpenSSL 3 安装

### 2.1 Linux

```bash
# Ubuntu 22.04+ / Debian
sudo apt install libssl-dev

# CentOS / RHEL
sudo dnf install openssl-devel
```

确保系统存在 `libssl.so`、`libssl.so.3`、`libcrypto.so`、`libcrypto.so.3`。

自定义安装路径时：

```bash
export LD_LIBRARY_PATH=/path/to/openssl/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/path/to/openssl/lib:$LIBRARY_PATH
```

### 2.2 macOS

```bash
brew install openssl@3
```

确保存在 `libssl.dylib`、`libssl.3.dylib`、`libcrypto.dylib`、`libcrypto.3.dylib`。

### 2.3 Windows

安装 OpenSSL 3.x.x（x64），确保存在 `libssl-3-x64.dll`、`libcrypto-3-x64.dll`，并将目录添加到 `PATH`。

### 2.4 验证

```bash
openssl version
# 应输出 OpenSSL 3.x.x
```

---

## 3. cjpm.toml 配置

### 3.1 动态库配置（推荐开发阶段）

```toml
[package]
  name = "my-tls-app"
  version = "1.0.0"
  output-type = "executable"

[dependencies]

[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["/path/to/stdx/dynamic/stdx"]
```

其他平台：
- Linux aarch64：`target.aarch64-unknown-linux-gnu`
- macOS aarch64：`target.aarch64-apple-darwin`
- macOS x86_64：`target.x86_64-apple-darwin`
- Windows x86_64：`target.x86_64-w64-mingw32`

### 3.2 静态库配置（推荐生产部署）

使用 crypto 和 net 包的静态库时，需要额外 `compile-option`：

| 平台 | compile-option | 原因 |
|------|----------------|------|
| Linux | `-ldl` | OpenSSL 静态库依赖 `libdl` |
| Windows | `-lcrypt32` | OpenSSL 依赖 Windows 证书存储 API |
| macOS | 无需额外配置 | — |

```toml
[package]
  name = "my-tls-app"
  version = "1.0.0"
  output-type = "executable"
  compile-option = "-ldl"

[dependencies]

[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["/path/to/stdx/static/stdx"]
```

---

## 4. 核心类型

### 4.1 类型总览

| 类型 | 分类 | 说明 |
|------|------|------|
| `TlsSocket` | 类 | 加密传输通道，用于 TLS 握手和加密数据收发 |
| `TlsSessionContext` | 类 | 服务端会话上下文，用于 session 恢复 |
| `TlsClientConfig` | 结构体 | 客户端 TLS 配置 |
| `TlsServerConfig` | 结构体 | 服务端 TLS 配置 |
| `TlsSession` | 结构体 | 客户端会话 ID，用于会话复用 |
| `CipherSuite` | 结构体 | TLS 密码套件（`name: String`，静态属性 `allSupported`） |
| `CertificateVerifyMode` | 枚举 | 证书验证模式 |
| `TlsVersion` | 枚举 | TLS 协议版本（`V1_2`、`V1_3`） |
| `TlsClientIdentificationMode` | 枚举 | 服务端对客户端证书的认证模式 |
| `SignatureAlgorithm` | 枚举 | 签名算法 |
| `TlsException` | 异常 | TLS 处理异常 |

### 4.2 TlsSocket

| 方法 / 属性 | 签名 | 说明 |
|-------------|------|------|
| `client` (静态) | `TlsSocket.client(StreamingSocket, clientConfig: TlsClientConfig, session!: ?TlsSession): TlsSocket` | 创建客户端 TLS 套接字 |
| `server` (静态) | `TlsSocket.server(StreamingSocket, serverConfig: TlsServerConfig, sessionContext!: ?TlsSessionContext): TlsSocket` | 创建服务端 TLS 套接字 |
| `handshake` | `handshake(timeout!: ?Duration): Unit` | 执行 TLS 握手（仅调用一次） |
| `read` | `read(Array<Byte>): Int64` | 读取解密数据 |
| `write` | `write(Array<Byte>): Unit` | 发送加密数据 |
| `close` | `close(): Unit` | 关闭 TLS 连接 |
| `isClosed` | `isClosed(): Bool` | 检查连接状态 |
| `session` | `session: ?TlsSession` | 获取会话 ID（用于会话恢复，仅客户端） |
| `tlsVersion` | `tlsVersion: TlsVersion` | 协商的 TLS 版本 |
| `cipherSuite` | `cipherSuite: CipherSuite` | 协商的密码套件 |
| `alpnProtocolName` | `alpnProtocolName: ?String` | 协商的 ALPN 协议 |
| `peerCertificate` | `peerCertificate: ?Array<X509Certificate>` | 对端证书 |
| `clientCertificate` | `clientCertificate: ?Array<X509Certificate>` | 客户端证书 |
| `serverCertificate` | `serverCertificate: Array<X509Certificate>` | 服务端证书 |
| `readTimeout` | `readTimeout: ?Duration` | 读超时 |
| `writeTimeout` | `writeTimeout: ?Duration` | 写超时 |

### 4.3 TlsClientConfig

| 属性 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `verifyMode` | `CertificateVerifyMode` | `Default` | 证书验证模式 |
| `domain` | `?String` | `None` | 服务端主机名（SNI） |
| `alpnProtocolsList` | `Array<String>` | `[]` | ALPN 协议列表（如 `["h2"]`） |
| `clientCertificate` | `?(Array<X509Certificate>, PrivateKey)` | `None` | 客户端证书链和私钥（双向认证时使用） |
| `cipherSuitesV1_2` | `?Array<String>` | `None` | TLS 1.2 密码套件名称列表 |
| `cipherSuitesV1_3` | `?Array<String>` | `None` | TLS 1.3 密码套件名称列表 |
| `minVersion` | `TlsVersion` | `V1_2` | 最低 TLS 版本 |
| `maxVersion` | `TlsVersion` | `V1_3` | 最高 TLS 版本 |
| `securityLevel` | `Int32` | `2` | 安全级别（0-5） |
| `signatureAlgorithms` | `?Array<SignatureAlgorithm>` | `None` | 签名算法偏好 |
| `keylogCallback` | `?(TlsSocket, String) -> Unit` | `None` | TLS 密钥日志回调（调试用） |

### 4.4 TlsServerConfig

| 属性 / 构造 | 类型 | 说明 |
|-------------|------|------|
| 构造函数 | `TlsServerConfig(certChain: Array<X509Certificate>, certKey: PrivateKey)` | 必须提供服务端证书链和私钥 |
| `clientIdentityRequired` | `TlsClientIdentificationMode` | 客户端证书认证模式（默认 `Disabled`） |
| `verifyMode` | `CertificateVerifyMode` | 证书验证模式 |
| `supportedAlpnProtocols` | `Array<String>` | 支持的 ALPN 协议 |
| `cipherSuitesV1_2` / `V1_3` | `Array<String>` | 密码套件名称列表 |
| `minVersion` / `maxVersion` | `TlsVersion` | TLS 版本范围 |
| `securityLevel` | `Int32` | 安全级别（0-5） |
| `dhParameters` | `?DHParameters` | DH 密钥交换参数 |
| `keylogCallback` | `?(TlsSocket, String) -> Unit` | TLS 密钥日志回调 |

### 4.5 证书验证模式（CertificateVerifyMode）

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| `Default` | 使用系统 CA 验证证书 | 生产环境（默认） |
| `CustomCA(Array<X509Certificate>)` | 使用自定义 CA 列表验证 | 自签名证书或私有 CA |
| `TrustAll` | 信任所有证书，不验证 | **仅限开发测试** |

### 4.6 客户端认证模式（TlsClientIdentificationMode）

| 模式 | 说明 |
|------|------|
| `Disabled` | 不要求客户端证书（单向认证，默认） |
| `Optional` | 客户端可选提供证书 |
| `Required` | 客户端必须提供证书（双向认证） |

---

## 5. 使用示例

### 5.1 TLS 客户端（TrustAll 模式 — 快速测试）

> **⚠️ 警告**：`TrustAll` 模式跳过证书验证，**仅限开发测试环境使用**。

```cangjie
package test_proj
import std.net.TcpSocket
import stdx.net.tls.*

main() {
    var config = TlsClientConfig()
    config.verifyMode = TrustAll
    config.alpnProtocolsList = ["h2"]

    // 需要有实际的 TLS 服务端才能连接
    // try (socket = TcpSocket("127.0.0.1", 8443)) {
    //     socket.connect()
    //     try (tls = TlsSocket.client(socket, clientConfig: config)) {
    //         tls.handshake()
    //         tls.write("Hello, TLS!\n".toArray())
    //         let buf = Array<Byte>(1024, repeat: 0)
    //         let n = tls.read(buf)
    //         println(String.fromUtf8(buf[..n]))
    //     }
    // }
    println("TLS client config created: verifyMode=TrustAll, ALPN=h2")
}
```

### 5.2 TLS 服务端

```cangjie
import std.io.*
import std.fs.*
import std.net.{TcpServerSocket, TcpSocket}
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import stdx.net.tls.*

main() {
    let pem = String.fromUtf8(readToEnd(File("./server.crt", Read)))
    let keyText = String.fromUtf8(readToEnd(File("./server.key", Read)))
    let certificate = X509Certificate.decodeFromPem(pem)
    let privateKey = PrivateKey.decodeFromPem(keyText)

    let config = TlsServerConfig(certificate, privateKey)
    let sessions = TlsSessionContext.fromName("my-server")

    try (server = TcpServerSocket(bindAt: 8443)) {
        server.bind()
        println("TLS server listening on port 8443")

        while (true) {
            let clientSocket = server.accept()
            spawn { =>
                try (tls = TlsSocket.server(clientSocket, serverConfig: config, sessionContext: sessions)) {
                    tls.handshake()
                    let buf = Array<Byte>(1024, repeat: 0)
                    let n = tls.read(buf)
                    println("Received: ${String.fromUtf8(buf[..n])}")
                    tls.write("Hello from TLS server!\n".toArray())
                } catch (e: Exception) {
                    println("TLS error: ${e}")
                } finally {
                    clientSocket.close()
                }
            }
        }
    }
}
```

### 5.3 会话恢复（减少握手开销）

```cangjie
package test_proj
import std.net.TcpSocket
import stdx.net.tls.*

main() {
    var config = TlsClientConfig()
    config.verifyMode = TrustAll

    var lastSession: ?TlsSession = None

    // 会话恢复示例（需要实际的 TLS 服务端）
    // for (i in 0..3) {
    //     try (socket = TcpSocket("127.0.0.1", 8443)) {
    //         socket.connect()
    //         try (tls = TlsSocket.client(socket, clientConfig: config, session: lastSession)) {
    //             tls.handshake()
    //             lastSession = tls.session  // 保存会话用于下次复用
    //             tls.write("Request ${i}\n".toArray())
    //         }
    //     }
    // }
    println("TLS session resumption config ready")
}
```

### 5.4 与 HTTP 模块集成（HTTPS）

TLS 通常通过 HTTP 模块的 `tlsConfig()` 方法集成使用，而非直接操作 `TlsSocket`：

```cangjie
package test_proj
import stdx.net.http.*
import stdx.net.tls.*

main() {
    var tlsConfig = TlsClientConfig()
    tlsConfig.verifyMode = TrustAll

    let client = ClientBuilder()
        .tlsConfig(tlsConfig)
        .build()

    // let resp = client.get("https://127.0.0.1:8443/api")
    // let body = StringReader(resp.body).readToEnd()
    // println(body)

    println("HTTPS client via TLS config created")
    client.close()
}
```

---

## 6. 构建与运行

```bash
# 1. 初始化项目
cjpm init --name my-tls-app

# 2. 编辑 cjpm.toml，添加 bin-dependencies 配置

# 3. 构建
cjpm build

# 4. 运行（自动配置动态库路径）
cjpm run
```

独立部署运行（动态库）需设置：

| 操作系统 | 环境变量 | 示例 |
|----------|----------|------|
| Linux | `LD_LIBRARY_PATH` | `export LD_LIBRARY_PATH=/path/to/stdx/dynamic/stdx:$LD_LIBRARY_PATH` |
| macOS | `DYLD_LIBRARY_PATH` | `export DYLD_LIBRARY_PATH=/path/to/stdx/dynamic/stdx:$DYLD_LIBRARY_PATH` |
| Windows | `PATH` | 将 stdx 动态库目录和 OpenSSL DLL 目录添加到 `PATH` |

---

## 7. 常见问题

| 问题 | 原因 | 解决 |
|------|------|------|
| `TlsException: Can not load openssl library` | 未安装 OpenSSL 3 或版本低 | 安装 OpenSSL 3，确认 `openssl version` 为 3.x.x |
| 编译找不到 `stdx.net.tls` 包 | `cjpm.toml` 路径不正确 | 确认路径指向 `dynamic/stdx` 或 `static/stdx` 子目录 |
| 静态库链接报 undefined reference | 缺少平台链接选项 | Linux 添加 `-ldl`，Windows 添加 `-lcrypt32` |
| 运行时找不到动态库 | 未设置动态库搜索路径 | 设置 `LD_LIBRARY_PATH` 或改用静态库 |

---

## 8. 快速参考

| 需求 | 做法 |
|------|------|
| 跳过证书验证（测试） | `config.verifyMode = TrustAll` |
| 使用系统 CA 验证 | `config.verifyMode = Default`（默认） |
| 使用自定义 CA | `config.verifyMode = CustomCA(certs)` |
| 启用 HTTP/2 ALPN | 客户端 `config.alpnProtocolsList = ["h2"]`；服务端 `config.supportedAlpnProtocols = ["h2"]` |
| 会话恢复 | 保存 `tls.session`，下次连接时传入 `session` 参数 |
| 双向认证 | 服务端 `config.clientIdentityRequired = Required`，客户端设置 `config.clientCertificate` |
| 限制 TLS 版本 | `config.minVersion = V1_3`、`config.maxVersion = V1_3` |
| 密钥日志（调试） | `config.keylogCallback = { _: TlsSocket, keylog: String => println(keylog) }` |
| 动态库配置 | `path-option = ["/path/to/stdx/dynamic/stdx"]` |
| 静态库配置 | `path-option = ["/path/to/stdx/static/stdx"]` |
| 构建运行 | `cjpm build && cjpm run` |
