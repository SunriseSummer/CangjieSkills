package notebook

import std.collection.*
import std.io.*
import std.fs.*
import stdx.encoding.json.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate

// ============================================================
// Test 1: Note 模型 JSON 序列化与反序列化
// ============================================================
@Test
class TestNoteModel {
    @TestCase
    func testNoteToJson() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("urgent")
        let note = Note(1, "Meeting Notes", "Discuss project plan", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["id"].asInt().getValue(), 1)
        @Assert(obj["title"].asString().getValue(), "Meeting Notes")
        @Assert(obj["content"].asString().getValue(), "Discuss project plan")
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 2)
        @Assert(jsonTags[0].asString().getValue(), "work")
        @Assert(jsonTags[1].asString().getValue(), "urgent")
    }

    @TestCase
    func testNoteFromJson() {
        let json = ##"{"id":2,"title":"Shopping List","content":"Buy milk and eggs","tags":["personal"]}"##
        let jv = JsonValue.fromStr(json)
        let note = Note.fromJsonValue(jv)
        @Assert(note.id, 2)
        @Assert(note.title, "Shopping List")
        @Assert(note.content, "Buy milk and eggs")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "personal")
    }

    @TestCase
    func testNoteEmptyTags() {
        let tags = ArrayList<String>()
        let note = Note(3, "Empty", "No tags", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["tags"].asArray().size(), 0)
    }

    @TestCase
    func testNoteRoundTrip() {
        let tags = ArrayList<String>()
        tags.add("a")
        tags.add("b")
        tags.add("c")
        let note = Note(10, "Round Trip", "Test round trip", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.id, 10)
        @Assert(note2.title, "Round Trip")
        @Assert(note2.content, "Test round trip")
        @Assert(note2.tags.size, 3)
        @Assert(note2.tags[0], "a")
        @Assert(note2.tags[1], "b")
        @Assert(note2.tags[2], "c")
    }

    @TestCase
    func testNoteWithSpecialChars() {
        let tags = ArrayList<String>()
        tags.add("special")
        let note = Note(4, "Hello \"World\"", "Line1\nLine2", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "Hello \"World\"")
        @Assert(note2.content, "Line1\nLine2")
        @Assert(note2.tags[0], "special")
    }

    @TestCase
    func testNoteWithChineseContent() {
        let tags = ArrayList<String>()
        tags.add("学习")
        tags.add("仓颉")
        let note = Note(6, "仓颉学习笔记", "今天学习了仓颉语言的基本语法", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "仓颉学习笔记")
        @Assert(note2.content, "今天学习了仓颉语言的基本语法")
        @Assert(note2.tags.size, 2)
    }

    @TestCase
    func testNoteMultipleTags() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("project")
        tags.add("meeting")
        tags.add("Q1")
        let note = Note(5, "Quarterly Review", "Review Q1 progress", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 4)
        @Assert(jsonTags[3].asString().getValue(), "Q1")
    }

    @TestCase
    func testNoteJsonFieldOrder() {
        let tags = ArrayList<String>()
        let note = Note(99, "Order", "Check field order", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj.containsKey("id"))
        @Assert(obj.containsKey("title"))
        @Assert(obj.containsKey("content"))
        @Assert(obj.containsKey("tags"))
    }

    @TestCase
    func testNoteFromJsonPreservesAllFields() {
        let json = ##"{"id":100,"title":"Full","content":"All fields","tags":["x","y","z"]}"##
        let note = Note.fromJsonValue(JsonValue.fromStr(json))
        @Assert(note.id, 100)
        @Assert(note.title, "Full")
        @Assert(note.content, "All fields")
        @Assert(note.tags.size, 3)
        @Assert(note.tags[2], "z")
    }
}

// ============================================================
// Test 2: NoteService 业务逻辑
// ============================================================
@Test
class TestNoteService {
    @TestCase
    func testCreateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("test")
        let note = svc.createNote("Title", "Content", tags)
        @Assert(note.title, "Title")
        @Assert(note.content, "Content")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "test")
    }

    @TestCase
    func testAutoIncrementId() {
        let svc = NoteService()
        let n1 = svc.createNote("Note 1", "C1", ArrayList<String>())
        let n2 = svc.createNote("Note 2", "C2", ArrayList<String>())
        let n3 = svc.createNote("Note 3", "C3", ArrayList<String>())
        @Assert(n2.id > n1.id)
        @Assert(n3.id > n2.id)
    }

    @TestCase
    func testGetNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("find")
        let created = svc.createNote("Find Me", "Content", tags)
        if (let Some(found) <- svc.getNote(created.id)) {
            @Assert(found.title, "Find Me")
            @Assert(found.content, "Content")
        } else {
            @Fail("Note should be found")
        }
    }

    @TestCase
    func testGetNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.getNote(999)) {
            @Fail("Note should not exist")
        }
    }

    @TestCase
    func testGetAllNotes() {
        let svc = NoteService()
        svc.createNote("N1", "C1", ArrayList<String>())
        svc.createNote("N2", "C2", ArrayList<String>())
        svc.createNote("N3", "C3", ArrayList<String>())
        let all = svc.getAllNotes()
        @Assert(all.size, 3)
    }

    @TestCase
    func testGetNotesByTag() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("project")
        svc.createNote("Work Note", "Content", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("personal")
        svc.createNote("Personal Note", "Content", tags2)

        let tags3 = ArrayList<String>()
        tags3.add("work")
        svc.createNote("Another Work", "Content", tags3)

        let workNotes = svc.getNotesByTag("work")
        @Assert(workNotes.size, 2)

        let personalNotes = svc.getNotesByTag("personal")
        @Assert(personalNotes.size, 1)
        @Assert(personalNotes[0].title, "Personal Note")
    }

    @TestCase
    func testGetNotesByTagNoMatch() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("work")
        svc.createNote("Work", "Content", tags)
        let result = svc.getNotesByTag("nonexistent")
        @Assert(result.size, 0)
    }

    @TestCase
    func testUpdateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("old")
        let created = svc.createNote("Original", "Old content", tags)

        let newTags = ArrayList<String>()
        newTags.add("updated")
        if (let Some(updated) <- svc.updateNote(created.id, "Updated", "New content", newTags)) {
            @Assert(updated.title, "Updated")
            @Assert(updated.content, "New content")
            @Assert(updated.tags[0], "updated")
        } else {
            @Fail("Update should succeed")
        }
    }

    @TestCase
    func testUpdateNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.updateNote(999, "X", "Y", ArrayList<String>())) {
            @Fail("Update should fail for non-existent note")
        }
    }

    @TestCase
    func testDeleteNote() {
        let svc = NoteService()
        let created = svc.createNote("Delete Me", "Content", ArrayList<String>())
        @Assert(svc.deleteNote(created.id))
        if (let Some(_) <- svc.getNote(created.id)) {
            @Fail("Deleted note should not be found")
        }
        @Assert(svc.getAllNotes().size, 0)
    }

    @TestCase
    func testDeleteNoteNotFound() {
        let svc = NoteService()
        @Assert(!svc.deleteNote(999))
    }

    @TestCase
    func testGetStats() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("meeting")
        svc.createNote("N1", "C1", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("work")
        svc.createNote("N2", "C2", tags2)

        let tags3 = ArrayList<String>()
        tags3.add("personal")
        svc.createNote("N3", "C3", tags3)

        let stats = svc.getStats()
        let obj = stats.asObject()
        @Assert(obj["total_notes"].asInt().getValue(), 3)
        let tagCounts = obj["tag_counts"].asObject()
        @Assert(tagCounts["work"].asInt().getValue(), 2)
        @Assert(tagCounts["meeting"].asInt().getValue(), 1)
        @Assert(tagCounts["personal"].asInt().getValue(), 1)
    }

    @TestCase
    func testGetStatsEmpty() {
        let svc = NoteService()
        let stats = svc.getStats()
        let obj = stats.asObject()
        @Assert(obj["total_notes"].asInt().getValue(), 0)
    }

    @TestCase
    func testCreateAndDeleteMultiple() {
        let svc = NoteService()
        let n1 = svc.createNote("A", "1", ArrayList<String>())
        let n2 = svc.createNote("B", "2", ArrayList<String>())
        let n3 = svc.createNote("C", "3", ArrayList<String>())
        @Assert(svc.getAllNotes().size, 3)
        @Assert(svc.deleteNote(n2.id))
        @Assert(svc.getAllNotes().size, 2)
        if (let Some(a) <- svc.getNote(n1.id)) {
            @Assert(a.title, "A")
        } else {
            @Fail("Note A should exist")
        }
        if (let Some(c) <- svc.getNote(n3.id)) {
            @Assert(c.title, "C")
        } else {
            @Fail("Note C should exist")
        }
    }

    @TestCase
    func testUpdatePreservesId() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("orig")
        let created = svc.createNote("Orig", "Content", tags)
        let origId = created.id

        let newTags = ArrayList<String>()
        newTags.add("new")
        if (let Some(updated) <- svc.updateNote(origId, "New", "New content", newTags)) {
            @Assert(updated.id, origId)
        } else {
            @Fail("Update should succeed")
        }
    }
}

// ============================================================
// Test 3: HTTP API 集成测试
// ============================================================
@Test
class TestNoteAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let service = NoteService()
        let server = NoteServer(service)
        server.start("127.0.0.1", 0)
        _server = server
        _baseUrl = "http://127.0.0.1:${server.getPort()}"
        _client = ClientBuilder().build()
    }

    @AfterAll
    func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"API Note","content":"Created via API","tags":["api","test"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let jv = JsonValue.fromStr(respBody)
        let obj = jv.asObject()
        @Assert(obj["title"].asString().getValue(), "API Note")
        @Assert(obj["content"].asString().getValue(), "Created via API")
        @Assert(obj["tags"].asArray().size(), 2)
        @Assert(obj.containsKey("id"))
    }

    @TestCase
    func testCreateAndGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"Get Test","content":"Test content for get","tags":["gettest"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        let getBody = StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 200)
        let got = JsonValue.fromStr(getBody).asObject()
        @Assert(got["title"].asString().getValue(), "Get Test")
        @Assert(got["id"].asInt().getValue(), id)
    }

    @TestCase
    func testGetNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note?id=99999")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note with a unique tag
        let body = ##"{"title":"List Test","content":"For listing","tags":["listtest_unique"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List all
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
        let obj = JsonValue.fromStr(listBody).asObject()
        @Assert(obj.containsKey("notes"))
        @Assert(obj.containsKey("total"))
        let total = obj["total"].asInt().getValue()
        @Assert(total >= 1)
    }

    @TestCase
    func testFilterByTagAPI() {
        let client = _client.getOrThrow()
        // Create two notes with specific tag
        let body1 = ##"{"title":"Filter A","content":"Content A","tags":["filtertag"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Filter B","content":"Content B","tags":["filtertag"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()

        // Filter
        let filterResp = client.get("${_baseUrl}/api/notes?tag=filtertag")
        let filterBody = StringReader(filterResp.body).readToEnd()
        @Assert(filterResp.status == 200)
        let obj = JsonValue.fromStr(filterBody).asObject()
        let total = obj["total"].asInt().getValue()
        @Assert(total >= 2)
    }

    @TestCase
    func testUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"Before Update","content":"Old content","tags":["old"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update via PUT
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"After Update","content":"New content","tags":["new"]}"##
            .replace("ID_PLACEHOLDER", id.toString())
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        let updateRespBody = StringReader(updateResp.body).readToEnd()
        @Assert(updateResp.status == 200)
        let updated = JsonValue.fromStr(updateRespBody).asObject()
        @Assert(updated["title"].asString().getValue(), "After Update")
        @Assert(updated["content"].asString().getValue(), "New content")
    }

    @TestCase
    func testUpdateNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let updateBody = ##"{"id":99999,"title":"Ghost","content":"Phantom","tags":[]}"##
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        StringReader(updateResp.body).readToEnd()
        @Assert(updateResp.status == 404)
    }

    @TestCase
    func testDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"To Delete","content":"Will be deleted","tags":["delete"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
        let deleteBody = StringReader(deleteResp.body).readToEnd()
        @Assert(deleteResp.status == 200)
        let result = JsonValue.fromStr(deleteBody).asObject()
        @Assert(result["success"].asBool().getValue())

        // Verify gone
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 404)
    }

    @TestCase
    func testDeleteNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.delete("${_baseUrl}/api/note?id=99999")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
    }

    @TestCase
    func testGetStatsAPI() {
        let client = _client.getOrThrow()
        // Create notes with known tags
        let body1 = ##"{"title":"Stats A","content":"CA","tags":["statstag1","statstag2"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Stats B","content":"CB","tags":["statstag1"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()

        // Get stats
        let statsResp = client.get("${_baseUrl}/api/stats")
        let statsBody = StringReader(statsResp.body).readToEnd()
        @Assert(statsResp.status == 200)
        let obj = JsonValue.fromStr(statsBody).asObject()
        @Assert(obj.containsKey("total_notes"))
        @Assert(obj.containsKey("tag_counts"))
        let totalNotes = obj["total_notes"].asInt().getValue()
        @Assert(totalNotes >= 2)
    }

    @TestCase
    func testMissingIdParamAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
    }

    @TestCase
    func testInvalidJsonBodyAPI() {
        let client = _client.getOrThrow()
        let resp = client.post("${_baseUrl}/api/notes", "not json at all")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testFullWorkflowAPI() {
        let client = _client.getOrThrow()

        // 1. Create a note
        let createBody = ##"{"title":"Workflow Note","content":"Full workflow test","tags":["workflow","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()
        @Assert(created["title"].asString().getValue(), "Workflow Note")

        // 2. Get the note
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        let getBody = StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 200)
        let got = JsonValue.fromStr(getBody).asObject()
        @Assert(got["title"].asString().getValue(), "Workflow Note")

        // 3. Update the note
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"Updated Workflow","content":"Updated content","tags":["workflow","updated"]}"##
            .replace("ID_PLACEHOLDER", id.toString())
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        let updateRespBody = StringReader(updateResp.body).readToEnd()
        @Assert(updateResp.status == 200)
        let updated = JsonValue.fromStr(updateRespBody).asObject()
        @Assert(updated["title"].asString().getValue(), "Updated Workflow")

        // 4. Verify update via get
        let getResp2 = client.get("${_baseUrl}/api/note?id=${id}")
        let getBody2 = StringReader(getResp2.body).readToEnd()
        let got2 = JsonValue.fromStr(getBody2).asObject()
        @Assert(got2["title"].asString().getValue(), "Updated Workflow")

        // 5. Delete the note
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
        StringReader(deleteResp.body).readToEnd()
        @Assert(deleteResp.status == 200)

        // 6. Verify deletion
        let getResp3 = client.get("${_baseUrl}/api/note?id=${id}")
        StringReader(getResp3.body).readToEnd()
        @Assert(getResp3.status == 404)
    }
}

// ============================================================
// Test 4: HTTPS API 集成测试
// ============================================================
@Test
class TestNoteHTTPSAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
        let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

        let service = NoteService()
        let server = NoteServer(service)
        server.startTls("127.0.0.1", 0, certPem, keyPem)
        _server = server
        _baseUrl = "https://127.0.0.1:${server.getPort()}"

        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))
        _client = ClientBuilder().tlsConfig(tlsConfig).build()
    }

    @AfterAll
    func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testHttpsCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Note","content":"Created over TLS","tags":["https","secure"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj["title"].asString().getValue(), "HTTPS Note")
        @Assert(obj.containsKey("id"))
    }

    @TestCase
    func testHttpsListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note first
        let body = ##"{"title":"HTTPS List","content":"List over TLS","tags":["httpslist"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
        let obj = JsonValue.fromStr(listBody).asObject()
        @Assert(obj.containsKey("notes"))
        @Assert(obj["total"].asInt().getValue() >= 1)
    }

    @TestCase
    func testHttpsGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Get","content":"Get via TLS","tags":["httpsget"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        let getBody = StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 200)
        let got = JsonValue.fromStr(getBody).asObject()
        @Assert(got["title"].asString().getValue(), "HTTPS Get")
    }

    @TestCase
    func testHttpsUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"HTTPS Update","content":"Old","tags":["httpsupd"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"HTTPS Updated","content":"New","tags":["httpsupd","done"]}"##
            .replace("ID_PLACEHOLDER", id.toString())
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        let updateRespBody = StringReader(updateResp.body).readToEnd()
        @Assert(updateResp.status == 200)
        let updated = JsonValue.fromStr(updateRespBody).asObject()
        @Assert(updated["title"].asString().getValue(), "HTTPS Updated")
    }

    @TestCase
    func testHttpsDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Del","content":"Delete via TLS","tags":["httpsdel"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
        let deleteBody = StringReader(deleteResp.body).readToEnd()
        @Assert(deleteResp.status == 200)
        let result = JsonValue.fromStr(deleteBody).asObject()
        @Assert(result["success"].asBool().getValue())

        // Verify gone
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 404)
    }

    @TestCase
    func testHttpsGetStatsAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Stats","content":"Stats via TLS","tags":["httpsstat"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        let statsResp = client.get("${_baseUrl}/api/stats")
        let statsBody = StringReader(statsResp.body).readToEnd()
        @Assert(statsResp.status == 200)
        let obj = JsonValue.fromStr(statsBody).asObject()
        @Assert(obj.containsKey("total_notes"))
        @Assert(obj.containsKey("tag_counts"))
    }

    @TestCase
    func testHttpsFullWorkflow() {
        let client = _client.getOrThrow()

        // 1. Create
        let createBody = ##"{"title":"HTTPS Workflow","content":"Full HTTPS test","tags":["https","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // 2. Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
        let getBody = StringReader(getResp.body).readToEnd()
        @Assert(getResp.status == 200)
        let got = JsonValue.fromStr(getBody).asObject()
        @Assert(got["title"].asString().getValue(), "HTTPS Workflow")

        // 3. Update
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"HTTPS Updated WF","content":"Updated","tags":["https","updated"]}"##
            .replace("ID_PLACEHOLDER", id.toString())
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        StringReader(updateResp.body).readToEnd()
        @Assert(updateResp.status == 200)

        // 4. Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
        StringReader(deleteResp.body).readToEnd()
        @Assert(deleteResp.status == 200)

        // 5. Verify gone
        let getResp2 = client.get("${_baseUrl}/api/note?id=${id}")
        StringReader(getResp2.body).readToEnd()
        @Assert(getResp2.status == 404)
    }
}
