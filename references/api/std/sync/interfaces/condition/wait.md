<!-- cj-doc kind="api-member" level="6" id="std.sync.interface.condition.wait" parent="std.sync.interface.condition" -->
# Condition.wait

[← Condition](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func wait()

### 签名

```cangjie role=signature
func wait(): Unit
```

当前线程挂起，直到对应的 `notify` 函数被调用。

### 契约

> **说明：**
>
> 线程在进入等待时会释放对应的互斥锁，被唤醒后再次持有互斥锁。

异常：

- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。

## func wait(Duration)

### 签名

```cangjie role=signature
func wait(timeout!: Duration): Bool
```

当前线程挂起，直到对应的 `notify` 函数被调用，或者挂起时间超过 `timeout`。

### 契约

> **说明：**
>
> 线程在进入等待时会释放对应的互斥锁，被唤醒后再次持有互斥锁。

参数：

- timeout!: Duration - 挂起时间，其默认值为 Duration.Max。

返回值：

- Bool - 如果 当前条件变量 被其他线程唤醒，返回 `true`；如果超时，则返回 `false`。

异常：

- IllegalArgumentException - 如果 `timeout` 小于等于 Duration.Zero，抛出异常。
- IllegalSynchronizationStateException - 如果当前线程没有持有该互斥体，抛出异常。
