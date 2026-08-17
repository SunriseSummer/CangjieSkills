# 分层类型化配置

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `layered_config`，实现一个无全局状态、可组合的类型化配置解析器。仅使用标准库。

## 公开 API

```cangjie
public enum ConfigValue {
    Text(String) | Integer(Int64) | Flag(Bool)
}

public class ConfigException <: Exception {
    public init(message: String)
}

public class LayeredConfig {
    public init()
    public func size(): Int64
    public func put(key: String, value: ConfigValue): Unit
    public func get(key: String): ?ConfigValue
    public func overlay(higher: LayeredConfig): LayeredConfig
    public func requireText(key: String): String
    public func requireInteger(key: String): Int64
    public func requireFlag(key: String): Bool
    public static func parse(text: String): LayeredConfig
    public static func parseFile(path: Path): LayeredConfig
}
```

配置格式按行解析：空行和去除首尾 ASCII 空白后以 `#` 开头的行忽略；其余行为 `key = tagged-value`。值标签为 `s:`（保留标签后文本）、`i:`（十进制 Int64）和 `b:true`/`b:false`。键和值两侧的 ASCII 空白均去除。空键、未知标签、非法整数/布尔值、缺少等号、同一层重复键均为错误。

一次解析必须收集全部错误，最终抛一个 `ConfigException`，message 按出现顺序包含全部出错行号（形如 `line 2; line 5`）。`overlay` 返回独立新对象：低优先级键先复制，高优先级同名键覆盖；之后修改任一输入都不得影响结果。`require*` 在缺键或类型不符时抛 `ConfigException`。

`parseFile` 必须通过 `std.fs.File.readFrom`、`Path` 和 UTF-8 解码复用 `parse`。

`main()` 解析默认层与覆盖层，输出：

```text
service=search
port=9100
debug=true
size=3
```

把随题测试原样放入 `src/`。验收：`cjpm clean/build/test/run` 全部成功，编译 warning 为 0。
