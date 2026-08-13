<!-- cj-doc kind="api-member" level="6" id="std.sync.enum.catchupstyle.value-skip" parent="std.sync.enum.catchupstyle" -->
# CatchupStyle.Skip

[← CatchupStyle](index.md)

## 签名

```cangjie role=signature
Skip
```

该策略下，每个任务的开始时间间隔固定，当任务执行时间大于设定的任务触发间隔时间时，将跳过后面错过的时间点，以尽快追平。
