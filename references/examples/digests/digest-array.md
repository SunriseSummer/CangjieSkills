<!-- cj-doc kind="example-leaf" level="4" id="examples.digests.digest-array" parent="examples.digests" -->
# 对字节数组计算摘要

[← 数据摘要](index.md)

把具体 Digest 实现传给标准库便捷函数，分离协议与算法实现。

## 典型示例

`digest` 接收任意实现 `Digest` 的算法对象，一次性处理字节数组。标准库定义统一接口，SHA-256 的实现来自扩展标准库；文本应先显式转为 UTF-8 字节。

```cangjie cjtest=run id=examples.digests.digest-array.api.digest.array.run form=unit requires=stdx timeout=60s
package digest_array_example

import std.crypto.digest.*
import stdx.crypto.digest.*
import stdx.encoding.hex.*

main(): Unit {
    let result = digest<SHA256>(SHA256(), "abc".toArray())
    println(toHexString(result))
}
```

预期标准输出：

```text cjtest=expect for=examples.digests.digest-array.api.digest.array.run stream=stdout match=exact
ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
```
