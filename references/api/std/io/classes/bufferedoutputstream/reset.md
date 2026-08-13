<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedoutputstream.reset" parent="std.io.class.bufferedoutputstream" -->
# BufferedOutputStream<T> where T <: OutputStream.reset

[← BufferedOutputStream<T> where T <: OutputStream](index.md)

## 签名

```cangjie role=signature
public func reset(output: T): Unit
```

绑定新的输出流，重置状态，但不重置 `capacity`。

## 契约

参数：

- output: T - 待绑定的输出流。
