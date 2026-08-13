<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressinputstream.init" parent="stdx.compress.zlib.class.decompressinputstream" -->
# DecompressInputStream.init

[← DecompressInputStream](index.md)

## 签名

```cangjie role=signature
public init(inputStream: InputStream, wrap!: WrapType = DeflateFormat, bufLen!: Int64 = 512)
```

构造一个解压输入流。

## 契约

需绑定一个输入流，可设置待解压数据格式、内部缓冲区大小（每次从输入流中读取多少数据进行解压）。

参数：

- inputStream: InputStream - 待压缩的输入流。
- wrap!: WrapType - 待解压数据格式，默认值为 DeflateFormat。
- bufLen!: Int64 - 输入流缓冲区的大小，取值范围为 (0, Int64.Max]，默认 512 字节。

异常：

- ZlibException - 如果 `bufLen` 小于等于 0，输入流分配内存失败，或待解压资源初始化失败，抛出异常。
