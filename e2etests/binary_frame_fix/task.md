# 修复二进制帧编解码器

当前目录已有仓颉 `1.1.3 (cjnative)` 可执行包 `binary_frame_fix`。现有实现能够编译，但长度端序、边界校验、校验和与数组所有权存在缺陷。请修复生产代码并保持公开 API。

## 公开 API

```cangjie
public class FrameException <: Exception {
    public init(message: String)
}

public class Frame {
    public let kind: UInt16
    public let payload: Array<UInt8>
    public init(kind: UInt16, payload: Array<UInt8>)
}

public class FrameCodec {
    public static func encode(frame: Frame): Array<UInt8>
    public static func decode(bytes: Array<UInt8>): Frame
}
```

## 线格式

| 偏移 | 内容 |
|---:|---|
| 0..1 | 魔数 `0x43 0x4A` |
| 2 | 版本 `0x01` |
| 3..4 | `kind`，UInt16 小端序 |
| 5..8 | payload 长度，UInt32 大端序 |
| 9.. | payload |
| 末字节 | 校验和 |

校验和是从版本字节（偏移 2）到 payload 最后一个字节的所有 UInt8 数值之和对 256 取模，不包含魔数和校验和自身。payload 最大 1 MiB。必须使用 `std.binary` 的端序扩展完成多字节字段转换。

`decode` 必须拒绝：短于最小帧、错误魔数、错误版本、声明长度超过 1 MiB、截断、尾随数据和校验和不匹配，并统一抛 `FrameException`。`Frame` 构造函数、`encode` 和 `decode` 都不得与调用方数组共享 payload 或返回数组的可变存储。

`main()` 应保持输出：

```text
wire=67,74,1,52,18,0,0,0,3,1,2,3,80
kind=4660
payload=1,2,3
```

根目录测试必须原样复制到 `src/`。依次运行 `cjpm clean/build/test/run`，修正所有错误和 warning；只格式化生产源码。
