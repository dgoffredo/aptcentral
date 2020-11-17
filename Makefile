
APTCENTRAL := ./aptcentral --prefix $(shell realpath scratch)

# try-start and try-stop could be better than the "|| true" hack.

burger: | /usr/games/cowsay
	cowsay "please don't eat me"
	touch burger
	$(APTCENTRAL) stop 2>/dev/null || true

/usr/games/cowsay:
	sudo $(APTCENTRAL) start 2>/dev/null || true
	$(APTCENTRAL) install cowsay
