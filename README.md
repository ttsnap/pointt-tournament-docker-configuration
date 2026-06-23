# pointt-tournament-docker-configuration

Docker-Konfiguration für den Betrieb von [poinTT Tournament](https://pointt.de) als containerisierter Desktop-Anwendung auf Basis von `linuxserver/webtop:debian-xfce`.

***

## Voraussetzungen

- [Docker](https://docs.docker.com/get-docker/) installiert
- [Docker Compose](https://docs.docker.com/compose/install/) installiert
- Internetzugang beim Build (das `.deb`-Paket wird automatisch heruntergeladen)

***

## Quickstart

### 1. Image bauen

```bash
docker build -t mein-webtop-debian:latest .
```

> Das Dockerfile lädt `pointt-tournament.deb` automatisch von [pointt.de](https://pointt.de/assets/pointt-tournament.deb) herunter — kein manueller Download nötig.

### 2. Container starten

```bash
docker-compose up -d
```

### 3. Im Browser aufrufen

| Zugang | URL |
|--------|-----|
| pointt App1 Web-Desktop (HTTPS) | https://localhost:3001 |
| pointt App2 Web-Desktop (HTTPS) | https://localhost:3002 |

Bitte Sicherheitswarnungen des Browsers umgehen.

***

## Projektstruktur

```
.
├── Dockerfile          # Multi-Stage Build: Download + finales Image
├── docker-compose.yml  # Container-Konfiguration und Netzwerk
└── README.md
```

***

## Dockerfile-Aufbau

Das Dockerfile verwendet einen **Multi-Stage Build**:

1. **Stage 1 (`downloader`)** — Lädt `pointt-tournament.deb` von `https://pointt.de/assets/pointt-tournament.deb` herunter.
2. **Stage 2 (finales Image)** — Übernimmt nur die `.deb`-Datei aus Stage 1, installiert sie und verwirft alle Build-Tools. Das finale Image bleibt dadurch schlank.

***

## Container stoppen

```bash
docker-compose down
```

***

## Hinweise

- Die Webtop-Oberfläche (XFCE-Desktop) ist direkt im Browser erreichbar — kein VNC-Client nötig.
- Beim ersten Build wird `pointt-tournament.deb` aus dem Internet geladen; stelle sicher, dass die Build-Umgebung Internetzugang hat.
- Für Produktivbetrieb empfiehlt sich ein Reverse Proxy (z. B. Traefik oder Nginx) mit TLS vor Port 3000/3001.