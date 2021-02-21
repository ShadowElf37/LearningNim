template repeat(name, body) = 
    block name:
        template exit = break name
        template exit(exit_name) = break exit_name
        while true:
            body

template repeat(body) =
    block loop_block:
        template exit = break loop_block
        template until(condition) =
            if condition:
                break loop_block
        while true:
            body

template until(condition, body) = 
    while not condition:
        body

var i = 0
repeat:
    inc i
    echo i

    until i == 5

until i == 8:
    inc i
    echo i