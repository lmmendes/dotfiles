.PHONY: brew asdf ssh git zsh
default: .PHONY

asdf:
	@chmod +x asdf/run.sh
	@./asdf/run.sh

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
