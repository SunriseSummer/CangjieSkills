<!-- cj-doc kind="api-type" level="5" id="std.sync.class.readwritelock" parent="std.sync" -->
# ReadWriteLock

[← std.sync](../../index.md)

`ReadWriteLock`

提供可重入读写锁相关功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`readLock: Lock`](prop-readlock.md) | 获取读锁。 |
| [`writeLock: UniqueLock`](prop-writelock.md) | 获取写锁。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(fair!: Bool = false)`](init.md) | 构造读写锁。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isFair(): Bool`](isfair.md) | 获取读写锁是否为 “公平” 模式。 |
