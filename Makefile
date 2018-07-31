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

.PHONY: deploy
deploy:
	$(rsync-base) --delete-after --filter=':- .gitignore' --exclude='.git' \
	./ tscc:~/project/agora-gizmo/

.PHONY: capture
capture:
	$(rsync-base) tscc:~/project/agora-gizmo/data/sfh/ data/sfh/
