<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.stream.struct.writeconfig.field-pretty" parent="stdx.encoding.json.stream.struct.writeconfig" -->
# WriteConfig.pretty

[← WriteConfig](index.md)

## 签名

```cangjie role=signature
public static let pretty: WriteConfig
```

提供整洁的序列化格式。

## 契约

> **说明：**
>
> pretty 的各属性值为：
>
> - newline: "\n"。
> - indent: "&emsp;&emsp;&emsp;&emsp;"，包含 4 个空格的字符串。
> - useSpaceAfterSeparators: true。
> - htmlSafe: false。
> - dateTimeFormat: DateTimeFormat.RFC3339。

类型：WriteConfig

示例：

```text
{
    "Name": "zhangsan",
    "Age": 18,
    "Scores": [
        88.8,
        99.9
    ],
    "Class": {
        "Name": "Class A",
        "Students Number": 33
    }
}
```
