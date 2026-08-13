<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.operator-eq" parent="std.fs.struct.path" -->
# Path.==

[← Path](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: Path): Bool
```

判断 Path 是否相等。

## 契约

判等时将对 Path 进行规范化，如果规范化后的字符串相等，则认为两个 Path 实例相等。规范化规则详见函数 normalize。

参数：

- that: Path - 另一个 Path。

返回值：

- Bool - true，是同一路径；false，不是同一路径。
