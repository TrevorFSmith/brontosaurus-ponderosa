export BUILD_HOME	:= $(shell pwd)
export FE_PATH		:= $(BUILD_HOME)/fe
export FE_DIST		:= $(BUILD_HOME)/package
export GOPATH		:= $(BUILD_HOME)/go
export GOSRC		:= $(GOPATH)/src
export GOPKG		:= $(GOPATH)/pkg
export GOBIN		:= $(GOPATH)/bin
export GODIST		:= $(BUILD_HOME)/dist
export ARCH			:= $(shell uname)
export RPM_IMAGE	:= "docker.pkg.github.com/transmutable/rpm-build-container/rpm-build-container:v1.0.0"

.PHONY: all tools clean fe npm-install install uninstall rpm
all: tools npm-install fe

tools:
	go build -o $(GOPATH)/bin/brontosaurus-ponderosa $(GOSRC)/bp/main.go
	go build -o $(GOPATH)/bin/ponderosa-brontosaurus $(GOSRC)/pb/main.go

rpm:
	docker run -v "$(BUILD_HOME):/home/rpmbuild" $(RPM_IMAGE) /run.sh rpm.spec

test:
	echo 'No tests, yet'

install: tools
ifneq ($(DESTDIR),)
	mkdir -p $(DESTDIR)/usr/bin
	install -m 0755 $(GOPATH)/bin/brontosaurus-ponderosa $(DESTDIR)/usr/bin/brontosaurus-ponderosa
	install -m 0755 $(GOPATH)/bin/ponderosa-brontosaurus $(DESTDIR)/usr/bin/ponderosa-brontosaurus
else
	install -m 0755 $(GOPATH)/bin/brontosaurus-ponderosa /usr/local/bin/brontosaurus-ponderosa
	install -m 0755 $(GOPATH)/bin/ponderosa-brontosaurus /usr/local/bin/ponderosa-brontosaurus
endif

sign:
ifeq ($(ARCH),Darwin)
	codesign --force --deep --sign - $(bintarget)
endif

npm-install:
	cd fe && npm install

fe:
	cd fe && npm run build
	cd .. && cp $(FE_PATH)/publish-package.json $(FE_DIST)/package.json 
	cp $(FE_PATH)/PUBLISH_README.md $(FE_DIST)/README.md

clean:
	rm -rf "$(GODIST)/*"
	rm -rf "$(GOPATH)/bin/*"
	rm -rf "$(GOPKG)/*"
	rm -rf "$(FE_DIST)/*"
	rm -rf .rpmmacros
	rm -rf ./rpmbuild
	rm -rf ./.cache
