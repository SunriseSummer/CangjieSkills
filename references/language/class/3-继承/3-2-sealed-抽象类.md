<!-- cj-doc kind="guide-leaf" level="5" id="language.class.3-继承.3-2-sealed-抽象类" parent="language.class.3-继承" -->
# 3.2 `sealed` 抽象类

[← 3. 继承](index.md)

- `sealed abstract class` — 仅同包内可继承
- `sealed` 隐含 `public`/`open` 语义
- `sealed` 的子类可不是 `sealed`，仍可被 `open`/`sealed` 修饰
- 若子类被 `open` 修饰，则其子类可在包外被继承
