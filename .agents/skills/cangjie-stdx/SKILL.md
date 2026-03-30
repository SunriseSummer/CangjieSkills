---
name: cangjie-stdx
description: "提供仓颉语言扩展标准库stdx常用功能速查文档，包括stdx配置构建/json编解码/日志/编码/压缩/序列化/HTTP客户端/HTTP服务端/WebSocket/TLS安全通信等"
---

请按需查询当前目录下的工具文档：

[config](./config/README.md)：扩展标准库的下载、配置、构建指导

[json](./json/README.md)：JSON 编解码库（stdx.encoding.json / stdx.encoding.json.stream）的使用指导

[encoding](./encoding/README.md)：Base64 / Hex / URL 编解码工具（stdx.encoding.base64 / hex / url）的使用指导

[log](./log/README.md)：日志系统（stdx.log / stdx.logger）的使用指导

[compress](./compress/README.md)：Gzip / Deflate 压缩与解压缩（stdx.compress.zlib）的使用指导

[serialization](./serialization/README.md)：序列化框架（stdx.serialization.serialization）的使用指导

[http_client](./http_client/README.md)：HTTP/HTTPS 客户端编程（stdx.net.http），包括 ClientBuilder 配置、请求发送、响应处理等。进阶话题见：[HTTPS 配置](./http_client/HTTPS.md)、[Cookie 管理](./http_client/COOKIE.md)、[自定义 TCP 连接](./http_client/CONNECTOR.md)、[分块上传与 Trailer](./http_client/CHUNKED.md)

[http_server](./http_server/README.md)：HTTP/HTTPS 服务端编程（stdx.net.http），包括 ServerBuilder 配置、路由注册、请求处理、自定义分发器等。进阶话题见：[HTTPS 配置](./http_server/HTTPS.md)、[分块响应与 Trailer](./http_server/CHUNKED.md)、[HTTP/2 Server Push](./http_server/PUSH.md)

[websocket](./websocket/README.md)：WebSocket 编程（stdx.net.http），包括客户端/服务端升级、帧读写、分片处理、关闭流程等

[tls](./tls/README.md)：TLS 安全通信（stdx.net.tls），包括 TlsSocket 加密传输、证书验证与解析、会话恢复、ALPN 协商等；配置构建指导见 [tls/BUILD.md](./tls/BUILD.md)

[crypto](./crypto/README.md)：加密与证书（stdx.crypto），包括 SecureRandom 安全随机数、消息摘要(SHA256/SM3/HMAC)、RSA/ECDSA/SM2 非对称加密与签名、X509 数字证书处理等

