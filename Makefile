
install:
	ln -T .dmenurc ~/.dmenurc
	cp ./scripts/* ~/.local/bin/

clean:
	rm ~/.dmenurc
	rm ~/.local/bin/dmenu-*.sh

check-scripts:
	shellcheck -x ./scripts/*.sh

.PHONY: clean install check-scripts
