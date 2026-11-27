<!-- cj-doc kind="api-member" level="7" id="std.env.class.consolewriter.writeln.writeln-b71ee37720" parent="std.env.class.consolewriter.writeln" -->
# ConsoleWriter.func writeln<T>(T) where T <: ToString

[← ConsoleWriter.writeln](index.md)

## 签名

```cangjie role=signature
public func writeln<T>(v: T): Unit where T <: ToString
```

将实现了 ToString 接口的数据类型转换成的字符串（后跟换行符）写入标准输出或标准错误流中。

## 契约

参数：

- v: T - 要写入的值。
