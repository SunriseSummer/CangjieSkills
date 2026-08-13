<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressoutputstream.write" parent="stdx.compress.zlib.class.decompressoutputstream" -->
# DecompressOutputStream.write

[← DecompressOutputStream](index.md)

## 签名

```cangjie role=signature
public func write(inBuf: Array<Byte>): Unit
```

将指定字节数组中的数据进行解压，并写入输出流，当数据全部解压完成并写入输出流，函数返回。

## 契约

参数：

- inBuf: Array\<Byte> - 待解压的字节数组。

异常：

- ZlibException - 如果当前解压输出流已经被关闭，或解压数据失败，抛出异常。
