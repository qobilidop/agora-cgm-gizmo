CONFIG_DIR = ../../config

GIZMO_REPO = https://bitbucket.org/qobilidop/gizmo-agora
GIZMO_COMMIT = d679f7e56ee39e8a5078617ac52dd2fbaa6caf4d
GIZMO_DIR = gizmo-hg
GIZMO_CONFIG = gizmo-config.sh
GIZMO_PARAMS = gizmo-params.txt

.PHONY: init

init: GIZMO
GIZMO: $(GIZMO_CONFIG)
	gizenv-compile-gizmo.py \
	--repo $(GIZMO_REPO) \
	--commit $(GIZMO_COMMIT) \
	--dir $(GIZMO_DIR) \
	--config $< \
	--bin $@

init: TREECOOL
TREECOOL: $(GIZMO_DIR)/cooling/TREECOOL
	ln -nsf $< $@

init: ic.dat
ic.dat: $(CONFIG_DIR)/initial-condition/$(CONFIG_IC)
	cp -f $< $@

init: $(GIZMO_PARAMS)
$(GIZMO_PARAMS): $(CONFIG_DIR)/gizmo-params/$(CONFIG_GIZMO_PARAMS)
	cp -f $< $@

ifeq ($(CONFIG_GIZMO_PARAMS),cos.txt)
init: output-times.txt
output-times.txt: $(CONFIG_DIR)/output-times/z.txt
	cp -f $< $@
endif

ifeq ($(CONFIG_GIZMO_PARAMS),iso-old.txt)
GRACKLE_DATA_FILE = CloudyData_UVB=HM2012.h5
else
GRACKLE_DATA_FILE = CloudyData_UVB=HM2012_shielded.h5
endif
init: $(GRACKLE_DATA_FILE)
$(GRACKLE_DATA_FILE): $(GIZENV_LOCAL)/opt/grackle/input/$(GRACKLE_DATA_FILE)
	cp -f $< $@

.PHONY: clean
clean:
	rm -rf job
	rm -rf gizmo-hg output
	rm -f *.dat *.h5 GIZMO gizmo-params.txt* GRACKLE_INFO TREECOOL
