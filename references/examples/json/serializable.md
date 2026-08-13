<!-- cj-doc kind="example-leaf" level="4" id="examples.json.serializable" parent="examples.json" -->
# 实现自定义 Serializable

[← JSON 与对象序列化](index.md)

显式定义 serialize/deserialize，检查 DataModel 实际形态后恢复字段。

## 典型示例

自定义类型实现 `Serializable<T>` 时，需要把字段写入 `DataModel`，并提供逆向的静态 `deserialize`。`DataModel` 是中间表示，可再由 JSON 等格式层负责实际编码。

```cangjie cjtest=run id=examples.json.serializable.api.stdx.serializable.run form=unit requires=stdx timeout=60s
package stdx_serializable_example

import stdx.encoding.json.*
import stdx.serialization.serialization.*

class Profile <: Serializable<Profile> {
    var name: String
    var score: Int64

    public init(name: String, score: Int64) {
        this.name = name
        this.score = score
    }

    public func serialize(): DataModel {
        DataModelStruct()
            .add(field<String>("name", name))
            .add(field<Int64>("score", score))
    }

    public static func deserialize(model: DataModel): Profile {
        let fields = match (model) {
            case value: DataModelStruct => value
            case _ => throw DataModelException("expected object")
        }
        return Profile(
            String.deserialize(fields.get("name")),
            Int64.deserialize(fields.get("score"))
        )
    }
}

main(): Unit {
    let source = Profile("Ada", 98)
    let json = source.serialize().toJson()
    let restored = Profile.deserialize(DataModel.fromJson(json))
    println(restored.name)
    println(restored.score)
}
```

预期标准输出：

```text cjtest=expect for=examples.json.serializable.api.stdx.serializable.run stream=stdout match=exact
Ada
98
```
