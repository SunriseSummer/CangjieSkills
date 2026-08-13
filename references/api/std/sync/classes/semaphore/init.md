<!-- cj-doc kind="api-member" level="6" id="std.sync.class.semaphore.init" parent="std.sync.class.semaphore" -->
# Semaphore.init

[← Semaphore](index.md)

## 签名

```cangjie role=signature
public init(count: Int64)
```

创建一个 Semaphore 对象并初始化内部计数器的值。

## 契约

参数：

- count: Int64 - 计数器初始值, 取值范围 0, [Int64.Max]。

异常：

- IllegalArgumentException - 参数 count 为负数时抛出异常。
