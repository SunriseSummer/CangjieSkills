<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.sha1.finish" parent="stdx.crypto.digest.class.sha1" -->
# SHA1.finish

[← SHA1](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func finish()

### 签名

```cangjie role=signature
public func finish(): Array<Byte>
```

返回生成的 SHA1 值，注意调用 finish 后 SHA1 上下文会发生改变，finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。

### 契约

返回值：

- Array\<Byte> - 生成的 SHA1 字节序列。

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
