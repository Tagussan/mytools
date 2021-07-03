libevent:
	./install/libevent/install.sh

tmux: libevent
	./install/tmux/install.sh
	cp ./install/tmux/temp/build/tmux bin/

zsh:
	./install/zsh/install.sh
	cp ./install/zsh/temp/build/Src/zsh bin/

nvim:
	./install/nvim/install.sh
	cp ./install/nvim/temp/nvim bin/

delta:
	./install/delta/install.sh
	cp ./install/delta/temp/build/delta bin/

lsd:
	./install/lsd/install.sh
	cp ./install/lsd/temp/build/lsd bin/

ripgrep:
	./install/ripgrep/install.sh
	cp ./install/ripgrep/temp/build/rg bin/
