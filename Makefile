.PHONY: help
help:
	cat Makefile

deploy:
	rsync -amvz --update --delete-after --filter=':- .gitignore' . tscc:~/project/agora-gizmo

capture:
	rsync -avz --update --exclude='backup' --exclude='restartfiles' tscc:~/project/agora-gizmo/lab/ lab/

share:
	rsync -amvz --update --delete-excluded --include='output/*' --include='*/' --exclude='*' . edison:~/project/agora-gizmo
