package mustache

@Test
class TestVariableInterpolation {
    @TestCase
    func testSimpleVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("World"))
        @Assert(tmpl.render(ctx), "Hello, World!")
    }

    @TestCase
    func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("greeting", MustacheStr("Hi"))
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Hi, Alice!")
    }

    @TestCase
    func testMissingVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hello, !")
    }

    @TestCase
    func testHtmlEscaping() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt;bold&lt;/b&gt;")
    }

    @TestCase
    func testAllHtmlEntities() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("&<>\"'"))
        @Assert(tmpl.render(ctx), "&amp;&lt;&gt;&quot;&#39;")
    }

    @TestCase
    func testEmptyTemplate() {
        let tmpl = MustacheTemplate.fromString("")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testPlainText() {
        let tmpl = MustacheTemplate.fromString("Just plain text")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Just plain text")
    }

    @TestCase
    func testVariableWithWhitespace() {
        let tmpl = MustacheTemplate.fromString("{{ name }}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice")
    }
}

@Test
class TestUnescapedVariable {
    @TestCase
    func testTripleBrace() {
        let tmpl = MustacheTemplate.fromString("{{{content}}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMixedEscaping() {
        let tmpl = MustacheTemplate.fromString("{{escaped}} {{{unescaped}}}")
        let ctx = MustacheContext()
        ctx.put("escaped", MustacheStr("<b>"))
        ctx.put("unescaped", MustacheStr("<b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt; <b>")
    }
}

@Test
class TestSections {
    @TestCase
    func testBoolTrueSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "Visible")
    }

    @TestCase
    func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}} {{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "a b c ")
    }

    @TestCase
    func testEmptyListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}item{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testContextSection() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} is {{age}}{{/person}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        person.put("age", MustacheStr("30"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice is 30")
    }

    @TestCase
    func testListOfContexts() {
        let tmpl = MustacheTemplate.fromString("{{#people}}{{name}} {{/people}}")
        let ctx = MustacheContext()
        let people = MustacheList()
        let p1 = MustacheContext()
        p1.put("name", MustacheStr("Alice"))
        let p2 = MustacheContext()
        p2.put("name", MustacheStr("Bob"))
        people.add(p1)
        people.add(p2)
        ctx.put("people", people)
        @Assert(tmpl.render(ctx), "Alice Bob ")
    }

    @TestCase
    func testNestedSections() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}yes{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("a", MustacheBool(true))
        ctx.put("b", MustacheBool(true))
        @Assert(tmpl.render(ctx), "yes")
    }
}

@Test
class TestInvertedSections {
    @TestCase
    func testInvertedFalse() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "No items")
    }

    @TestCase
    func testInvertedNonEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
class TestComments {
    @TestCase
    func testComment() {
        let tmpl = MustacheTemplate.fromString("Before{{! comment }}After")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "BeforeAfter")
    }

    @TestCase
    func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice!")
    }
}

@Test
class TestDotNotation {
    @TestCase
    func testNestedAccess() {
        let tmpl = MustacheTemplate.fromString("{{person.name}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice")
    }

    @TestCase
    func testDeepNesting() {
        let tmpl = MustacheTemplate.fromString("{{a.b.c}}")
        let ctx = MustacheContext()
        let a = MustacheContext()
        let b = MustacheContext()
        b.put("c", MustacheStr("deep"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "deep")
    }

    @TestCase
    func testMissingNested() {
        let tmpl = MustacheTemplate.fromString("{{person.unknown}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotOnNonContext() {
        let tmpl = MustacheTemplate.fromString("{{name.length}}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
class TestDotValue {
    @TestCase
    func testDotInList() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}}{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "abc")
    }

    @TestCase
    func testDotOutsideList() {
        let tmpl = MustacheTemplate.fromString("{{.}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotWithSeparator() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}},{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("x"))
        items.add(MustacheStr("y"))
        items.add(MustacheStr("z"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "x,y,z,")
    }
}

@Test
class TestContextStack {
    @TestCase
    func testParentFallback() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} - {{title}}{{/person}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("Engineer"))
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice - Engineer")
    }

    @TestCase
    func testInnerOverride() {
        let tmpl = MustacheTemplate.fromString("{{#inner}}{{value}}{{/inner}}")
        let ctx = MustacheContext()
        ctx.put("value", MustacheStr("outer"))
        let inner = MustacheContext()
        inner.put("value", MustacheStr("inner"))
        ctx.put("inner", inner)
        @Assert(tmpl.render(ctx), "inner")
    }

    @TestCase
    func testDeepStack() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}{{x}}-{{y}}-{{z}}{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("x", MustacheStr("1"))
        let a = MustacheContext()
        a.put("y", MustacheStr("2"))
        let b = MustacheContext()
        b.put("z", MustacheStr("3"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "1-2-3")
    }
}

@Test
class TestErrorHandling {
    @TestCase
    func testUnclosedTag() {
        try {
            MustacheTemplate.fromString("{{name")
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
    }

    @TestCase
    func testMismatchedSection() {
        try {
            MustacheTemplate.fromString("{{#a}}text{{/b}}")
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
    }

    @TestCase
    func testUnclosedSection() {
        try {
            MustacheTemplate.fromString("{{#a}}text")
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
    }

    @TestCase
    func testUnexpectedClose() {
        try {
            MustacheTemplate.fromString("{{/a}}")
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
    }
}

@Test
class TestBuildValues {
    @TestCase
    func testBuildContext() {
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        ctx.put("age", MustacheStr("30"))
        @Assert(ctx.containsKey("name"))
        @Assert(ctx.containsKey("age"))
        @Assert(!ctx.containsKey("unknown"))
    }

    @TestCase
    func testContextPutOverwrite() {
        let ctx = MustacheContext()
        ctx.put("key", MustacheStr("old"))
        ctx.put("key", MustacheStr("new"))
        @Assert(ctx.get("key").getOrThrow().asString(), "new")
    }

    @TestCase
    func testBuildList() {
        let list = MustacheList()
        list.add(MustacheStr("a"))
        list.add(MustacheStr("b"))
        @Assert(list.size(), 2)
        @Assert(list.get(0).asString(), "a")
        @Assert(list.get(1).asString(), "b")
    }

    @TestCase
    func testTypeChecks() {
        @Assert(MustacheNone().isNone())
        @Assert(!MustacheNone().isBool())
        @Assert(!MustacheNone().isString())
        @Assert(!MustacheNone().isList())
        @Assert(!MustacheNone().isContext())

        @Assert(MustacheBool(true).isBool())
        @Assert(MustacheStr("x").isString())
        @Assert(MustacheList().isList())
        @Assert(MustacheContext().isContext())
    }

    @TestCase
    func testTypeMismatchThrows() {
        try {
            MustacheNone().asBool()
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
        try {
            MustacheNone().asString()
            @Fail("Should have thrown")
        } catch (e: MustacheException) {
            @Assert(true)
        }
    }

    @TestCase
    func testGetMissing() {
        let ctx = MustacheContext()
        @Assert(ctx.get("missing").isNone())
    }

    @TestCase
    func testBoolValues() {
        @Assert(MustacheBool(true).asBool(), true)
        @Assert(MustacheBool(false).asBool(), false)
    }
}

@Test
class TestComplex {
    @TestCase
    func testHtmlTemplate() {
        let tmpl = MustacheTemplate.fromString("<h1>{{title}}</h1><ul>{{#items}}<li>{{name}}: {{value}}</li>{{/items}}</ul>{{^items}}<p>No items</p>{{/items}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("My List"))
        let items = MustacheList()
        let i1 = MustacheContext()
        i1.put("name", MustacheStr("Item 1"))
        i1.put("value", MustacheStr("100"))
        let i2 = MustacheContext()
        i2.put("name", MustacheStr("Item 2"))
        i2.put("value", MustacheStr("200"))
        items.add(i1)
        items.add(i2)
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "<h1>My List</h1><ul><li>Item 1: 100</li><li>Item 2: 200</li></ul>")
    }

    @TestCase
    func testNestedListsTemplate() {
        let tmpl = MustacheTemplate.fromString("{{#groups}}[{{#members}}{{.}} {{/members}}]{{/groups}}")
        let ctx = MustacheContext()
        let groups = MustacheList()
        let g1 = MustacheContext()
        let m1 = MustacheList()
        m1.add(MustacheStr("Alice"))
        m1.add(MustacheStr("Bob"))
        g1.put("members", m1)
        let g2 = MustacheContext()
        let m2 = MustacheList()
        m2.add(MustacheStr("Charlie"))
        g2.put("members", m2)
        groups.add(g1)
        groups.add(g2)
        ctx.put("groups", groups)
        @Assert(tmpl.render(ctx), "[Alice Bob ][Charlie ]")
    }

    @TestCase
    func testConditionalSections() {
        let tmpl = MustacheTemplate.fromString("{{#loggedIn}}Welcome, {{name}}!{{/loggedIn}}{{^loggedIn}}Please log in.{{/loggedIn}}")
        let ctx1 = MustacheContext()
        ctx1.put("loggedIn", MustacheBool(true))
        ctx1.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx1), "Welcome, Alice!")

        let ctx2 = MustacheContext()
        ctx2.put("loggedIn", MustacheBool(false))
        @Assert(tmpl.render(ctx2), "Please log in.")
    }
}
