<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzerbuilder.init" parent="stdx.fuzz.fuzz.class.fuzzerbuilder" -->
# FuzzerBuilder.init

[← FuzzerBuilder](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init((Array<UInt8>) -> Int32)

### 签名

```cangjie role=signature
public init(targetFunction: (Array<UInt8>) -> Int32)
```

根据以 UInt8 数组为参数，以 Int32 为返回值的目标函数，创建 FuzzerBuilder 实例。

### 契约

参数：

- targetFunction: (Array\<UInt8>) ->Int32 - 以 UInt8 数组为参数，以 Int32 为返回值的目标函数。

## init((FuzzDataProvider) -> Int32)

### 签名

```cangjie role=signature
public init(targetFunction: (FuzzDataProvider) -> Int32)
```

根据以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数，创建 FuzzerBuilder 实例。

### 契约

参数：

- targetFunction: (FuzzDataProvider) ->Int32 - 以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数。
