COLLECT=../collect-cdx-times.pl
RELATIVE=../relative-cdx-values.pl
AVERAGE=../average-cdx-values.pl

SUFFIXES=plain eea sext
ALLFILES=$(foreach suffix,$(SUFFIXES),$(wildcard $(suffix)[0-9].txt))

.PHONY: all clean

all: time.svg memory.svg $(ALLFILES:%.txt=time-%.txt) $(ALLFILES:%.txt=memory-%.txt) $(SUFFIXES:%=avg-time-%.txt) $(SUFFIXES:%=avg-memory-%.txt) $(SUFFIXES:%=reltime-%.txt) $(SUFFIXES:%=relmemory-%.txt)

-include depend.mk

depend.mk: $(ALLFILES) Makefile
	@echo "# automatically generated dependencies" >$@
	@$(foreach suffix,$(SUFFIXES),echo "avg-time-$(suffix).txt: $(patsubst %.txt,time-%.txt,$(wildcard $(suffix)[0-9].txt))" >>$@;)
	@$(foreach suffix,$(SUFFIXES),echo "avg-memory-$(suffix).txt: $(patsubst %.txt,memory-%.txt,$(wildcard $(suffix)[0-9].txt))" >>$@;)

time-%.txt: %.txt
	$(COLLECT) time memory $^

memory-%.txt: %.txt
	$(COLLECT) time memory $^

avg-time-%.txt:
	$(AVERAGE) $@ $^

avg-memory-%.txt:
	$(AVERAGE) $@ $^

reltime-%.txt: avg-time-plain.txt avg-time-%.txt
	$(RELATIVE) $@ $< $(@:reltime-%.txt=avg-time-%.txt)

relmemory-%.txt: avg-memory-plain.txt avg-memory-%.txt
	$(RELATIVE) $@ $< $(@:relmemory-%.txt=avg-memory-%.txt)

time.svg: $(SUFFIXES:%=reltime-%.txt)
memory.svg: $(SUFFIXES:%=relmemory-%.txt)

%.svg: %.p
	gnuplot <$<

clean:
	rm -f depend.mk
	rm -f $(ALLFILES:%.txt=reltime-%.txt) $(ALLFILES:%.txt=relmemory-%.txt)
	rm -f $(SUFFIXES:%=avg-time-%.txt) $(SUFFIXES:%=avg-memory-%.txt)
	rm -f time.svg memory.svg
