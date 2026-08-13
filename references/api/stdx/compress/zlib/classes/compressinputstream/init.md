<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.compressinputstream.init" parent="stdx.compress.zlib.class.compressinputstream" -->
# CompressInputStream.init

[← CompressInputStream](index.md)

## 签名

```cangjie role=signature
public init(inputStream: InputStream, wrap!: WrapType = DeflateFormat, compressLevel!: CompressLevel = DefaultCompression, bufLen!: Int64 = 512)
```

构造一个压缩输入流。

## 契约

需绑定一个输入流，可设置压缩数据格式、压缩等级、内部缓冲区大小（每次从输入流中读取多少数据进行压缩）。

参数：

- inputStream: InputStream - 待压缩的输入流。
- wrap!: WrapType - 压缩数据格式，默认值为 DeflateFormat。
- compressLevel!: CompressLevel - 压缩等级，默认值为 DefaultCompression。
- bufLen!: Int64 - 输入流缓冲区的大小，取值范围为 (0, Int64.Max]，默认 512 字节。

异常：

- ZlibException - 当 `bufLen` 小于等于 0，输入流分配内存失败，或压缩资源初始化失败，抛出异常。
