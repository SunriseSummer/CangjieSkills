<!-- cj-doc kind="api-member" level="5" id="std.math.func.checkedabs" parent="std.math" -->
# checkedAbs

[← std.math](../index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## checkedAbs(Int16)

### 签名

```cangjie role=signature
public func checkedAbs(x: Int16): Option<Int16>
```

求一个 16 位有符号整数的绝对值。

### 契约

功能：求一个 16 位有符号整数的绝对值。如果入参是 16 位有符号整数的最小值，函数返回 None；否则，返回 Some(abs(x))。

参数：

- x: Int16 - 传入的 16 位有符号整数。

返回值：

- Option\<Int16> - 返回传入参数的绝对值的 Option 类型。

## checkedAbs(Int32)

### 签名

```cangjie role=signature
public func checkedAbs(x: Int32): Option<Int32>
```

求一个 32 位有符号整数的绝对值。

### 契约

功能：求一个 32 位有符号整数的绝对值。如果入参是 32 位有符号整数的最小值，函数返回 None；否则，返回 Some(abs(x))。

参数：

- x: Int32 - 传入的 32 位有符号整数。

返回值：

- Option\<Int32> - 返回传入参数的绝对值的 Option 类型。

## checkedAbs(Int64)

### 签名

```cangjie role=signature
public func checkedAbs(x: Int64): Option<Int64>
```

求一个 64 位有符号整数的绝对值。

### 契约

功能：求一个 64 位有符号整数的绝对值。如果入参是 64 位有符号整数的最小值，函数返回 None；否则，返回 Some(abs(x))。

参数：

- x: Int64 - 传入的 64 位有符号整数。

返回值：

- Option\<Int64> - 返回传入参数的绝对值的 Option 类型。

## checkedAbs(Int8)

### 签名

```cangjie role=signature
public func checkedAbs(x: Int8): Option<Int8>
```

求一个 8 位有符号整数的绝对值。

### 契约

功能：求一个 8 位有符号整数的绝对值。如果入参是 8 位有符号整数的最小值，函数返回 None；否则，返回 Some(abs(x))。

参数：

- x: Int8 - 传入的 8 位有符号整数。

返回值：

- Option\<Int8> - 返回传入参数的绝对值的 Option 类型。
