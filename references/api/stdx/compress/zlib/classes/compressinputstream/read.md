<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressinputstream.read" parent="stdx.compress.zlib.class.compressinputstream" -->
# CompressInputStream.read

[← CompressInputStream](index.md)

## 签名

```cangjie role=signature
public func read(outBuf: Array<Byte>): Int64
```

从绑定的输入流中读取数据并压缩，压缩后数据放入指定的字节数组中。

## 契约

参数：

- outBuf: Array\<Byte> - 用来存放压缩后数据的缓冲区。

返回值：

- Int64 - 如果压缩成功，返回压缩后字节数，如果绑定的输入流中数据已经全部压缩完成，或者该压缩输入流被关闭，返回 0。

异常：

- ZlibException - 当 `outBuf` 为空，或压缩数据失败，抛出异常。
