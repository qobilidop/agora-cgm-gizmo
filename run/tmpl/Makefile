GIZMO_GIT_SRC = https://github.com/qobilidop/gizmo-agora.git
GIZMO_GIT_COMMIT = cb3a66d19a5acbd57434d6e77e9e43a84bb95621

.PHONY: init
init: GIZMO spcool_tables TREECOOL

GIZMO: gizmo_config.sh | gizmo_src
	cp gizmo_config.sh gizmo_hg/Config.sh
	spack diy -d gizmo_src -n gizmo@local && eval `spack env deactivate --sh` && spack uninstall -y gizmo@local
	ln -s gizmo_hg/GIZMO $@

gizmo_src:
	git clone $(GIZMO_GIT_SRC) $@
	cd $@ && git checkout $(GIZMO_GIT_COMMIT)

spcool_tables:
	curl http://www.tapir.caltech.edu/~phopkins/public/spcool_tables.tgz | tar xz

TREECOOL: | gizmo_src
	ln -s gizmo_src/cooling/TREECOOL $@

.PHONY: recompile
recompile:
	cd gizmo_src && make clean
	rm GIZMO
	make GIZMO
