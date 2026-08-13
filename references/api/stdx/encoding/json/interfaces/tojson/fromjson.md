<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.interface.tojson.fromjson" parent="stdx.encoding.json.interface.tojson" -->
# ToJson.fromJson

[← ToJson](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func fromJson(JsonValue)

### 签名

```cangjie role=signature
static func fromJson(jv: JsonValue): DataModel
```

将 JsonValue 转化为对象 DataModel。

### 契约

参数：

- jv: JsonValue - 待转换的 JsonValue。

返回值：

- DataModel - 转换后的 DataModel。

## static func fromJson(JsonValue)

适用扩展：[extend DataModel <: ToJson](extensions/extend-datamodel-tojson.md)。

### 签名

```cangjie role=signature
public static func fromJson(jv: JsonValue): DataModel
```

将 JsonValue 转化为对象 DataModel。

### 契约

参数：

- jv: JsonValue - 待转换的 JsonValue。

返回值：

- DataModel - 转换后的 DataModel。
