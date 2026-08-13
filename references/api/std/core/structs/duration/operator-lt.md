<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.operator-lt" parent="std.core.struct.duration" -->
# Duration.<

[← Duration](index.md)

## 签名

```cangjie role=signature
public operator func <(r: Duration): Bool
```

判断当前 Duration 实例是否小于 `r`。

## 契约

参数：

- r: Duration - Duration 实例。

返回值：

- Bool - `true` 或 `false`。当前 Duration 实例小于 `r` 时，返回 `true`；否则，返回 `false`。
