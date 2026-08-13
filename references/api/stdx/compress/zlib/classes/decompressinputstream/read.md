<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressinputstream.read" parent="stdx.compress.zlib.class.decompressinputstream" -->
# DecompressInputStream.read

[← DecompressInputStream](index.md)

## 签名

```cangjie role=signature
public func read(outBuf: Array<Byte>): Int64
```

从绑定的输入流中读取数据并解压，解压后数据放入指定的字节数组中。

## 契约

参数：

- outBuf: Array\<Byte> - 用来存放解压后数据的缓冲区。

返回值：

- Int64 - 如果解压成功，返回解压后字节数，如果绑定的输入流中数据已经全部解压完成，或者该解压输入流被关闭，返回 0。

异常：

- ZlibException - 当 `outBuf` 为空，或解压数据失败，抛出异常。
