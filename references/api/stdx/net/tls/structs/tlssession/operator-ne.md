<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlssession.operator-ne" parent="stdx.net.tls.struct.tlssession" -->
# TlsSession.!=

[← TlsSession](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: TlsSession): Bool
```

判断会话 id 是否不同。

## 契约

参数：

- other: TlsSession - 待比较的会话对象。

返回值：

- Bool - 若会话 id 不同，则返回 `true`，否则返回 `false`。
