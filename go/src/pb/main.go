package main

import (
	"common"
	"log"
	"os"
)

var logger = log.New(os.Stdout, "[ponderosa-brontosaurus] ", 0)

func main() {
	// try using a value from another package
	if common.ValueOne == "two" {
		logger.Println("This should never happen")
	}
	logger.Println("Roar-Yee!")
}
