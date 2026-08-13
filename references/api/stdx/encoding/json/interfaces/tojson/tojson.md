<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.interface.tojson.tojson" parent="stdx.encoding.json.interface.tojson" -->
# ToJson.toJson

[← ToJson](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func toJson()

### 签名

```cangjie role=signature
func toJson(): JsonValue
```

将自身转化为 JsonValue。

### 契约

返回值：

- JsonValue - 转换后的 JsonValue。

异常：

- JsonException - 如果转换失败，抛出异常。

## func toJson()

适用扩展：[extend DataModel <: ToJson](extensions/extend-datamodel-tojson.md)。

### 签名

```cangjie role=signature
public func toJson(): JsonValue
```

将自身转化为 JsonValue。

### 契约

返回值：

- JsonValue - 转换后的 JsonValue。

异常：

- JsonException - 如果转换失败，抛出异常。
