<!-- cj-doc kind="api-member" level="6" id="std.crypto.digest.interface.digest.finish" parent="std.crypto.digest.interface.digest" -->
# Digest.finish

[← Digest](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func finish()

### 签名

```cangjie role=signature
func finish(): Array<Byte>
```

返回生成的 digest 值。

### 契约

返回值：

- Array\<Byte> - 返回生成摘要值。

## func finish(Array<Byte>)

### 签名

```cangjie role=signature
func finish(to!: Array<Byte>): Unit
```

获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。

### 契约

参数：

- to!: Array\<Byte> - 目标数组。
