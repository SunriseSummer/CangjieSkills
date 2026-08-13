<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressoutputstream.init" parent="stdx.compress.zlib.class.compressoutputstream" -->
# CompressOutputStream.init

[← CompressOutputStream](index.md)

## 签名

```cangjie role=signature
public init(outputStream: OutputStream, wrap!: WrapType = DeflateFormat, compressLevel!: CompressLevel = DefaultCompression, bufLen!: Int64 = 512)
```

构造一个压缩输出流，需绑定一个输出流，可设置压缩数据类型、压缩等级、内部缓冲区大小（每得到多少压缩后数据往输出流写出）。

## 契约

参数：

- outputStream: OutputStream - 绑定的输出流，压缩后数据将写入该输出流。
- wrap!: WrapType - 压缩数据格式，默认值为 DeflateFormat。
- compressLevel!: CompressLevel - 压缩等级，默认值为 DefaultCompression。
- bufLen!: Int64 - 输出流缓冲区的大小，取值范围为 (0, Int64.Max]，默认 512 字节。

异常：

- ZlibException - 如果 `bufLen` 小于等于 0，输出流分配内存失败，或压缩资源初始化失败，抛出异常。
