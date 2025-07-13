.PHONY: brew asdf mise ssh git zsh ghostty
default: .PHONY

mise:
	@chmod +x mise/run.sh
	@./mise/run.sh

brew:
	@chmod +x brew/run.sh
	@./brew/run.sh

zsh:
	@chmod +x zsh/run.sh
	@./zsh/run.sh

ssh:
	@chmod +x ssh/run.sh
	@./ssh/run.sh

git:
	@chmod +x git/run.sh
	@./git/run.sh

ghostty:
	@chmod +x ghostty/run.sh
	@./ghostty/run.sh
