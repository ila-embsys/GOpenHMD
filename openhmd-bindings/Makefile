#!/usr/bin/env make -f

LIB_NAME=openhmd
LIB_CONTENT_PREFIX=ohmd
LIB_VER=0.3.0

all: $(LIB_NAME).gir \
	$(LIB_NAME).vapi \
	$(LIB_NAME).typelib

$(LIB_NAME).gir:
	g-ir-scanner \
		--library=$(LIB_NAME) \
		--pkg-export=$(LIB_NAME) \
		--namespace=$(LIB_NAME) \
		--nsversion=$(LIB_VER) \
		--warn-all \
		--external-library \
		--identifier-prefix=$(LIB_CONTENT_PREFIX) \
		--symbol-prefix=$(LIB_CONTENT_PREFIX) \
		-o "$(CURDIR)/$@" \
		/usr/include/$(LIB_NAME)/$(LIB_NAME).h

$(LIB_NAME).vapi: $(LIB_NAME).gir
	mkdir -p $(CURDIR)/hack-gir

	cp $(LIB_NAME).gir $(CURDIR)/hack-gir

	sed -i 's/<return-value>/<return-value transfer-ownership="none">/g' \
		 $(CURDIR)/hack-gir/$(LIB_NAME).gir

	sed -i 's/introspectable="0"/introspectable="1"/g' \
		$(CURDIR)/hack-gir/$(LIB_NAME).gir

	vapigen --library=$(LIB_NAME) $(CURDIR)/hack-gir/$(LIB_NAME).gir

	rm -rf $(CURDIR)/hack-gir

# It could be generated, but actually context creating falls
# $(LIB_NAME).typelib: $(LIB_NAME).gir
# 	g-ir-compiler --shared-library=libopenhmd --output="$(CURDIR)/$@" openhmd.gir

clean:
	rm -f $(LIB_NAME).gir $(LIB_NAME).vapi $(LIB_NAME).typelib

.PHONY: clean $(LIB_NAME).gir $(LIB_NAME).vapi $(LIB_NAME).typelib
