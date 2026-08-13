<!-- cj-doc kind="api-member" level="5" id="std.io.func.copy-inputstream-outputstream" parent="std.io" -->
# copy(InputStream, OutputStream)

[← std.io](../index.md)

## 签名

```cangjie role=signature
public func copy(from: InputStream, to!: OutputStream): Int64
```

将一个输入流中未被读取的数据拷贝到另一个输出流中。

## 契约

参数：

- from: InputStream - 待读取数据的输入流。
- to!: OutputStream - 数据将要拷贝到的输出流。

返回值：

- Int64 - 拷贝数据的字节数。
