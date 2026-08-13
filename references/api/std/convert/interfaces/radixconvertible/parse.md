<!-- cj-doc kind="api-member" level="6" id="std.convert.interface.radixconvertible.parse" parent="std.convert.interface.radixconvertible" -->
# RadixConvertible<T>.parse

[← RadixConvertible<T>](index.md)

本页汇总 9 个同名重载；先按签名选择，再读取对应契约。

## static func parse(String, Int64)

### 签名

```cangjie role=signature
static func parse(value: String, radix!: Int64): T
```

从指定进制字符串中解析特定类型。

### 契约

参数：

- value: String - 待解析的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- T - 转换后的值。

## static func parse(String, Int64)

适用扩展：[extend Int16 <: RadixConvertible<Int16>](extensions/extend-int16-radixconvertible-int16.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): Int16
```

将 Int16 类型字面量的字符串转换为 Int16 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Int16 - 返回转换后 Int16 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、转换后超出 Int16 范围、字符串中含有无效的 UTF-8 字符、转换失败时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend Int32 <: RadixConvertible<Int32>](extensions/extend-int32-radixconvertible-int32.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): Int32
```

将 Int32 类型字面量的字符串转换为 Int32 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Int32 - 返回转换后 Int32 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、转换后超出 Int32 范围、字符串中含有无效的 UTF-8 字符、转换失败时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend Int64 <: RadixConvertible<Int64>](extensions/extend-int64-radixconvertible-int64.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): Int64
```

将 Int64 类型字面量的字符串转换为 Int64 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Int64 - 返回转换后 Int64 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、转换后超出 Int64 范围、字符串中含有无效的 UTF-8 字符、转换失败时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend Int8 <: RadixConvertible<Int8>](extensions/extend-int8-radixconvertible-int8.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): Int8
```

将 Int8 类型字面量的字符串转换为 Int8 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Int8 - 返回转换后 Int8 值。

异常：

- IllegalArgumentException - 当字符串为空，进制超出范围，转换后超出 Int8 范围或字符串中含有无效的 UTF-8 字符，转换失败时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend UInt16 <: RadixConvertible<UInt16>](extensions/extend-uint16-radixconvertible-uint16.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): UInt16
```

将 UInt16 类型字面量的字符串转换为 UInt16 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- UInt16 - 返回转换后 UInt16 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、首位为 `-`、转换后超出 UInt16 范围、字符串中含有无效的 UTF-8 字符时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend UInt32 <: RadixConvertible<UInt32>](extensions/extend-uint32-radixconvertible-uint32.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): UInt32
```

将 UInt32 类型字面量的字符串转换为 UInt32 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- UInt32 - 返回转换后 UInt32 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、首位为 `-`、转换后超出 UInt32 范围、字符串中含有无效的 UTF-8 字符时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend UInt64 <: RadixConvertible<UInt64>](extensions/extend-uint64-radixconvertible-uint64.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): UInt64
```

将 UInt64 类型字面量的字符串转换为 UInt64 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- UInt64 - 返回转换后 UInt64 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、首位为 `-`、转换后超出 UInt64 范围、字符串中含有无效的 UTF-8 字符时，抛出异常。

## static func parse(String, Int64)

适用扩展：[extend UInt8 <: RadixConvertible<UInt8>](extensions/extend-uint8-radixconvertible-uint8.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): UInt8
```

将 UInt8 类型字面量的字符串转换为 UInt8 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- UInt8 - 返回转换后 UInt8 值。

异常：

- IllegalArgumentException - 当字符串为空、进制超出范围、首位为 `-`、转换后超出 UInt8 范围、字符串中含有无效的 UTF-8 字符时，抛出异常。
