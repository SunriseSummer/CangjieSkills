# 精确份额分配器

## 目标

使用仓颉 1.1.3 实现包 `exact_share_allocator`：将十进制金额按指定标度和舍入规则转换为任意精度最小单位，再用最大余数法按权重精确分配；同时提供整数溢出策略对照和以自动派生值类型为键的聚合。

实现必须直接使用 `std.math.numeric` 的 `Decimal`/`BigInt`、`std.math.RoundingMode`、`std.overflow`、`std.deriving` 和 `HashMap`。禁止 Float、随机数、时钟、文件与网络。将 `exact_share_allocator_test.cj` 原样复制到 `src/`，测试不可修改。

## 公开 API

```cangjie
public class AllocationException <: Exception { public init(message: String) }

@Derive[Equatable, Hashable, ToString]
public struct AllocationKey {
    public let account: String
    public let bucket: Int64
    public init(account: String, bucket: Int64)
}

public struct AllocationEntry {
    public let key: AllocationKey
    public let units: BigInt
    public init(key: AllocationKey, units: BigInt)
}

public struct OverflowProfile {
    public let checked: ?Int64
    public let saturated: Int64
    public let wrapped: Int64
    public let truncated: Bool
    public let carryingValue: Int64
}

public func toMinorUnits(text: String, scale: Int32, mode!: RoundingMode = RoundingMode.HalfEven): BigInt
public func allocate(total: BigInt, weights: Array<BigInt>): Array<BigInt>
public func overflowProfile(a: Int64, b: Int64): OverflowProfile
public func sumByKey(entries: Array<AllocationEntry>): HashMap<AllocationKey, BigInt>
```

## 契约

- `toMinorUnits` 用 `Decimal.tryParse` 解析，scale 仅允许 0..18；用 `reScale(scale, roundingMode: mode)` 舍入并返回 `value`（无标度 BigInt）。非法输入抛 `AllocationException`。
- `allocate` 仅接受非负 total、非空且全非负并且和大于 0 的 weights。先取每个 `total * weight / sum(weights)` 的整数商，再按余数从大到小补 1；余数相同按输入顺序。结果顺序与 weights 一致且和严格等于 total。
- `overflowProfile` 分别调用 checked、saturating、wrapping、carrying 加法；`truncated` 与 `carryingValue` 直接来自 `carryingAdd`。
- `sumByKey` 用 `AllocationKey` 作为 `HashMap` 键，对相同键的 BigInt units 求和。

## 工程与入口

入口把 `10.00` 转成 1000，再按 `[1,2,3]` 分配，输出：

```text
units=1000
shares=167,333,500
sum=1000
overflow=true
```

## 验收

依次执行 `cjpm clean`、`cjpm build`、`cjpm test`、`cjpm run`，均须成功，31 个确定性测试全部通过且 warning 为 0。
