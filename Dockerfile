# ── Stage 1: Downloader ──────────────────────────────────────────────
FROM debian:bookworm-slim AS downloader

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/apps && \
    wget -q -O /tmp/apps/pointt-tournament.deb https://pointt.de/assets/pointt-tournament.deb


# ── Stage 2: Finales Image ───────────────────────────────────────────
FROM linuxserver/webtop:debian-xfce

COPY --from=downloader /tmp/apps/pointt-tournament.deb /tmp/apps/

RUN apt-get update && \
    apt-get install -y --no-install-recommends /tmp/apps/pointt-tournament.deb && \
    rm -rf /tmp/apps /var/lib/apt/lists/*