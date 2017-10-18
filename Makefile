DRAFT=draft-ietf-doh-dns-over-https-latest
all: $(DRAFT).txt $(DRAFT).html

.PRECIOUS: $(DRAFT).xml

%.txt: %.xml
	xml2rfc $<

%.html: %.xml
	xml2rfc --html $<

%.xml: %.mkd
	kramdown-rfc2629 $< >$@.new
	# -diff $@ $@.new
	mv $@.new $@

clean:
	$(RM) $(DRAFT).xml $(DRAFT).txt $(DRAFT).html