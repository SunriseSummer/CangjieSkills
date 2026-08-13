<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzer.enabledebugdataprovider" parent="stdx.fuzz.fuzz.class.fuzzer" -->
# Fuzzer.enableDebugDataProvider

[← Fuzzer](index.md)

## 签名

```cangjie role=signature
public func enableDebugDataProvider(): Unit
```

启用调试信息打印功能，当 FuzzDataProvider.consumeXXX 被调用时，返回值将被打印到 `stdout`。

## 契约

功能：启用调试信息打印功能，当 FuzzDataProvider.consumeXXX 被调用时，返回值将被打印到 `stdout`。该功能默认为关闭。
