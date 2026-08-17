<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tarwriter.finish" parent="stdx.compress.tar.class.tarwriter" -->
# TarWriter.finish

[← TarWriter](index.md)

## 签名

```cangjie role=signature
public func finish(): Unit
```

写入 tar 结尾标志，即 1024 个空字节，结束 tar 格式的写入。

## 异常

- TarException - 如果写入已结束，或者写入失败，则抛出异常。

