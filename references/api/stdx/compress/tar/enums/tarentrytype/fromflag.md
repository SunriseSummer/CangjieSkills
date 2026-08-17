<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.enum.tarentrytype.fromflag" parent="stdx.compress.tar.enum.tarentrytype" -->
# TarEntryType.fromFlag

[← TarEntryType](index.md)

## 签名

```cangjie role=signature
public static func fromFlag(flag: UInt8): TarEntryType
```

根据传入的 `typeflag` 字节值构造对应的 `TarEntryType` 枚举实例。

## 参数

- flag: UInt8 - tar 头部中 `typeflag` 的字节值。

## 返回值

- TarEntryType - 对应的条目类型枚举实例。如果无法识别，将返回 `Unknown(flag)`。

