<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.argumentmatcher" parent="std.unittest.mock" -->
# ArgumentMatcher

[← std.unittest.mock](../../index.md)

`abstract ArgumentMatcher`

参数匹配器抽象类，该类与其子类可作为桩签名的入参类型。

## 方法

| 签名 | 功能 |
|---|---|
| [`withDescription(description: String): ArgumentMatcher`](withdescription.md) | 配置参数匹配器抛出异常时的描述信息。 |
| [`forParameter(name: String): ArgumentMatcher`](forparameter.md) | 配置所匹配的参数名称。 |
| [`matchesAny(arg: Any)`](matchesany.md) | 匹配任意类型的任意值。 |
