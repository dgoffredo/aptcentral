
# "=" instead of ":=", because "scratch.d/" might not exist yet.
APTCENTRAL = ./aptcentral --prefix $(shell realpath scratch.d)

# Note: 'try-start' and 'try-stop' commands would be better than this
# "2>/dev/null || true" hack used below. Then we could distinguish "already
# did that" from "something went wrong."

# Reminder: The pipe character ("|") in a list of prerequesites separates the
# _normal_ prerequisites from the _order-only_ prerequisites. For dependencies
# on installable system utilities, we want _order-only_ prerequisites. Those
# are made if they're absent, but their modification time is not taken to
# account subsequently. Also, remaking them doesn't remake their dependents.
# See the docs:
# https://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html

burger: | /usr/games/cowsay /usr/bin/beef
	cowsay "please don't eat me" | sed "s/n't//; 1c\+[------->++<]>+.++++++++." | tee tmp
	beef tmp >burger
	rm tmp
	$(APTCENTRAL) stop 2>/dev/null || true

/usr/games/cowsay:
	mkdir -p scratch.d && chmod 700 scratch.d
	sudo $(APTCENTRAL) start 2>/dev/null || true
	$(APTCENTRAL) install cowsay

/usr/bin/beef:
	mkdir -p scratch.d && chmod 700 scratch.d
	sudo $(APTCENTRAL) start 2>/dev/null || true
	$(APTCENTRAL) install beef
