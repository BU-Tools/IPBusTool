LIBRARY_EXCEPTION_SOURCES  = 
LIBRARY_EXCEPTION_OBJECT_FILES = 

PLUGINS= $(wildcard plugins/*)
SYM_LINKS=$(patsubst %,BUTool/%,${PLUGINS})

FLAGS = $(ifeq $(MAKEFLAGS) "","",-$(MAKEFLAGS))

export CACTUS_ROOT

all: local

cc: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f mk/Makefile.crosscompile

local: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f mk/Makefile.local

init: 
	git submodule update --init --recursive

BUTool/%:%
	@ln -s ../../$< $@

install: 
	$(MAKE) install ${FLAGS} -C BUTool -f mk/Makefile.local

clean:
	@make -C BUTool -f mk/Makefile.crosscompile clean
	@rm -rf ${SYM_LINKS}
