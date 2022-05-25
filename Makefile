# lamewm - lame window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c lamewm.c util.c
OBJ = ${SRC:.c=.o}

all: options lamewm

options:
	@echo lamewm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

lamewm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f lamewm ${OBJ} lamewm-${VERSION}.tar.gz

dist: clean
	mkdir -p lamewm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		lamewm.1 drw.h util.h ${SRC} dwm.png transient.c lamewm-${VERSION}
	tar -cf lamewm-${VERSION}.tar lamewm-${VERSION}
	gzip lamewm-${VERSION}.tar
	rm -rf lamewm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f lamewm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/lamewm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < lamewm.1 > ${DESTDIR}${MANPREFIX}/man1/lamewm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/lamewm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/lamewm\
		${DESTDIR}${MANPREFIX}/man1/lamewm.1

.PHONY: all options clean dist install uninstall
