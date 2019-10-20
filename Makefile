.PHONY: deploy clean build
clean: 
	rm -rf book

build: 
	mdbook build

deploy: book
	@echo "====> deploying to github"
	rm -rf /tmp/book
	mkdir -p /tmp/book
	git worktree add -f /tmp/book gh-pages
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages
