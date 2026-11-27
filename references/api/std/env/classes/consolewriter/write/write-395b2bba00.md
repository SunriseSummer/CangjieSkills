<!-- cj-doc kind="api-member" level="7" id="std.env.class.consolewriter.write.write-395b2bba00" parent="std.env.class.consolewriter.write" -->
# ConsoleWriter.func write<T>(T) where T <: ToString

[← ConsoleWriter.write](index.md)

## 签名

```cangjie role=signature
public func write<T>(v: T): Unit where T <: ToString
```

将实现了 ToString 接口的数据类型写入标准输出或标准错误流中。

## 契约

参数：

- v: T - 要被写入的 ToString 类型的实例。
