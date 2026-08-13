<!-- cj-doc kind="example-leaf" level="4" id="examples.reflection.field-annotation" parent="examples.reflection" -->
# 通过反射按名称查找字段和注解

[← 反射与注解](index.md)

反射成员集合顺序不稳定；按字段名选择，读取注解，并在检查可变性后访问字段值。

## 已验证示例

成员集合只用于发现候选项，不能依赖其顺序。下面按字段名选择成员、读取自定义注解，并在确认可写后通过反射赋值。

```cangjie cjtest=run id=examples.reflection.field-annotation.language.reflection-field-lookup.run form=unit timeout=20s
package reflection_field_lookup_example

import std.reflect.*

@Annotation[target: [MemberVariable]]
public class ExternalName {
    public let value: String

    public const init(value: String) {
        this.value = value
    }
}

public class Profile {
    @ExternalName["display_name"]
    public var name: String = "Ada"

    public var age: Int64 = 42
}

main(): Unit {
    let profile = Profile()
    for (field in ClassTypeInfo.of(profile).instanceVariables) {
        if (field.name == "name") {
            let label = field.findAnnotation<ExternalName>().getOrThrow()
            if (field.isMutable()) {
                field.setValue(profile, "Grace")
            }
            let value = (field.getValue(profile) as String).getOrThrow()
            println("${label.value}:${value}")
        }
    }
}
```

预期标准输出：

```text cjtest=expect for=examples.reflection.field-annotation.language.reflection-field-lookup.run stream=stdout match=exact
display_name:Grace
```
