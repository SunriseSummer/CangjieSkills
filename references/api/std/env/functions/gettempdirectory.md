<!-- cj-doc kind="api-member" level="5" id="std.env.func.gettempdirectory" parent="std.env" -->
# getTempDirectory()

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func getTempDirectory(): Path
```

获取当前进程临时目录的路径。

## 契约

功能：获取当前进程临时目录的路径。从环境变量中获取 TMPDIR、TMP、TEMP 和 TEMPDIR 环境变量。如果以上值在环境变量中均不存在，则默认返回 /tmp 目录。

返回值：

- Path - 当前进程临时目录的路径。
