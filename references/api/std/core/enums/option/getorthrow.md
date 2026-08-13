<!-- cj-doc kind="api-member" level="6" id="std.core.enum.option.getorthrow" parent="std.core.enum.option" -->
# Option<T>.getOrThrow

[← Option<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func getOrThrow(() -> Exception)

### 签名

```cangjie role=signature
public func getOrThrow(exception: ()->Exception): T
```

获得值或抛出指定异常。

### 契约

参数：

- exception: () ->Exception - 异常函数，如果当前实例值是 None，将执行该函数并将其返回值作为异常抛出。

返回值：

- T - 如果当前实例值是 Some\<T>，返回类型为 `T` 的实例。

异常：

- Exception - 如果当前实例是 None，抛出异常函数返回的异常。

## func getOrThrow()

### 签名

```cangjie role=signature
public func getOrThrow(): T
```

获得值或抛出异常。

### 契约

返回值：

- T - 如果当前实例值是 Some\<T>，返回类型为 `T` 的实例。

异常：

- NoneValueException - 如果当前实例是 None，抛出异常。
