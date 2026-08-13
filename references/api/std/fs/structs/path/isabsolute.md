<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.isabsolute" parent="std.fs.struct.path" -->
# Path.isAbsolute

[← Path](index.md)

## 签名

```cangjie role=signature
public func isAbsolute(): Bool
```

判断 Path 是否是绝对路径。

## 契约

功能：判断 Path 是否是绝对路径。在 Unix 中，以 `/` 开头的路径为绝对路径。

返回值：

- Bool - true，是绝对路径；false，不是绝对路径。

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。
