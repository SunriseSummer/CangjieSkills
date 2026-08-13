<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressoutputstream.close" parent="stdx.compress.zlib.class.decompressoutputstream" -->
# DecompressOutputStream.close

[← DecompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭当前解压输出流实例。

## 契约

关闭时，将写入剩余解压后数据，并释放其所占内存资源。当前压缩输出流使用完毕后必须调用此函数来释放其所占内存资源，以免造成内存泄漏。如果之前 write 函数已处理的压缩数据不完整，调用 close 函数时会因为解压数据不全而抛出异常。

异常：

- ZlibException - 如果当前压缩输出流已经被关闭，通过 write 函数传入的待解压数据不完整，或释放压缩资源失败，抛出异常。
