var a = array[2, int]([0, 0])
#a[] = [2,5]

# Works
echo a[1]
# Works
echo a[^1]

# WORKS
iterator iterup_1[S: static[int], T](arr: var array[S, T]): int =
    for i in countup(0, S-1):
        yield arr[i]

# WORKS
iterator iterup_2[S: static[int], T](arr: var array[S, T]): int =
    for i in countup(0, S-1):
        yield arr[i]

# WORKS
iterator iterdown_1[S: static[int], T](arr: var array[S, T]): int =
    for i in countup(1, S):
        yield arr[^i]

# DOESNT COMPILE
iterator iterdown_2[S: static[int], T](arr: var array[S, T]): int =
    for i in countup(1, S):
        yield arr[^i]

for j in iterup_1(a):
    echo j
for j in iterdown_1(a):
    echo j
for j in iterup_2(a):
    echo j
for j in iterdown_2(a):
    echo j