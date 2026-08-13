<!-- cj-doc kind="api-member" level="5" id="std.core.func.eprintln" parent="std.core" -->
# eprintln

[← std.core](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## eprintln(String)

### 签名

```cangjie role=signature
public func eprintln(str: String): Unit
```

将指定字符串打印到标准错误文本流，末尾添加换行。

### 契约

如抛出异常时，消息将打印到标准错误文本流（stderr），而不是标准输出（stdout）。

参数：

- str: String - 待输出的字符串。

## eprintln<T>(T) where T <: ToString

### 签名

```cangjie role=signature
public func eprintln<T>(arg: T): Unit where T <: ToString
```

将指定 T 类型实例的字符串表示打印到标准错误文本流，末尾添加换行。

### 契约

如抛出异常时，消息将打印到标准错误文本流（stderr），而不是标准输出（stdout）。

参数：

- arg: T - 待打印的 T 类型实例，该函数将打印其 toString 的返回值。
