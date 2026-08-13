<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.6-高级配置.6-3-交叉编译-target" parent="tools.cjpm.6-高级配置" -->
# 6.3 交叉编译（target）

[← 6. 高级配置](index.md)

配置入口：`[target.x86_64-unknown-linux-gnu]`。

```toml
[target.x86_64-unknown-linux-gnu]
  compile-option = "-O2"
  link-option = "-L/usr/lib"

[target.x86_64-unknown-linux-gnu.dependencies]
  platform_lib = { path = "./libs/linux" }

[target.x86_64-w64-mingw32.bin-dependencies]
  path-option = ["./win_libs"]
```

```bash
cjpm build --target x86_64-w64-mingw32    # 交叉编译到 Windows
```
