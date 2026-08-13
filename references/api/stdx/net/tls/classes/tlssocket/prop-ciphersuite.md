<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.prop-ciphersuite" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.cipherSuite

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public prop cipherSuite: CipherSuite
```

握手后协商到的加密套。

## 契约

> **说明：**
>
> 密码套件包含加密算法，用于消息认证的散列函数，密钥交换算法。

类型：CipherSuite

异常：

- TlsException - 当套接字未完成 TLS 握手或本端 TLS 套接字已关闭时，抛出异常。
