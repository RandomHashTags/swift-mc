
import Foundation

public enum SimplexNoiseGenerator { // Generated by ChatGPT
    private static func grad(_ hash: Int, _ x: Double, _ y: Double, _ z: Double) -> Double {
        let h:Int = hash & 15
        let u:Double = h < 8 ? x : y
        let v:Double = h < 4 ? y : (h == 12 || h == 14 ? x : z)
        return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v)
    }
    
    /// where `numbers` is an array with count of 512.
    static func noise(_ xin: Double, _ yin: Double, _ zin: Double, numbers: [Int]) -> Double {
        var perm:[Int] = numbers
        fisher_yates_shuffle(&perm)
        
        let F3:Double = 1.0 / 3.0
        let G3:Double = 1.0 / 6.0
        let s:Double = (xin + yin + zin) * F3
        let i:Double = floor(xin + s)
        let j:Double = floor(yin + s)
        let k:Double = floor(zin + s)
        let t:Double = (i + j + k) * G3
        let X0:Double = i - t
        let Y0:Double = j - t
        let Z0:Double = k - t
        let x0:Double = xin - X0
        let y0:Double = yin - Y0
        let z0:Double = zin - Z0
        var i1:Int, j1:Int, k1:Int, i2:Int, j2:Int, k2:Int
        if x0 >= y0 {
            if y0 >= z0 {
                i1 = 1
                j1 = 0
                k1 = 0
                i2 = 1
                j2 = 1
                k2 = 0
            } else if x0 >= z0 {
                i1 = 1
                j1 = 0
                k1 = 0
                i2 = 1
                j2 = 0
                k2 = 1
            } else {
                i1 = 0
                j1 = 0
                k1 = 1
                i2 = 1
                j2 = 0
                k2 = 1
            }
        } else {
            if y0 < z0 {
                i1 = 0
                j1 = 0
                k1 = 1
                i2 = 0
                j2 = 1
                k2 = 1
            } else if x0 < z0 {
                i1 = 0
                j1 = 1
                k1 = 0
                i2 = 0
                j2 = 1
                k2 = 1
            } else {
                i1 = 0
                j1 = 1
                k1 = 0
                i2 = 1
                j2 = 1
                k2 = 0
            }
        }
        let x1:Double = x0 - Double(i1) + G3
        let y1:Double = y0 - Double(j1) + G3
        let z1:Double = z0 - Double(k1) + G3
        let x2:Double = x0 - Double(i2) + 2.0 * G3
        let y2:Double = y0 - Double(j2) + 2.0 * G3
        let z2:Double = z0 - Double(k2) + 2.0 * G3
        let x3:Double = x0 - 1.0 + 3.0 * G3
        let y3:Double = y0 - 1.0 + 3.0 * G3
        let z3:Double = z0 - 1.0 + 3.0 * G3
        let ii:Int = Int(i) & 255
        let jj:Int = Int(j) & 255
        let kk:Int = Int(k) & 255
        let gi0:Int = perm[ii + perm[jj + perm[kk]]] % 12
        let gi1:Int = perm[ii + i1 + perm[jj + j1 + perm[kk + k1]]] % 12
        let gi2:Int = perm[ii + i2 + perm[jj + j2 + perm[kk + k2]]] % 12
        let gi3:Int = perm[ii + 1 + perm[jj + 1 + perm[kk + 1]]] % 12
        var t0:Double = 0.6 - x0 * x0 - y0 * y0 - z0 * z0
        if t0 < 0 {
            t0 = 0
        } else {
            t0 *= t0
        }
        var n0:Double = t0 * t0 * grad(Int(grad(gi0, x0, y0, z0)), x0, y0, z0)
        var t1:Double = 0.6 - x1 * x1 - y1 * y1 - z1 * z1
        if t1 < 0 {
            t1 = 0
        } else {
            t1 *= t1
        }
        var n1:Double = t1 * t1 * grad(Int(grad(gi1, x1, y1, z1)), x1, y1, z1)
        var t2:Double = 0.6 - x2 * x2 - y2 * y2 - z2 * z2
        if t2 < 0 {
            t2 = 0
        } else {
            t2 *= t2
        }
        var n2:Double = t2 * t2 * grad(Int(grad(gi2, x2, y2, z2)), x2, y2, z2)
        var t3:Double = 0.6 - x3 * x3 - y3 * y3 - z3 * z3
        if t3 < 0 {
            t3 = 0
        } else {
            t3 *= t3
        }
        let n3:Double = t3 * t3 * grad(Int(grad(gi3, x3, y3, z3)), x3, y3, z3)
        return 32.0 * (n0 + n1 + n2 + n3)
    }
    
    private static func fisher_yates_shuffle<T>(_ array: inout [T]) {
        let count:Int = array.count
        for i in 0..<count {
            let j:Int = Int.random(in: i..<count)
            if i != j {
                array.swapAt(i, j)
            }
        }
    }
}
