<!-- cj-doc kind="example-leaf" level="4" id="examples.json.json-parse" parent="examples.json" -->
# 解析 JSON 并识别输入方言

[← JSON 与对象序列化](index.md)

用 `JsonValue.fromStr` 解析后按形态取值；1.0.5.1 接受非标准整数前缀，严格协议不能把它当合规性校验器。

## 典型示例

解析后先按 JSON 形态转换，再通过对象索引和具体值类型的 `getValue()` 取得仓颉值。stdx 1.0.5.1 的解析器还接受 `0b`、`0o`、`0x` 整数前缀；这便于识别既有输入，但意味着 `fromStr` 不能充当严格 JSON 校验器。

```cangjie cjtest=run id=examples.json.json-parse.api.stdx.json.fromstr.run form=unit requires=stdx timeout=60s
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

预期标准输出：

```text cjtest=expect for=examples.json.json-parse.api.stdx.json.fromstr.run stream=stdout match=exact
Ada
95
16
```
