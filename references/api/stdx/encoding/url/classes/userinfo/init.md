<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.url.class.userinfo.init" parent="stdx.encoding.url.class.userinfo" -->
# UserInfo.init

[← UserInfo](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## init()

### 签名

```cangjie role=signature
public init()
```

创建 UserInfo 实例。

## init(String)

### 签名

```cangjie role=signature
public init(userName: String)
```

根据用户名创建 UserInfo 实例。

### 契约

参数：

- userName: String - 用户名。

## init(String, Option<String>)

### 签名

```cangjie role=signature
public init(userName: String, passWord: Option<String>)
```

根据用户名和密码创建 UserInfo 实例。

### 契约

参数：

- userName: String - 用户名。
- passWord: Option\<String> - 密码，用 Option\<String> 类型表示。

## init(String, String)

### 签名

```cangjie role=signature
public init(userName: String, passWord: String)
```

根据用户名和密码创建 UserInfo 实例。

### 契约

参数：

- userName: String - 用户名。
- passWord: String - 密码。
