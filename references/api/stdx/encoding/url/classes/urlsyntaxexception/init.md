<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.urlsyntaxexception.init" parent="stdx.encoding.url.class.urlsyntaxexception" -->
# UrlSyntaxException.init

[← UrlSyntaxException](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init(String)

### 签名

```cangjie role=signature
public init(reason: String)
```

根据错误原因构造 UrlSyntaxException 实例。

### 契约

参数：

- reason: String - 解析错误的原因。

## init(String, String)

### 签名

```cangjie role=signature
public init(input: String, reason: String)
```

根据 URL 及错误原因构造 UrlSyntaxException 实例。

### 契约

参数：

- input: String - 原生 URL 或其片段。
- reason: String - 解析错误的原因。

## init(String, String, String)

### 签名

```cangjie role=signature
public init(input: String, reason: String, pos: String)
```

根据 URL 字符串，错误原因以及解析失败的部分，构造 UrlSyntaxException 实例。

### 契约

参数：

- input: String - 原生 URL 或其片段。
- reason: String - 解析错误的原因。
- pos: String - 给定 URL 字符串中解析失败的部分。
