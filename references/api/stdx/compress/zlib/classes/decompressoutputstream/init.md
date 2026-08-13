<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressoutputstream.init" parent="stdx.compress.zlib.class.decompressoutputstream" -->
# DecompressOutputStream.init

[← DecompressOutputStream](index.md)

## 签名

```cangjie role=signature
public init(outputStream: OutputStream, wrap!: WrapType = DeflateFormat, bufLen!: Int64 = 512)
```

构造一个解压输出流。

## 契约

需绑定一个输出流，可设置压缩数据类型、压缩等级、内部缓冲区大小（解压后数据会存入内部缓冲区，缓冲区存满后再写到输出流）。

参数：

- outputStream: OutputStream - 绑定的输出流，解压后数据将写入该输出流。
- wrap!: WrapType - 待解压数据格式，默认值为 DeflateFormat。
- bufLen!: Int64 - 输出流缓冲区的大小，取值范围为 (0, Int64.Max]，默认 512 字节。

异常：

- ZlibException - 如果 `bufLen` 小于等于 0，输出流分配内存失败，或解压资源初始化失败，抛出异常。
