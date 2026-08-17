<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.uint32.position" parent="std.core.intrinsic.uint32.extension.extend-uint32-countable-uint32" -->
# UInt32.position

[← extend UInt32 <: Countable<UInt32>](extensions/extend-uint32-countable-uint32.md)

## 签名

```cangjie role=signature
public func position(): Int64
```

`position(): Int64` 返回 UInt32 在 Countable 序列中的位置；它不是 UInt64 转换或带范围检查的安全转换 API。

## 契约

返回值：

- Int64 - 当前 UInt32 值在 Countable 序列中的位置；仓颉 1.1.3 的签名和编译器实测均为 Int64。发布件原始 API 的功能描述误写为转换成 UInt64，与同页签名及返回值表矛盾。此成员不是通用的安全数值转换 API。

## 已验证示例

`position()` 来自 `Countable<UInt32>` 扩展，返回 `Int64`。它描述当前值在可计数序列中的位置，不是转换到 `UInt64` 或执行范围检查的 API。

```cangjie cjtest=run id=api.uint32-position.run form=unit
package uint32_position_example

main(): Unit {
    let value: UInt32 = 8
    let position: Int64 = value.position()
    println(position)
}
```

```text cjtest=expect for=api.uint32-position.run stream=stdout match=exact
8
```
