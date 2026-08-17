# 混合端序遥测日志

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `endian_journal`，实现确定性的遥测记录二进制编码。实现必须直接使用 `std.binary` 的具体数值扩展和 `std.io.ByteBuffer`，不可手写移位替代端序 API。

## 公开 API

```cangjie
public class JournalException <: Exception {
    public init(message: String)
}

public struct TelemetryRecord {
    public let sensorId: UInt32
    public let sequence: Int64
    public let reading: Float64
    public let flags: UInt16
    public init(sensorId: UInt32, sequence: Int64, reading: Float64, flags: UInt16)
}

public class JournalCodec {
    public static func headerSize(): Int64
    public static func recordSize(): Int64
    public static func encodedSize(count: Int64): Int64
    public static func encode(records: Array<TelemetryRecord>): Array<Byte>
    public static func decode(frame: Array<Byte>): Array<TelemetryRecord>
    public static func throughBuffer(bytes: Array<Byte>): Array<Byte>
}
```

帧头为两个 ASCII 字节 `TJ`、版本字节 `1`、两字节大端无符号记录数，共 5 字节。每条记录固定 22 字节：`sensorId` 为 UInt32 小端、`sequence` 为 Int64 大端、`reading` 为 Float64 小端、`flags` 为 UInt16 大端。顺序与输入一致。

`encodedSize` 返回 `5 + 22 * count`，负数、超过 UInt16 最大记录数或 Int64 运算溢出时抛 `JournalException`。`decode` 必须拒绝短帧、错误魔数/版本、声明长度不一致和尾随数据。`throughBuffer` 用 `ByteBuffer.write` 与 `bytes()` 完成无损复制，不能返回传入数组本身。

`main()` 编码并解码两条固定记录，输出：

```text
bytes=49
records=2
first=7:42:12.500000:3
roundtrip=true
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，编译 warning 为 0。
