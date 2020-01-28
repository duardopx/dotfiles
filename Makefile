all:

pull:
	cp ~/.radare2rc ./radare2
	cp ~/.tmux.conf ./tmux
	cp ~/.zshrc ./zsh
	cp ~/.zprofile ./zsh
	cp ~/.config/nvim/init.vim .nvim
	cp ~/.config/i3/config ./i3
	cp ~/.config/alacritty/alacritty.yml ./alacritty

push:
	cp ./radare2/.radare2rc ~
	cp ./tmux/.tmux.conf ~
	cp ./zsh/.zshrc ~
	cp ./zsh/.zprofile ~
	cp ./nvim/init.vim ~/.config/nvim
	cp ./i3/config ~/.config/i3
	cp .alacritty/alacritty.yml ~/.config/alacritty
