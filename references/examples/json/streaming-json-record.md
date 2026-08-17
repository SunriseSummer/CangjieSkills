<!-- cj-doc kind="example-leaf" level="4" id="examples.json.streaming-json-record" parent="examples.json" -->
# 流式读写对象、Option 与数组

[← JSON 与对象序列化](index.md)

自定义 `JsonSerializable`/`JsonDeserializable` 时显式维护对象状态；Windows cjnative 1.1.3.1 的复合数组按元素读写，避免直接调用泛型数组接口。

## 已验证示例

流式读写需要让读取状态与 JSON 结构严格同步：对象名后只消费一个完整值，未知字段用 `skip()`；复合数组在受影响的 Windows 版本组合中显式逐项处理。写入端保持相同的字段顺序，并成对结束对象和数组。

```cangjie cjtest=run id=guide.stdx.streaming-json-record.run form=unit requires=stdx timeout=60s
package streaming_json_record

import std.collection.ArrayList
import std.io.*
import stdx.encoding.json.stream.*

class Record <: JsonSerializable & JsonDeserializable<Record> {
    let id: Int64
    let note: Option<String>
    let tags: Array<String>

    init(id: Int64, note: Option<String>, tags: Array<String>) {
        this.id = id
        this.note = note
        this.tags = tags
    }

    public static func fromJson(reader: JsonReader): Record {
        var id: Option<Int64> = None
        var note: Option<String> = None
        let tags = ArrayList<String>()
        reader.startObject()
        while (reader.peek() != Some(JsonToken.EndObject)) {
            match (reader.readName()) {
                case "id" => id = Some(reader.readValue<Int64>())
                case "note" =>
                    if (reader.peek() == Some(JsonToken.JsonNull)) {
                        reader.skip()
                        note = None
                    } else {
                        note = Some(reader.readValue<String>())
                    }
                case "tags" =>
                    reader.startArray()
                    while (reader.peek() != Some(JsonToken.EndArray)) {
                        tags.add(reader.readValue<String>())
                    }
                    reader.endArray()
                case _ => reader.skip()
            }
        }
        reader.endObject()
        let requiredId = match (id) {
            case Some(value) => value
            case None => throw IllegalArgumentException("missing id")
        }
        return Record(requiredId, note, tags.toArray())
    }

    public func toJson(writer: JsonWriter): Unit {
        writer.startObject()
        writer.writeName("id")
        writer.writeValue(id)
        writer.writeName("note")
        match (note) {
            case Some(value) => writer.writeValue(value)
            case None => writer.writeNullValue()
        }
        writer.writeName("tags")
        writer.startArray()
        for (tag in tags) {
            writer.writeValue(tag)
        }
        writer.endArray()
        writer.endObject()
    }
}

func decode(text: String): Record {
    return Record.fromJson(JsonReader(ByteBuffer(text.toArray())))
}

func encode(value: Record): String {
    let output = ByteBuffer()
    let writer = JsonWriter(output)
    writer.writeConfig = WriteConfig.compact
    value.toJson(writer)
    writer.flush()
    return String.fromUtf8(output.bytes())
}

main(): Unit {
    let input = ##"{"id":7,"ignored":{"deep":[1,2]},"note":null,"tags":["math","code"]}"##
    println(encode(decode(input)))
}
```

预期标准输出：

```text cjtest=expect for=guide.stdx.streaming-json-record.run stream=stdout match=exact
{"id":7,"note":null,"tags":["math","code"]}
```
