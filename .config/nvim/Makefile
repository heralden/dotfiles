install-packages-xbps:
	sudo xbps-install cargo gopls nodejs python3-pip racket ripgrep

install-packages-brew:
	brew install python neovim rust nodejs ripgrep

setup: export TFLINT_INSTALL_PATH = $(HOME)/bin
setup:
	npm install --global \
		bash-language-server \
		dockerfile-language-server-nodejs \
		graphql-language-service-cli \
		ocaml-language-server \
		pyright \
		sql-language-server \
		svelte-language-server \
		@tailwindcss/language-server \
		typescript typescript-language-server \
		vim-language-server \
		vls \
		vscode-langservers-extracted \
		yaml-language-server

	curl -sLO https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install
	chmod +x install
	./install --dir $(HOME)/bin
	rm install

	curl -sLO https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo
	chmod +x install-clj-kondo
	./install-clj-kondo --dir $(HOME)/bin
	rm install-clj-kondo

	python3 -m pip install --user neovim

	curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

setup-tex:
	cargo install --git https://github.com/latex-lsp/texlab.git --locked

setup-racket:
	sudo raco pkg install racket-langserver

.PHONY: *
