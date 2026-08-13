<!-- cj-doc kind="api-package" level="4" id="std.unittest.common" parent="api.std" -->
# std.unittest.common

[← std 包索引](../index.md)

单元测试框架提供了打印所需的类型和一些通用方法。

包路径：`std.unittest.common`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Configuration <: ToString`](classes/configuration/index.md) | 存储 `@Configure` 宏生成的 `unittest` 配置数据的对象。 |
| [`abstract sealed ConfigurationKey <: Equatable<ConfigurationKey> & Hashable`](classes/configurationkey/index.md) | 配置项的键值对象。 |
| [`abstract PrettyPrinter`](classes/prettyprinter/index.md) | 拥有颜色和对齐、缩进控制的打印器。 |
| [`PrettyText <: PrettyPrinter & PrettyPrintable & ToString`](classes/prettytext/index.md) | 存储打印的输出。 |
| [`UnittestOptionValidationException <: Exception`](classes/unittestoptionvalidationexception.md) | 框架验证选项值合法性过程中抛出的异常。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`DataProvider<T>`](interfaces/dataprovider/index.md) | DataStrategy 的组件，用于提供测试数据，T 指定提供者提供的数据类型。 |
| [`DataShrinker<T>`](interfaces/datashrinker/index.md) | DataStrategy 的组件，用于在测试期间缩减数据，T 指定该收缩器处理的数据类型。 |
| [`DataStrategy<T>`](interfaces/datastrategy/index.md) | 为参数化测试提供数据的策略，T 指定该策略操作的数据类型。 |
| [`PrettyPrintable`](interfaces/prettyprintable/index.md) | 类型实现该接口表示可以较好地进行颜色及缩进格式的打印。 |
| [`KeyFor<T>`](interfaces/keyfor/index.md) | Configuration 中配置型的键的类型。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`KeyTags <: KeyFor<Array<String>>`](structs/keytags/index.md) | 用于在 Configuration 配置键值。 |
| [`OptionInfo`](structs/optioninfo/index.md) | 打印帮助页面时可以使用的选项的信息。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`Color <: Equatable<Color>`](enums/color/index.md) | 指定颜色。 |
| [`OptionValidity`](enums/optionvalidity/index.md) | 代表选项值验证的结果的枚举值。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`registerOptionValidator(name: String, validator: (Any) -> OptionValidity): Unit`](functions/registeroptionvalidator-string-any-optionvalidity.md) | 用于注册自定义选项验证器。 |
| [`setOptionInfo( name: String, types: Array<String>, description!: ?String = None ): Unit`](functions/setoptioninfo-string-array-string-string.md) | 用于设置选项的描述的函数。 |
| [`setOrUpdateOptionInfo( name: String, description: ?String, ty: String, typeDescription: String ): Unit`](functions/setorupdateoptioninfo-string-string-string-string.md) | 用于设置具体类型的选项的描述。 |

## 只读变量

| 声明 | 功能 |
|---|---|
| [`optionsInfo: HashMap<String, OptionInfo> = HashMap()`](values/optionsinfo.md) | 保存有关单元测试选项的信息的注册表。 |

## 变量

| 声明 | 功能 |
|---|---|
| [`unittestOptionsRegistryClosed = false`](variables/unittestoptionsregistryclosed.md) | 用于标记选项是否可以注册的内部标志。 |
