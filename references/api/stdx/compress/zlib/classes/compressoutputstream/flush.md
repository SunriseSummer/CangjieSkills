<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressoutputstream.flush" parent="stdx.compress.zlib.class.compressoutputstream" -->
# CompressOutputStream.flush

[← CompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func flush(): Unit
```

刷新压缩输出流。

## 契约

功能：刷新压缩输出流。将内部缓冲区里已压缩的数据刷出并写入绑定的输出流，然后刷新绑定的输出流。

异常：

- ZlibException - 如果当前压缩输出流已经被关闭，抛出异常。
