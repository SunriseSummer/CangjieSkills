<!-- cj-doc kind="api-member" level="6" id="std.io.class.multioutputstream.init" parent="std.io.class.multioutputstream" -->
# MultiOutputStream<T> where T <: OutputStream.init

[← MultiOutputStream<T> where T <: OutputStream](index.md)

## 签名

```cangjie role=signature
public init(output: Array<T>)
```

创建 MultiOutputStream 实例。

## 契约

参数：

- output: Array\<T> - 绑定指定输出流数组。

异常：

- IllegalArgumentException - 当 output 为空时，抛出异常。
