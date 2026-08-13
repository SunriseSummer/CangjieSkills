package sha256_lines

@Test
func sha256PublicVectorTest(): Unit {
    @Expect(
        sha256Hex("abc"),
        "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
    )
}

@Test
func emptyFileContentProducesNoRecordsTest(): Unit {
    @Expect(digestTextLines("").size, 0)
}

@Test
func asciiChineseAndEmptyLinesKeepOrderTest(): Unit {
    let records = digestTextLines("abc\n\n仓颉")
    @Expect(records.size, 3)
    @Expect(records[0], "${sha256Hex("abc")}  abc")
    @Expect(records[1], "${sha256Hex("")}  ")
    @Expect(records[2], "${sha256Hex("仓颉")}  仓颉")
}
