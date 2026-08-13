package json_catalog

private func expectCatalogError(action: () -> Unit): Unit {
    try {
        action()
        @Fail("expected CatalogException")
    } catch (_: CatalogException) {
        @Assert(true)
    }
}

@Test
class CatalogCodecTests {
    @TestCase func bookRoundTripsTags() {
        let source = Book(1, "One", ["a", "b"])
        let restored = Book.deserialize(source.serialize())
        @Assert(restored.id, 1)
        @Assert(restored.title, "One")
        @Assert(restored.tags, ["a", "b"])
    }

    @TestCase func catalogRoundTripsMultipleBooks() {
        let source = Catalog("shelf", [Book(1, "A", []), Book(2, "B", ["x"])])
        let restored = CatalogCodec.fromJson(CatalogCodec.toJson(source))
        @Assert(restored.name, "shelf")
        @Assert(restored.books.size, 2)
        @Assert(restored.books[0].id, 1)
        @Assert(restored.books[1].title, "B")
        @Assert(restored.books[1].tags, ["x"])
    }

    @TestCase func emptyArraysRoundTrip() {
        let restored = CatalogCodec.fromJson(CatalogCodec.toJson(Catalog("empty", [])))
        @Assert(restored.books.isEmpty())
    }

    @TestCase func jsonHasStableFieldOrder() {
        let text = CatalogCodec.toJson(Catalog("demo", [Book(7, "Cangjie", ["lang", "vm"])]))
        @Assert(text, "{\"name\":\"demo\",\"books\":[{\"id\":7,\"title\":\"Cangjie\",\"tags\":[\"lang\",\"vm\"]}]}")
    }

    @TestCase func malformedJsonIsTranslated() {
        expectCatalogError { => CatalogCodec.fromJson("{"); () }
    }

    @TestCase func wrongRootTypeIsTranslated() {
        expectCatalogError { => CatalogCodec.fromJson("[]"); () }
    }

    @TestCase func missingFieldIsTranslated() {
        expectCatalogError { => CatalogCodec.fromJson("{\"name\":\"x\"}"); () }
    }

    @TestCase func wrongFieldTypeIsTranslated() {
        expectCatalogError { => CatalogCodec.fromJson("{\"name\":1,\"books\":[]}"); () }
    }

    @TestCase func wrongNestedElementIsTranslated() {
        expectCatalogError { => CatalogCodec.fromJson("{\"name\":\"x\",\"books\":[1]}"); () }
    }

    @TestCase func constructorsCloneArrays() {
        let tags = ["initial"]
        let book = Book(1, "A", tags)
        tags[0] = "changed"
        @Assert(book.tags, ["initial"])
        let books = [book]
        let catalog = Catalog("x", books)
        books[0] = Book(2, "B", [])
        @Assert(catalog.books[0].id, 1)
    }
}
