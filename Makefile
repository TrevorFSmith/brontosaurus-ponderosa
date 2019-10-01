export BUILD_HOME	:= $(shell pwd)
export GOPATH		:= $(BUILD_HOME)/go
export GOSRC		:= $(GOPATH)/src
export GOPKG		:= $(GOPATH)/pkg

.PHONY: all tools clean
all: tools

tools:
	go build -o $(GOPATH)/bin/brontosaurus-ponderosa $(GOSRC)/bp/main.go
	go build -o $(GOPATH)/bin/ponderosa-brontosaurus $(GOSRC)/pb/main.go

clean:
	rm -rf $(GOPATH)/bin/*
	rm -rf $(GOPKG)/*

