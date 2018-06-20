.PHONY: help code deploy

help:
	cat Makefile

code:
	cd code && make

deploy:
	rsync -aKmvz --update --delete-after --filter=':- .gitignore' . edison:~/project/agora-gizmo
