<!-- cj-doc kind="api-member" level="6" id="std.process.class.process.prop-command" parent="std.process.class.process" -->
# Process.command

[← Process](index.md)

## 签名

```cangjie role=signature
public prop command: String
```

获取进程命令。

## 契约

类型：String

异常：

- ProcessException - 当进程不存在或对应进程为僵尸进程，无法获取进程命令时，抛出异常。
