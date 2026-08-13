<!-- cj-doc kind="api-member" level="6" id="std.core.class.error.getstacktrace" parent="std.core.class.error" -->
# Error.getStackTrace

[← Error](index.md)

## 签名

```cangjie role=signature
public func getStackTrace(): Array<StackTraceElement>
```

获取堆栈信息，每一条堆栈信息用一个 StackTraceElement 实例表示，最终返回一个 StackTraceElement 的数组。

## 契约

返回值：

- Array\<StackTraceElement> - 堆栈信息数组。
