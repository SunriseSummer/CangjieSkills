<!-- cj-doc kind="index" level="2" id="examples" parent="references" -->
# 应用示例

[← 总索引](../index.md)

按开发场景选择分类；分类页直接列出完整可运行示例，不按 std/stdx 分层。每个示例围绕一个教学目标给出核心决策、规范实现和预期结果。

| 场景分类 | 内容 |
|---|---|
| [项目构建与测试](project-build/index.md) | 建立可运行的 cjpm 工程，并用仓颉单元测试组织实现验证。 |
| [代码格式化与静态检查](code-quality/index.md) | 把 cjfmt 与 cjlint 组成可审计的质量门禁，并核对诊断、输入覆盖和报告产物。 |
| [命令行与子进程](cli-process/index.md) | 接收程序参数、返回退出状态，并启动子进程和处理其输出。 |
| [函数、闭包与运算符](functions/index.md) | 使用命名默认参数、嵌套函数、可逃逸闭包和自定义下标运算符。 |
| [值类型、枚举与模式匹配](data-model/index.md) | 用结构体值语义和带负载递归枚举表达数据，并通过穷举匹配处理分支。 |
| [接口、泛型与扩展](abstractions/index.md) | 以接口定义能力边界，用泛型约束保证调用契约，并通过扩展复用实现。 |
| [可选值、异常与资源管理](failure/index.md) | 用 Option 表达缺失，用异常表达失败，并确保正常与异常路径都释放资源。 |
| [宏与语法树处理](macros/index.md) | 开发独立宏包、生成声明，并用 std.ast 解析和遍历仓颉语法树。 |
| [C 互操作与 unsafe 边界](cffi/index.md) | 构建和链接本机动态库，管理跨语言数组，并把 foreign 调用限制在显式 unsafe 边界内。 |
| [反射与注解](reflection/index.md) | 按名称选择反射成员，读取自定义注解，并在确认可写后访问字段值。 |
| [集合查找、统计与排序](collections/index.md) | 用 HashMap 的 Option 返回值安全查找和累计数据，解构遍历键值，并按派生键或多字段比较器排序。 |
| [字符串、正则与文本解析](text/index.md) | 分割字符串、查找 Unicode 正则捕获组，并把带进制文本解析为整数。 |
| [文件与目录](files/index.md) | 以明确的字节边界读写文件，并用元数据递归遍历目录。 |
| [日期与时间](time/index.md) | 用 DateTime 处理日历时间与格式化输入，用 MonoTime 测量不受系统时钟校准影响的经过时间。 |
| [数值计算与转换](numeric/index.md) | 保持十进制精度、安全窄化整数，并使用标准圆周率常数完成角度与弧度换算。 |
| [可重复随机数](random/index.md) | 使用固定种子复现实验，并按半开区间约束采样结果而不绑定具体序列。 |
| [并发任务与同步](concurrency/index.md) | 取得并发任务结果，用同步块、条件变量、原子变量和并发映射保护共享状态，并设计可关闭的阻塞容器。 |
| [字节缓冲与端序](binary/index.md) | 选择字节字面量或显式数值转换，在缓冲中读写数据，并按明确端序恢复整数。 |
| [Base64 文本编码](encoding/index.md) | 在原始字节与适合文本传输的 Base64 表示之间建立明确的 UTF-8 边界。 |
| [数据摘要](digests/index.md) | 以通用摘要接口或具体 SHA-256 实现计算固定长度的数据指纹。 |
| [数据压缩](compression/index.md) | 选择与协议一致的 Deflate 包装格式，并在关闭输出流后再消费完整压缩结果。 |
| [JSON 与对象序列化](json/index.md) | 按数据形态选择 DOM、流式读写或 Serializable，并对字段类型和数组兼容路径显式处理。 |
| [HTTP、URL 与 WebSocket](network/index.md) | 解析 URL，构造 HTTP 请求，并管理本机 HTTP/WebSocket 往返的启动、关闭和资源回收。 |
| [结构化日志](logging/index.md) | 配置日志输出端和级别，为组件绑定固定属性，并为单次事件附加字段。 |
| [密码、TLS 与证书](security/index.md) | 选择正确的加密与签名组合，显式配置证书信任边界，并构造可重复的 X.509 验证条件。 |
