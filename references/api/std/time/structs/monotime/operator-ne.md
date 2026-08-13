<!-- cj-doc kind="api-member" level="6" id="std.time.struct.monotime.operator-ne" parent="std.time.struct.monotime" -->
# MonoTime.!=

[← MonoTime](index.md)

## 签名

```cangjie role=signature
public operator func !=(r: MonoTime): Bool
```

判断当前 MonoTime 实例是否不等于 `r`。

## 契约

参数：

- r: MonoTime - 单调时间。

返回值：

- Bool - `true` 或 `false`。当前 MonoTime 实例不等于 `r` 时，返回 `true`；否则，返回 `false`。
