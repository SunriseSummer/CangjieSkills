<!-- cj-doc kind="api-member" level="6" id="std.unittest.struct.immutableinputprovider.createorexisting" parent="std.unittest.struct.immutableinputprovider" -->
# ImmutableInputProvider<T>.createOrExisting

[← ImmutableInputProvider<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func createOrExisting(T, Int64)

### 签名

```cangjie role=signature
public static func createOrExisting(arg: T, x!:Int64=0): ImmutableInputProvider<T>
```

创建或获取一个 ImmutableInputProvider 对象。

### 契约

参数：

- arg: T - 提供器需复制的参数。
- x!: Int64 - 为实现重载而增加的参数。

返回值：

- ImmutableInputProvider\<T> - 输入提供器。

## static func createOrExisting<U>(U)

### 签名

```cangjie role=signature
public static func createOrExisting<U>(arg: U): U where U <: BenchInputProvider<T>
```

创建或获取一个 BenchInputProvider 的子类型对象。

### 契约

参数：

- arg: T - 提供器需复制的参数。

返回值：

- U - 输入提供器。
