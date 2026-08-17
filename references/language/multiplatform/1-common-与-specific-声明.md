<!-- cj-doc kind="guide-leaf" level="4" id="language.multiplatform.1-common-与-specific-声明" parent="language.multiplatform" -->
# 1. common 与 specific 声明

[← 跨平台开发](index.md)

`common` 标记公共部分，`specific` 标记平台部分。两者属于同一个包；平台文件可以依赖公共文件，公共文件不能反向依赖平台文件。该能力在 1.1.3 中仍是实验特性。

```cangjie role=signature
// common 源码集
package platform_demo

public common func platformName(): String
```

```cangjie role=signature
// Windows specific 源码集
package platform_demo

public specific func platformName(): String { "windows" }
```

关键约束：

- `common` 与 `specific` 不能和 `private`、`const`、`foreign` 同时使用；只能分别出现在公共/平台源码中。
- 无实现的 `common` 函数必须声明返回类型，并有唯一匹配的 `specific` 实现；参数类型、可见性及除 `common/specific` 外的修饰符必须匹配，返回值允许协变。
- 默认参数只在一侧给出；若公共侧使用命名参数，平台侧对应参数必须保留同名。
- class、struct、enum、interface、extend 及其部分成员均可配对；公共 class/struct 必须显式声明构造函数。只有构造函数签名留给平台侧实现时才写 `common init(...)` / `specific init(...)`；主构造函数不能带 `common`/`specific`。
- 1.1.3 不支持用 `@Frozen` 修饰 `common`/`specific` 声明。
