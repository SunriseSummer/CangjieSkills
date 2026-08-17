<!-- cj-doc kind="guide-leaf" level="4" id="language.multiplatform.2-feature-与-source-set-构建" parent="language.multiplatform" -->
# 2. feature 与 source-set 构建

[← 跨平台开发](index.md)

`cjpm` 多平台构建需要 `[profile] experimental = true`。`[[source-set]]` 把目录绑定到 feature；无 feature 的源码集通常承载公共代码，叶节点源码集生成产品。

```toml
[profile]
experimental = true

[[feature]]
name = "user.platform_demo.windows"

[[source-set]]
name = "common"
src-dir = "./common"
features = []

[[source-set]]
name = "windows"
src-dir = "./windows"
features = ["user.platform_demo.windows"]
product = true
```

源码集文件必须在 `package` 之前用 `features {user.platform_demo.windows}` 声明一致的 feature；没有 feature 的公共非产品源码集使用 `@NonProduct features {}`。自定义 feature 至少三段，以 `user.<包名>.` 开头。

`cjpm build/run/test --enable-features=user.platform_demo.windows` 显式选择；`--no-feature-deduce` 禁用从 `--target` 推导。1.1.3 的 `cjpm check` 不接受这两个 feature 选项，多平台源码集用 `build` 或实际 `test` 验证。内置 feature 包括 `os.android`、`os.ohos`、`os.ios`、`os.linux`、`os.windows`、`os.darwin`。
