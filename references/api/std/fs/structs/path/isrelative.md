<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.isrelative" parent="std.fs.struct.path" -->
# Path.isRelative

[← Path](index.md)

## 签名

```cangjie role=signature
public func isRelative(): Bool
```

判断 Path 是否是相对路径，其结果与函数 isAbsolute 结果相反。

## 契约

返回值：

- Bool - true，是相对路径；false，不是相对路径。

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。
