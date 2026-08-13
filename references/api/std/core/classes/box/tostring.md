<!-- cj-doc kind="api-member" level="7" id="std.core.class.box.tostring" parent="std.core.class.box.extension.extend-t-box-t-tostring-where-t-tostring" -->
# Box<T>.toString

[← extend<T> Box<T> <: ToString where T <: ToString](extensions/extend-t-box-t-tostring-where-t-tostring.md)

## 签名

```cangjie role=signature
public func toString(): String
```

获取 Box 对象的字符串表示，字符串内容为当前实例封装的 `T` 类型实例的字符串表示。

## 契约

返回值：

- String - 转换后的字符串。
