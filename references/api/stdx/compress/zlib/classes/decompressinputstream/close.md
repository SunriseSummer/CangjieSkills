<!-- cj-doc kind="api-member" level="6" id="stdx.compress.zlib.class.decompressinputstream.close" parent="stdx.compress.zlib.class.decompressinputstream" -->
# DecompressInputStream.close

[← DecompressInputStream](index.md)

## 签名

```cangjie role=signature
public func close(): Unit
```

关闭解压输入流。

## 契约

当前 DecompressInputStream 实例使用完毕后必须调用此函数来释放其所占内存资源，以免造成内存泄漏。调用该函数前需确保 read 函数已返回 0，否则可能导致绑定的 InputStream 并未被全部解压。

异常：

- ZlibException - 如果释放解压资源失败，抛出异常。
