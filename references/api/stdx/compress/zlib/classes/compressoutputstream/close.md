<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressoutputstream.close" parent="stdx.compress.zlib.class.compressoutputstream" -->
# CompressOutputStream.close

[← CompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前压缩输出流实例。

## 契约

关闭时，将写入剩余压缩数据（包括缓冲区中数据，以及压缩尾部信息），并释放其所占内存资源。当前压缩输出流使用完毕后必须调用此函数来释放其所占内存资源，以免造成内存泄漏。在调用 close 函数前，绑定的输出流里已写入的数据并不是一段完整的压缩数据，调用 close 函数后，才会把剩余压缩数据写入绑定的输出流，使其完整。

异常：

- ZlibException - 如果当前压缩输出流已经被关闭，或释放压缩资源失败，抛出异常。
