include .env
export

traefik/traefik.toml:
ifeq ($(LETSENCRYPT), true)
	cp traefik/traefik-ssl-sample.toml $@
else
	cp traefik/traefik-sample.toml $@
endif
ifdef DNS_PROVIDER
	cp traefik/traefik-ssl-dns-sample.toml $@
	sed "s,{DNS_PROVIDER},$$DNS_PROVIDER," $@ > tmp && mv tmp $@
endif
ifdef PROXY_DOMAIN
	sed "s,{PROXY_DOMAIN},$$PROXY_DOMAIN," $@ > tmp && mv tmp $@
endif
ifdef ADMIN_EMAIL
	sed "s,{ADMIN_EMAIL},$$ADMIN_EMAIL," $@ > tmp && mv tmp $@
endif

deploy: clean traefik/traefik.toml
	docker-compose up -d

clean:
	rm -f traefik/traefik.toml

.PHONY: clean deploy
