GIZMO_LOCAL = extern/gizmo-agora
GIZMO_REMOTE = https://bitbucket.org/qobilidop/gizmo-agora
GIZMO_VERSION = agora
GIZMO_TARGET = $(GIZMO_LOCAL)/GIZMO

GRACKLE_LOCAL = extern/grackle-gizmo-agora
GRACKLE_REMOTE = https://bitbucket.org/qobilidop/grackle-gizmo-agora
GRACKLE_VERSION = gizmo-agora
GRACKLE_TARGET = $(LOCAL_PREFIX)/include/grackle.h

.PHONY: all
all: bin/GIZMO

# GIZMO

bin/GIZMO: $(GIZMO_TARGET)
	mkdir -p bin
	cp $< $@

$(GIZMO_TARGET): $(GRACKLE_TARGET) | $(GIZMO_LOCAL)
	@echo
	@echo Compiling GIZMO
	cp -f config/gizmo_Config.sh $(GIZMO_LOCAL)/Config.sh
	cp -f config/$(SYSTEM)/gizmo_Makefile.systype $(GIZMO_LOCAL)/Makefile.systype
	cd $(GIZMO_LOCAL) && make

$(GIZMO_LOCAL): | extern
	hg clone $(GIZMO_REMOTE) $@ -u $(GIZMO_VERSION)

# Grackle

$(GRACKLE_TARGET): | $(GRACKLE_LOCAL)
	@echo
	@echo Compiling Grackle
	mkdir -p $(LOCAL_PREFIX)
	cp -f config/$(SYSTEM)/grackle_Make.mach.local $(GRACKLE_LOCAL)/src/clib/Make.mach.local
	cd $(GRACKLE_LOCAL) && ./configure
	cd $(GRACKLE_LOCAL)/src/clib && make machine-local && make && make install

$(GRACKLE_LOCAL): | extern
	hg clone $(GRACKLE_REMOTE) $@ -u $(GRACKLE_VERSION)

# Misc

extern:
	mkdir $@

# Clean

.PHONY: clean clean-all

clean:
	rm -f bin/GIZMO
	cd $(GIZMO_LOCAL) && make clean
	cd $(GRACKLE_LOCAL)/src/clib && make clean

clean-all:
	rm -rf bin
	rm -rf extern
	rm -rf local
