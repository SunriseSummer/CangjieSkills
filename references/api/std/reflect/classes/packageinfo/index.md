<!-- cj-doc kind="api-type" level="5" id="std.reflect.class.packageinfo" parent="std.reflect" -->
# PackageInfo

[← std.reflect](../../index.md)

`PackageInfo <: Equatable<PackageInfo> & Hashable & ToString`

描述包信息。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`variables: Collection<GlobalVariableInfo>`](prop-variables.md) | 获取该 PackageInfo 对应的包中所有 `public` 全局变量的信息所组成的列表。 |
| [`functions: Collection<GlobalFunctionInfo>`](prop-functions.md) | 获取该 PackageInfo 对应的包中所有 `public` 全局函数的信息所组成的列表。 |
| [`name: String`](prop-name.md) | 获取该包信息所对应的包的名称。 |
| [`parentPackage: PackageInfo`](prop-parentpackage.md) | 获取该 PackageInfo 对应的父包的 PackageInfo。 |
| [`qualifiedName: String`](prop-qualifiedname.md) | 获取该 PackageInfo 对应的包的限定名称。 |
| [`rootPackage: PackageInfo`](prop-rootpackage.md) | 获取该 PackageInfo 对应的 `root` 包的 PackageInfo。 |
| [`subPackages: Collection<PackageInfo>`](prop-subpackages.md) | 获取该 PackageInfo 对应的所有子包的 PackageInfo 集合。 |
| [`typeInfos: Collection<TypeInfo>`](prop-typeinfos.md) | 获取该 PackageInfo 对应的包中所有全局定义的 `public` 类型的类型信息，返回对应集合。 |
| [`version: String`](prop-version.md) | 获取该 PackageInfo 对应的包的版本号。 |
| [`prop organizationName: String`](prop-organizationname.md) | 获取该包信息所对应的包的组织名称。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static get(qualifiedName: String): PackageInfo`](get.md) | 获取给定 `qualifiedName` 所对应的 PackageInfo。 |
| [`static load(path: String): PackageInfo`](load.md) | 运行时动态加载指定路径下的一个仓颉动态库模块并获得该模块的信息。 |
| [`getFunction(name: String, parameterTypes: Array<TypeInfo>): GlobalFunctionInfo`](getfunction.md) | 尝试在该 PackageInfo 对应的包中获取拥有给定函数名称且与给定形参类型信息列表匹配的 `public` 全局函数的信息。 |
| [`getFunctions(name: String): Array<GlobalFunctionInfo>`](getfunctions.md) | 尝试在该 PackageInfo 对应的包中获取拥有给定函数名称的所有 `public` 全局函数的信息。 |
| [`getSubPackage(qualifiedName: String): PackageInfo`](getsubpackage.md) | 尝试获取该 PackageInfo 对应限定名称为 `qualifiedName` 的子包的信息。 |
| [`getTypeInfo(qualifiedTypeName: String): TypeInfo`](gettypeinfo.md) | 尝试在该 PackageInfo 对应的包中获取拥有给定类型名称的全局定义的 `public` 类型的类型信息。 |
| [`getVariable(name: String): GlobalVariableInfo`](getvariable.md) | 尝试在该 PackageInfo 对应的包中获取拥有给定变量名称的 `public` 全局变量的信息。 |
| [`hashCode(): Int64`](hashcode.md) | 获取该包信息的哈希值。 |
| [`toString(): String`](tostring.md) | 获取字符串形式的该包信息。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: PackageInfo): Bool`](operator-ne.md) | 判断该包信息与给定的另一个包信息是否不等。 |
| [`operator ==(that: PackageInfo): Bool`](operator-eq.md) | 判断该包信息与给定的另一个包信息是否相等。 |
