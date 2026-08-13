<!-- cj-doc kind="api-member" level="6" id="std.sync.enum.catchupstyle.value-burst" parent="std.sync.enum.catchupstyle" -->
# CatchupStyle.Burst

[← CatchupStyle](index.md)

## 签名

```cangjie role=signature
Burst
```

该策略下，每个任务的开始时间间隔固定，当任务执行时间大于设定的任务触发间隔时间时，依次执行错过的时间点上的任务，直到追平。
