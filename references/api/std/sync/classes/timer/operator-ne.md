<!-- cj-doc kind="api-member" level="6" id="std.sync.class.timer.operator-ne" parent="std.sync.class.timer" -->
# Timer.!=

[← Timer](index.md)

## 签名

```cangjie role=signature
public operator func !=(rhs: Timer): Bool
```

判断当前 Timer 与入参 `rhs` 指定的 Timer 是否不是同一个实例。

## 契约

参数：

- rhs: Timer - 待比较的另一个 Timer 对象。

返回值：

- Bool - 若两个 Timer 不是同一个实例，则返回 `true`，否则返回 `false`。
