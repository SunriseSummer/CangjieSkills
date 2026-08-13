<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.startcpuprofiling" parent="std.runtime" -->
# startCPUProfiling()

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func startCPUProfiling(): Unit
```

启动 CPU profiler 跟踪。

## 契约

> **注意：**
>
> startCPUProfiling 与 stopCPUProfiling(Path) 两个函数必须一一对应。

异常：

- ProfilingInfoException - 若调用了 startCPUProfiling 后，没有调用 stopCPUProfiling(Path)，而是又调用了 startCPUProfiling 则抛出异常。
