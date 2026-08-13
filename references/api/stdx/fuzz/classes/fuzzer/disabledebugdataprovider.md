<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzer.disabledebugdataprovider" parent="stdx.fuzz.fuzz.class.fuzzer" -->
# Fuzzer.disableDebugDataProvider

[← Fuzzer](index.md)

## 签名

```cangjie role=signature
public func disableDebugDataProvider(): Unit
```

关闭调试信息打印功能，当 FuzzDataProvider.consumeXXX 被调用时，返回值将不被打印到 `stdout`。
