# 二进制帧归档编解码器

## 目标

在仓颉 `1.0.5 (cjnative)` 中实现包 `binary_frame_archive`：把多个命名二进制条目编码为一个确定性的帧，支持可选 Deflate 压缩、SHA-256 完整性校验、Hex 文本转换和文件读写。

实现必须直接使用 `std.binary`、`std.overflow`、`std.crypto.digest`、`std.io`、`stdx.crypto.digest`、`stdx.encoding.hex`、`stdx.compress.zlib`。禁止网络、随机数、当前时间和平台原生代码。

将随题提供的 `binary_frame_archive_test.cj` 原样复制到项目 `src/`；测试不可修改。stdx 版本固定为与 cjc 1.0.5 匹配的 `1.0.5.1`。

## 公开 API

```cangjie
public class ArchiveException <: Exception {
    public init(message: String)
}

public class ArchiveEntry {
    public let name: String
    public let data: Array<Byte>
    public init(name: String, data: Array<Byte>)
}

public class FrameArchive {
    public static func headerSize(): Int64
    public static func checkedStorageBudget(rawLength: Int64, storedLength: Int64): Int64
    public static func sha256Hex(data: Array<Byte>): String
    public static func frameToHex(frame: Array<Byte>): String
    public static func frameFromHex(text: String): Array<Byte>
    public static func encode(entries: Array<ArchiveEntry>, compress!: Bool = true): Array<Byte>
    public static func decode(frame: Array<Byte>): Array<ArchiveEntry>
    public static func writeFile(path: String, entries: Array<ArchiveEntry>, compress!: Bool = true): Unit
    public static func readFile(path: String): Array<ArchiveEntry>
}
```

## 二进制格式

所有偏移按字节计，固定头长 `48`：

| 偏移 | 长度 | 内容 |
|---:|---:|---|
| 0 | 4 | ASCII `CJAR` |
| 4 | 1 | 版本，固定 `1` |
| 5 | 1 | flags：`0` 未压缩，`1` 为 `DeflateFormat`；其他值非法 |
| 6 | 2 | 条目数，`UInt16` 大端 |
| 8 | 4 | 解压后负载长度，`UInt32` 大端 |
| 12 | 4 | 帧中存储负载长度，`UInt32` 小端 |
| 16 | 32 | 解压后负载的 SHA-256 |
| 48 | N | 存储负载 |

解压后负载按条目顺序连接，每条：

| 长度 | 内容 |
|---:|---|
| 2 | UTF-8 名称长度，`UInt16` 大端 |
| 4 | 数据长度，`UInt32` 大端 |
| nameLength | UTF-8 名称 |
| dataLength | 原始数据 |

空归档、空数据条目和 Unicode 名称均合法；空名称非法；重复名称合法且保持顺序。条目数和名称 UTF-8 长度必须分别不超过 `UInt16.max`，数据及两个负载长度必须不超过 `UInt32.max`。

`compress: true` 必须用 `CompressOutputStream(..., wrap: DeflateFormat)`，解码使用配对的 `DecompressInputStream`，持续读取至 EOF，并关闭流以完成尾部或释放资源。压缩结果在相同工具链/输入下必须字节确定。

## 契约与错误

- 所有长度字段通过 `std.binary` 大小端接口读写。
- `checkedStorageBudget(rawLength, storedLength)` 返回 `48 + rawLength + storedLength`；负数或任一步 `CheckedOp.checkedAdd` 溢出时抛 `ArchiveException`。
- SHA-256 通过 `std.crypto.digest.digest(SHA256(), bytes)` 计算，并用 `stdx.encoding.hex.toHexString` 输出小写 Hex。
- `frameFromHex` 接受 `fromHexString` 可解码的大小写 Hex；奇数长度或非法字符抛 `ArchiveException`。
- `decode` 严格验证魔数、版本、flags、外层长度、解压长度、SHA-256、条目边界、非空名称、条目计数和无尾随负载。任一失败抛 `ArchiveException`。
- zlib 和文件系统异常包装为 `ArchiveException`。
- `encode` 和 `decode` 不修改调用者传入的数组；`decode` 返回按编码顺序排列的新数组。
- `writeFile` 覆盖文件；`readFile` 读取并解码。

## 工程与入口

`cjpm.toml`：包名 `binary_frame_archive`，输出类型 `executable`，使用当前 Skill 的 `setup_stdx.py` 配置 stdx。`main()` 对两个固定条目执行压缩往返，输出：

```text
entries=2
first=hello.txt:13
sha256=cf63ffdb3df8a9c5ad251380f560a7162b68c6ef4933e767052369e574594540
roundtrip=true
```

其中摘要是字符串 `Hello Cangjie`（13 个 UTF-8 字节）的 SHA-256。

## 验收

```text
cjpm clean
cjpm build
cjpm test
cjpm run
```

四条命令均成功，至少 20 项测试全通过，编译器 warning 为 0，且不可修改测试文件。
