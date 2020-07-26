# This will start a code-server container and expose it at http://127.0.0.1:8080.
# It will also mount your current directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside
# the container.
#docker run -it -p 127.0.0.1:8080:8080 \

docker create \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -p 8443:8443 \
  --restart unless-stopped \
  -v /home/eric/git/code-server/config:/config \
  ubuntu:20.04

#docker create \
#  --name=code-server \
#  -e DOCKER_MODS=linuxserver/mods:code-server-python3 \
#  -e PUID=1000 \
#  -e PGID=1000 \
#  -e TZ=America/Chicago \
#  -p 8443:8443 \
#  -v /home/eric/git/code-server/config:/config \
#  --restart unless-stopped \
#  linuxserver/code-server

#  -v /var/run/docker.sock:/var/run/docker.sock \

#  -e DOCKER_MODS=linuxserver/mods:code-server-docker\|linuxserver/mods:code-server-python3 \

  #-e PASSWORD= `#optional` \
  #-e SUDO_PASSWORD= `#optional` \
  #-e PROXY_DOMAIN=code-server.my.domain `#optional` \

# docker container exec -it code-server /bin/bash;
# add this to a dockerfile and set it up that way
#apt-get install -y python3.8;apt-get install -y python3-pip;


#docker start code-server

#def this...

#docker container exec -it code-server /bin/bash -c '\
#    sudo apt-get update -y && apt-get upgrade -y; \
#    sudo apt-get install -y \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    gnupg-agent \
#    software-properties-common; \
#    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - ;\
#'

#curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh;"
#sudo usermod -aG docker abc;newgrp docker;"

#maybe...
#sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common; \
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -; \
#sudo apt-get update;sudo apt-get install -y docker-ce docker-ce-cli containerd.io;

#this didn't help...
##sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
##sudo apt update
##sudo apt install docker-ce
