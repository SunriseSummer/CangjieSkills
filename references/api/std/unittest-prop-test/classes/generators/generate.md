<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.class.generators.generate" parent="std.unittest.prop_test.class.generators" -->
# Generators.generate

[← Generators](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func generate<T>(T, T, (T, T) -> T)

### 签名

```cangjie role=signature
public static func generate<T>(l: T, r: T, body: (T, T) -> T): Generator<T>
```

通过重复调用函数生成值的生成器，范围为 [l, r]。

### 契约

参数：

- l: T - 最小值。
- r: T - 最大值。
- body: () -> T - 被调用的生成器闭包。

返回值：

- Generator\<T> - 生成器。

## static func generate<T>(() -> T)

### 签名

```cangjie role=signature
public static func generate<T>(body: () -> T): Generator<T>
```

通过重复调用函数生成值的生成器。

### 契约

参数：

- body: () -> T - 被调用的生成器闭包。

返回值：

- Generator\<T> - 生成器。
