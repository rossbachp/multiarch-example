package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Println("Hello, world!")
	fmt.Println(
`
                        /¯¯\
                        \__/ 
                /¯¯\/¯¯\/¯¯\
                \__/\__/\__/ 
            /¯¯\/¯¯\/¯¯\/¯¯\/¯¯\
bee silicon \__/\__/\__/\__/\__/ on`, runtime.GOOS , "-", runtime.GOARCH )
}
