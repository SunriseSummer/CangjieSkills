<!-- cj-doc kind="api-member" level="6" id="std.unittest.mock.class.matchers.argthat" parent="std.unittest.mock.class.matchers" -->
# Matchers.argThat

[← Matchers](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func argThat<T>(ValueListener<T>, (T) -> Bool)

### 签名

```cangjie role=signature
public static func argThat<T>(listener: ValueListener<T>, predicate: (T) -> Bool): TypedMatcher<T>
```

通过传入的 predicate 闭包函数过滤传入的参数值，允许 listener 值监听器对满足条件的传入参数值进行处理。

### 契约

参数：

- listener: ValueListener\<T> - 值监听器。
- predicate: (T) ->Bool - 过滤器，可通过此函数定义过滤参数值的匹配条件。

返回值：

- TypedMatcher\<T> - 拥有值监听器和过滤器的类型匹配器。

## static func argThat<T>((T) -> Bool)

### 签名

```cangjie role=signature
public static func argThat<T>(predicate: (T) -> Bool): TypedMatcher<T>
```

根据提供的过滤器闭包过滤输入值。

### 契约

参数：

- predicate: (T) ->Bool - 过滤器。

返回值：

- TypedMatcher\<T> - 参数过滤类型匹配器实例。
