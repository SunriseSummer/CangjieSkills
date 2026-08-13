<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.compare" parent="std.core.struct.duration" -->
# Duration.compare

[← Duration](index.md)

## 签名

```cangjie role=signature
public func compare(rhs: Duration): Ordering
```

比较当前 Duration 实例与另一个 Duration 实例的关系，如果大于，返回 Ordering.GT；如果等于，返回 Ordering.EQ；如果小于，返回 Ordering.LT。

## 契约

参数：

- rhs: Duration - 参与比较的 Duration 实例。

返回值：

- Ordering - 当前 Duration 实例与 `rhs` 的大小关系。
