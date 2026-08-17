<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonvalue.fromstr" parent="stdx.encoding.json.class.jsonvalue" -->
# JsonValue.fromStr

[← JsonValue](index.md)

## 签名

```cangjie role=signature
public static func fromStr(s: String): JsonValue
```

把字符串解析为 JsonValue；语法错误抛 `JsonException`。stdx 1.1.3.1 还接受 `0b`/`0o`/`0x` 整数前缀，不能把它当作严格 JSON 校验器。

## 契约

输入方言边界：

- `fromStr` 在 stdx 1.1.3.1 中除标准十进制 JSON 数字外，还实测接受 `0b`、`0o`、`0x` 整数前缀，并把它们解析为对应整数。
- 因此它不是严格 JSON 合规性校验器。若协议必须拒绝非标准数字，应先用严格解析器或协议层校验输入，再把已确认的文本交给 `fromStr`。
- 语法或形态错误会抛出 `JsonException`；对不可信输入应捕获并转为领域错误。

## 典型示例

解析后先按 JSON 形态转换，再通过对象索引和具体值类型的 `getValue()` 取得仓颉值。stdx 1.1.3.1 的解析器还接受 `0b`、`0o`、`0x` 整数前缀；这便于识别既有输入，但意味着 `fromStr` 不能充当严格 JSON 校验器。

```cangjie cjtest=run id=api.stdx.json.fromstr.run form=unit requires=stdx timeout=60s
package stdx_json_fromstr_example

import stdx.encoding.json.*

main(): Unit {
    let root = JsonValue.fromStr("{\"name\":\"Ada\",\"score\":95}").asObject()
    println(root["name"].asString().getValue())
    println(root["score"].asInt().getValue())

    let extended = JsonValue.fromStr("{\"mask\":0x10}").asObject()
    println(extended["mask"].asInt().getValue())
}
```

```text cjtest=expect for=api.stdx.json.fromstr.run stream=stdout match=exact
Ada
95
16
```
