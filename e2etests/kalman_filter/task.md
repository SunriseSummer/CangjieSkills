# 仓颉语言卡尔曼滤波目标跟踪开发任务书

## 1. 任务目标

使用 **C 语言**实现一个多维卡尔曼滤波器核心模块，然后使用**仓颉（Cangjie）语言**通过 C 互操作（FFI）调用该 C 模块，实现一个 **2D 目标跟踪仿真**应用。这是一个典型的仓颉 C 互操作综合项目，涉及：

- **C 模块开发**：实现多维卡尔曼滤波算法（矩阵运算、预测/更新步骤）
- **仓颉 FFI 绑定**：声明 `foreign` 函数，映射 C 指针类型
- **仓颉封装层**：提供安全的面向对象 API，管理 C 资源生命周期
- **仿真应用**：实现 2D 匀速运动目标跟踪场景，验证滤波效果

---

## 2. 项目结构

```
kalman/
├── cjpm.toml                  # 仓颉项目配置
├── c_src/
│   ├── kalman_filter.h        # C 头文件（API 声明）
│   └── kalman_filter.c        # C 实现（卡尔曼滤波算法）
├── libs/                      # 编译后的 C 动态库存放目录
│   └── libkalman_filter.so/dll
└── src/
    ├── main.cj                # 入口文件（演示用）
    ├── kalman_ffi.cj          # FFI 声明（foreign 函数）
    ├── kalman_wrapper.cj      # 仓颉封装类（KalmanFilter + KalmanException）
    ├── target_tracker.cj      # 目标跟踪仿真（TargetTracker + 辅助类型）
    └── kalman_test.cj         # 单元测试（已给定，不可修改）
```

### 2.1 项目初始化

```bash
cjpm init --name kalman --type=executable
```

### 2.2 cjpm.toml 配置

```toml
[package]
  cjc-version = "1.0.5"
  name = "kalman"
  version = "1.0.0"
  output-type = "executable"
  link-option = "-lm"

[dependencies]

[ffi.c]
kalman_filter = { path = "./libs/" }
```

> **说明**：`[ffi.c]` 节指定 C 库依赖，`kalman_filter` 对应 `libs/libkalman_filter.so`，`link-option = "-lm"` 链接数学库。

---

## 3. 卡尔曼滤波器算法背景

### 3.1 状态空间模型

卡尔曼滤波器基于线性状态空间模型：

- **状态转移方程**：`x(k) = F * x(k-1) + w(k)`，其中 `w(k) ~ N(0, Q)`
- **观测方程**：`z(k) = H * x(k) + v(k)`，其中 `v(k) ~ N(0, R)`

变量说明：

| 符号 | 维度 | 说明 |
|------|------|------|
| `x` | n × 1 | 状态向量 |
| `F` | n × n | 状态转移矩阵 |
| `H` | m × n | 观测矩阵 |
| `Q` | n × n | 过程噪声协方差 |
| `R` | m × m | 测量噪声协方差 |
| `P` | n × n | 误差协方差矩阵 |
| `K` | n × m | 卡尔曼增益 |
| `z` | m × 1 | 测量向量 |

### 3.2 预测步骤（Predict）

```
x_pred = F * x
P_pred = F * P * F^T + Q
```

### 3.3 更新步骤（Update）

```
y = z - H * x_pred          （新息/残差）
S = H * P_pred * H^T + R    （新息协方差）
K = P_pred * H^T * S^{-1}   （卡尔曼增益）
x = x_pred + K * y          （状态更新）
P = (I - K * H) * P_pred    （协方差更新）
```

### 3.4 所有矩阵使用**行优先（row-major）** 存储

例如 2×2 矩阵 `[[a, b], [c, d]]` 在一维数组中存储为 `[a, b, c, d]`。

---

## 4. C 模块 API 设计

### 4.1 头文件 kalman_filter.h

C 模块使用**不透明指针**（opaque pointer）封装内部状态：

```c
typedef struct KalmanFilter KalmanFilter;
```

### 4.2 生命周期函数

| 函数 | 签名 | 说明 |
|------|------|------|
| `kf_create` | `KalmanFilter* kf_create(int32_t state_dim, int32_t meas_dim)` | 创建滤波器，维度须 > 0，失败返回 NULL |
| `kf_destroy` | `void kf_destroy(KalmanFilter* kf)` | 释放滤波器及所有内部内存 |

### 4.3 参数设置函数

| 函数 | 签名 | 说明 |
|------|------|------|
| `kf_set_transition` | `void kf_set_transition(KalmanFilter* kf, const double* F)` | 设置状态转移矩阵 F（n×n） |
| `kf_set_observation` | `void kf_set_observation(KalmanFilter* kf, const double* H)` | 设置观测矩阵 H（m×n） |
| `kf_set_process_noise` | `void kf_set_process_noise(KalmanFilter* kf, const double* Q)` | 设置过程噪声 Q（n×n） |
| `kf_set_measurement_noise` | `void kf_set_measurement_noise(KalmanFilter* kf, const double* R)` | 设置测量噪声 R（m×m） |
| `kf_set_state` | `void kf_set_state(KalmanFilter* kf, const double* x)` | 设置状态向量 x（n×1） |
| `kf_set_covariance` | `void kf_set_covariance(KalmanFilter* kf, const double* P)` | 设置协方差矩阵 P（n×n） |

### 4.4 滤波函数

| 函数 | 签名 | 说明 |
|------|------|------|
| `kf_predict` | `void kf_predict(KalmanFilter* kf)` | 执行预测步骤 |
| `kf_update` | `void kf_update(KalmanFilter* kf, const double* z)` | 执行更新步骤，z 为测量向量（m×1） |

### 4.5 状态获取函数

| 函数 | 签名 | 说明 |
|------|------|------|
| `kf_get_state` | `void kf_get_state(const KalmanFilter* kf, double* x_out)` | 获取当前状态估计（n×1） |
| `kf_get_covariance` | `void kf_get_covariance(const KalmanFilter* kf, double* P_out)` | 获取误差协方差（n×n） |
| `kf_get_gain` | `void kf_get_gain(const KalmanFilter* kf, double* K_out)` | 获取上次更新的卡尔曼增益（n×m） |
| `kf_get_state_dim` | `int32_t kf_get_state_dim(const KalmanFilter* kf)` | 获取状态维度 |
| `kf_get_meas_dim` | `int32_t kf_get_meas_dim(const KalmanFilter* kf)` | 获取测量维度 |

### 4.6 C 实现要求

1. 矩阵运算使用**行优先存储**，手动实现矩阵乘法、加法、减法、转置乘法
2. 矩阵求逆使用 **Gauss-Jordan 消元法**（带部分主元选取）
3. `kf_create` 初始化 F 和 P 为单位矩阵，其余矩阵为零
4. 所有函数须对 NULL 指针参数做安全检查
5. 编译时启用栈保护：`-fstack-protector-all`

---

## 5. 仓颉 FFI 绑定规格（kalman_ffi.cj）

使用 `foreign` 块声明 C 函数，所有指针参数映射为 `CPointer<Unit>` 或 `CPointer<Float64>`：

```cangjie
package kalman

foreign {
    func kf_create(state_dim: Int32, meas_dim: Int32): CPointer<Unit>
    func kf_destroy(kf: CPointer<Unit>): Unit
    func kf_set_transition(kf: CPointer<Unit>, F: CPointer<Float64>): Unit
    func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit
    func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

**关键技术点**：

- C 的 `KalmanFilter*`（不透明结构体指针）映射为 `CPointer<Unit>`
- C 的 `double*` 数组参数映射为 `CPointer<Float64>`
- 所有 foreign 函数调用须在 `unsafe {}` 块中

---

## 6. 仓颉封装层规格

### 6.1 异常类型（KalmanException）

```
KalmanException <: Exception
  - init(message: String)
```

用于所有滤波器操作错误（创建失败、维度不匹配、已销毁后操作等）。

### 6.2 KalmanFilter 封装类

| 方法 | 签名 | 说明 |
|------|------|------|
| `init` | `public init(stateDim: Int64, measDim: Int64)` | 创建滤波器，维度须 > 0，失败抛 `KalmanException` |
| `destroy` | `public func destroy(): Unit` | 释放 C 资源，可多次调用 |
| `stateDim` | `public prop stateDim: Int64` | 状态维度（只读属性） |
| `measDim` | `public prop measDim: Int64` | 测量维度（只读属性） |
| `setTransition` | `public func setTransition(F: Array<Float64>): Unit` | 设置 F，大小须为 stateDim² |
| `setObservation` | `public func setObservation(H: Array<Float64>): Unit` | 设置 H，大小须为 measDim × stateDim |
| `setProcessNoise` | `public func setProcessNoise(Q: Array<Float64>): Unit` | 设置 Q，大小须为 stateDim² |
| `setMeasurementNoise` | `public func setMeasurementNoise(R: Array<Float64>): Unit` | 设置 R，大小须为 measDim² |
| `setState` | `public func setState(x: Array<Float64>): Unit` | 设置 x，大小须为 stateDim |
| `setCovariance` | `public func setCovariance(P: Array<Float64>): Unit` | 设置 P，大小须为 stateDim² |
| `predict` | `public func predict(): Unit` | 执行预测步骤 |
| `update` | `public func update(z: Array<Float64>): Unit` | 执行更新步骤，z 大小须为 measDim |
| `getState` | `public func getState(): Array<Float64>` | 获取当前状态（返回 stateDim 大小数组） |
| `getCovariance` | `public func getCovariance(): Array<Float64>` | 获取协方差（返回 stateDim² 大小数组） |
| `getGain` | `public func getGain(): Array<Float64>` | 获取卡尔曼增益（返回 stateDim × measDim 大小数组） |

**实现要求**：

1. 使用 `acquireArrayRawData` / `releaseArrayRawData` 实现零拷贝的数组指针传递
2. 所有方法在调用前检查滤波器是否已被销毁，已销毁则抛出 `KalmanException`
3. 所有矩阵设置方法检查数组大小，不匹配则抛出 `KalmanException`

---

## 7. 目标跟踪仿真规格（target_tracker.cj）

### 7.1 辅助数据类型

```cangjie
public struct Position {
    public var x: Float64
    public var y: Float64
}

public struct TargetState {
    public var px: Float64  // 位置 x
    public var py: Float64  // 位置 y
    public var vx: Float64  // 速度 x
    public var vy: Float64  // 速度 y
}

public struct TrackingStep {
    public let time: Float64           // 时间
    public let trueState: TargetState  // 真实状态
    public let measurement: Position   // 测量值
    public let estimated: TargetState  // 估计状态
    public let positionError: Float64  // 位置误差
}
```

### 7.2 随机数生成器（SimpleRandom）

用于确定性仿真的伪随机数生成器：

```cangjie
public class SimpleRandom {
    public init(seed: UInt64)
    public func nextUniform(): Float64           // [0, 1) 均匀分布
    public func nextGaussian(): Float64          // 标准正态分布
    public func nextGaussian(mean: Float64, std: Float64): Float64  // 指定均值和标准差
}
```

**要求**：
- 使用 **xorshift64** 算法生成均匀分布随机数
- 使用 **Box-Muller** 变换生成正态分布随机数
- 相同种子须产生完全相同的随机序列

### 7.3 TargetTracker 类

2D 目标跟踪器，内部使用 4 维状态 `[px, py, vx, vy]` 和 2 维测量 `[px, py]`。

| 方法 | 签名 | 说明 |
|------|------|------|
| `init` | `public init(dt: Float64, processNoise: Float64, measurementNoise: Float64)` | 创建跟踪器 |
| `initialize` | `public func initialize(initialState: TargetState, posUncertainty: Float64, velUncertainty: Float64): Unit` | 设置初始状态和不确定性 |
| `simulate` | `public func simulate(trueInitial: TargetState, steps: Int64, seed: UInt64): ArrayList<TrackingStep>` | 运行完整仿真 |
| `predict` | `public func predict(): Unit` | 单步预测 |
| `update` | `public func update(measurement: Position): Unit` | 单步更新 |
| `getState` | `public func getState(): Array<Float64>` | 获取当前状态 |
| `getCovariance` | `public func getCovariance(): Array<Float64>` | 获取当前协方差 |
| `destroy` | `public func destroy(): Unit` | 释放资源 |

**匀速运动模型参数**：

```
状态转移矩阵 F（dt 为时间步长）：
┌ 1  0  dt  0 ┐
│ 0  1  0  dt │
│ 0  0  1   0 │
└ 0  0  0   1 ┘

观测矩阵 H：
┌ 1  0  0  0 ┐
└ 0  1  0  0 ┘

过程噪声 Q（q = processNoise²）：
┌ dt⁴/4·q   0         dt³/2·q   0       ┐
│ 0         dt⁴/4·q   0         dt³/2·q │
│ dt³/2·q   0         dt²·q     0       │
└ 0         dt³/2·q   0         dt²·q   ┘

测量噪声 R（r = measurementNoise²）：
┌ r   0 ┐
└ 0   r ┘
```

**仿真流程**（simulate 方法）：

```
对每一步 i = 1..steps:
  1. 真实状态传播：加入过程噪声的加速度扰动
     ax = processNoise * N(0,1)
     ay = processNoise * N(0,1)
     true_px += true_vx * dt + 0.5 * ax * dt²
     true_py += true_vy * dt + 0.5 * ay * dt²
     true_vx += ax * dt
     true_vy += ay * dt
  
  2. 生成带噪声的测量：
     meas_x = true_px + measurementNoise * N(0,1)
     meas_y = true_py + measurementNoise * N(0,1)
  
  3. 卡尔曼滤波 predict + update
  
  4. 计算位置估计误差（欧氏距离）
```

---

## 8. 入口文件（main.cj）

```cangjie
package kalman

import std.math.*

main(): Int64 {
    println("=== Kalman Filter Target Tracking Demo ===")
    println()

    // 创建跟踪器：dt=1.0s, 过程噪声=0.5 m/s², 测量噪声=10.0 m
    let tracker = TargetTracker(1.0, 0.5, 10.0)

    // 真实初始状态：位置 (0, 0)，速度 (10, 5) m/s
    let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)

    // 用带偏差的初始估计初始化滤波器
    let initEstimate = TargetState(5.0, -3.0, 8.0, 6.0)
    tracker.initialize(initEstimate, 20.0, 5.0)

    // 运行 50 步仿真
    let results = tracker.simulate(trueInitial, 50, 42)

    // 输出结果（每 5 步输出一行）
    // ... 格式化输出 ...

    // 验证收敛性
    // 前 10 步平均误差 vs 后 10 步平均误差

    tracker.destroy()
    return 0
}
```

---

## 9. 单元测试要求

测试文件已给定为 `kalman_test.cj`，**不要做修改**，直接引入项目并使用仓颉单元测试框架测试。

测试覆盖 **34 个测试用例**，分为 9 个测试类：

| 测试类 | 测试数 | 测试内容 |
|--------|--------|----------|
| `TestKalmanFilterCreate` | 5 | 创建/销毁、维度校验、异常处理 |
| `TestKalmanFilterSetup` | 6 | 状态/协方差设置与获取、维度不匹配异常 |
| `TestKalmanFilter1D` | 3 | 1D 静态值估计、匀速跟踪、纯预测传播 |
| `TestKalmanFilter2D` | 2 | 2D 匀速跟踪、静态目标定位 |
| `TestKalmanConvergence` | 3 | 协方差收敛、误差收敛、增益衰减 |
| `TestTargetTracker` | 5 | 仿真运行、时间步递增、跟踪收敛、确定性、噪声影响 |
| `TestKalmanRobustness` | 4 | 高维滤波、零过程噪声、大/小测量噪声 |
| `TestTrackerStepByStep` | 2 | 手动逐步操作、协方差获取 |
| `TestSimpleRandom` | 4 | 确定性、范围、高斯分布、不同种子 |

---

## 10. 验收标准

1. **C 库编译成功**
2. **仓颉项目编译成功**：`cjpm build` 无错误，无警告
3. **运行正常**：`cjpm run` 输出目标跟踪演示，显示滤波器收敛
4. **全部测试通过**：`cjpm test` 全部 34 个测试通过，0 失败
5. **代码结构清晰**：C 模块和仓颉代码分层明确，文件划分合理

# 5. 测试
cjpm test
# 6. 运行
cjpm run
```
