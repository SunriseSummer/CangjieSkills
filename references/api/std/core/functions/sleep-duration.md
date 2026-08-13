<!-- cj-doc kind="api-member" level="5" id="std.core.func.sleep-duration" parent="std.core" -->
# sleep(Duration)

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func sleep(dur: Duration): Unit
```

休眠当前线程。

## 契约

若 `dur` 小于等于 Duration.Zero，当前线程会让出运行权。

参数：

- dur: Duration - 线程休眠的时长。
