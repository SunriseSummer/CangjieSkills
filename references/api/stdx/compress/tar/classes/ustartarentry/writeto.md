<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.ustartarentry.writeto" parent="stdx.compress.tar.class.ustartarentry" -->
# UstarTarEntry.writeTo

[← UstarTarEntry](index.md)

## 签名

```cangjie role=signature
public override func writeTo(target: OutputStream): Unit
```

将当前条目写入到指定的输出流中。

## 参数

- target: OutputStream - 指定输出流。

## 异常

- TarException - 如果字段超出格式要求或写入失败，则抛出异常。

