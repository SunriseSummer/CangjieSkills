<!-- cj-doc kind="api-member" level="6" id="std.core.struct.string.withrawdata" parent="std.core.struct.string" -->
# String.withRawData

[← String](index.md)

## 签名

```cangjie role=signature
public static unsafe func withRawData(rawData: Array<UInt8>): String
```

根据字节数组构造一个字符串。

## 契约

相较于 fromUtf8Unchecked 函数，withRawData 没有做数组的拷贝，直接用传入的数组构造了字符串。

> **注意：**
>
> 用户应该保证：
>
> 1. rawData 在字符串构造后永远不会被修改。
> 2. rawData 符合 UTF-8 编码。
>
> 否则程序行为是未定义的。
>
> 如果不是某些场景下的性能考虑，请优先使用安全的 fromUtf8 函数。

参数：

- rawData: Array\<UInt8> - 根据该字节数组构造字符串。

返回值：

- String - 构造的字符串。

异常：

- IllegalArgumentException - 当试图构造长度超过 UInt32 的最大值 的字符串时，抛出异常。
