<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.operator-ne" parent="std.time.struct.datetime" -->
# DateTime.!=

[← DateTime](index.md)

## 签名

```cangjie role=signature
public operator func !=(r: DateTime): Bool
```

判断当前 DateTime 实例是否不等于 `r`。

## 契约

若两个 DateTime 不相等，那么它们指向的不是同一 UTC 时间。

参数：

- r: DateTime - DateTime 实例。

返回值：

- Bool - `true` 或 `false`。当前 DateTime 实例不等于 `r` 时，返回 `true`；否则，返回 `false`。
