<!-- cj-doc kind="api-member" level="5" id="std.collection.func.collectstring-t-string-where-t-tostring" parent="std.collection" -->
# collectString<T>(String) where T <: ToString

[← std.collection](../index.md)

## 签名

```cangjie role=signature
public func collectString<T>(delimiter!: String = ""): (Iterable<T>) -> String where T <: ToString
```

将一个对应元素实现了 ToString 接口的迭代器转换成 String 类型。

## 契约

参数：

- delimiter!: String - 字符串拼接分隔符。

返回值：

- (Iterable\<T>) -> String - 返回一个转换函数。
