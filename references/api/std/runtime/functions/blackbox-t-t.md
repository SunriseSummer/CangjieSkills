<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.blackbox-t-t" parent="std.runtime" -->
# blackBox<T>(T)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func blackBox<T>(input: T): T
```

指示编译器传入的变量进入优化黑盒，无法进行死代码消除等优化。

## 契约

参数：

- input: T - 进入优化黑洞的变量。

返回值：

- T - 若变量仍需被使用，则可使用该返回值进行调用。
