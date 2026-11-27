<!-- cj-doc kind="api-member" level="5" id="std.env.func.getcommand" parent="std.env" -->
# getCommand()

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func getCommand(): String
```

获取进程命令。

## 契约

返回值：

- String - 当前进程命令。

异常：

- EnvException - 当进程不存在或对应进程为僵尸进程，无法获取进程名时，抛出异常。
