<!-- cj-doc kind="api-member" level="6" id="std.fs.class.directory.isempty" parent="std.fs.class.directory" -->
# Directory.isEmpty

[← Directory](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func isEmpty(Path)

### 签名

```cangjie role=signature
public static func isEmpty(path: Path): Bool
```

判断指定目录是否为空。

### 契约

参数：

- path: Path - 待判断是否为空的目录对应的路径。

返回值：

- Bool - 为 true 时目录为空，为 false 时不为空。

异常：

- FSException - 如果指定路径不存在、指定路径不是目录或判断过程中底层接口发生错误，则抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。

## static func isEmpty(String)

### 签名

```cangjie role=signature
public static func isEmpty(path: String): Bool
```

判断指定目录是否为空。

### 契约

参数：

- path: String - 待判断是否为空的目录对应的路径。

返回值：

- Bool - 为 true 时目录为空，为 false 时不为空。

异常：

- FSException - 如果指定路径不存在、指定路径不是目录或判断过程中底层接口发生错误，则抛出异常。
- IllegalArgumentException - 当指定路径为空或包含空字符时，抛出异常。
