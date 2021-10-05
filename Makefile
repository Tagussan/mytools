deploy: vimplug
	ln -s `pwd`/config/.zshrc $(HOME)/.zshrc
	ln -s `pwd`/config/.tmux.conf $(HOME)/.tmux.conf
	mkdir -p $(HOME)/.config/nvim
	ln -s `pwd`/config/init.vim $(HOME)/.config/nvim/init.vim
	ln -s `pwd`/config/.gitconfig $(HOME)/.gitconfig
	bin/nvim -E +PlugInstall +qall

clean:
	rm -rf $(HOME)/.zshrc $(HOME)/.tmux.conf $(HOME)/.config/nvim $(HOME)/.gitconfig

install-ubuntu: install fish-ubuntu zsh-ubuntu

install: tmux nvim delta lsd ripgrep zoxide mcfly

tmux:
	./install/tmux/install.sh
	cp ./install/tmux/temp/build/tmux bin/

#zsh:
#	./install/zsh/install.sh
#	cp ./install/zsh/temp/build/Src/zsh bin/

vimplug:
	./install/vimplug/install.sh

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

zoxide:
	./install/zoxide/install.sh

mcfly:
	./install/mcfly/install.sh

fish-ubuntu:
	sudo apt-add-repository ppa:fish-shell/release-3
	sudo apt update
	sudo apt install fish -y

zsh-ubuntu:
	sudo apt update
	sudo apt install zsh -y
