package shape_analytics

import std.collection.*
import std.math.*

@Test
class ShapeTests {
    @TestCase
    func squareImplementsShape() {
        let shape: Shape = Square(3.0)
        @Assert(shape.name(), "square")
        @Assert(abs(shape.area() - 9.0) < 0.000001)
    }

    @TestCase
    func circleImplementsShape() {
        let shape: Shape = Circle(2.0)
        @Assert(shape.name(), "circle")
        @Assert(abs(shape.area() - 12.566370614359172) < 0.000001)
    }
}

@Test
class AnalyticsTests {
    @TestCase
    func areasAreDescending() {
        let shapes = ArrayList<Shape>()
        shapes.add(Square(2.0))
        shapes.add(Circle(1.0))
        shapes.add(Square(3.0))

        let values = descendingAreas(shapes)
        @Assert(values.size, 3)
        @Assert(abs(values[0] - 9.0) < 0.000001)
        @Assert(abs(values[1] - 4.0) < 0.000001)
        @Assert(abs(values[2] - 3.141592653589793) < 0.000001)
    }

    @TestCase
    func computesRootMeanSquare() {
        let actual = rootMeanSquare([3.0, 4.0])
        @Assert(abs(actual - 3.5355339059327378) < 0.000001)
    }

    @TestCase
    func computesUnitDirection() {
        let (x, y) = unitDirection(1.5707963267948966)
        @Assert(abs(x) < 0.000001)
        @Assert(abs(y - 1.0) < 0.000001)
    }

    @TestCase
    func computesLogProduct() {
        let actual = logProduct([1.0, 2.0, 4.0])
        @Assert(abs(actual - 2.0794415416798357) < 0.000001)
    }
}
