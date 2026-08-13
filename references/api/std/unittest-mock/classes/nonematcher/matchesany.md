<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.nonematcher.matchesany" parent="std.unittest.mock.class.nonematcher" -->
# NoneMatcher.matchesAny

[← NoneMatcher](index.md)

## 签名

```cangjie role=signature
public override func matchesAny(arg: Any): Bool
```

匹配任意输入值，值为 None 时返回 `true` 。

## 契约

参数：

- arg: Any - 待匹配的入参值。

返回值：

- Bool - 当输入为 None 时返回 `true` ，否则返回 `false` 。
