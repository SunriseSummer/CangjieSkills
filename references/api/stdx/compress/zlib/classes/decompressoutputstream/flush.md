<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressoutputstream.flush" parent="stdx.compress.zlib.class.decompressoutputstream" -->
# DecompressOutputStream.flush

[← DecompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func flush(): Unit
```

刷新解压输出流。

## 契约

功能：刷新解压输出流。将内部缓冲区里已解压的数据写入绑定的输出流，然后刷新绑定的输出流。

异常：

- ZlibException - 如果当前解压输出流已经被关闭，抛出异常。
