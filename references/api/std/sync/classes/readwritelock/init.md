<!-- cj-doc kind="api-member" level="6" id="std.sync.class.readwritelock.init" parent="std.sync.class.readwritelock" -->
# ReadWriteLock.init

[← ReadWriteLock](index.md)

## 签名

```cangjie role=signature
public init(fair!: Bool = false)
```

构造读写锁。

## 契约

参数：

- fair!: Bool - 读写锁是否为公平模式，默认值为 `false`，即构造 “非公平” 的读写锁。
