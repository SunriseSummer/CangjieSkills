<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssessioncontext.fromname" parent="stdx.net.tls.class.tlssessioncontext" -->
# TlsSessionContext.fromName

[← TlsSessionContext](index.md)

## 签名

```cangjie role=signature
public static func fromName(name: String): TlsSessionContext
```

通过名称创建 TlsSessionContext 实例。

## 契约

通过 TlsSessionContext 保存的名称获取 TlsSessionContext 对象。该名称用于区分 TLS 服务器，因此客户端依赖此名称来避免意外，尝试恢复与错误的服务器的连接。这里不一定使用加密安全名称，因为底层实现可以完成这项工作。从此函数返回的具有相同名称的两个 TlsSessionContext 可能不相等，并且不保证可替换。尽管它们是从相同的名称创建的，因此服务器实例应该在整个生命周期内创建一个 TlsSessionContext ，并且在每次 TlsSocket.server() 调用中使用它。

参数：

- name: String - 会话上下文名称。

返回值：

- TlsSessionContext - 会话上下文。
