<!-- cj-doc kind="index" level="3" id="api.stdx" parent="api" -->
# stdx 包索引

本页只列包及职责；进入包页后再选择类型、接口或顶层函数。

stdx 不随核心工具链默认链接。首次使用时，从 Skill 根目录运行 `python scripts/setup_stdx.py --project <project-root>`；脚本按 `cjc -v` 选择兼容发布件，安装到 `~/.cangjie/stdx/` 供多项目复用，并合并 `path-option`。离线时配合 `--offline` 或 `--archive`。失败时按脚本诊断检查版本、平台、缓存和 cjpm.toml。

| 包 | 功能 | 类型/顶层声明 |
|---|---|---:|
| [stdx.aspectCJ](aspectCJ/index.md) | 提供 AOP 注解，配合编译插件完成函数前后插桩或实现替换。 | 3 |
| [stdx.compress](compress/index.md) | 提供 TarGzip 便捷入口，将目录或流归档为 gzip 压缩的 tar，并支持解压与提取。 | 1 |
| [stdx.compress.tar](compress/tar/index.md) | 创建、提取和流式读写 tar 归档，并提供 V7、Ustar、PAX 与 GNU 条目模型。 | 12 |
| [stdx.compress.zlib](compress/zlib/index.md) | 压缩解压功能。 | 7 |
| [stdx.crypto.common](crypto/common/index.md) | 定义证书、密钥、安全随机数和 CryptoKit 等加密能力的公共抽象及编码载体。 | 13 |
| [stdx.crypto.crypto](crypto/crypto/index.md) | 提供安全随机数及 SM4 对称加解密。 | 5 |
| [stdx.crypto.digest](crypto/digest/index.md) | 提供常用的消息摘要算法，包括 MD5、SHA1、SHA224、SHA256、SHA384、SHA512、HMAC、SM3 等。 | 10 |
| [stdx.crypto.keys](crypto/keys/index.md) | 提供非对称加密和签名算法，包括 RSA 和 SM2 非对称加密算法以及 ECDSA 签名算法。 | 10 |
| [stdx.crypto.kit](crypto/kit/index.md) | 提供 CryptoKit 默认实现，包括安全随机数生成及 DER、PEM 解码能力。 | 1 |
| [stdx.crypto.x509](crypto/x509/index.md) | 解析、序列化和验证 X.509 证书，并创建自签名证书与证书链。 | 21 |
| [stdx.effect](effect/index.md) | 为实验性 Effect Handlers 提供效应基类与运行时异常。 | 3 |
| [stdx.encoding.base64](encoding/base64/index.md) | 在字节数组与 Base64 字符串之间编解码。 | 2 |
| [stdx.encoding.hex](encoding/hex/index.md) | 提供字符串的 Hex 编码及解码。 | 2 |
| [stdx.encoding.json](encoding/json/index.md) | 在 String、JsonValue 与 DataModel 之间转换 JSON 数据。 | 11 |
| [stdx.encoding.json.stream](encoding/json-stream/index.md) | 在仓颉对象与 JSON 数据流之间转换。 | 6 |
| [stdx.encoding.url](encoding/url/index.md) | 解析、编解码和合并 URL 或路径。 | 4 |
| [stdx.fuzz.fuzz](fuzz/index.md) | 提供模糊测试输入、覆盖率反馈和运行控制。 | 6 |
| [stdx.log](log/index.md) | 提供与具体日志实现解耦的统一日志 API。 | 10 |
| [stdx.logger](logger/index.md) | 提供文本格式和 `JSON` 格式日志打印功能。 | 3 |
| [stdx.net.http](net/http/index.md) | 提供 HTTP/1.1、HTTP/2 和 WebSocket 客户端与服务端实现。 | 40 |
| [stdx.net.tls](net/tls/index.md) | 创建 TLS 客户端/服务端，执行握手、加密收发和会话恢复。 | 13 |
| [stdx.net.tls.common](net/tls/common/index.md) | 定义 TLS 配置、连接、握手结果、会话、版本和证书验证模式等共享抽象。 | 10 |
| [stdx.serialization.serialization](serialization/index.md) | 通过 DataModel 序列化和反序列化数据。 | 12 |
| [stdx.string_intern](string-intern/index.md) | 提供可配置的字符串驻留池，复用等值 String 实例以降低重复字符串的内存占用。 | 1 |
| [stdx.unittest.data](unittest/data/index.md) | 为参数化测试读取 JSON、CSV、TSV 等输入数据。 | 6 |
