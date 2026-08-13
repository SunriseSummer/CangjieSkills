<!-- cj-doc kind="api-member" level="5" id="std.core.func.zerovalue-t" parent="std.core" -->
# zeroValue<T>()

[← std.core](../index.md)

## 签名

```cangjie role=signature
public unsafe func zeroValue<T>(): T
```

获取一个已全零初始化的 T 类型实例。

## 契约

> **注意：**
>
> 通过该函数获取到的实例一定要赋值为正常初始化的值再使用，否则将引发程序崩溃。

返回值：

- T - 一个已全零初始化的 T 类型实例。
