<!-- cj-doc kind="api-member" level="5" id="std.env.func.getworkingdirectory" parent="std.env" -->
# getWorkingDirectory()

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func getWorkingDirectory(): Path
```

获取当前进程工作路径。

## 契约

功能：获取当前进程工作路径。对于 Windows 平台，只能获取当前进程的工作路径，其他场景下无法在非特权 API 下获取到本属性。

返回值：

- Path - 当前进程工作路径。

异常：

- EnvException - 当进程不存在、对应进程为僵尸进程或在其他不支持的场景下无法获取进程工作路径时，抛出异常。
