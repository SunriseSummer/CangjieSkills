<!-- cj-doc kind="api-member" level="5" id="std.ast.func.setitem" parent="std.ast" -->
# setItem

[← std.ast](../index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## setItem(String, Bool)

### 签名

```cangjie role=signature
public func setItem(key: String, value: Bool): Unit
```

内层宏通过该接口发送 Bool 类型的信息到外层宏。

### 契约

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- key: String - 发送的关键字，用于检索信息。
- value: Bool - 要发送的 Bool 类型的信息。

## setItem(String, Int64)

### 签名

```cangjie role=signature
public func setItem(key: String, value: Int64): Unit
```

内层宏通过该接口发送 Int64 类型的信息到外层宏。

### 契约

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- key: String - 发送的关键字，用于检索信息。
- value: Int64 - 要发送的 Int64 类型的信息。

## setItem(String, String)

### 签名

```cangjie role=signature
public func setItem(key: String, value: String): Unit
```

内层宏通过该接口发送 String 类型的信息到外层宏。

### 契约

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- key: String - 发送的关键字，用于检索信息。
- value: String - 要发送的 String 类型的信息。

## setItem(String, Tokens)

### 签名

```cangjie role=signature
public func setItem(key: String, value: Tokens): Unit
```

内层宏通过该接口发送 Tokens 类型的信息到外层宏。

### 契约

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- key: String - 发送的关键字，用于检索信息。
- value: Tokens - 要发送的 Tokens 类型的信息。
