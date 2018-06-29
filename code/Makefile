GIZMO_LOCAL = extern/gizmo-agora
GIZMO_REMOTE = https://bitbucket.org/qobilidop/gizmo-agora
GIZMO_VERSION = agora

GRACKLE_LOCAL = extern/grackle-gizmo-agora
GRACKLE_REMOTE = https://bitbucket.org/qobilidop/grackle-gizmo-agora
GRACKLE_VERSION = gizmo-agora
GRACKLE_HEADER = $(PROJECT_PREFIX)/include/grackle.h

TARGETS = bin/GIZMO-noSF bin/GIZMO-SFF $(GRACKLE_HEADER)

.PHONY: all
all: $(TARGETS)

# GIZMO

bin/GIZMO-%: config/gizmo_Config-%.sh $(GRACKLE_HEADER) | $(GIZMO_LOCAL) bin
	@echo
	@echo Compiling GIZMO-$*
	cp -f $< $(GIZMO_LOCAL)/Config.sh
	cp -f config/$(PROJECT_ENV)/gizmo_Makefile.systype $(GIZMO_LOCAL)/Makefile.systype
	cd $(GIZMO_LOCAL) && make
	mv $(GIZMO_LOCAL)/GIZMO $@

$(GIZMO_LOCAL): | extern
	hg clone $(GIZMO_REMOTE) $@ -u $(GIZMO_VERSION)

# Grackle

$(GRACKLE_HEADER): | $(GRACKLE_LOCAL)
	@echo
	@echo Compiling Grackle
	mkdir -p $(PROJECT_PREFIX)
	cp -f config/$(PROJECT_ENV)/grackle_Make.mach.local $(GRACKLE_LOCAL)/src/clib/Make.mach.local
	cd $(GRACKLE_LOCAL) && ./configure
	cd $(GRACKLE_LOCAL)/src/clib && make machine-local && make && make install

$(GRACKLE_LOCAL): | extern
	hg clone $(GRACKLE_REMOTE) $@ -u $(GRACKLE_VERSION)

# Directories

bin:
	mkdir $@

extern:
	mkdir $@

# Clean

.PHONY: clean clean-all

clean:
	rm -f $(TARGETS)
	cd $(GIZMO_LOCAL) && make clean
	cd $(GRACKLE_LOCAL)/src/clib && make clean

clean-all:
	rm -rf bin
	rm -rf extern
	rm -rf local
