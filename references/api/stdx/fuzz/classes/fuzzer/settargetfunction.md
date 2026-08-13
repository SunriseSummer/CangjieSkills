<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzer.settargetfunction" parent="stdx.fuzz.fuzz.class.fuzzer" -->
# Fuzzer.setTargetFunction

[← Fuzzer](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func setTargetFunction((Array<UInt8>) -> Int32)

### 签名

```cangjie role=signature
public func setTargetFunction(targetFunction: (Array<UInt8>) -> Int32): Unit
```

设置 Fuzz 目标函数。

### 契约

参数：

- targetFunction: (Array\<UInt8>) ->Int32 - 以 UInt8 数组为参数，以 Int32 为返回值的目标函数。

## func setTargetFunction((FuzzDataProvider) -> Int32)

### 签名

```cangjie role=signature
public func setTargetFunction(targetFunction: (FuzzDataProvider) -> Int32): Unit
```

设置 Fuzz 目标函数。

### 契约

参数：

- targetFunction: (FuzzDataProvider) ->Int32 - 以 FuzzDataProvider 为参数，以 Int32 为返回值的目标函数。
