<!-- cj-doc kind="api-member" level="6" id="stdx.fuzz.fuzz.class.fuzzer.enablefakecoverage" parent="stdx.fuzz.fuzz.class.fuzzer" -->
# Fuzzer.enableFakeCoverage

[← Fuzzer](index.md)

## 签名

```cangjie role=signature
public func enableFakeCoverage(): Unit
```

创建一块虚假的覆盖率反馈区域，保持 Fuzz 持续进行。

## 契约

功能：创建一块虚假的覆盖率反馈区域，保持 Fuzz 持续进行。在 FuzzDataProvider 模式下，前几轮运行时可能由于数据不足而导致没有覆盖率，libfuzzer 会退出。该功能默认为关闭。
