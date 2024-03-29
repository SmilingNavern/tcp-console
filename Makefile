VERSION=0.4

# www.vanheusden.com

DEBUG=-g -D_DEBUG
LDFLAGS+=$(DEBUG)
CFLAGS+=-O2 -Wall -Wextra -DVERSION=\"$(VERSION)\" $(DEBUG)

OBJS=error.o tc.o

all: tcpconsole

tcpconsole: $(OBJS)
	$(CC) -Wall -W $(OBJS) $(LDFLAGS) -o tcpconsole

install: tcpconsole
	cp tcpconsole /usr/local/sbin

clean:
	rm -f $(OBJS) core tcpconsole

package: clean
	# source package
	rm -rf tcpconsole-$(VERSION)*
	mkdir tcpconsole-$(VERSION)
	cp *.c *.h Makefile* readme.txt tcpconsole-$(VERSION)
	tar cf - tcpconsole-$(VERSION) | gzip -9 > tcpconsole-$(VERSION).tgz
	rm -rf tcpconsole-$(VERSION)
