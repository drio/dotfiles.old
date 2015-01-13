# vim :set ft=make:
app_name:= $(shell basename $(shell pwd))

all:
	@echo "server, apu"

serve:
	python3 -m http.server 8888

apu:
	rsync -avz --exclude=.git --exclude=.git ../$(app_name)/* apu:public_html/$(app_name)
	@echo "--> http://davidr.io/~drio/$(app_name)"

.PHONY: apu watch serve
