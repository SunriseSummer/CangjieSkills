<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.7-包扫描-循环依赖与命令扩展.7-3-扩展-cjpm-子命令" parent="tools.cjpm.7-包扫描-循环依赖与命令扩展" -->
# 7.3 扩展 cjpm 子命令

[← 7. 包扫描、循环依赖与命令扩展](index.md)

把 `cjpm-xxx`（Windows 为 `cjpm-xxx.exe`）放入 `PATH` 后，可用 `cjpm xxx [args]` 调用，效果等同于直接运行该程序。内置子命令优先，不能被同名扩展覆盖；扩展依赖的动态库目录也需加入平台对应的加载路径。

---
