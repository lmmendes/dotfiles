.PHONY: brew zsh asdf iterm ssh git
default: .PHONY

asdf:
	@chmod +x asdf/run.sh
	@./asdf/run.sh

brew:
	@chmod +x brew/run.sh
	@./brew/run.sh

iterm:
	@chmod +x iterm2/run.sh
	@./iterm2/run.sh

zsh:
	@chmod +x zsh/run.sh
	@./zsh/run.sh

ssh:
	@chmod +x ssh/run.sh
	@./ssh/run.sh

git:
	@chmod +x git/run.sh
	@./git/run.sh