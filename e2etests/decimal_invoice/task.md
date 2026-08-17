# Decimal 精确账单

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `decimal_invoice`。使用 `std.math.numeric.Decimal` 和 `std.math.RoundingMode` 计算账单，禁止以 Float64 作为金额或税率的中间表示。

## 公开 API

```cangjie
public class InvoiceException <: Exception {
    public init(message: String)
}

public struct LineItem {
    public let sku: String
    public let unitPrice: Decimal
    public let quantity: Int64
    public init(sku: String, unitPrice: Decimal, quantity: Int64)
    public static func parse(text: String): LineItem
}

public class Invoice {
    public init(items: Array<LineItem>, taxRate: Decimal)
    public func subtotal(): Decimal
    public func tax(): Decimal
    public func total(): Decimal
    public func totalMinorUnits(): BigInt
    public func render(): String
}
```

LineItem 文本为 `sku|unitPrice|quantity`，sku 非空，价格非负，quantity 为正整数；不合法时抛 InvoiceException。税率非负。`subtotal` 对所有 `unitPrice * Decimal(quantity)` 求和后以 `RoundingMode.HalfUp` 调整为 2 位小数；`tax` 对未含税 subtotal 乘税率并 HalfUp 到 2 位；`total` 为二者之和并保持 2 位；`totalMinorUnits` 返回 total 的无标度 BigInt。输入数组必须防御性复制。

`render()` 输出 `subtotal=<值>;tax=<值>;total=<值>`，均用 Decimal 的普通十进制字符串。main 用 `book|12.345|2`、`pen|1.10|3`、税率 `0.075` 输出：

```text
subtotal=27.99;tax=2.10;total=30.09
minor=3009
```

把随题测试原样放入 `src/`；验收所有 cjpm 命令成功且 warning 为 0。
