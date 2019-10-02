export BUILD_HOME	:= $(shell pwd)
export FE_PATH		:= $(BUILD_HOME)/fe
export FE_DIST		:= $(BUILD_HOME)/package
export GOPATH		:= $(BUILD_HOME)/go
export GOSRC		:= $(GOPATH)/src
export GOPKG		:= $(GOPATH)/pkg
export GODIST		:= $(BUILD_HOME)/dist

.PHONY: all tools clean fe npm-install
all: tools npm-install fe

tools:
	go build -o $(GOPATH)/bin/brontosaurus-ponderosa $(GOSRC)/bp/main.go
	go build -o $(GOPATH)/bin/ponderosa-brontosaurus $(GOSRC)/pb/main.go

make npm-install:
	cd fe && npm install

fe:
	cd fe && npm run build
	cd .. && cp $(FE_PATH)/publish-package.json $(FE_DIST)/package.json 

clean:
	rm -rf $(GODIST)/*
	rm -rf $(GOPATH)/bin/*
	rm -rf $(GOPKG)/*
	rm -rf $(FE_DIST)/*
