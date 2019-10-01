package main

import (
	"log"
	"os"
)

var logger = log.New(os.Stdout, "[brontosaurus-ponderosa] ", 0)

func main() {
	logger.Println("Yee-Roar!")
}
