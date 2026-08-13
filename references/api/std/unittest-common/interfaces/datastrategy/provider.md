<!-- cj-doc kind="api-member" level="6" id="std.unittest.common.interface.datastrategy.provider" parent="std.unittest.common.interface.datastrategy" -->
# DataStrategy.provider

[← DataStrategy](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func provider(Configuration)

### 签名

```cangjie role=signature
func provider(configuration: Configuration): DataProvider<T>
```

获取提供测试数据组件。

### 契约

参数：

- configuration: Configuration - 配置信息。

返回值：

- DataProvider\<T> - 提供测试数据的组件对象。

## func provider(Configuration)

适用扩展：[extend<T> Array<T> <: DataStrategy<T>](extensions/extend-t-array-t-datastrategy-t.md)。

### 签名

```cangjie role=signature
public func provider(configuration: Configuration): DataProvider<T>
```

获取提供测试数据组件。

### 契约

参数：

- configuration: Configuration - 配置信息。

返回值：

- DataProvider\<T> - 提供测试数据的组件对象。

## func provider(Configuration)

适用扩展：[extend<T> Range<T> <: DataStrategy<T>](extensions/extend-t-range-t-datastrategy-t.md)。

### 签名

```cangjie role=signature
public func provider(configuration: Configuration): DataProvider<T>
```

获取提供测试数据组件。

### 契约

参数：

- configuration: Configuration - 配置信息。

返回值：

- DataProvider\<T> - 提供测试数据的组件对象。
