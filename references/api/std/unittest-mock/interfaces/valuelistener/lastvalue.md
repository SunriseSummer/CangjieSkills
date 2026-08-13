<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.interface.valuelistener.lastvalue" parent="std.unittest.mock.interface.valuelistener" -->
# ValueListener<T>.lastValue

[← ValueListener<T>](index.md)

## 签名

```cangjie role=signature
func lastValue(): Option<T>
```

返回当前“值监听器”对象所处理的最后一个值。

## 契约

返回值：

- Option\<T> - 返回“值监听器”对象所处理的最后一个值，不存在时，返回 None 。
