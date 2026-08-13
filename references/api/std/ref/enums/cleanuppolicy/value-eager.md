<!-- cj-doc kind="api-member" level="6" id="std.ref.enum.cleanuppolicy.value-eager" parent="std.ref.enum.cleanuppolicy" -->
# CleanupPolicy.EAGER

[← CleanupPolicy](index.md)

## 签名

```cangjie role=signature
EAGER
```

指定 WeakRef 实例的清理策略为 `EAGER`，在该清理策略下，GC 会尽快回收 WeakRef 指向的对象，但不能保证其立即回收，也不能保证其一定会被回收。
