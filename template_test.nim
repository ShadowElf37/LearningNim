template repeat(name: untyped, body) =
    block name:
        template exit = break name
        template exit(exit_name) = break exit_name
        template until(condition) =
            if condition: break name
        while true:
            body

template repeat(body) =
    block loopBlockSauce:
        template exit = break loopBlockSauce
        template until(condition) =
            if condition: break loopBlockSauce
        while true:
            body

template until(condition, body) = 
    while not condition:
        body

template counter(name) =
    var name: int
