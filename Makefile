.PHONY: help
help:
	cat Makefile

deploy:
	rsync -aKmvz --update --delete-after --filter=':- .gitignore' . tscc:~/project/agora-gizmo

capture:
	rsync -avz --update --exclude='backup' --exclude='restartfiles' tscc:~/project/agora-gizmo/lab/ lab/
