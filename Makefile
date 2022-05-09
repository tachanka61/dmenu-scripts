
install:
	ln -T .dmenurc ~/.dmenurc

clean:
	rm ~/.dmenurc

check-scripts:
	shellcheck -x ./scripts/*.sh

.PHONY: clean install check-scripts
