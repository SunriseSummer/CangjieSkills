<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.prop-hostname" parent="std.net.class.ipaddress" -->
# IPAddress.hostName

[← IPAddress](index.md)

## 签名

```cangjie role=signature
public prop hostName: ?String
```

返回当前 IPAddress 对象对应的主机名，如果无法成功解析，则为 None，当前暂未实现。

## 契约

异常：

- UnsupportedException - 如果不是合法字符串，抛出异常。

类型：?String
