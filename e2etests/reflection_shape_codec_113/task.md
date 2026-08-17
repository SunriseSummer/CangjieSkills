# 1.1.3 枚举、元组与函数运行时反射

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `reflection_shape_codec_113`。将随题提供的 `reflection_shape_codec_113_test.cj` 原样复制到项目 `src/`，测试不可修改。

声明以下公开枚举与 API：

```cangjie
public enum WireValue <: ToString {
    Flag(Bool) | Count(Int64) | Pair(String, Int64)
}

public func rebuildWire(constructor: String, args: Array<Any>): WireValue
public func describeWire(value: WireValue): String
public func rebuildTuple(value: (String, Int64, Bool)): (String, Int64, Bool)
public func functionShape(handler: (String, Int64) -> Bool): String
public func invokePredicate(handler: (String, Int64) -> Bool, name: String, count: Int64): Bool
```

要求：

- `rebuildWire` 使用 `EnumTypeInfo.of<WireValue>()`、`getConstructor(constructor, argsCount: args.size)` 与 `EnumConstructorInfo.apply` 动态构造；不得按构造子名称手写分支。
- `describeWire` 使用 `EnumTypeInfo.destruct` 或 `EnumConstructorInfo.of/getAssociatedValues`，返回 `Flag|true`、`Count|7` 或 `Pair|jobs|3`；只允许按反射得到的构造子名称选择关联值类型，不得直接 match `WireValue`。
- `rebuildTuple` 使用 `TupleTypeInfo` 的 `destruct` 和 `construct` 完成同类型重建，不直接返回输入。
- `functionShape` 使用 `FunctionTypeInfo.parameters` 与 `returnType`，返回 `String,Int64->Bool`。
- `invokePredicate` 必须通过 `FunctionTypeInfo.apply` 调用函数值并安全转换结果。
- 保留反射 API 对参数个数或运行时类型不匹配时抛出的异常，不得改成静默默认值。

最终执行 `cjpm clean && cjpm test`（PowerShell 可分两条命令）；全部测试通过且生产源码零 warning。

