<!-- cj-doc kind="api-member" level="6" id="std.ref.enum.cleanuppolicy.value-deferred" parent="std.ref.enum.cleanuppolicy" -->
# CleanupPolicy.DEFERRED

[← CleanupPolicy](index.md)

## 签名

```cangjie role=signature
DEFERRED
```

指定 WeakRef 实例的清理策略为 `DEFERRED`，在该清理策略下，GC 会尽可能保证 WeakRef 中的对象存活，只有当可用内存不足时才回收它。
