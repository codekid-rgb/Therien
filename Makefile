.PHONY: all nixos-rebuild

all: nixos-rebuild

nixos-rebuild:
	sudo nixos-rebuild switch --flake .#Therien

