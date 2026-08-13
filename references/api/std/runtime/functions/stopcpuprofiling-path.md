<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.stopcpuprofiling-path" parent="std.runtime" -->
# stopCPUProfiling(Path)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func stopCPUProfiling(path: Path): Unit
```

停止 CPU profiler 跟踪，并将记录写入指定路径的文件。

## 契约

> **注意：**
>
> startCPUProfiling 与 stopCPUProfiling(Path) 两个函数必须一一对应。

参数：

- path: Path - 生成记录文件的文件路径。

异常：

- ProfilingInfoException - 若没有调用了 startCPUProfiling，直接调用 stopCPUProfiling(Path) 则抛出异常。
