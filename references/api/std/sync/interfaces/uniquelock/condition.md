<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.uniquelock.condition" parent="std.sync.interface.uniquelock" -->
# UniqueLock.condition

[← UniqueLock](index.md)

## 签名

```cangjie role=signature
func condition(): Condition
```

创建一个与该 Lock 相关的 Condition。

## 契约

可能被用来实现 “单 Lock 多等待队列” 的并发原语。

返回值：

- Condition - 创建的与该 Lock 相关的 Condition 实例。

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。
