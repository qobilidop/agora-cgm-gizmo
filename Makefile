REMOTE_WORK = tscc:~/project/agora-gizmo

.PHONY: help
help:
	cat Makefile

.PHONY: init
# Initialize local env for the first time:
# $ source env/activate
# $ source env/<LOCAL_ENV>/activate
# $ make init
# Activate local env afterwords:
# $ source env/activate
init:
	./env/init.sh

.PHONY: purge
# Purge local env
purge:
	rm -rf .local

.PHONY: deploy
deploy:
	rsync -aKmvz --update --delete-after --filter=":- .gitignore" --exclude=".git" ./ $(REMOTE_WORK)/

.PHONY: capture
capture:
	rsync -amvz --update --delete-excluded --exclude="restartfiles" $(REMOTE_WORK)/data/ data/
