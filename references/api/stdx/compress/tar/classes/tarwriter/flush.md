<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tarwriter.flush" parent="stdx.compress.tar.class.tarwriter" -->
# TarWriter.flush

[← TarWriter](index.md)

## 签名

```cangjie role=signature
public func flush(): Unit
```

刷新内部流。

## 异常

- TarException - 如果写入已结束（调用 finish() 之后），则抛出异常。

