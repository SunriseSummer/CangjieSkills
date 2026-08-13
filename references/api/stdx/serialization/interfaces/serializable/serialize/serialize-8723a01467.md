<!-- cj-doc kind="api-member" level="7" id="stdx.serialization.serialization.interface.serializable.serialize.serialize-8723a01467" parent="stdx.serialization.serialization.interface.serializable.serialize" -->
# Serializable.func serialize()

[← Serializable.serialize](index.md)

## 签名

```cangjie role=signature
func serialize(): DataModel
```

将自身序列化为 DataModel。

## 契约

返回值：

- DataModel - 序列化的 DataModel。

## 典型示例

自定义类型实现 `Serializable<T>` 时，需要把字段写入 `DataModel`，并提供逆向的静态 `deserialize`。`DataModel` 是中间表示，可再由 JSON 等格式层负责实际编码。

```cangjie cjtest=run id=api.stdx.serializable.run form=unit requires=stdx timeout=60s
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

```text cjtest=expect for=api.stdx.serializable.run stream=stdout match=exact
Ada
98
```
