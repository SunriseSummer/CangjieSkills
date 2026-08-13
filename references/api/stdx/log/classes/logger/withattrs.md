<!-- cj-doc kind="api-member" level="6" id="stdx.log.class.logger.withattrs" parent="stdx.log.class.logger" -->
# Logger.withAttrs

[← Logger](index.md)

## 签名

```cangjie role=signature
public open func withAttrs(attrs: Array<Attr>): Logger
```

创建当前对象的副本，新的副本会包含指定的属性。

## 契约

参数：

- attrs: Array\<Attr> - 日志数据键值对属性。

返回值：

- Logger - Logger 类的对象实例。
