# docker-traefik-standalone

A standalone Traefik container which can be easily configured with environment variables (or an .env file) and deployed with docker-compose.

## ACME SSL

If `LETSENCRYPT` is set to `true`, provision a SSL cert for services.

If `DNS_PROVIDER` is set, use the DNS Challenge rather than `HTTP-01` Challenge.

See Traefik Docs (https://docs.traefik.io/configuration/acme/#provider) for full list of providers and required environment variables.
