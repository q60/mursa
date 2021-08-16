NAME = mursa
TARGET = build/mursa

.PHONY: build

all: build test

build:
	red -o "$(TARGET)" -r "src/main.red"

test:
	$(TARGET)

install:
	install -Dm755 "$(TARGET)" "$(DESTDIR)/usr/bin/$(NAME)"

uninstall:
	rm -rfv "$(DESTDIR)/usr/bin/$(NAME)"
