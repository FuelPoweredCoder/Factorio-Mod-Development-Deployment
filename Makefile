MODSDIR ?= "$(FACTORIO_MODS_DIR)"
ZIPCMD ?= zip
ZIPFILE = "$(MODNAME)_$(VERSION).zip"

deploy: check-mods-dir check-modname get-version
ifeq ($(ZIPCMD), zip)
	zip -r $(ZIPFILE) $(MODNAME)
else ifeq ($(ZIPCMD), 7zz)
	7zz a $(ZIPFILE) $(MODNAME)/*
endif
	mv $(ZIPFILE) $(MODSDIR)

check-mods-dir:
ifndef FACTORIO_MODS_DIR
	$(error FACTORIO_MODS_DIR is not set. Set it using 'export FACTORIO_MODS_DIR=<your_mods_directory>')
endif

get-version: check-modname
	$(eval VERSION=$(shell jq -r '.version' $(MODNAME)/info.json))

check-modname:
ifndef MODNAME
	$(error MODNAME is not set)
endif

examples:
	@echo "Examples of using the make command with this Makefile:"
	@echo ""
	@echo "1. To deploy using the default zip command:"
	@echo "   make deploy MODNAME=<modname>"
	@echo ""
	@echo "2. To deploy using the 7zz command:"
	@echo "   make deploy ZIPCMD=7zz MODNAME=<modname>"
