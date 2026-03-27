# 仓颉语言摘要算法 Skill

## 1. Digest 接口

- 来自 `std.crypto.digest.*`
- `Digest` 接口定义摘要算法的通用协议

| 属性/方法 | 说明 |
|----------|------|
| `size: Int64` | 摘要输出字节长度 |
| `blockSize: Int64` | 内部分组大小 |
| `algorithm: String` | 算法名称 |
| `write(buffer: Array<Byte>)` | 写入待摘要数据 |
| `finish(): Array<Byte>` | 完成计算，返回摘要结果 |
| `finish(to!: Array<Byte>)` | 将摘要结果写入指定 buffer |
| `reset()` | 重置状态，开始新一轮计算 |

- 使用流程：创建实例 → 多次 `write()` → `finish()` 获取结果 → `reset()` 可复用

---

## 2. digest() 便捷函数

- `digest(algorithm: Digest, data: Array<Byte>): Array<Byte>` — 一次性计算摘要
- `digest(algorithm: Digest, inputStream: InputStream): Array<Byte>` — 从流计算摘要
- 内部自动调用 `write` + `finish`

```cangjie
package test_proj
import std.crypto.digest.*

class MyDigest <: Digest {
    public prop size: Int64 { get() { 16 } }
    public prop blockSize: Int64 { get() { 64 } }
    public prop algorithm: String { get() { "MyDigest" } }
    public func write(buffer: Array<Byte>): Unit {}
    public func finish(to!: Array<Byte>): Unit {}
    public func finish(): Array<Byte> { Array<Byte>(16, repeat: 0) }
    public func reset(): Unit {}
}

main() {
    let data: Array<Byte> = "hello".toArray()
    let mydigest = MyDigest()
    let result = digest(mydigest, data)
    println("Digest length: ${result.size}")
}
```

---

## 3. BlockCipher 对称加密接口（简介）

- 来自 `std.crypto.cipher.*`
- `BlockCipher` 接口定义分组加密算法协议

| 属性/方法 | 说明 |
|----------|------|
| `blockSize: Int64` | 分组大小 |
| `encrypt(input: Array<Byte>): Array<Byte>` | 加密一个分组 |
| `decrypt(input: Array<Byte>): Array<Byte>` | 解密一个分组 |

- 具体实现（如 AES、SM4）可能在扩展包中提供

---

## 4. 关键规则速查

1. `Digest` 接口是摘要算法的核心抽象，所有摘要实现均需遵循此接口
2. `digest()` 便捷函数适用于一次性计算，大数据建议分块 `write()` + `finish()`
3. `finish()` 后需 `reset()` 才能复用同一实例进行新计算
4. `std.crypto.digest` 仅定义接口；**具体算法实现（MD5、SHA256、HMAC 等）在扩展标准库 `stdx.crypto.digest` 中**（详见 `cangjie-stdx` Skill）
5. `finish(to!:)` 变体可避免额外内存分配，buffer 长度需 >= `size`
