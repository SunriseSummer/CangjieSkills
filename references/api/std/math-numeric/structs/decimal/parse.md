<!-- cj-doc kind="api-member" level="7" id="std.math.numeric.struct.decimal.parse" parent="std.math.numeric.struct.decimal.extension.extend-decimal-parsable-decimal" -->
# Decimal.parse

[← extend Decimal <: Parsable<Decimal>](extensions/extend-decimal-parsable-decimal.md)

## 签名

```cangjie role=signature
public static func parse(value: String): Decimal
```

通过规定格式字符串构建 Decimal 结构体。

## 契约

功能：通过规定格式字符串构建 Decimal 结构体。默认采用精度值为 0，即无限精度进行构建。字符串需满足如下格式，即开头可选的符号（正号或负号），接 ValueString 字符串，再接可选的 ExponentString 字符串：

Decimal 字符串: SignString? ValueString ExponentString?

- SignString: + | -

- ValueString: IntegerPart.(FractionPart)? | .FractionPart | IntegerPart

    - IntegerPart：Digits

    - FractionPart：Digits

    - Digits: Digit | Digit Digits

        - Digit：'0' ~ '9'

- ExponentString: ExponentIndicator (SignString)? IntegerPart

    - ExponentIndicator：e | E

参数：

- value: String - 规定格式字符串。

返回值：

- Decimal - 解析出的 Decimal 结构体。

异常：

- IllegalArgumentException - 当入参字符串不满足规定格式时，抛此异常。
- OverflowException - 当构建值标度溢出时，抛此异常。
