<!-- cj-doc kind="api-member" level="6" id="std.io.class.chainedinputstream.init" parent="std.io.class.chainedinputstream" -->
# ChainedInputStream<T> where T <: InputStream.init

[← ChainedInputStream<T> where T <: InputStream](index.md)

## 签名

```cangjie role=signature
public init(input: Array<T>)
```

创建 ChainedInputStream 实例。

## 契约

参数：

- input: Array\<T> - 绑定指定输入流数组。

异常：

- IllegalArgumentException - 当 input 为空时，抛出异常。
