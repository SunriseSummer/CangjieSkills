<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.sha256.finish" parent="stdx.crypto.digest.class.sha256" -->
# SHA256.finish

[← SHA256](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func finish()

### 签名

```cangjie role=signature
public func finish(): Array<Byte>
```

返回生成的 SHA256 值，注意调用 finish 后 SHA256 上下文会发生改变，finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。

### 契约

返回值：

- Array\<Byte> - 生成的 SHA256 字节序列。

异常：

- CryptoException - 未重置上下文再次调用 finish 进行摘要计算，抛此异常。

## func finish(Array<Byte>)

### 签名

```cangjie role=signature
public func finish(to!: Array<Byte>): Unit
```

获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。

### 契约

参数：

- to!: Array\<Byte> - 目标数组。

异常：

- CryptoException - 未重置上下文再次调用 finish 进行摘要计算或者指定输出数组大小不等于摘要算法信息长度，抛此异常。

## 典型示例

摘要对象可分段 `write`，`finish` 返回固定长度字节；十六进制编码便于记录和比对摘要值。

```cangjie cjtest=run id=api.stdx.sha256.run form=unit requires=stdx timeout=60s
package stdx_sha256_example

import stdx.crypto.digest.*
import stdx.encoding.hex.*

main(): Unit {
    let hasher = SHA256()
    hasher.write("abc".toArray())
    println(toHexString(hasher.finish()))
}
```

```text cjtest=expect for=api.stdx.sha256.run stream=stdout match=exact
ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
```
