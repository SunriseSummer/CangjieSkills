<!-- cj-doc kind="api-member" level="6" id="stdx.log.interface.logvalue.writeto" parent="stdx.log.interface.logvalue" -->
# LogValue.writeTo

[← LogValue](index.md)

本页汇总 12 个同名重载；先按签名选择，再读取对应契约。

## func writeTo(LogWriter)

### 签名

```cangjie role=signature
func writeTo(w: LogWriter): Unit
```

将实现了 LogValue 接口的类型写入参数 `w` 指定的 LogWriter 实例中。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend Bool <: LogValue](extensions/extend-bool-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Bool 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend Exception <: LogValue](extensions/extend-exception-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Exception 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend Int64 <: LogValue](extensions/extend-int64-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Int64 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend Float64 <: LogValue](extensions/extend-float64-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Float64 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend String <: LogValue](extensions/extend-string-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 String 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend DateTime <: LogValue](extensions/extend-datetime-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 DateTime 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend Duration <: LogValue](extensions/extend-duration-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Duration 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend<T> Array<T> <: LogValue where T <: LogValue](extensions/extend-t-array-t-logvalue-where-t-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Array<T> 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend<V> HashMap<String, V> <: LogValue where V <: LogValue](extensions/extend-v-hashmap-string-v-logvalue-where-v-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 HashMap<K, V> 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend<V> TreeMap<String, V> <: LogValue where V <: LogValue](extensions/extend-v-treemap-string-v-logvalue-where-v-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 TreeMap<K, V> 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。

## func writeTo(LogWriter)

适用扩展：[extend<T> Option<T> <: LogValue where T <: LogValue](extensions/extend-t-option-t-logvalue-where-t-logvalue.md)。

### 签名

```cangjie role=signature
public func writeTo(w: LogWriter): Unit
```

提供 Option<T> 类型序列化到流的功能。

### 契约

参数：

- w:  LogWriter - 写入序列化结果的 LogWriter 实例。
