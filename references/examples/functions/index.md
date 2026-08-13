<!-- cj-doc kind="example-category" level="3" id="examples.functions" parent="examples" -->
# 函数、闭包与运算符

[← 应用示例](../index.md)

使用命名默认参数、嵌套函数、可逃逸闭包和自定义下标运算符。

| 示例 | 教学目标 |
|---|---|
| [设计命名默认参数](default-parameters.md) | 默认值只放在命名参数上；调用方可省略参数，也可按名称无序覆盖。 |
| [返回捕获不可变环境的嵌套函数](nested-function.md) | 嵌套函数可读取外围参数并作为函数值返回，形成保留不可变环境的闭包。 |
| [为可逃逸闭包封装可变状态](closure-state.md) | 捕获 let 绑定的引用对象以安全保存状态，并识别局部 var 不能随闭包逃逸的限制。 |
| [实现下标读取与赋值](index-operator.md) | 分别声明取值和带 value 命名参数的赋值重载，让类型支持普通下标语法。 |
