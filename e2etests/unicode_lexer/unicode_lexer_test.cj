package unicode_lexer

@Test
class UnicodeLexerTests {
    @TestCase func emptyInputProducesNoTokens() {
        @Assert(UnicodeLexer.tokenize(""), [])
    }

    @TestCase func separatorsProduceNoTokens() {
        @Assert(UnicodeLexer.tokenize(" ,.!\t\n"), [])
    }

    @TestCase func asciiWordsBecomeLowerCase() {
        @Assert(UnicodeLexer.tokenize("Hello WORLD"), [
            Token(TokenKind.Word, "hello"), Token(TokenKind.Word, "world")
        ])
    }

    @TestCase func unicodeLettersRemainWholeRunes() {
        @Assert(UnicodeLexer.tokenize("Äpfel 仓颉"), [
            Token(TokenKind.Word, "äpfel"), Token(TokenKind.Word, "仓颉")
        ])
    }

    @TestCase func asciiNumbersAreGrouped() {
        @Assert(UnicodeLexer.tokenize("12 345"), [
            Token(TokenKind.Number, "12"), Token(TokenKind.Number, "345")
        ])
    }

    @TestCase func fullWidthNumbersAreUnicodeNumbers() {
        @Assert(UnicodeLexer.tokenize("１２３"), [Token(TokenKind.Number, "１２３")])
    }

    @TestCase func lettersAndNumbersSplitWithoutPunctuation() {
        @Assert(UnicodeLexer.tokenize("abc42def"), [
            Token(TokenKind.Word, "abc"), Token(TokenKind.Number, "42"),
            Token(TokenKind.Word, "def")
        ])
    }

    @TestCase func punctuationSeparatesTokens() {
        @Assert(UnicodeLexer.tokenize("one,two—three"), [
            Token(TokenKind.Word, "one"), Token(TokenKind.Word, "two"),
            Token(TokenKind.Word, "three")
        ])
    }

    @TestCase func renderUsesStableKinds() {
        @Assert(UnicodeLexer.render([
            Token(TokenKind.Word, "x"), Token(TokenKind.Number, "7")
        ]), "W:x|N:7")
    }

    @TestCase func renderEmptyIsEmpty() {
        @Assert(UnicodeLexer.render([]), "")
    }

    @TestCase func mixedExampleMatchesContract() {
        @Assert(UnicodeLexer.render(UnicodeLexer.tokenize("Äpfel １２,仓颉42!")),
            "W:äpfel|N:１２|W:仓颉|N:42")
    }
}
