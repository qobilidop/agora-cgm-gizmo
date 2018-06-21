.PHONY: help
help:
	cat Makefile

# % could be {edison, tscc}
deploy-to-%:
	rsync -aKmvz --update --delete-after --filter=':- .gitignore' . $*:~/project/agora-gizmo
