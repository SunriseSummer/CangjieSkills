<!-- cj-doc kind="api-member" level="5" id="std.ast.func.cangjielex" parent="std.ast" -->
# cangjieLex

[← std.ast](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## cangjieLex(String)

### 签名

```cangjie role=signature
public func cangjieLex(code: String): Tokens
```

将字符串转换为 Tokens 对象。

### 契约

参数：

- code: String - 待词法解析的字符串。

返回值：

- Tokens - 词法解析得到的 Tokens。

异常：

- IllegalMemoryException - 当申请内存失败时，抛出异常。
- IllegalArgumentException - 当输入的 code 无法被正确的解析为 Tokens 时，抛出异常。

## cangjieLex(String, Bool)

### 签名

```cangjie role=signature
public func cangjieLex(code: String, truncated: Bool): Tokens
```

将字符串转换为 Tokens 对象。

### 契约

参数：

- code: String - 待词法解析的字符串。
- truncated: Bool - 是否删减解析后 Tokens 中的 Token(END)。

返回值：

- Tokens - 词法解析得到的 Tokens。

异常：

- IllegalMemoryException - 当申请内存失败时，抛出异常。
- IllegalArgumentException - 当输入的 code 无法被正确的解析为 Tokens 时，抛出异常。
