.PHONY: help code deploy

help:
	cat Makefile

deploy:
	rsync -aKmvz --update --delete-after --filter=':- .gitignore' . edison:~/project/agora-gizmo
