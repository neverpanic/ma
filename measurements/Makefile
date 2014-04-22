SUBDIRS=$(wildcard [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*)

.PHONY: all clean

all:
	$(foreach subdir,$(SUBDIRS),$(MAKE) -C $(subdir) $@;)

clean:
	$(foreach subdir,$(SUBDIRS),$(MAKE) -C $(subdir) $@;)
