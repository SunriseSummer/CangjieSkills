<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.enum.optionvalidity" parent="std.unittest.common" -->
# OptionValidity

[← std.unittest.common](../../index.md)

`OptionValidity`

代表选项值验证的结果的枚举值。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`UnknownOptionType`](value-unknownoptiontype.md) | 未知状态，仅在验证出现内部错误时出现。 |
| [`InvalidOption(String)`](value-invalidoption-string.md) | 选项验证无效，包含无效的原因。 |
| [`ValidOption(ConfigurationKey)`](value-validoption-configurationkey.md) | 选项值有效，包含选项值在配置项中对应键值对的键名。 |
