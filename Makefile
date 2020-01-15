all:

pull:
	cp ~/.radare2rc .
	cp ~/.tmux.conf .
	cp ~/.zshrc .
	cp ~/.config/nvim/init.vim .
	cp ~/.config/i3/config .

push:
	cp .radare2rc ~
	cp .tmux.conf ~
	cp .zshrc ~
	cp init.vim ~/.config/nvim
	cp config ~/.config/i3
