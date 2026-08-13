<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonarray.init" parent="stdx.encoding.json.class.jsonarray" -->
# JsonArray.init

[← JsonArray](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

创建空 JsonArray。

## init(ArrayList<JsonValue>)

### 签名

```cangjie role=signature
public init(list: ArrayList<JsonValue>)
```

将指定的 ArrayList 类型实例封装成 JsonArray 实例。

### 契约

参数：

- list: ArrayList\<JsonValue> - 用于创建 JsonArray 的 ArrayList。

## init(Array<JsonValue>)

### 签名

```cangjie role=signature
public init(list: Array<JsonValue>)
```

将指定的 Array 类型实例封装成 JsonArray 实例。

### 契约

参数：

- list: Array\<JsonValue> - 用于创建 JsonArray 的 Array。
