<!-- cj-doc kind="api-member" level="6" id="std.core.class.stringbuilder.appendfromutf8" parent="std.core.class.stringbuilder" -->
# StringBuilder.appendFromUtf8

[← StringBuilder](index.md)

## 签名

```cangjie role=signature
public func appendFromUtf8(arr: Array<Byte>): Unit
```

在 StringBuilder 末尾插入参数 `arr` 指向的字节数组。

## 契约

该函数要求参数 `arr` 符合 UTF-8 编码，如果不符合，将抛出异常。

参数：

- arr: Array\<Byte> - 插入的字节数组。

异常：

- IllegalArgumentException - 当字节数组不符合 utf8 编码规则时，抛出异常。
