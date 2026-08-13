<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.interface.valuelistener.oneach" parent="std.unittest.mock.interface.valuelistener" -->
# ValueListener<T>.onEach

[← ValueListener<T>](index.md)

## 签名

```cangjie role=signature
static func onEach(callback: (T) -> Unit): ValueListener<T>
```

创建一个新的“值监听器”对象，带有一个处理参数的闭包方法。

## 契约

参数：

- callback: (T) ->Unit - 处理参数值的闭包函数。

返回值：

- ValueListener\<T> - “值监听器”对象。
