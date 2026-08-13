<!-- cj-doc kind="api-member" level="5" id="stdx.log.func.getgloballogger-array-attr" parent="stdx.log" -->
# getGlobalLogger(Array<Attr>)

[← stdx.log](../index.md)

## 签名

```cangjie role=signature
public func getGlobalLogger(attrs: Array<Attr>): Logger
```

获取 Logger 对象。

## 契约

> **说明：**
>
> 如果未传入 attrs 参数，那么获取的是同一个 Logger 对象，传入了 attrs 参数，则创建一个包含指定的属性的  Logger 对象副本。

参数：

- attrs: Array\<Attr> - 日志数据键值对属性，获取的 Logger 对象会包含这些属性。

返回值：

- Logger - Logger 类的对象实例。
