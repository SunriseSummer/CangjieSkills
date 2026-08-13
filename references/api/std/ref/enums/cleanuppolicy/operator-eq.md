<!-- cj-doc kind="api-member" level="6" id="std.ref.enum.cleanuppolicy.operator-eq" parent="std.ref.enum.cleanuppolicy" -->
# CleanupPolicy.==

[← CleanupPolicy](index.md)

## 签名

```cangjie role=signature
public operator func ==(that: CleanupPolicy): Bool
```

对 `Enum CleanupPolicy` 判断是否相等。

## 契约

参数：

- that: CleanupPolicy - 被比较的枚举实例。

返回值：

- Bool - 当前回收策略与 `that` 回收策略相同时返回 `true`，否则返回 `false`。
