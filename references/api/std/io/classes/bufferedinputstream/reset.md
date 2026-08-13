<!-- cj-doc kind="api-member" level="6" id="std.io.class.bufferedinputstream.reset" parent="std.io.class.bufferedinputstream" -->
# BufferedInputStream<T> where T <: InputStream.reset

[← BufferedInputStream<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public func reset(input: T): Unit
```

绑定新的输入流，重置状态，但不重置 `capacity`。

## 契约

参数：

- input: T - 待绑定的输入流。
