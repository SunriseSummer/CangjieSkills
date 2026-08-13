<!-- cj-doc kind="example-leaf" level="4" id="examples.json.json-roundtrip" parent="examples.json" -->
# 完成嵌套对象的 JSON 往返

[← JSON 与对象序列化](index.md)

自定义 Serializable，把嵌套 DataModel 转为 JSON 后再恢复领域对象。

## 已验证 JSON 往返示例

嵌套类型同样实现 `Serializable<T>` 后，可作为 `field<T>` 的值；编码链为 `serialize().toJson()`，解码链为 `T.deserialize(DataModel.fromJson(JsonValue.fromStr(text)))`。

```cangjie cjtest=run id=guide.stdx.serialization-json-roundtrip.run form=unit requires=stdx timeout=60s
package stdx_serialization_json_roundtrip

import stdx.encoding.json.*
import stdx.serialization.serialization.*

class Endpoint <: Serializable<Endpoint> {
    var host: String
    var port: Int64

    public init(host: String, port: Int64) {
        this.host = host
        this.port = port
    }

    public func serialize(): DataModel {
        DataModelStruct()
            .add(field<String>("host", host))
            .add(field<Int64>("port", port))
    }

    public static func deserialize(model: DataModel): Endpoint {
        let fields = match (model) {
            case value: DataModelStruct => value
            case _ => throw DataModelException("expected endpoint object")
        }
        return Endpoint(
            String.deserialize(fields.get("host")),
            Int64.deserialize(fields.get("port"))
        )
    }
}

class Config <: Serializable<Config> {
    var name: String
    var endpoint: Endpoint

    public init(name: String, endpoint: Endpoint) {
        this.name = name
        this.endpoint = endpoint
    }

    public func serialize(): DataModel {
        DataModelStruct()
            .add(field<String>("name", name))
            .add(field<Endpoint>("endpoint", endpoint))
    }

    public static func deserialize(model: DataModel): Config {
        let fields = match (model) {
            case value: DataModelStruct => value
            case _ => throw DataModelException("expected config object")
        }
        return Config(
            String.deserialize(fields.get("name")),
            Endpoint.deserialize(fields.get("endpoint"))
        )
    }
}

main(): Unit {
    let source = Config("demo", Endpoint("127.0.0.1", 8080))
    let json = source.serialize().toJson().toString()
    let restored = Config.deserialize(DataModel.fromJson(JsonValue.fromStr(json)))
    println(json)
    println("${restored.name}|${restored.endpoint.host}|${restored.endpoint.port}")
}
```

预期标准输出：

```text cjtest=expect for=guide.stdx.serialization-json-roundtrip.run stream=stdout match=exact
{"name":"demo","endpoint":{"host":"127.0.0.1","port":8080}}
demo|127.0.0.1|8080
```
