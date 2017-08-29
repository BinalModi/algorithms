# Need to export as ENV var
export TEMPLATE_DIR = templates
PTML_DIR = ptml

INCS = $(TEMPLATE_DIR)/menu.txt $(TEMPLATE_DIR)/chap_menu.txt $(TEMPLATE_DIR)/lang_menu.txt

HTMLFILES = $(shell ls $(PTML_DIR)/*.ptml | sed -e 's/.ptml/.html/' | sed -e 's/ptml\///')
SUBPROJ_FILES = $(shell ls Algocynfas/*.html)

%.html: $(PTML_DIR)/%.ptml $(INCS) template
	utils/html_include.awk <$< >$@

website: $(INCS) $(HTMLFILES) $(SUBPROJ_FILES) template
	./C++/tests.sh
	./Clojure/tests.sh
	./Go/tests.sh
	./Java/tests.sh
	./Javascript/tests.sh
	./Ruby/tests.sh
	cd Python; ./tests.sh
	cd ..
	-git commit -a -m "HTML rebuild."
	git push origin master

local: $(INCS) $(HTMLFILES) template

template: $(TEMPLATE_DIR)
	cd $(TEMPLATE_DIR) ; make all

clean:
	rm $(HTMLFILES)
	cd $(TEMPLATE_DIR) ; make clean
