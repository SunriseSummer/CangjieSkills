<!-- cj-doc kind="api-member" level="5" id="std.deriving.macro.derive" parent="std.deriving" -->
# @Derive

[← std.deriving](../index.md)

## 签名

```cangjie role=signature
@Derive
```

`@Derive[...]` 为类型自动生成指定接口实现；使用前导入 `std.deriving.*`，并确保字段或枚举负载也满足目标接口约束。
