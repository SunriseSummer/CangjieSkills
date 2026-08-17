# JSON 图书目录往返

在仓颉 `1.1.3 (cjnative)` 与 stdx `1.1.3.1` 中创建可执行包 `json_catalog`，实现嵌套对象和对象数组的 JSON 编解码。必须使用 `stdx.serialization.serialization` 的 `Serializable`/`DataModel` 与 `stdx.encoding.json`，不得手工拼接或扫描 JSON。

Windows x86_64 cjnative 1.1.3 环境中，对数组采用与发布件兼容的 `DataModelSeq` 显式逐项序列化/反序列化写法，不得直接依赖已知可能运行时崩溃的 `Array<T>.deserialize` 路径。

## 公开 API

```cangjie
public class CatalogException <: Exception {
    public init(message: String)
}

public class Book <: Serializable<Book> {
    public let id: Int64
    public let title: String
    public let tags: Array<String>
    public init(id: Int64, title: String, tags: Array<String>)
    public func serialize(): DataModel
    public static func deserialize(model: DataModel): Book
}

public class Catalog <: Serializable<Catalog> {
    public let name: String
    public let books: Array<Book>
    public init(name: String, books: Array<Book>)
    public func serialize(): DataModel
    public static func deserialize(model: DataModel): Catalog
}

public class CatalogCodec {
    public static func toJson(catalog: Catalog): String
    public static func fromJson(text: String): Catalog
}
```

JSON 字段顺序按 `name,books` 和 `id,title,tags` 写出。解码时，非法 JSON、根类型错误、字段缺失、字段类型错误或嵌套元素错误都统一转换为 `CatalogException`。构造函数必须克隆传入数组；恢复出的目录也不能与任何临时容器共享可变数组存储。

`main()` 构造 `demo` 目录，其中一本书为 `Book(7, "Cangjie", ["lang", "vm"])`，并输出：

```text
{"name":"demo","books":[{"id":7,"title":"Cangjie","tags":["lang","vm"]}]}
demo|1|7|Cangjie|lang,vm
```

把随题测试原样复制到 `src/`。先运行当前 Skill 的 `setup_stdx.py --project <project-root>` 配置兼容的 stdx；如评测环境另行提供离线发布包，可追加 `--archive <release.zip> --offline`。再执行 `cjpm clean/build/test/run`；全部成功且 warning 为 0。
