import sugar
import math

func Integrator(f: (float) -> float): (float, float) -> float =
    let N = 1000
    return proc (x0, x1: float): float =
        let dx = ((x1 - x0) / N.float)
        let width = abs(dx)
        var
            y0, y1: float
            cursor = x0
        y1 = f(cursor)
        for i in countup(0, N-1):
            cursor += dx
            y0 = y1
            y1 = f(cursor)
            result += (y0 + y1) * width / 2
func ZeroIntegrator(f: (float) -> float): (float) -> float =
    return proc (x: float): float = Integrator(f)(0, x)

func Derivator(f: (float) -> float, dx: float = 1/1000000): (float) -> float =
    return proc (x: float): float =
        (f(x+dx) - f(x)) / dx

func nDerivator(f: (float) -> float, n: int, dx: float = 1/1000): (float) -> float =
    result = f
    if n < 1:
        return f
    for _ in countup(1, n):
        result = Derivator(result, dx)


func f(x: float): float = x^2

proc TaylorSeries(f: (float) -> float, a: float=0.0, order=3): (float) -> float =
    var parts: seq[(float) -> float]
    parts.add((x: float) => f(a))
    var d: float
    for n in countup(1, order):
        d = nDerivator(f, n)(a)
        capture n, d:
            parts.add((x: float) =>
                parts[n-1](x) +  d * ((x - a) ^ n) / fac(n).float)
    return parts[^1]

echo f(1.1)
echo TaylorSeries(f, a=1, order=5)(1.1)
