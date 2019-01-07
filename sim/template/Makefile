CONFIG_DIR = ../../config

.PHONY: init submit

init: GIZMO
GIZMO: Config.sh
	gizenv-compile-gizmo.py \
	--repo https://bitbucket.org/qobilidop/gizmo-agora \
	--commit d679f7e56ee39e8a5078617ac52dd2fbaa6caf4d \
	--config $< \
	--dir gizmo \
	--bin $@

init: TREECOOL
TREECOOL: gizmo/cooling/TREECOOL
	ln -nsf $< $@

init: ic.dat
ic.dat: $(CONFIG_DIR)/initial-condition/$(IC)
	ln -nsf $< $@

init: params.txt
params.txt: $(CONFIG_DIR)/gizmo-params/$(PARAMS)
	cp -f $< $@

ifeq ($(PARAMS),iso-old.txt)
GRACKLE_DATA_FILE = CloudyData_UVB=HM2012.h5
else
GRACKLE_DATA_FILE = CloudyData_UVB=HM2012_shielded.h5
endif
init: $(GRACKLE_DATA_FILE)
$(GRACKLE_DATA_FILE): $(GIZENV_LOCAL)/opt/grackle/input/$(GRACKLE_DATA_FILE)
	ln -nsf $< $@

init: job/$(JOB)
job/$(JOB): $(CONFIG_DIR)/job/$(JOB)
	mkdir -p job
	cp -f $< $@

submit:
	cd job && $(SUBMIT) $(JOB)
