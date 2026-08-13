<!-- cj-doc kind="api-member" level="6" id="std.sync.class.mutex.init" parent="std.sync.class.mutex" -->
# Mutex.init

[← Mutex](index.md)

## 签名

```cangjie role=signature
public init()
```

创建可重入互斥锁。

## 契约

异常：

- IllegalSynchronizationStateException - 当出现系统错误时，抛出异常。
