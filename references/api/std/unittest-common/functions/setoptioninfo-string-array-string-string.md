<!-- cj-doc kind="api-member" level="5" id="std.unittest.common.func.setoptioninfo-string-array-string-string" parent="std.unittest.common" -->
# setOptionInfo(String, Array<String>, ?String)

[← std.unittest.common](../index.md)

## 签名

```cangjie role=signature
public func setOptionInfo(
    name: String,
    types: Array<String>,
    description!: ?String = None
): Unit
```

用于设置选项的描述的函数。

## 契约

参数：

- name: String - 选项名称。
- types: Array\<String> - 可以表示的选项值的有效类型
- description: ?String - 选项描述。
