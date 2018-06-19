.PHONY: all

all: extern/gizmo-agora extern/grackle-gizmo-agora

extern:
	mkdir $@

extern/gizmo-agora: | extern
	hg clone ssh://hg@bitbucket.org/qobilidop/gizmo-agora $@
	cp Config.sh $@/

extern/grackle-gizmo-agora: | extern
	hg clone ssh://hg@bitbucket.org/qobilidop/grackle-gizmo-agora $@
	cd $@ && hg up grackle-2.1
