<!-- cj-doc kind="api-member" level="6" id="std.time.class.timezone.operator-ne" parent="std.time.class.timezone" -->
# TimeZone.!=

[← TimeZone](index.md)

## 签名

```cangjie role=signature
public operator func !=(r: TimeZone): Bool
```

判断当前 TimeZone 实例的引用是否不等于 `r` 的引用。

## 契约

参数：

- r: TimeZone - TimeZone 实例。

返回值：

- Bool - `true` 或 `false`。当前 TimeZone 实例的引用不等于 `r` 的引用时，返回 `true`；否则，返回 `false`。
