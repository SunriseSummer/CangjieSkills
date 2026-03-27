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

## 3. SwapEndianOrder

- 扩展接口，提供字节序反转

| 方法 | 说明 |
|------|------|
| `swapEndian(): T` | 返回字节序反转后的值 |

- 用途：在大端与小端之间转换
- 对 Bool 和单字节类型（Int8/UInt8）无实际效果

```cangjie
package test_proj
import std.binary.*

main() {
    let v: UInt32 = 0x01020304u32
    let swapped = v.swapEndian()
    println(swapped)

    let buf = Array<UInt8>(4, repeat: 0)
    v.writeBigEndian(buf)
    let le = UInt32.readLittleEndian(buf)
    println(le == swapped)
}
```

---

## 4. 关键规则速查

1. `writeBigEndian` / `writeLittleEndian` 返回写入字节数，buffer 长度需 >= 类型大小
2. `readBigEndian` / `readLittleEndian` 是静态方法，通过类型名调用（如 `Int32.readBigEndian(buf)`）
3. `swapEndian()` 反转字节序，可用于大端 ↔ 小端转换
4. 网络协议通常使用大端序（BigEndian）
5. Bool 写入大端序后占 1 字节，`true` 为 `0x01`，`false` 为 `0x00`
