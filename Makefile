export BUILD_HOME	:= $(shell pwd)
export FE_PATH		:= $(BUILD_HOME)/fe
export FE_DIST		:= $(FE_PATH)/dist
export GOPATH		:= $(BUILD_HOME)/go
export GOSRC		:= $(GOPATH)/src
export GOPKG		:= $(GOPATH)/pkg

.PHONY: all tools clean fe npm-install
all: tools

tools:
	go build -o $(GOPATH)/bin/brontosaurus-ponderosa $(GOSRC)/bp/main.go
	go build -o $(GOPATH)/bin/ponderosa-brontosaurus $(GOSRC)/pb/main.go

make npm-install:
	cd fe && npm install

fe:
	cd fe && npm run build

clean:
	rm -rf $(GOPATH)/bin/*
	rm -rf $(GOPKG)/*
	rm -rf $(FE_DIST)/*
