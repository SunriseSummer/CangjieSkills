<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.build" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.build

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func build(): Server
```

根据设置的参数构建 Server 实例。

## 契约

此处会对各参数的值进行检查，如果取值非法，将抛出异常。各参数的取值范围详见设置参数相关的函数。

返回值：

- Server - 生成的 Server 实例。

异常：

- IllegalArgumentException - 当设置的参数非法时，抛出异常。
- IllegalFormatException 格式错误时，抛出异常。
