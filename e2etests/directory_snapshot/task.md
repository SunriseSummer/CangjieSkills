# 递归目录快照

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `directory_snapshot`。使用 `std.fs.Path`、`Directory.readFrom`、`FileInfo` 和 `File` 对真实目录建立确定性快照。必须递归读取子目录；不得把非递归的 `Directory.walk` 误当递归 API，也不得调用 shell 命令枚举文件。

## 公开 API

```cangjie
public struct SnapshotEntry {
    public let relativePath: String
    public let size: Int64
    public init(relativePath: String, size: Int64)
}

public class DirectorySnapshot {
    public init(entries: Array<SnapshotEntry>)
    public prop size: Int64
    public prop totalBytes: Int64
    public func entries(): Array<SnapshotEntry>
    public func render(): String
    public static func scan(root: Path): DirectorySnapshot
}
```

`scan` 只记录普通文件，递归进入目录；路径相对 root，统一使用 `/` 分隔，不以 `/` 开头。条目按 relativePath 的 String 自然顺序排序。目录本身不计数；空目录合法；不存在或不是目录的 root 沿用 `std.fs` 异常。`entries()` 与构造函数都要做数组防御性复制。`render()` 每行 `relativePath:size`，最后无多余换行，空快照返回空字符串。

`main()` 创建临时树 `a.txt`（3 字节）与 `nested/b.txt`（2 字节），扫描后输出：

```text
files=2
bytes=5
a.txt:3
nested/b.txt:2
```

必须在 finally 中删除 main 创建的临时树。把随题测试原样放入 `src/`；验收所有 cjpm 命令成功且 warning 为 0。
