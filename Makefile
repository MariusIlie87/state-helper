PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
NAME   ?= state-helper
SRC    ?= state-helper.sh

.PHONY: install uninstall

install:
	install -d $(BINDIR)
	install -m 755 $(SRC) $(BINDIR)/$(NAME)

uninstall:
	rm -f $(BINDIR)/$(NAME)
