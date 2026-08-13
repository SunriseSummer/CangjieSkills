<!-- cj-doc kind="api-type" level="5" id="std.ast.enum.importkind" parent="std.ast" -->
# ImportKind

[← std.ast](../../index.md)

`ImportKind <: ToString`

表示导入语句的类型。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Single`](value-single.md) | 表示单导入，如 `import a.b`。 |
| [`Alias`](value-alias.md) | 表示别名导入，如 `import a.b as c`。 |
| [`All`](value-all.md) | 表示全导入，如 `import a.b.*`。 |
| [`Multi`](value-multi.md) | 表示多导入，如 `import a.{b, c, d}`。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 将 ImportKind 类型转化为字符串类型表示。 |
