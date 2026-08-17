<!-- cj-doc kind="api-member" level="6" id="stdx.compress.tar.class.tarentry.prop-stream" parent="stdx.compress.tar.class.tarentry" -->
# TarEntry.stream

[← TarEntry](index.md)

## 签名

```cangjie role=signature
public prop stream: ?InputStream
```

获取当前条目的输入流。如果实例由 TarReader 创建，则本属性返回流中为条目的数据，若条目没有数据则返回 None。如果实例由构造函数创建，则本属性返回的是创建的文件流，传入 TarWriter 时会调用该属性用于写入条目数据。

类型：Option<InputStream>

