<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.powerassertdiagrambuilder.r" parent="std.unittest.class.powerassertdiagrambuilder" -->
# PowerAssertDiagramBuilder.r

[← PowerAssertDiagramBuilder](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func r<T>(T, String, Int64)

### 签名

```cangjie role=signature
public func r<T>(
    value: T,
    exprAsText: String,
    position: Int64
): T
```

记录对比数据。

### 契约

参数：

- value: T - 被记录的数据。
- exprAsText: String - 表达式字符串。
- position: Int64 - 位置信息。

返回值：

- T - 被记录的数据。

## func r(String, String, Int64)

### 签名

```cangjie role=signature
public func r(
    value: String,
    exprAsText: String,
    position: Int64
): String
```

记录对比数据。

### 契约

参数：

- value: String - 被记录的数据。
- exprAsText: String - 表达式字符串。
- position: Int64 - 位置信息。

返回值：

- String - 被记录的数据。

## func r(Rune, String, Int64)

### 签名

```cangjie role=signature
public func r(
    value: Rune,
    exprAsText: String,
    position: Int64
): Rune
```

记录对比数据。

### 契约

参数：

- value: Rune - 被记录的数据。
- exprAsText: String - 表达式字符串。
- position: Int64 - 位置信息。

返回值：

- Rune - 被记录的数据。
