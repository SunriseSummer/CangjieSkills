<!-- cj-doc kind="api-member" level="6" id="std.math.numeric.struct.bigint.parse" parent="std.math.numeric.struct.bigint" -->
# BigInt.parse

[← BigInt](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func parse(String)

适用扩展：[extend BigInt <: Parsable<BigInt>](extensions/extend-bigint-parsable-bigint.md)。

### 签名

```cangjie role=signature
public static func parse(value: String): BigInt
```

将字符串解析成一个 BigInt 结构体。

### 契约

字符串的规则如下，即开头是可选的符号（正号或负号），接进制前缀，再接一串字符串表示的数字：

IntegerString : SignString? BaseString? ValueString

- SignString : + | -

- BaseString : "0b" | "0B" | "0o" | "0O" | "0x" | "0X" | ""

- ValueString : Digits

    - Digits: Digit | Digit Digits

        - Digit : '0' ~ '9' | 'A' ~ 'Z' | 'a' ~ 'z'

            - 如果进制前缀是 "0b" 或 "0B"，则 Digit 取值范围应为 '0' ~ '1'；

            - 如果进制前缀是 "0o" 或 "0O"，则 Digit 取值范围应为 '0' ~ '7'；

            - 如果进制前缀是 "0x" 或 "0X"，则 Digit 取值范围应为 '0' ~ '9'、'a' ~ 'z' 或 'A' ~ 'Z'；

            - 如果进制前缀是空，则 Digit 取值范围应为 '0' ~ '9'。

参数：

- value: String - 用于构建 BigInt 结构体的字符串。字符串规则为，开头可选一个正号（+）或者负号（-）。接下来可选的进制前缀，默认为十进制，使用 "0b" 或 "0B" 表示二进制，使用 "0o" 或 "0O" 表示八进制，使用 "0x" 或 "0X" 表示十六进制。再接下来必选非空阿拉伯数字或大小写拉丁字母的字符序列，大小写字符含义一样，'a' 和 'A' 的大小等于十进制的 10，'b' 和 'B' 的大小等于十进制的 11，以此类推。序列中的字符应符合相应进制的字符集要求。

返回值：

- BigInt - 解析出的 BigInt 结构体。

异常：

- IllegalArgumentException - 如果字符串 `value` 不符合上述规则，抛此异常。

## static func parse(String, Int64)

适用扩展：[extend BigInt <: RadixConvertible<BigInt>](extensions/extend-bigint-radixconvertible-bigint.md)。

### 签名

```cangjie role=signature
public static func parse(value: String, radix!: Int64): BigInt
```

根据指定进制将字符串解析成一个 BigInt 结构体，支持 2 进制到 36 进制。

### 契约

字符串的规则如下，即开头是可选的符号（正号或负号），接一串字符串表示的数字：

IntegerString : SignString? ValueString

- SignString : + | -

- ValueString : Digits

    - Digits: Digit | Digit Digits

        - Digit : '0' ~ '9' | 'A' ~ 'Z' | 'a' ~ 'z'

            - 如果 Digit 在 '0' ~ '9' 内， 需要满足 (Digit - '0') < radix；

            - 如果 Digit 在 'A' ~ 'Z' 内， 需要满足 (Digit - 'A') + 10 < radix；

            - 如果 Digit 在 'a' ~ 'z' 内， 需要满足 (Digit - 'A') + 10 < radix。

参数：

- value: String - 用于构建 BigInt 结构体的字符串。字符串规则为，开头可选一个正号（+）或者负号（-）。接下来必选非空阿拉伯数字或大小写拉丁字母的字符序列，大小写字符含义一样，'a' 和 'A' 的大小等于十进制的 10，'b' 和 'B' 的大小等于十进制的 11，以此类推。序列中的字符大小不得大于等于进制大小。
- radix!: Int64 - 进制。字符串所表示的进制，范围为 [2, 36]。

返回值：

- BigInt - 解析出的 BigInt 结构体。

异常：

- IllegalArgumentException - 如果字符串 `value` 不符合上述规则，或 `radix` 表示的进制不在 [2, 36] 区间内，抛此异常。
