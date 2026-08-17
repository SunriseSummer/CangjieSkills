<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.paxtarentry.getpaxdata" parent="stdx.compress.tar.class.paxtarentry" -->
# PaxTarEntry.getPaxData

[← PaxTarEntry](index.md)

## 签名

```cangjie role=signature
public func getPaxData(key: String): ?String
```

获取当前条目的 Pax 数据。

## 参数

- key: String - Pax 数据的键。

## 返回值

- Option<String> - 如果存在对应键的 Pax 数据，则返回其值，否则返回 None。

