.PHONY: all puissance moyenne palindrome pile clean help zip 

ZIP_NAME = INF1600_H26_TP1.zip

all: help

puissance:
	@$(MAKE) -C puissance run

moyenne:
	@$(MAKE) -C moyenne run

palindrome:
	@$(MAKE) -C palindrome run

pile:
	@$(MAKE) -C pile run


clean:
	@$(MAKE) -C puissance clean
	@$(MAKE) -C moyenne clean
	@$(MAKE) -C palindrome clean
	@$(MAKE) -C pile clean

zip: clean
	@echo "=== Création de l'archive $(ZIP_NAME) ==="
	@zip -r $(ZIP_NAME) moyenne/ pile/ palindrome/ puissance/ Makefile
	@echo "Archive créée: $(ZIP_NAME)"

help:
	@echo "Commandes disponibles:"
	@echo "  make moyenne  - Compiler et exécuter le projet moyenne"
	@echo "  make pile     - Compiler et exécuter le projet pile"
	@echo "  make clean    - Nettoyer tous les projets"
	@echo "  make help     - Afficher ce message d'aide"