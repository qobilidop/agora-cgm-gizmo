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

.PHONY: deploy
deploy:
	rsync -aKmvz --update --delete-after --filter=":- .gitignore" --exclude=".git" ./ $(REMOTE_WORK)/

.PHONY: capture
capture:
	rsync -amvz --update --delete-excluded --exclude="restartfiles" $(REMOTE_WORK)/data/ data/
