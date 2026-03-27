# 仓颉扩展标准库序列化 Skill

## 1. 概述

仓颉通过 `stdx.serialization.serialization` 包提供序列化/反序列化框架，基于中间数据层 `DataModel` 实现类型与数据格式的解耦。

| 导入 | 功能 |
|------|------|
| `import stdx.serialization.serialization.*` | 序列化框架核心 API |

> 使用前需配置好 stdx，详见 `cangjie-stdx` Skill

---

## 2. 核心类型

### 2.1 DataModel 体系

`DataModel` 是序列化框架的中间数据层，各子类对应不同数据类型：

| 类 | 对应数据 | 构造方式 |
|---|---|---|
| `DataModelInt` | 整数 | `DataModelInt(value: Int64)` |
| `DataModelFloat` | 浮点数 | `DataModelFloat(value: Float64)` |
| `DataModelBool` | 布尔值 | `DataModelBool(value: Bool)` |
| `DataModelString` | 字符串 | `DataModelString(value: String)` |
| `DataModelNull` | 空值 | `DataModelNull()` |
| `DataModelSeq` | 序列/数组 | `DataModelSeq()` + `.add(DataModel)` |
| `DataModelStruct` | 结构化对象 | `DataModelStruct()` + `.add(Field)` |

### 2.2 Field 辅助类

`Field` 用于构建 `DataModelStruct` 的字段，通过 `field<T>(name, value)` 函数创建：

```cangjie
field<String>("name", "Alice")   // 字符串字段
field<Int64>("age", 30)          // 整数字段
```

### 2.3 Serializable 接口

自定义类型需实现 `Serializable<T>` 接口以支持序列化/反序列化：

```cangjie
interface Serializable<T> {
    func serialize(): DataModel
    static func deserialize(dm: DataModel): T
}
```

基本类型（`String`、`Int64`、`Float64`、`Bool` 等）已内置实现 `Serializable`。

---

## 3. 使用示例

### 3.1 自定义类型序列化

```cangjie
import stdx.serialization.serialization.*

class User <: Serializable<User> {
    var name: String = ""
    var age: Int64 = 0

    public init() {}
    public init(name: String, age: Int64) {
        this.name = name
        this.age = age
    }

    // 序列化：User → DataModel
    public func serialize(): DataModel {
        DataModelStruct()
            .add(field<String>("name", name))
            .add(field<Int64>("age", age))
    }

    // 反序列化：DataModel → User
    public static func deserialize(dm: DataModel): User {
        let dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("Expected DataModelStruct")
        }
        let user = User()
        user.name = String.deserialize(dms.get("name"))
        user.age = Int64.deserialize(dms.get("age"))
        return user
    }
}

main() {
    // 序列化
    let user = User("Alice", 30)
    let dm = user.serialize()

    // 反序列化（roundtrip）
    let user2 = User.deserialize(dm)
    println("${user2.name}, ${user2.age}")  // Alice, 30
}
```

### 3.2 与 JSON 结合使用

`DataModel` 可以与 JSON 包配合，实现 JSON ↔ 自定义类型的转换：

```cangjie
import stdx.serialization.serialization.*
import stdx.encoding.json.*

class Config <: Serializable<Config> {
    var host: String = ""
    var port: Int64 = 0

    public init() {}
    public init(host: String, port: Int64) {
        this.host = host
        this.port = port
    }

    public func serialize(): DataModel {
        DataModelStruct()
            .add(field<String>("host", host))
            .add(field<Int64>("port", port))
    }

    public static func deserialize(dm: DataModel): Config {
        let dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("Expected DataModelStruct")
        }
        let cfg = Config()
        cfg.host = String.deserialize(dms.get("host"))
        cfg.port = Int64.deserialize(dms.get("port"))
        return cfg
    }
}
```

---

## 4. DataModel 操作

### 4.1 DataModelStruct 方法

| 方法 | 说明 |
|------|------|
| `add(field: Field): DataModelStruct` | 添加字段，返回自身（支持链式调用） |
| `get(name: String): DataModel` | 按字段名获取 DataModel 值 |

### 4.2 DataModelSeq 方法

| 方法 | 说明 |
|------|------|
| `add(element: DataModel): DataModelSeq` | 添加元素，返回自身（支持链式调用） |
| `get(index: Int64): DataModel` | 按索引获取元素 |

---

## 5. 注意事项

| 要点 | 说明 |
|------|------|
| **stdx 配置** | 序列化包属于 stdx，需先下载配置（详见 `cangjie-stdx` Skill） |
| **DataModel 中间层** | 序列化框架通过 DataModel 解耦类型与格式，便于支持多种输出格式（JSON、XML 等） |
| **类型匹配** | `deserialize` 中须检查 DataModel 的实际类型，类型不匹配时抛出 `DataModelException` |
| **内置类型** | `String`、`Int64`、`Float64`、`Bool` 等已实现 `Serializable`，可直接使用 `T.deserialize(dm)` |
| **field 函数** | `field<T>(name, value)` 中 `T` 须实现 `Serializable<T>` |
