<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.interface.valuelistener.addcallback" parent="std.unittest.mock.interface.valuelistener" -->
# ValueListener<T>.addCallback

[← ValueListener<T>](index.md)

## 签名

```cangjie role=signature
func addCallback(callback: (T) -> Unit): Unit
```

为当前“值监听器”对象增加闭包函数，该函数将处理传入的参数值。

## 契约

参数：

- callback: (T) ->Unit - 处理参数值的闭包函数。
