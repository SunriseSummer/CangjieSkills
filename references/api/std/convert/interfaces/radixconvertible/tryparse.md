<!-- cj-doc kind="api-member" level="6" id="std.convert.interface.radixconvertible.tryparse" parent="std.convert.interface.radixconvertible" -->
# RadixConvertible<T>.tryParse

[← RadixConvertible<T>](index.md)

本页汇总 9 个同名重载；先按签名选择，再读取对应契约。

## static func tryParse(String, Int64)

### 签名

```cangjie role=signature
static func tryParse(value: String, radix!: Int64): Option<T>
```

从指定进制字符串中解析特定类型。

### 契约

参数：

- value: String - 待解析的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<T> - 转换后值，转换失败返回 Option\<T>.None。

## static func tryParse(String, Int64)

适用扩展：[extend Int16 <: RadixConvertible<Int16>](extensions/extend-int16-radixconvertible-int16.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<Int16>
```

将 Int16 类型字面量的字符串转换为 Option<Int16> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<Int16> - 返回转换后 Option\<Int16> 值，转换失败返回 Option\<Int16>.None。

## static func tryParse(String, Int64)

适用扩展：[extend Int32 <: RadixConvertible<Int32>](extensions/extend-int32-radixconvertible-int32.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<Int32>
```

将 Int32 类型字面量的字符串转换为 Option<Int32> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<Int32> - 返回转换后 Option\<Int32> 值，转换失败返回 Option\<Int32>.None。

## static func tryParse(String, Int64)

适用扩展：[extend Int64 <: RadixConvertible<Int64>](extensions/extend-int64-radixconvertible-int64.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<Int64>
```

将 Int64 类型字面量的字符串转换为 Option<Int64> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<Int64> - 返回转换后 Option\<Int64> 值，转换失败返回 Option\<Int64>.None。

## static func tryParse(String, Int64)

适用扩展：[extend Int8 <: RadixConvertible<Int8>](extensions/extend-int8-radixconvertible-int8.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<Int8>
```

将 Int8 类型字面量的字符串转换为 Option<Int8> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<Int8> - 返回转换后 Option\<Int8> 值，转换失败返回 Option\<Int8>.None。

## static func tryParse(String, Int64)

适用扩展：[extend UInt16 <: RadixConvertible<UInt16>](extensions/extend-uint16-radixconvertible-uint16.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<UInt16>
```

将 UInt16 类型字面量的字符串转换为 Option<UInt16> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<UInt16> - 返回转换后 Option\<UInt16> 值，转换失败返回 Option\<UInt16>.None。

## static func tryParse(String, Int64)

适用扩展：[extend UInt32 <: RadixConvertible<UInt32>](extensions/extend-uint32-radixconvertible-uint32.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<UInt32>
```

将 UInt32 类型字面量的字符串转换为 Option<UInt32> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<UInt32> - 返回转换后 Option\<UInt32> 值，转换失败返回 Option\<UInt32>.None。

## static func tryParse(String, Int64)

适用扩展：[extend UInt64 <: RadixConvertible<UInt64>](extensions/extend-uint64-radixconvertible-uint64.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<UInt64>
```

将 UInt64 类型字面量的字符串转换为 Option<UInt64> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<UInt64> - 返回转换后 Option\<UInt64> 值，转换失败返回 Option\<UInt64>.None。

## static func tryParse(String, Int64)

适用扩展：[extend UInt8 <: RadixConvertible<UInt8>](extensions/extend-uint8-radixconvertible-uint8.md)。

### 签名

```cangjie role=signature
public static func tryParse(value: String, radix!: Int64): Option<UInt8>
```

将 UInt8 类型字面量的字符串转换为 Option<UInt8> 值。

### 契约

参数：

- value: String - 要转换的字符串。
- radix!: Int64 - 指定的进制。

返回值：

- Option\<UInt8> - 返回转换后 Option\<UInt8> 值，转换失败返回 Option\<UInt8>.None。
