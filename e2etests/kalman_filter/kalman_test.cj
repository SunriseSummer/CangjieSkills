package kalman

import std.math.*
import std.collection.*

// ============================================================
// 1. 基础 API 测试
// ============================================================

@Test
class TestKalmanFilterCreate {
    /** 创建和销毁滤波器 */
    @TestCase
    func testCreateAndDestroy() {
        let kf = KalmanFilter(4, 2)
        @Assert(kf.stateDim, 4)
        @Assert(kf.measDim, 2)
        kf.destroy()
    }

    /** 创建 1 维滤波器 */
    @TestCase
    func testCreate1D() {
        let kf = KalmanFilter(2, 1)
        @Assert(kf.stateDim, 2)
        @Assert(kf.measDim, 1)
        kf.destroy()
    }

    /** 无效维度应抛出异常 */
    @TestCase
    func testInvalidDimensions() {
        try {
            let _ = KalmanFilter(0, 2)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        try {
            let _ = KalmanFilter(2, -1)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
    }

    /** 多次销毁不应崩溃 */
    @TestCase
    func testDoubleDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        kf.destroy()
        @Assert(true)
    }

    /** 销毁后操作应抛出异常 */
    @TestCase
    func testUseAfterDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        try {
            kf.getState()
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
    }
}

// ============================================================
// 2. 矩阵设置与维度校验测试
// ============================================================

@Test
class TestKalmanFilterSetup {
    /** 设置和获取状态 */
    @TestCase
    func testSetAndGetState() {
        let kf = KalmanFilter(3, 1)
        let x0: Array<Float64> = [1.0, 2.0, 3.0]
        kf.setState(x0)
        let x = kf.getState()
        @Assert(x.size, 3)
        @Assert(abs(x[0] - 1.0) < 1.0e-10)
        @Assert(abs(x[1] - 2.0) < 1.0e-10)
        @Assert(abs(x[2] - 3.0) < 1.0e-10)
        kf.destroy()
    }

    /** 设置和获取协方差矩阵 */
    @TestCase
    func testSetAndGetCovariance() {
        let kf = KalmanFilter(2, 1)
        let P: Array<Float64> = [4.0, 0.0, 0.0, 9.0]
        kf.setCovariance(P)
        let P2 = kf.getCovariance()
        @Assert(P2.size, 4)
        @Assert(abs(P2[0] - 4.0) < 1.0e-10)
        @Assert(abs(P2[3] - 9.0) < 1.0e-10)
        kf.destroy()
    }

    /** 矩阵大小不匹配应抛出异常 */
    @TestCase
    func testStateSizeMismatch() {
        let kf = KalmanFilter(3, 1)
        try {
            kf.setState([1.0, 2.0])  // 期望 3，给了 2
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }

    /** 转移矩阵大小不匹配应抛出异常 */
    @TestCase
    func testTransitionSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setTransition([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }

    /** 观测矩阵大小不匹配应抛出异常 */
    @TestCase
    func testObservationSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setObservation([1.0, 0.0, 0.0])  // 期望 2 (1x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }

    /** 测量噪声矩阵大小不匹配应抛出异常 */
    @TestCase
    func testMeasNoiseSizeMismatch() {
        let kf = KalmanFilter(2, 2)
        try {
            kf.setMeasurementNoise([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
}

// ============================================================
// 3. 一维卡尔曼滤波测试
// ============================================================

@Test
class TestKalmanFilter1D {
    /**
     * 1D 静态值估计：真值为常数 100，测量带噪声。
     * 滤波后估计值应趋近 100。
     */
    @TestCase
    func testStaticValueEstimation() {
        let kf = KalmanFilter(1, 1)
        // F = [1], H = [1]
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0001])
        kf.setMeasurementNoise([100.0])  // R = 100 (sigma=10)
        kf.setState([0.0])
        kf.setCovariance([1000.0])

        // 用固定的测量序列模拟（围绕 100 波动）
        let measurements: Array<Float64> = [
            105.0, 95.0, 110.0, 88.0, 102.0,
            97.0, 108.0, 92.0, 100.0, 103.0,
            98.0, 107.0, 94.0, 101.0, 99.0,
            106.0, 93.0, 104.0, 96.0, 100.0
        ]

        for (m in measurements) {
            kf.predict()
            kf.update([m])
        }

        let state = kf.getState()
        // 20 次测量后，估计值应接近 100（允许 5 的误差）
        @Assert(abs(state[0] - 100.0) < 5.0)
        kf.destroy()
    }

    /**
     * 1D 匀速运动跟踪：状态 = [位置, 速度]，测量 = [位置]。
     * 真实运动：初始位置 0，速度 10 m/s。
     */
    @TestCase
    func testConstantVelocity1D() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0

        // F = [[1, dt], [0, 1]]
        kf.setTransition([1.0, dt, 0.0, 1.0])
        // H = [[1, 0]]（只测量位置）
        kf.setObservation([1.0, 0.0])
        // Q: 较小的过程噪声
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        // R: 测量噪声
        kf.setMeasurementNoise([25.0])  // sigma=5
        // 初始状态：位置=0, 速度=0
        kf.setState([0.0, 0.0])
        kf.setCovariance([100.0, 0.0, 0.0, 100.0])

        // 真实速度为 10 m/s
        let trueVelocity = 10.0
        let rng = SimpleRandom(123)

        for (i in 1..=30) {
            let truePos = trueVelocity * Float64(i) * dt
            let measPos = truePos + 5.0 * rng.nextGaussian()
            kf.predict()
            kf.update([measPos])
        }

        let state = kf.getState()
        // 30 步后，位置应接近 300（允许 10 的误差）
        @Assert(abs(state[0] - 300.0) < 10.0)
        // 速度应接近 10（允许 2 的误差）
        @Assert(abs(state[1] - 10.0) < 2.0)
        kf.destroy()
    }

    /**
     * 仅预测（不更新）：状态应按转移矩阵传播。
     */
    @TestCase
    func testPredictOnly() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.1, 0.0, 0.0, 0.1])
        kf.setMeasurementNoise([1.0])
        // 初始状态：位置=10, 速度=5
        kf.setState([10.0, 5.0])
        kf.setCovariance([1.0, 0.0, 0.0, 1.0])

        // 预测 3 步，不进行更新
        kf.predict()
        kf.predict()
        kf.predict()

        let state = kf.getState()
        // 位置应为 10 + 5*3 = 25
        @Assert(abs(state[0] - 25.0) < 1.0e-10)
        // 速度应保持 5
        @Assert(abs(state[1] - 5.0) < 1.0e-10)

        // 协方差应增大（因为无更新）
        let P = kf.getCovariance()
        @Assert(P[0] > 1.0)  // 位置不确定性增大
        kf.destroy()
    }
}

// ============================================================
// 4. 二维卡尔曼滤波测试
// ============================================================

@Test
class TestKalmanFilter2D {
    /**
     * 2D 匀速运动跟踪：状态 = [px, py, vx, vy]，测量 = [px, py]。
     * 真实运动：位置 (0,0)，速度 (10, 5) m/s。
     */
    @TestCase
    func testConstantVelocity2D() {
        let kf = KalmanFilter(4, 2)
        let dt = 1.0

        // F: 匀速模型
        kf.setTransition([
            1.0, 0.0, dt,  0.0,
            0.0, 1.0, 0.0, dt,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        ])
        // H: 观测位置
        kf.setObservation([
            1.0, 0.0, 0.0, 0.0,
            0.0, 1.0, 0.0, 0.0
        ])
        // Q: 过程噪声
        kf.setProcessNoise([
            0.25, 0.0,  0.5, 0.0,
            0.0,  0.25, 0.0, 0.5,
            0.5,  0.0,  1.0, 0.0,
            0.0,  0.5,  0.0, 1.0
        ])
        // R: 测量噪声
        kf.setMeasurementNoise([
            100.0, 0.0,
            0.0,   100.0
        ])
        // 初始状态
        kf.setState([0.0, 0.0, 0.0, 0.0])
        kf.setCovariance([
            500.0, 0.0,   0.0,   0.0,
            0.0,   500.0, 0.0,   0.0,
            0.0,   0.0,   100.0, 0.0,
            0.0,   0.0,   0.0,   100.0
        ])

        let trueVx = 10.0
        let trueVy = 5.0
        let rng = SimpleRandom(456)

        for (i in 1..=40) {
            let t = Float64(i) * dt
            let truePx = trueVx * t
            let truePy = trueVy * t
            let measPx = truePx + 10.0 * rng.nextGaussian()
            let measPy = truePy + 10.0 * rng.nextGaussian()
            kf.predict()
            kf.update([measPx, measPy])
        }

        let state = kf.getState()
        // 40 步后，位置应接近 (400, 200)
        @Assert(abs(state[0] - 400.0) < 20.0)
        @Assert(abs(state[1] - 200.0) < 20.0)
        // 速度应接近 (10, 5)
        @Assert(abs(state[2] - 10.0) < 3.0)
        @Assert(abs(state[3] - 5.0) < 3.0)
        kf.destroy()
    }

    /**
     * 2D 静态目标：位置固定在 (50, 30)，有测量噪声。
     * 滤波后应趋近真实位置。
     */
    @TestCase
    func testStaticTarget2D() {
        let kf = KalmanFilter(2, 2)
        // 静态模型 F = I
        kf.setTransition([1.0, 0.0, 0.0, 1.0])
        // H = I
        kf.setObservation([1.0, 0.0, 0.0, 1.0])
        kf.setProcessNoise([0.001, 0.0, 0.0, 0.001])
        kf.setMeasurementNoise([25.0, 0.0, 0.0, 25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([1000.0, 0.0, 0.0, 1000.0])

        let truePx = 50.0
        let truePy = 30.0
        let rng = SimpleRandom(789)

        for (_ in 0..30) {
            let measPx = truePx + 5.0 * rng.nextGaussian()
            let measPy = truePy + 5.0 * rng.nextGaussian()
            kf.predict()
            kf.update([measPx, measPy])
        }

        let state = kf.getState()
        @Assert(abs(state[0] - 50.0) < 5.0)
        @Assert(abs(state[1] - 30.0) < 5.0)
        kf.destroy()
    }
}

// ============================================================
// 5. 滤波收敛性测试
// ============================================================

@Test
class TestKalmanConvergence {
    /**
     * 验证协方差收敛：多次预测+更新后，P 应减小。
     */
    @TestCase
    func testCovarianceDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        let initialP = kf.getCovariance()[0]

        for (_ in 0..10) {
            kf.predict()
            kf.update([50.0])
        }

        let finalP = kf.getCovariance()[0]
        // 协方差应显著减小
        @Assert(finalP < initialP)
        @Assert(finalP < 1.0)  // 应远小于初始值 100
        kf.destroy()
    }

    /**
     * 验证估计误差收敛：前期误差应大于后期误差。
     */
    @TestCase
    func testErrorConverges() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        kf.setMeasurementNoise([25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([100.0, 0.0, 0.0, 100.0])

        let trueVel = 10.0
        let rng = SimpleRandom(111)

        var earlyErrors = ArrayList<Float64>()
        var lateErrors = ArrayList<Float64>()

        for (i in 1..=40) {
            let truePos = trueVel * Float64(i) * dt
            let measPos = truePos + 5.0 * rng.nextGaussian()
            kf.predict()
            kf.update([measPos])
            let state = kf.getState()
            let error = abs(state[0] - truePos)
            if (i <= 10) {
                earlyErrors.add(error)
            }
            if (i > 30) {
                lateErrors.add(error)
            }
        }

        var earlySum = 0.0
        for (e in earlyErrors) { earlySum += e }
        let earlyAvg = earlySum / Float64(earlyErrors.size)

        var lateSum = 0.0
        for (e in lateErrors) { lateSum += e }
        let lateAvg = lateSum / Float64(lateErrors.size)

        // 后期平均误差应小于前期
        @Assert(lateAvg < earlyAvg)
        kf.destroy()
    }

    /**
     * Kalman 增益应随更新次数减小（固定测量情况下）。
     */
    @TestCase
    func testGainDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        // 第一次
        kf.predict()
        kf.update([50.0])
        let gain1 = kf.getGain()[0]

        // 再做几步
        for (_ in 0..9) {
            kf.predict()
            kf.update([50.0])
        }
        let gain10 = kf.getGain()[0]

        // 第 10 次更新后的增益应小于第 1 次
        @Assert(gain10 < gain1)
        kf.destroy()
    }
}

// ============================================================
// 6. 目标跟踪仿真测试
// ============================================================

@Test
class TestTargetTracker {
    /**
     * 基本仿真运行：验证仿真正常完成，返回正确数量的步骤。
     */
    @TestCase
    func testSimulationRuns() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker.initialize(trueInitial, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 30, 42)
        @Assert(results.size, 30)
        tracker.destroy()
    }

    /**
     * 仿真结果中时间步应递增。
     */
    @TestCase
    func testTimeStepsIncrease() {
        let tracker = TargetTracker(0.5, 0.3, 5.0)
        let trueInitial = TargetState(0.0, 0.0, 5.0, 3.0)
        tracker.initialize(trueInitial, 10.0, 3.0)
        let results = tracker.simulate(trueInitial, 20, 99)

        for (i in 1..results.size) {
            @Assert(results[i].time > results[i - 1].time)
        }
        tracker.destroy()
    }

    /**
     * 跟踪收敛：后期的平均位置误差应小于前期。
     */
    @TestCase
    func testTrackingConvergence() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        let initEstimate = TargetState(5.0, -3.0, 8.0, 6.0)
        tracker.initialize(initEstimate, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 50, 42)

        // 前 10 步平均误差
        var earlyError = 0.0
        for (i in 0..10) {
            earlyError += results[i].positionError
        }
        earlyError = earlyError / 10.0

        // 后 10 步平均误差
        var lateError = 0.0
        for (i in 40..50) {
            lateError += results[i].positionError
        }
        lateError = lateError / 10.0

        // 后期误差应小于前期
        @Assert(lateError < earlyError)
        tracker.destroy()
    }

    /**
     * 仿真结果确定性：相同种子应产生相同结果。
     */
    @TestCase
    func testDeterministicSimulation() {
        let tracker1 = TargetTracker(1.0, 0.5, 10.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker1.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results1 = tracker1.simulate(trueInit, 20, 12345)

        let tracker2 = TargetTracker(1.0, 0.5, 10.0)
        tracker2.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results2 = tracker2.simulate(trueInit, 20, 12345)

        @Assert(results1.size, results2.size)
        for (i in 0..results1.size) {
            @Assert(abs(results1[i].estimated.px - results2[i].estimated.px) < 1.0e-10)
            @Assert(abs(results1[i].estimated.py - results2[i].estimated.py) < 1.0e-10)
            @Assert(abs(results1[i].positionError - results2[i].positionError) < 1.0e-10)
        }

        tracker1.destroy()
        tracker2.destroy()
    }

    /**
     * 低噪声下跟踪精度应更高。
     */
    @TestCase
    func testLowNoiseBetterAccuracy() {
        // 高噪声跟踪
        let trackerHigh = TargetTracker(1.0, 0.5, 50.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        trackerHigh.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsHigh = trackerHigh.simulate(trueInit, 50, 42)

        // 低噪声跟踪
        let trackerLow = TargetTracker(1.0, 0.5, 5.0)
        trackerLow.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsLow = trackerLow.simulate(trueInit, 50, 42)

        // 计算后 20 步平均误差
        var highError = 0.0
        var lowError = 0.0
        for (i in 30..50) {
            highError += resultsHigh[i].positionError
            lowError += resultsLow[i].positionError
        }
        highError = highError / 20.0
        lowError = lowError / 20.0

        // 低噪声情况下误差应更小
        @Assert(lowError < highError)

        trackerHigh.destroy()
        trackerLow.destroy()
    }
}

// ============================================================
// 7. 边界条件与鲁棒性测试
// ============================================================

@Test
class TestKalmanRobustness {
    /**
     * 大维度滤波器：验证 6 维状态可以正常工作。
     */
    @TestCase
    func testHighDimension() {
        let n = 6
        let m = 3
        let kf = KalmanFilter(Int64(n), Int64(m))

        // 设置单位矩阵作为 F
        let F = Array<Float64>(n * n, {i => if (i / n == i % n) { 1.0 } else { 0.0 }})
        kf.setTransition(F)

        // 设置观测矩阵（前 3 个状态可观测）
        let H = Array<Float64>(m * n, {i =>
            let row = i / n
            let col = i % n
            if (row == col) { 1.0 } else { 0.0 }
        })
        kf.setObservation(H)

        let Q = Array<Float64>(n * n, {i => if (i / n == i % n) { 0.01 } else { 0.0 }})
        kf.setProcessNoise(Q)

        let R = Array<Float64>(m * m, {i => if (i / m == i % m) { 1.0 } else { 0.0 }})
        kf.setMeasurementNoise(R)

        kf.setState(Array<Float64>(n, repeat: 0.0))
        let P0 = Array<Float64>(n * n, {i => if (i / n == i % n) { 100.0 } else { 0.0 }})
        kf.setCovariance(P0)

        // 运行 10 步
        for (_ in 0..10) {
            kf.predict()
            kf.update([10.0, 20.0, 30.0])
        }

        let state = kf.getState()
        @Assert(state.size, Int64(n))
        // 前 3 个状态应接近测量值
        @Assert(abs(state[0] - 10.0) < 2.0)
        @Assert(abs(state[1] - 20.0) < 2.0)
        @Assert(abs(state[2] - 30.0) < 2.0)
        kf.destroy()
    }

    /**
     * 零过程噪声：纯测量更新。
     */
    @TestCase
    func testZeroProcessNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        for (_ in 0..20) {
            kf.predict()
            kf.update([42.0])
        }

        let state = kf.getState()
        @Assert(abs(state[0] - 42.0) < 0.1)

        // 协方差应非常小
        let P = kf.getCovariance()[0]
        @Assert(P < 0.1)
        kf.destroy()
    }

    /**
     * 大测量噪声：滤波器应更依赖预测。
     */
    @TestCase
    func testLargeMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10000.0])  // 非常大的测量噪声
        kf.setState([50.0])
        kf.setCovariance([1.0])

        // 给一个很远的测量值
        kf.predict()
        kf.update([200.0])

        let state = kf.getState()
        // 因为测量噪声很大，滤波器应更信任预测（50附近）
        @Assert(abs(state[0] - 50.0) < abs(200.0 - 50.0) / 2.0)
        kf.destroy()
    }

    /**
     * 小测量噪声：滤波器应更依赖测量。
     */
    @TestCase
    func testSmallMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([100.0])
        kf.setMeasurementNoise([0.001])  // 非常小的测量噪声
        kf.setState([50.0])
        kf.setCovariance([100.0])

        kf.predict()
        kf.update([200.0])

        let state = kf.getState()
        // 因为测量噪声很小，滤波器应接近测量值 200
        @Assert(abs(state[0] - 200.0) < 10.0)
        kf.destroy()
    }
}

// ============================================================
// 8. TargetTracker 单步操作测试
// ============================================================

@Test
class TestTrackerStepByStep {
    /**
     * 手动逐步操作跟踪器。
     */
    @TestCase
    func testManualPredictUpdate() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 10.0, 5.0)

        // 手动执行几步
        for (i in 1..=5) {
            tracker.predict()
            tracker.update(Position(Float64(i) * 10.0, Float64(i) * 5.0))
        }

        let state = tracker.getState()
        @Assert(state.size, 4)
        // 状态应在合理范围内
        @Assert(abs(state[0]) < 200.0)
        @Assert(abs(state[1]) < 200.0)
        tracker.destroy()
    }

    /**
     * 获取协方差矩阵。
     */
    @TestCase
    func testGetCovariance() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 20.0, 5.0)

        let cov = tracker.getCovariance()
        @Assert(cov.size, 16)  // 4x4 矩阵

        // 对角线元素应为正
        @Assert(cov[0] > 0.0)   // P(px, px)
        @Assert(cov[5] > 0.0)   // P(py, py)
        @Assert(cov[10] > 0.0)  // P(vx, vx)
        @Assert(cov[15] > 0.0)  // P(vy, vy)
        tracker.destroy()
    }
}

// ============================================================
// 9. SimpleRandom 测试
// ============================================================

@Test
class TestSimpleRandom {
    /**
     * 相同种子应产生相同序列。
     */
    @TestCase
    func testDeterministic() {
        let rng1 = SimpleRandom(42)
        let rng2 = SimpleRandom(42)

        for (_ in 0..100) {
            @Assert(abs(rng1.nextUniform() - rng2.nextUniform()) < 1.0e-15)
        }
    }

    /**
     * 均匀分布应在 [0, 1) 范围内。
     */
    @TestCase
    func testUniformRange() {
        let rng = SimpleRandom(123)
        for (_ in 0..1000) {
            let v = rng.nextUniform()
            @Assert(v >= 0.0)
            @Assert(v < 1.0)
        }
    }

    /**
     * 高斯分布：大量样本的均值应接近 0，标准差接近 1。
     */
    @TestCase
    func testGaussianDistribution() {
        let rng = SimpleRandom(456)
        let n = 10000
        var sum = 0.0
        var sumSq = 0.0

        for (_ in 0..n) {
            let v = rng.nextGaussian()
            sum += v
            sumSq += v * v
        }

        let mean = sum / Float64(n)
        let variance = sumSq / Float64(n) - mean * mean
        let std = sqrt(variance)

        // 均值应接近 0（允许 0.1 误差）
        @Assert(abs(mean) < 0.1)
        // 标准差应接近 1（允许 0.2 误差）
        @Assert(abs(std - 1.0) < 0.2)
    }

    /**
     * 不同种子应产生不同序列。
     */
    @TestCase
    func testDifferentSeeds() {
        let rng1 = SimpleRandom(1)
        let rng2 = SimpleRandom(2)
        var allSame = true
        for (_ in 0..10) {
            if (abs(rng1.nextUniform() - rng2.nextUniform()) > 1.0e-10) {
                allSame = false
                break
            }
        }
        @Assert(!allSame)
    }
}
