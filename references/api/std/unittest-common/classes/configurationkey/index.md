<!-- cj-doc kind="api-type" level="5" id="std.unittest.common.class.configurationkey" parent="std.unittest.common" -->
# ConfigurationKey

[← std.unittest.common](../../index.md)

`abstract sealed ConfigurationKey <: Equatable<ConfigurationKey> & Hashable`

配置项的键值对象。

## 方法

| 签名 | 功能 |
|---|---|
| [`override hashCode(): Int64`](hashcode.md) | 获取 hashCode 值。 |

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](field-name.md) | 配置键值的名称。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator ==(that: ConfigurationKey): Bool`](operator-eq.md) | 判等。 |
| [`override operator !=(that: ConfigurationKey): Bool`](operator-ne.md) | 判不等。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend ConfigurationKey`](extensions/extend-configurationkey.md) | 声明该类型的扩展实现及其约束。 |
