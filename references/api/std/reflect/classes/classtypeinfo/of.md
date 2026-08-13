<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.classtypeinfo.of" parent="std.reflect.class.classtypeinfo" -->
# ClassTypeInfo.of

[← ClassTypeInfo](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## static func of(Any)

### 签名

```cangjie role=signature
public redef static func of(a: Any): ClassTypeInfo
```

获取给定的任意类型的实例的运行时类型所对应的类型信息。

### 契约

运行时类型是指在程序运行时，通过动态绑定确定的类型，运行时类型与实例对象相绑定。在继承等场景下运行时类型和静态类型可能不一致。

参数：

- a: Any - 任意类型的实例。

返回值：

- ClassTypeInfo - 实例 `a` 的运行时类型所对应的类型信息。

异常：

- InfoNotFoundException - 如果无法获得实例 `a` 的运行时类型所对应的类型信息，则抛出异常。
- IllegalTypeException - 如果获取到的类型信息不是 ClassTypeInfo， 则抛出异常。

## static func of(Object)

### 签名

```cangjie role=signature
public static func of(a: Object): ClassTypeInfo
```

获取给定的 `class` 类型的实例的运行时类型所对应的 `class` 类型信息。

### 契约

参数：

- a: Object - `class` 类型的实例。

返回值：

- ClassTypeInfo - `class` 类型的实例 `a` 的运行时类型所对应的 `class` 类型信息。

异常：

- InfoNotFoundException - 如果无法获得实例 `a` 的运行时类型所对应的 `class` 类型信息，则抛出异常。

## static func of<T>()

### 签名

```cangjie role=signature
public redef static func of<T>(): ClassTypeInfo
```

获取给定类型 `T` 对应的类型信息。

### 契约

返回值：

- ClassTypeInfo - `T` 类型对应的类型信息。

异常：

- InfoNotFoundException - 如果无法获得类型 T 所对应的类型信息，抛出异常。
- IllegalTypeException - 如果获取到的类型信息不是 ClassTypeInfo， 则抛出异常。
