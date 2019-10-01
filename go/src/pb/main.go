package main

import (
	"log"
	"os"
)

var logger = log.New(os.Stdout, "[ponderosa-brontosaurus] ", 0)

func main() {
	logger.Println("Roar-Yee!")
}
