<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.httpheaders.iterator" parent="stdx.net.http.class.httpheaders" -->
# HttpHeaders.iterator

[← HttpHeaders](index.md)

## 签名

```cangjie role=signature
public func iterator(): Iterator<(String, Collection<String>)>
```

获取迭代器，可用于遍历所有键值对。

## 契约

返回值：

- Iterator\<(String, Collection\<String>)> - 该键值集的迭代器。
