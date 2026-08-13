<!-- cj-doc kind="api-member" level="5" id="std.core.func.eprint" parent="std.core" -->
# eprint

[← std.core](../index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## eprint(String, Bool)

### 签名

```cangjie role=signature
public func eprint(str: String, flush!: Bool = true): Unit
```

将指定字符串打印到标准错误文本流。

### 契约

如抛出异常时，消息将打印到标准错误文本流（stderr），而不是标准输出（stdout）。

参数：

- str: String - 待输出的字符串。
- flush!: Bool - 是否将缓存数据区的内容立即刷新写入与标准错误流相关的文件和设备中，true 表示立即刷新，false 表示暂不刷新 ，默认 false。

## eprint<T>(T, Bool) where T <: ToString

### 签名

```cangjie role=signature
public func eprint<T>(arg: T, flush!: Bool = false): Unit where T <: ToString
```

将指定 T 类型实例的字符串表示打印到标准错误文本流。

### 契约

如抛出异常时，消息将打印到标准错误文本流（stderr），而不是标准输出（stdout）。

参数：

- arg: T - 待打印的 T 类型实例，该函数将打印其 toString 的返回值。
- flush!: Bool - 是否清空缓存，true 清空，false 不清空，默认 false。
