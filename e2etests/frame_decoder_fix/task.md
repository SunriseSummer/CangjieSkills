# 修复增量二进制帧解码器

当前目录提供一个可构建但实现存在缺陷的仓颉 `1.1.3` cjpm 项目 `frame_decoder_fix`。请修复并适当重构生产代码，使固定测试全部通过。不得修改给定测试和种子项目的公开 API。

## 帧格式

所有整数使用大端序：

```text
magic(2) = 0xCA 0xFE
version(1) = 1
flags(1)
payloadLength(4, UInt32)
sequence(8, Int64)
payload(payloadLength bytes)
checksum(4, UInt32)
```

checksum 是从 version 到 payload 最后一个字节（不含 magic、不含 checksum）每个 UInt8 值之和，按 UInt32 回绕。

## 公开 API

```cangjie
public class FrameException <: Exception { public init(message: String) }

public struct Frame {
    public let flags: UInt8
    public let sequence: Int64
    public let payload: Array<UInt8>
}

public func encode(frame: Frame): Array<UInt8>

public class FrameDecoder {
    public init(maxPayload: UInt32)
    public func feed(chunk: Array<UInt8>): Array<Frame>
    public func bufferedBytes(): Int64
    public func reset(): Unit
}
```

## 行为契约

- `encode` 生成上述完整格式；返回内容与输入 payload 独立。
- decoder 支持任意分片：帧头、payload、checksum 可以跨多次 feed；一次 feed 也可包含多帧。
- `feed` 返回本次新完成的帧，顺序不变；返回的 Frame.payload 必须与内部缓冲区独立。
- 完整帧前保留所有字节并返回空数组。空 chunk 是无操作。
- magic 错误、version 非 1、payloadLength 超过 maxPayload、checksum 不符时抛 `FrameException`，并清空整个内部缓冲区，以便后续输入从干净状态恢复。
- 在解析出完整帧前不得把“不足 8 字节的大端读取”等底层异常泄漏给调用者。
- `bufferedBytes()` 精确返回尚未消费字节数；`reset()` 清空缓冲。构造 maxPayload 可为 0，只允许空 payload。
- main 编码两个内置帧，以不规则分片送入 decoder，输出 `sequence|flags|payloadLength`，最后输出 `buffered=0`。

## 工程与验收

- 根目录 `seed/` 是待修复项目；在该目录内完成任务。把根目录给定 `frame_decoder_test.cj` 原样复制到 `seed/src/`。
- 不得修改 `task.md`、根目录测试或测试副本，不得删除既有公开声明。
- 可以拆分生产文件和重构内部实现，但禁止硬编码测试输入。
- 执行 `cjpm build`、`cjpm test --no-color`、`cjpm run`，全部成功且没有 warning。
