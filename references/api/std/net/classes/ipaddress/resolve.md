<!-- cj-doc kind="api-member" level="6" id="std.net.class.ipaddress.resolve" parent="std.net.class.ipaddress" -->
# IPAddress.resolve

[← IPAddress](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func resolve(AddressFamily, String)

### 签名

```cangjie role=signature
public static func resolve(family: AddressFamily, domain: String): Array<IPAddress>
```

解析域名，得到 IPAddress 列表。

### 契约

参数：

- family: AddressFamily - 地址族。
- domain: String - 域名。

返回值：

- Array\<IPAddress> - Array\<IPAddress> 对象。

## static func resolve(String)

### 签名

```cangjie role=signature
public static func resolve(domain: String): Array<IPAddress>
```

解析域名，得到 IPAddress 列表。

### 契约

参数：

- domain: String - 域名。

返回值：

- Array\<IPAddress> - Array\<IPAddress> 对象。
