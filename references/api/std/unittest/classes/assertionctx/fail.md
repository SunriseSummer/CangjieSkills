<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.assertionctx.fail" parent="std.unittest.class.assertionctx" -->
# AssertionCtx.fail

[← AssertionCtx](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func fail(String)

### 签名

```cangjie role=signature
public func fail(message: String): Nothing
```

存储失败信息，在用户定义的断言函数中提供并抛出 `AssertExpection`。

### 契约

参数：

- message: String - 失败信息。

## func fail<PP>(PP)

### 签名

```cangjie role=signature
public func fail<PP>(pt: PP): Nothing where PP <: PrettyPrintable
```

存储失败信息，在用户定义的断言函数中提供并抛出 `AssertExpection`。

### 契约

参数：

- pt: PP <: PrettyPrintable - 失败信息。
