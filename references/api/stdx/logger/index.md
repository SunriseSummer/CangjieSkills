<!-- cj-doc kind="api-package" level="4" id="stdx.logger" parent="api.stdx" -->
# stdx.logger

[← stdx 包索引](../index.md)

提供文本格式和 `JSON` 格式日志打印功能。

包路径：`stdx.logger`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`JsonLogger <: Logger`](classes/jsonlogger/index.md) | 此类实现了输出 `JSON` 格式的日志打印功能，形如 `{"time":"2024-07-27T11:51:59+08:00","level":"INFO","msg":"foo","name":"bar"}`。 |
| [`SimpleLogger <: Logger`](classes/simplelogger/index.md) | 此类实现了输出文本格式的日志打印功能，形如 `2024-07-27T11:50:47.6616733+08:00 INFO foo name="bar"`。 |
| [`TextLogger <: Logger`](classes/textlogger/index.md) | 此类实现了输出文本格式的日志打印功能，形如 `time=2024-07-27T11:52:40.3226881+08:00 level="INFO" msg="foo" name="bar"`。 |
