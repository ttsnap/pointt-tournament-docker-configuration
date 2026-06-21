FROM linuxserver/webtop:debian-xfce

# Kopiere die lokalen .deb-Dateien in den Container
COPY apps/ /tmp/apps/

# Pakete installieren und Abhängigkeiten automatisch auflösen
RUN apt-get update && \
    apt-get install -y /tmp/apps/*.deb && \
    rm -rf /tmp/apps /var/lib/apt/lists/*
