<!-- cj-doc kind="api-member" level="6" id="std.fs.struct.path.prop-extensionname" parent="std.fs.struct.path" -->
# Path.extensionName

[← Path](index.md)

## 签名

```cangjie role=signature
public prop extensionName: String
```

获得 Path 的文件扩展名部分。

## 契约

文件名 fileName 根据最后一个 r'.' 被划分为不带扩展名的文件名 fileNameWithoutExtension 和扩展名 extensionName 两部分。无扩展名时返回空字符串。

- 对于路径 "./NewFile.txt"，此属性返回 `"txt"`。
- 对于路径 "./.gitignore"，此属性返回 `"gitignore"`。
- 对于路径 "./noextension"，此属性返回 `""`。
- 对于路径 "./a.b.c"，此属性返回 `"c"`。
- 对于路径 "./NewFile.txt/"，此属性返回 `"txt"`。

类型：String

异常：

- IllegalArgumentException - 当路径为空或包含字符串结束符则抛出异常。
