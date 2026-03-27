# 仓颉语言二进制端序 Skill

## 1. BigEndianOrder

- 来自 `std.binary.*`
- 扩展接口，为基本类型提供大端序读写

| 方法 | 说明 |
|------|------|
| `writeBigEndian(buffer: Array<UInt8>): Int64` | 将值以大端序写入 buffer，返回写入字节数 |
| `static readBigEndian(buffer: Array<UInt8>): T` | 从 buffer 以大端序读取值 |

- 支持类型：Bool, Float16/32/64, Int8/16/32/64, UInt8/16/32/64

---

## 2. LittleEndianOrder

- 扩展接口，为基本类型提供小端序读写

| 方法 | 说明 |
|------|------|
| `writeLittleEndian(buffer: Array<UInt8>): Int64` | 将值以小端序写入 buffer，返回写入字节数 |
| `static readLittleEndian(buffer: Array<UInt8>): T` | 从 buffer 以小端序读取值 |

- 大端序：高字节在低地址（网络字节序）
- 小端序：低字节在低地址（x86 本地字节序）

```cangjie
package test_proj
import std.binary.*

main() {
    let buffer = Array<UInt8>(8, repeat: 0)
    let n = true.writeBigEndian(buffer)
    println(n == 1)
    println(buffer[0] == 0x01u8)

    let val: Int32 = 0x01020304
    val.writeBigEndian(buffer)
    println(buffer[0..4])

    let read_val = Int32.readBigEndian(buffer)
    println(read_val == val)
}
```

---

## 3. 端序转换示例

- 大端序写入后用小端序读取，可观察字节序差异

```cangjie
package test_proj
import std.binary.*

main() {
    let v: UInt32 = 0x01020304u32
    let bufBE = Array<UInt8>(4, repeat: 0)
    let bufLE = Array<UInt8>(4, repeat: 0)
    v.writeBigEndian(bufBE)
    v.writeLittleEndian(bufLE)
    println("BigEndian:    ${bufBE}")      // [1, 2, 3, 4]
    println("LittleEndian: ${bufLE}")      // [4, 3, 2, 1]
    // 从各自字节序读回，值相同
    let readBE = UInt32.readBigEndian(bufBE)
    let readLE = UInt32.readLittleEndian(bufLE)
    println(readBE == readLE)              // true
}
```

---

## 4. 关键规则速查

1. `writeBigEndian` / `writeLittleEndian` 返回写入字节数，buffer 长度需 >= 类型大小
2. `readBigEndian` / `readLittleEndian` 是静态方法，通过类型名调用（如 `Int32.readBigEndian(buf)`）
3. 大端序写入后用小端序读取结果不同，反之亦然
4. 网络协议通常使用大端序（BigEndian）
5. Bool 写入大端序后占 1 字节，`true` 为 `0x01`，`false` 为 `0x00`
