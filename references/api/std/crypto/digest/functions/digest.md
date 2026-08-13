<!-- cj-doc kind="api-member" level="5" id="std.crypto.digest.func.digest" parent="std.crypto.digest" -->
# digest

[← std.crypto.digest](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## digest<T>(T, Array<Byte>) where T <: Digest

### 签名

```cangjie role=signature
public func digest<T>(algorithm: T, data: Array<Byte>): Array<Byte> where T <: Digest
```

提供 digest 泛型函数，实现用指定的摘要算法进行摘要运算。

### 契约

参数：

- algorithm: T - 具体的摘要算法。
- data: Array\<Byte> - 待进行摘要运算的数据。

返回值：

- Array\<Byte> - 摘要运算结果。

## digest<T>(T, InputStream) where T <: Digest

### 签名

```cangjie role=signature
public func digest<T>(algorithm: T, input: InputStream): Array<Byte> where T <: Digest
```

提供 digest 泛型函数，实现用指定的摘要算法对 InputStream 里的数据进行摘要运算。

### 契约

参数：

- algorithm: T - 具体的摘要算法。
- input: InputStream - 待进行摘要运算的 InputStream。

返回值：

- Array\<Byte> - 摘要运算结果。

## 典型示例

`digest` 接收任意实现 `Digest` 的算法对象，一次性处理字节数组。标准库定义统一接口，SHA-256 的实现来自扩展标准库；文本应先显式转为 UTF-8 字节。

```cangjie cjtest=run id=api.digest.array.run form=unit requires=stdx timeout=60s
package digest_array_example

import std.crypto.digest.*
import stdx.crypto.digest.*
import stdx.encoding.hex.*

main(): Unit {
    let result = digest<SHA256>(SHA256(), "abc".toArray())
    println(toHexString(result))
}
```

```text cjtest=expect for=api.digest.array.run stream=stdout match=exact
ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
```
