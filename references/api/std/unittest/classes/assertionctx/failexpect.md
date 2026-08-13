<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.assertionctx.failexpect" parent="std.unittest.class.assertionctx" -->
# AssertionCtx.failExpect

[← AssertionCtx](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func failExpect(String)

### 签名

```cangjie role=signature
public func failExpect(message: String): Unit
```

存储失败信息，在用户定义的断言函数内提供并继续函数执行。

### 契约

参数：

- message: String - 失败信息。

## func failExpect<PP>(PP)

### 签名

```cangjie role=signature
public func failExpect<PP>(pt: PP): Unit where PP <: PrettyPrintable
```

存储失败信息，在用户定义的断言函数内提供并继续函数执行。

### 契约

参数：

- pt: PP <: PrettyPrintable - 失败信息。
