<!-- cj-doc kind="api-member" level="6" id="std.time.struct.monotime.compare" parent="std.time.struct.monotime" -->
# MonoTime.compare

[← MonoTime](index.md)

## 签名

```cangjie role=signature
public func compare(rhs: MonoTime): Ordering
```

判断一个 MonoTime 实例与参数 `rhs` 的大小关系。

## 契约

功能：判断一个 MonoTime 实例与参数 `rhs` 的大小关系。如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

参数：

- rhs: MonoTime - 参与比较的 MonoTime 实例。

返回值：

- Ordering - 当前 MonoTime 实例与 `rhs` 大小关系。
