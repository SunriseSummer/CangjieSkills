<!-- cj-doc kind="api-member" level="5" id="std.env.func.getvariables" parent="std.env" -->
# getVariables()

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func getVariables(): Array<(String, String)>
```

获取当前进程环境变量。

## 契约

功能：获取当前进程环境变量。对于 Windows 平台，只能获取当前进程的环境变量，其他场景下无法在非特权 API 下获取到本属性。

返回值：

- Array\<(String, String)> - 当前进程环境变量。

异常：

- EnvException - 当进程不存在、对应进程为僵尸进程或在其他不支持的场景下无法获取进程环境变量时，抛出异常。
