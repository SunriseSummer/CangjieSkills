<!-- cj-doc kind="api-member" level="6" id="std.core.class.exception.init" parent="std.core.class.exception" -->
# Exception.init

[← Exception](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 Exception 实例，默认异常信息为空。

## init(String)

### 签名

```cangjie role=signature
public init(message: String)
```

根据异常信息构造一个 Exception 实例。

### 契约

参数：

- message: String - 异常提示信息。
