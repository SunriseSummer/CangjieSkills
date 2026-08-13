<!-- cj-doc kind="api-member" level="5" id="std.unittest.common.func.setorupdateoptioninfo-string-string-string-string" parent="std.unittest.common" -->
# setOrUpdateOptionInfo(String, ?String, String, String)

[← std.unittest.common](../index.md)

## 签名

```cangjie role=signature
public func setOrUpdateOptionInfo(
    name: String,
    description: ?String,
    ty: String,
    typeDescription: String
): Unit
```

用于设置具体类型的选项的描述。

## 契约

参数：

- name: String - 选项名称。
- description: ?String - 选项的描述。如果值不为 None ，则覆盖先前的值。
- ty: String - 类型的字符串形式。
- typeDescription: String - 选项的类型描述。
