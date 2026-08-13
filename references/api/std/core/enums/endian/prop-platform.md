<!-- cj-doc kind="api-member" level="6" id="std.core.enum.endian.prop-platform" parent="std.core.enum.endian" -->
# Endian.Platform

[← Endian](index.md)

## 签名

```cangjie role=signature
public static prop Platform: Endian
```

获取所在运行平台的端序。

## 契约

类型：Endian

异常：

- UnsupportedException - 当所运行平台返回的端序无法识别时，抛出异常。
