<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.form.init" parent="stdx.encoding.url.class.form" -->
# Form.init

[← Form](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

构造一个默认的 Form 实例。

## init(String)

### 签名

```cangjie role=signature
public init(queryComponent: String)
```

根据 URL 编码的查询字符串，即 URL 实例的 query 部分构造 Form 实例。

### 契约

解析 URL 编码的查询字符串，得到若干键值对，并将其添加到新构造的 Form 实例中。

参数：

- queryComponent: String - URL 的 query 组件部分的字符串，但是不包括组件前面的 `?` 符号。

异常：

- IllegalArgumentException - 当URL 字符串中包含不符合 utf8 编码规则的字节时，抛出异常。
- UrlSyntaxException - 当 URL 字符串中包含非法转义字符时，抛出异常。
