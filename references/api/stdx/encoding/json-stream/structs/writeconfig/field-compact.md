<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.field-compact" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.compact

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public static let compact: WriteConfig
```

提供紧凑的序列化格式。

## 契约

> **说明：**
>
> compact 的各属性值为：
>
> - newline: ""，空字符串。
> - indent: ""，空字符串。
> - useSpaceAfterSeparators: false。
> - htmlSafe: false。
> - dateTimeFormat: DateTimeFormat.RFC3339。

类型：WriteConfig

示例：

```text
{"Name":"zhangsan","Age":18,"Scores":[88.8,99.9],"Class":{"Name":"Class A","Students Number":33}}
```
