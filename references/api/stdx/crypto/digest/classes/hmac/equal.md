<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.hmac.equal" parent="stdx.crypto.digest.class.hmac" -->
# HMAC.equal

[← HMAC](index.md)

## 签名

```cangjie role=signature
public static func equal(mac1: Array<Byte>, mac2: Array<Byte>): Bool
```

比较两个信息摘要是否相等，且不泄露比较时间，即比较不采用传统短路原则，从而防止 timing attack 类型的攻击。

## 契约

参数：

- mac1: Array\<Byte> - 需要比较的信息摘要序列。
- mac2: Array\<Byte> - 需要比较的信息摘要序列。

返回值：

- Bool - 信息摘要是否相同，true 相同，false 不相同。
