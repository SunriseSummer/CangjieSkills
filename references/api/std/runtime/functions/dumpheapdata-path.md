<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.dumpheapdata-path" parent="std.runtime" -->
# dumpHeapData(Path)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func dumpHeapData(path: Path): Unit
```

生成堆内存快照信息，写入指定路径的文件。

## 契约

参数：

- path: Path - 生成堆内存快照文件的文件路径。

异常：

- MemoryInfoException - 生成堆内存快照失败时，抛出此异常。
