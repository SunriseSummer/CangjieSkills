<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.compare" parent="std.time.struct.datetime" -->
# DateTime.compare

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func compare(rhs: DateTime): Ordering
```

判断一个 DateTime 实例与参数 `rhs` 的大小关系。

## 契约

功能：判断一个 DateTime 实例与参数 `rhs` 的大小关系。如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

参数：

- rhs: DateTime - 参与比较的 DateTime 实例。

返回值：

- Ordering - DateTime 实例与 `rhs` 大小关系。
