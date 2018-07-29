REMOTE_WORK = tscc:~/project/agora-gizmo

.PHONY: help
help:
	cat Makefile

.PHONY: init
init:
	./env/init.sh

.PHONY: purge
purge:
	rm -rf .local

rsync-base = rsync -aKmvz --update
rsync-gitignore = $(rsync-base) --delete-after --filter=':- .gitignore' --exclude='.git'

.PHONY: deploy-tscc capture-tscc-data
deploy-tscc:
	$(rsync-gitignore) ./ tscc:~/project/agora-gizmo/
capture-tscc-data:
	$(rsync-base) --delete-excluded \
	--include='/isolated-*/output/*.hdf5' --include='*/' --exclude='*' \
	tscc:~/project/agora-gizmo/data/sim/ data/sim/

.PHONY: deploy-edison deploy-edison-data
deploy-edison:
	$(rsync-gitignore) ./ edison:~/project/agora-gizmo/
deploy-edison-data:
	$(rsync-base) --exclude='/sim/cosmological-*/***' \
	data/ edison:~/project/agora-gizmo/data/
