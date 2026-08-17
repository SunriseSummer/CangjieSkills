"""Stable query and release-format constants."""

SCHEMA_VERSION = "2"

APPLICATION_ID = 0x434A534B

VALID_DOMAINS = {"language", "std", "stdx", "tools", "api", "examples", "guides", "all"}

DEFAULT_MAX_PAGES = 200

DEFAULT_MAX_CHARS = 200_000

DEFAULT_MAX_API_LEAVES = 12

DEFAULT_MAX_TOPIC_LEAVES = 24

BROAD_ROUTING_ROOTS = {"references", "api", "api.std", "api.stdx", "examples", "language", "tools"}

GENERIC_SCOPE_TERMS = {
    "仓颉", "仓颉语言", "cangjie", "文档", "api", "接口文档",
    "语言特性", "应用示例", "使用示例", "使用指南",
}

QUERY_SHAPE_NOISE = {
    "api", "cangjie", "class", "code", "conversion", "convert", "func",
    "function", "import", "language", "method", "package", "parse", "std",
    "stdx", "struct", "type", "value",
}

GENERIC_ARGUMENT_TERMS = {
    "bool", "byte", "rune", "string",
    "int8", "int16", "int32", "int64", "intnative",
    "uint8", "uint16", "uint32", "uint64", "uintnative",
    "float16", "float32", "float64",
}

SEARCHABLE_IDENTIFIER_PARTS = {"api", "ffi", "http", "https", "json", "pi", "tls", "url"}

NON_ACTION_QUERY_TERMS = {"api", "cangjie", "import", "language", "package", "std", "stdx"}

QUERY_TERM_ALIASES = {
    "exception": ("异常",),
    "exceptions": ("异常",),
    "stderr": ("标准错误",),
    "stdout": ("标准输出",),
    "strict": ("严格",),
    "elapsed": ("经过时间", "耗时"),
    "rules": ("规则",),
    "directory": ("目录",),
    "environment": ("环境",),
    "variable": ("变量",),
    # The 1.1.3 API type is named Server; developers often search HttpServer.
    "httpserver": ("http 服务端",),
    "httpserverbuilder": ("serverbuilder",),
    "named": ("命名",),
    "argument": ("参数",),
    "arguments": ("参数",),
    "positional": ("位置", "非命名"),
    "substring": ("子字符串", "切片", "截取"),
    "slice": ("切片",),
    "warning": ("警告", "告警"),
    "warnings": ("警告", "告警"),
    "unused": ("未使用",),
    "initialization": ("init", "初始化"),
    "initialize": ("init", "初始化"),
    "init": ("初始化", "创建"),
    "project": ("项目", "工程"),
    "executable": ("可执行",),
    "constructor": ("init", "构造函数", "构造"),
    "constructors": ("init", "构造函数", "构造"),
    "literal": ("字面量",),
    "literals": ("字面量",),
    "conversion": ("类型转换", "数值转换", "转换"),
    "cast": ("类型转换", "数值转换", "转换"),
    "unwrap": ("getorthrow", "解构", "解包"),
    "unwrapping": ("getorthrow", "解构", "解包"),
    "uppercase": ("toasciiupper", "toupper", "大写"),
    "lowercase": ("toasciilower", "tolower", "小写"),
    # Translate familiar names from adjacent ecosystems to the exact 1.1.3
    # vocabulary.  These remain query-time aliases; the result still exposes
    # the real Cangjie symbol so an agent cannot copy a non-existent API.
    "isdigit": ("isnumber",),
    "isfile": ("isregular", "普通文件"),
    "reentrantmutex": ("mutex", "可重入互斥锁"),
    "append": ("add", "附加", "末尾"),
    "push": ("add", "附加", "末尾"),
    "put": ("operator-indexer", "添加键值对", "覆盖旧值"),
    "character": ("字符", "rune"),
    "characters": ("字符", "rune"),
    "codepoint": ("码点", "unicode 标量值", "uint32"),
    "newline": ("换行", "tokenkind.nl"),
    "newlines": ("换行", "tokenkind.nl"),
    "multiple": ("多条", "多个"),
    "multi": ("多个", "多字段"),
    "multifield": ("多字段",),
    "nl": ("tokenkind.nl", "换行"),
    "statements": ("语句", "多条语句"),
    "getenv": ("getvariable", "获取环境变量"),
    "setenv": ("setvariable", "设置环境变量"),
    "unsetenv": ("removevariable", "移除环境变量"),
    "enqueue": ("add", "队列尾部插入"),
    "dequeue": ("remove", "删除队列头部"),
    "precision": ("精度",),
    "alignment": ("对齐",),
    "cleanup": ("清理", "cleanuppolicy"),
    "tuple": ("元组",),
    "tuples": ("元组",),
    "comparator": ("比较器", "lessthan"),
    "comparison": ("比较", "lessthan", "ordering"),
    "callback": ("回调",),
    "callbacks": ("回调",),
    "empty": ("空字符串", "空值", "为空"),
    "equal": ("等号",),
    "equals": ("等号",),
    "destructure": ("解构",),
    "destructuring": ("解构",),
    "iteration": ("迭代", "遍历"),
    "access": ("访问",),
    "field": ("字段", "元素"),
    "fields": ("字段", "元素"),
    # Fixed-width integers expose Countable.position() as their Int64 value;
    # developers commonly search for it as a conventional conversion name.
    "toint64": ("position", "转换为 int64"),
    "blocked": ("阻塞", "等待"),
    "blocking": ("阻塞", "等待"),
    "sender": ("发送者", "生产者", "入队线程"),
    "senders": ("发送者", "生产者", "入队线程"),
    "drain": ("批量取出", "排空", "清空"),
    "draining": ("批量取出", "排空", "清空"),
    "wake": ("唤醒", "notifyall"),
    "wakeup": ("唤醒", "notifyall"),
    "close": ("关闭", "生命周期"),
    "closed": ("关闭", "已关闭"),
}
