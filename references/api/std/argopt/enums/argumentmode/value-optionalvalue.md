<!-- cj-doc kind="api-member" level="6" id="std.argopt.enum.argumentmode.value-optionalvalue" parent="std.argopt.enum.argumentmode" -->
# ArgumentMode.OptionalValue

[← ArgumentMode](index.md)

## 签名

```cangjie role=signature
OptionalValue
```

选项值可省略；长选项只接受 `--option=value` 或 `--option`，短选项接受 `-ovalue` 或 `-o`。省略值及显式空值都会向回调传入空字符串，二者不能由回调区分。

## 契约

参数形态：

- 长选项只接受 `--option=value` 或 `--option`，不会把后续独立参数当作可选值。
- 短选项接受 `-ovalue` 或 `-o`。
- 省略值时回调收到空字符串；显式空值 `--option=` 也得到空字符串，回调无法区分这两种输入。需要区分时不要使用 OptionalValue，应重新设计选项契约。
