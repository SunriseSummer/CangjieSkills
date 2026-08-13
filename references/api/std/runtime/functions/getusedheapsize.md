<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.getusedheapsize" parent="std.runtime" -->
# getUsedHeapSize()

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func getUsedHeapSize(): Int64
```

在 Linux 平台下获取仓颉堆实际占用的物理内存大小，单位为 byte。

## 契约

功能：在 Linux 平台下获取仓颉堆实际占用的物理内存大小，单位为 byte。在 Windows 及 macOs 平台下获取仓颉进程实际占用的物理内存大小，单位为 byte。

返回值：

- Int64 - 仓颉堆或仓颉进程实际占用的物理内存大小，单位为 byte。
