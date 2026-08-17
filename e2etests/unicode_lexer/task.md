# Unicode Rune 词法器

在仓颉 `1.1.3 (cjnative)` 中创建可执行包 `unicode_lexer`。使用 `String.runes()`、`std.unicode` 的 Rune 扩展和 `StringBuilder` 把文本切分为 Unicode 单词与数字。不得按 UTF-8 Byte 逐字节分类，也不得只处理 ASCII 范围。

## 公开 API

```cangjie
@Derive[Equatable]
public enum TokenKind {
    | Word
    | Number
}

@Derive[Equatable]
public struct Token {
    public let kind: TokenKind
    public let text: String
    public init(kind: TokenKind, text: String)
}

public class UnicodeLexer {
    public static func tokenize(text: String): Array<Token>
    public static func render(tokens: Array<Token>): String
}
```

连续 Unicode 字母组成 Word，并逐 Rune 转为 Unicode 小写；连续 Unicode 数字组成 Number，保留原字符。空白和其他标点都是分隔符且不产出 token；字母与数字相邻时分成不同 token。必须使用 `isLetter()`、`isNumber()` 和 `toLowerCase()`，以 StringBuilder 累积当前 token。输入为空或全为分隔符时返回空数组。

render 按输入顺序输出 `W:<text>` 或 `N:<text>`，以 `|` 连接。main 处理 `Äpfel １２,仓颉42!`，输出：

```text
W:äpfel|N:１２|W:仓颉|N:42
```

把随题测试原样放入 `src/`；验收所有 cjpm 命令成功且 warning 为 0。
