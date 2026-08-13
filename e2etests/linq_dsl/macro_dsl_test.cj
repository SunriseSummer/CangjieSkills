package macro_dsl

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.sort.*
import macros.*

// ==========================================
// Test 1: Basic Select Operations
// ==========================================
@Test
class TestBasicSelect {
    @TestCase
    func testSelectAll() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr select x * 2)
        @Assert(result.size == 5)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
        @Assert(result[3] == 8)
        @Assert(result[4] == 10)
    }

    @TestCase
    func testSelectIdentity() {
        let arr = [10, 20, 30]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 10)
        @Assert(result[1] == 20)
        @Assert(result[2] == 30)
    }

    @TestCase
    func testSelectExpression() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select x * x + 1)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 5)
        @Assert(result[2] == 10)
    }

    @TestCase
    func testSelectNegation() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select 0 - x)
        @Assert(result.size == 3)
        @Assert(result[0] == -1)
        @Assert(result[1] == -2)
        @Assert(result[2] == -3)
    }
}

// ==========================================
// Test 2: Where Clause Filtering
// ==========================================
@Test
class TestWhereClause {
    @TestCase
    func testSingleWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr where x > 3 select x)
        @Assert(result.size == 2)
        @Assert(result[0] == 4)
        @Assert(result[1] == 5)
    }

    @TestCase
    func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)
        @Assert(result.size == 5)
        @Assert(result[0] == 3)
        @Assert(result[1] == 4)
        @Assert(result[2] == 5)
        @Assert(result[3] == 6)
        @Assert(result[4] == 7)
    }

    @TestCase
    func testWhereNoMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 100 select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testWhereAllMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 0 select x)
        @Assert(result.size == 3)
    }

    @TestCase
    func testWhereModulo() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
    }

    @TestCase
    func testWhereComplexCondition() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x >= 3 where x <= 7 where x % 2 == 1 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 3)
        @Assert(result[1] == 5)
        @Assert(result[2] == 7)
    }
}

// ==========================================
// Test 3: OrderBy Sorting
// ==========================================
@Test
class TestOrderBy {
    @TestCase
    func testOrderByAsc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby asc)
        @Assert(result.size == 8)
        @Assert(result[0] == 1)
        @Assert(result[1] == 1)
        @Assert(result[2] == 2)
        @Assert(result[3] == 3)
        @Assert(result[result.size - 1] == 9)
    }

    @TestCase
    func testOrderByDesc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby desc)
        @Assert(result.size == 8)
        @Assert(result[0] == 9)
        @Assert(result[1] == 6)
        @Assert(result[2] == 5)
        @Assert(result[result.size - 1] == 1)
    }

    @TestCase
    func testOrderByWithWhere() {
        let arr = [5, 3, 8, 1, 9, 2, 7]
        let result = @query[Int64](from x in arr where x > 3 select x orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 5)
        @Assert(result[1] == 7)
        @Assert(result[2] == 8)
        @Assert(result[3] == 9)
    }

    @TestCase
    func testOrderByDefault() {
        let arr = [3, 1, 2]
        let result = @query[Int64](from x in arr select x orderby)
        @Assert(result[0] == 1)
        @Assert(result[1] == 2)
        @Assert(result[2] == 3)
    }

    @TestCase
    func testOrderByWithTransform() {
        let arr = [5, 3, 8, 1]
        let result = @query[Int64](from x in arr select x * 10 orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 10)
        @Assert(result[1] == 30)
        @Assert(result[2] == 50)
        @Assert(result[3] == 80)
    }
}

// ==========================================
// Test 4: Count Aggregation
// ==========================================
@Test
class TestCount {
    @TestCase
    func testCountAll() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr)
        @Assert(result == 5)
    }

    @TestCase
    func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
    }

    @TestCase
    func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
    }

    @TestCase
    func testCountMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result: Int64 = @query[count](from x in arr where x > 3 where x < 8)
        @Assert(result == 4)
    }
}

// ==========================================
// Test 5: Type Conversion
// ==========================================
@Test
class TestTypeConversion {
    @TestCase
    func testIntToString() {
        let arr = [1, 2, 3]
        let result = @query[String](from x in arr select x.toString())
        @Assert(result.size == 3)
        @Assert(result[0] == "1")
        @Assert(result[1] == "2")
        @Assert(result[2] == "3")
    }

    @TestCase
    func testBoolResult() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Bool](from x in arr select x > 3)
        @Assert(result.size == 5)
        @Assert(result[0] == false)
        @Assert(result[1] == false)
        @Assert(result[2] == false)
        @Assert(result[3] == true)
        @Assert(result[4] == true)
    }
}

// ==========================================
// Test 6: Complex Scenarios
// ==========================================
@Test
class TestComplexQuery {
    @TestCase
    func testWithArrayList() {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let result = @query[Int64](from x in list where x > 2 select x * 10)
        @Assert(result.size == 3)
        @Assert(result[0] == 30)
        @Assert(result[1] == 40)
        @Assert(result[2] == 50)
    }

    @TestCase
    func testEmptySource() {
        let arr = Array<Int64>(0, {_ => 0})
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testSingleElement() {
        let arr = [42]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 1)
        @Assert(result[0] == 42)
    }

    @TestCase
    func testWhereAndSelect() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x * 3)
        @Assert(result.size == 5)
        @Assert(result[0] == 6)
        @Assert(result[1] == 12)
        @Assert(result[2] == 18)
        @Assert(result[3] == 24)
        @Assert(result[4] == 30)
    }

    @TestCase
    func testFullPipeline() {
        let arr = [15, 3, 8, 12, 1, 20, 7, 14]
        let result = @query[Int64](from x in arr where x > 5 where x < 16 select x orderby desc)
        @Assert(result.size == 5)
        @Assert(result[0] == 15)
        @Assert(result[1] == 14)
        @Assert(result[2] == 12)
        @Assert(result[3] == 8)
        @Assert(result[4] == 7)
    }

    @TestCase
    func testLargeDataset() {
        let arr = Array<Int64>(100, {i => i + 1})
        let result = @query[Int64](from x in arr where x % 10 == 0 select x)
        @Assert(result.size == 10)
        @Assert(result[0] == 10)
        @Assert(result[9] == 100)
    }

    @TestCase
    func testCountAndSelectConsistency() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let cnt: Int64 = @query[count](from x in arr where x > 5)
        let selected = @query[Int64](from x in arr where x > 5 select x)
        @Assert(cnt == selected.size)
    }
}
