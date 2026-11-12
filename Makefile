MSG ?= Automated Commit

.PHONY: commit_all
commit_all:
	git add -A
	git commit -m "$(MSG)"
	git push origin

update:
	git pull
