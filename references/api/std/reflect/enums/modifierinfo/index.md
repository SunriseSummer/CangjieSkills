<!-- cj-doc kind="api-type" level="5" id="std.reflect.enum.modifierinfo" parent="std.reflect" -->
# ModifierInfo

[← std.reflect](../../index.md)

`ModifierInfo <: Equatable<ModifierInfo> & Hashable & ToString`

描述修饰符信息。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Abstract`](value-abstract.md) | 表示 abstract 修饰符。 |
| [`Mut`](value-mut.md) | 表示 mut 修饰符。 |
| [`Open`](value-open.md) | 表示 open 修饰符。 |
| [`Override`](value-override.md) | 表示 override 修饰符。 |
| [`Redef`](value-redef.md) | 表示 redef 修饰符。 |
| [`Sealed`](value-sealed.md) | 表示 sealed 修饰符。 |
| [`Static`](value-static.md) | 表示 static 修饰符。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获取该修饰符信息的哈希值。 |
| [`override toString(): String`](tostring.md) | 获取字符串形式的该修饰符信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(that: ModifierInfo): Bool`](operator-ne.md) | 判断该修饰符信息与给定的另一个修饰符信息是否不等。 |
| [`override operator ==(that: ModifierInfo): Bool`](operator-eq.md) | 判断该修饰符信息与给定的另一个修饰符信息是否相等。 |
