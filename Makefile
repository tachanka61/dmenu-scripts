
install:
	sudo cp .dmenurc ~/.dmenurc
	sudo cp ./scripts/* /usr/bin/

clean:
	rm ~/.dmenurc
	rm /usr/bin/dmenu-*.sh

check-scripts:
	shellcheck -x ./scripts/*.sh

.PHONY: clean install check-scripts
