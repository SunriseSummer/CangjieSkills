<!-- cj-doc kind="api-member" level="5" id="std.process.func.findprocess-int64" parent="std.process" -->
# findProcess(Int64)

[← std.process](../index.md)

## 签名

```cangjie role=signature
public func findProcess(pid: Int64): Process
```

根据输入进程 `id` 绑定一个进程实例。

## 契约

参数：

- pid: Int64 - 进程 `id`。

返回值：

- Process - 返回进程 `id` 对应的进程实例。

异常：

- IllegalArgumentException - 当输入进程 `id` 大于 Int32 最大值或小于 `0`时，抛出异常。
- ProcessException - 当内存分配失败或 `pid` 对应的进程不存在时，抛出异常。
