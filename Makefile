DESTDIR ?= /usr/local
progname = rofi-linkding
version = $(shell cat version.txt)
etcconfig = /etc/$(progname)rc
defaultconfig = /.config/$(progname)/config
config ?= preferred
configfile = $(HOME)/$(defaultconfig)
ifeq ($(config), etc)
	configfile = $(etcconfig)
endif
ifeq ($(config), home)
	configfile = $(HOME)/.$(progname)rc
endif
group = root
ifeq (`uname -s`), OpenBSD)
	group = bin
endif
ifeq (`uname -s`), Darwin)
	group = bin
endif

help:
	@echo "Usage:"
	@echo "  SYSTEM WIDE INSTALL:"
	@echo "  'sudo make install-system': Install in $(DESTDIR)/bin"
	@echo "  'sudo make DESTDIR=/usr install-system': Install in /usr/bin"
	@echo "  'sudo make DESTDIR=/opt install-system': Install in /opt/bin"
	@echo
	@echo "  USER INSTALL:"
	@echo "  'make install-user': Install in "'$$'"HOME/bin with config as "'$$'"HOME$(defaultconfig)"
	@echo "  'make config=home install-user': Install in "'$$'"HOME/bin with config as "'$$'"HOME/.$(progname)rc"
	@echo "  'make config=etc install-user': Install in "'$$'"HOME/bin with config as /etc/$(progname)rc"
	@echo
	@echo "Note: The script will look for the config file in this order:"
	@echo "  1. "'$$'"HOME$(defaultconfig) (preferred)"
	@echo "  2. "'$$'"HOME/.$(progname)rc"
	@echo "  3. /etc/$(progname)rc"

install:
	@echo "Use 'make install-system' for system-wide install to $(DESTDIR)"
	@echo "Use 'make install-user' for user install to $(HOME)/bin"

install-user:
	install -d -m 755 $(HOME)/bin
	install -m 755 $(progname) $(HOME)/bin/$(progname)
ifeq ($(config), etc)
	@# Use group 0 here because it's 'root' on Linux and 'wheel' on BSD
	sudo install -d -o root -g 0 -m 755 `dirname $(configfile)`
	sudo install -o root -g 0 -m 644 config $(configfile)
else
	install -d -m 755 `dirname $(configfile)`
	install -m 644 config $(configfile)
endif
	@echo "Edit $(configfile) and update with your 'url' and 'apikey'"

install-system:
ifeq ($(LOGNAME), root)
	install -d -o root -g `id -gn root` -m 755 $(DESTDIR)/bin
	install -o root -g $(group) $(progname) -m 755 $(DESTDIR)/bin/$(progname)
	@echo "Create $(etcconfig) or "'$$'"HOME$(defaultconfig) and update with your 'url' and 'apikey'"
else
	@echo "Error: You must be root to run 'make install-system' (use sudo)"
endif

build:
	mkdir -p build/$(progname)-$(version)
	cp README.md LICENSE Makefile $(progname) config build/$(progname)-$(version)/

$(progname)-$(version).tar.gz: build
	cd build && tar -czf ../$(progname)-$(version).tar.gz $(progname)-$(version)

package: $(progname)-$(version).tar.gz

clean:
	rm -Rf build $(progname)-*.tar.gz
