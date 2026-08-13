<!-- cj-doc kind="api-member" level="6" id="std.reflect.class.packageinfo.load" parent="std.reflect.class.packageinfo" -->
# PackageInfo.load

[← PackageInfo](index.md)

## 签名

```cangjie role=signature
public static func load(path: String): PackageInfo
```

运行时动态加载指定路径下的一个仓颉动态库模块并获得该模块的信息。

## 契约

> **注意：**
>
> - 为了提升兼容性，路径 `path` 中的共享库文件名不需要后缀名（如 `.so` 和 `.dll` 等）。
> - 如果某个 `package` 通过静态加载方式（如：`import`）已经导入过，那么动态加载该 `package` 会抛出异常。

参数：

- path: String - 共享库文件的绝对路径或相对路径。

返回值：

- PackageInfo - 指定仓颉动态库的包信息。

异常：

- ReflectException - 如果共享库加载失败，则会抛出异常。
- ReflectException - 如果具有相同包名称或相同文件名的共享库被重复加载，则会抛出异常。
- ReflectException - 如果动态库内部存在多个 Package，则抛出异常。
- IllegalArgumentException - 当路径不合法时，抛出异常。
