# pointt-tournament-docker-configuration

You need docker to be installed on the system.
Also download the latest version of the app you want to install inside the containers (like pointt-tournament.deb) and store it under apps/ folder.
Build the image via: docker build .
Then run two containers within the same network via: docker-compose up -d