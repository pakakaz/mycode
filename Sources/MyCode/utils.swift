import Python
import Foundation
let plt = Python.import("matplotlib.pyplot")

public func show(rows: Int = 1, columns: Int = 1, figsize: [Int]=[6,6], _ f: (PythonObject, PythonObject) -> ()) {
    let figax = plt.subplots(rows, columns, figsize:figsize)
    f(figax[0], figax[1])
    _=plt.show()
}


public func timeit(repeating: Int = 1, _ f: () -> ()) {
    guard repeating > 0 else { return }
    
    // Warmup
    if repeating > 1 { f() }
    
    var times = [Double]()
    for _ in 1...repeating {
        let start = DispatchTime.now()
        f()
        let end = DispatchTime.now()
        let nanoseconds = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)
        let milliseconds = nanoseconds / 1e6
        times.append(milliseconds)
    }
    print("average: \(times.reduce(0.0, +)/Double(times.count)) ms,   " +
          "min: \(times.reduce(times[0], min)) ms,   " +
          "max: \(times.reduce(times[0], max)) ms")
}
