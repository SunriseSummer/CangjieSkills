<!-- cj-doc kind="api-member" level="6" id="std.sync.class.readwritelock.isfair" parent="std.sync.class.readwritelock" -->
# ReadWriteLock.isFair

[← ReadWriteLock](index.md)

## 签名

```cangjie role=signature
public func isFair(): Bool
```

获取读写锁是否为 “公平” 模式。

## 契约

返回值：

- Bool - `true` 表示 “公平” 模式，否则表示 “非公平” 模式。
