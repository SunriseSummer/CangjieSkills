<!-- cj-doc kind="api-member" level="6" id="std.sync.class.mutex.trylock" parent="std.sync.class.mutex" -->
# Mutex.tryLock

[← Mutex](index.md)

## 签名

```cangjie role=signature
public func tryLock(): Bool
```

尝试锁定互斥体。

## 契约

返回值：

- Bool - 如果互斥体已被锁定，则返回 `false`；反之，则锁定互斥体并返回 `true`。
