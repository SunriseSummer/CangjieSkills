<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.url.mergepaths" parent="stdx.encoding.url.class.url" -->
# URL.mergePaths

[← URL](index.md)

## 签名

```cangjie role=signature
public static func mergePaths(basePath: String, refPath: String): String
```

合并两个路径。

## 契约

合并规则：将引用路径 refPath 追加到基础路径 basePath 的最后一段。如果 refPath 是绝对路径，结果就是 refPath 原本的值。如果 refPath 不是绝对路径，则将自身拼接至 basePath 最后一个 `/` 后，所有结果最终都会进行标准化（路径中的`.`字符，`..`字符，以及多个连续的 `/` 字符都会被优化）。具体行为可以参照下面示例。更详细行为参考 RFC 3986 协议。

如需合并 URL 请使用 resolveURL。

例如：

- `/a/b/c` 合并 `/d` 输出 `/d`。
- `/a/b/c` 合并 `d` 输出 `/a/b/d`。
- `/a/b/` 合并 `d/e/../f` 输出 `/a/b/d/f`。
- `/a/b/c/` 合并 `./../../g` 输出 `/a/g`。

参数：

- basePath: String - 基础路径。
- refPath: String - 引用路径。

返回值：

- String - 合并且标准化后的路径。
