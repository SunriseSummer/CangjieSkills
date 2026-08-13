<!-- cj-doc kind="example-leaf" level="4" id="examples.numeric.exact-decimal-value" parent="examples.numeric" -->
# 把金额换算为精确最小单位

[← 数值计算与转换](index.md)

用 `Decimal.tryParse`、`reScale` 和无标度 `value` 做精确最小单位换算，并用 `@Derive` 生成稳定值语义。

## 已验证示例

金额不要先转为浮点数。先用 `Decimal.tryParse` 保留解析失败，再用 `reScale` 明确标度和舍入规则，最后读取无标度 `value` 作为最小单位。需要作为集合键的领域值可用 `@Derive` 同时生成相等、哈希和字符串能力。

```cangjie cjtest=run id=guide.std.exact-decimal-value.run form=unit timeout=30s
package exact_decimal_value

import std.deriving.*
import std.math.*
import std.math.numeric.*

@Derive[Equatable, Hashable, ToString]
struct MoneyKey {
    let currency: String
    let scale: Int32

    init(currency: String, scale: Int32) {
        this.currency = currency
        this.scale = scale
    }
}

func toMinorUnits(text: String, scale: Int32): BigInt {
    let amount = match (Decimal.tryParse(text)) {
        case Some(value) => value
        case None => throw IllegalArgumentException("invalid decimal amount")
    }
    return amount.reScale(scale, roundingMode: RoundingMode.HalfEven).value
}

main(): Unit {
    let left = MoneyKey("USD", 2)
    let right = MoneyKey("USD", 2)
    println("minor=${toMinorUnits("12.345", 2)}")
    println("equal=${left == right}")
    println("sameHash=${left.hashCode() == right.hashCode()}")
}
```

预期标准输出：

```text cjtest=expect for=guide.std.exact-decimal-value.run stream=stdout match=exact
minor=1234
equal=true
sameHash=true
```
