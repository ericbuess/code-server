# For more information, please refer to https://aka.ms/vscode-docker-python
FROM ubuntu:eoan
#FROM ubuntu:latest
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1
#ENV PATH="/opt/conda/:$PATH"

ENV TZ=America/Chicago
#ENV XDG_DATA_HOME=/config

# Install dependencies:
RUN /bin/bash -c '\
   apt-get update -y && apt-get upgrade -y; \
   apt-get install -y apt-utils sudo;\
   apt-get update -y && apt-get upgrade -y; \
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common python3.8 python3-pip; \
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - ; \
sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/debian \
   buster \
   stable"; \
apt-get update -y && apt-get upgrade -y; \
curl -fsSL https://get.docker.com -o get-docker.sh; \
sudo sh get-docker.sh; \
sudo apt-get install -y \
  build-essential \
  pkg-config \
  libx11-dev \
  libxkbfile-dev \
  libsecret-1-dev; \
sudo pip3 install docker-compose; \
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -; \
sudo apt-get install -y nodejs; \
sudo apt-get install -y gcc g++ make; \
sudo apt-get install -y git; \
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -; \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list; \
sudo apt-get update && sudo apt-get install -y yarn nano; \
echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" \
    | sudo tee -a /etc/apt/sources.list.d/caddy-fury.list; \
sudo apt update; \
sudo apt install -y caddy; \
yarn global add code-server \
'

# set the working directory in the container to /app
#WORKDIR /config/workspace/code-server

# Expose the port
#EXPOSE 8443
EXPOSE 80
EXPOSE 443

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["python", "app.py"]
#CMD ["echo","Hello World"]
#CMD tail -f /dev/null
#CMD ["/bin/bash", "code-server & caddy run &"]
#CMD /bin/bash -c "cd /root/.local/share/code-server/workspace/code-server; caddy run & code-server"
#CMD /bin/bash -c "cd /root/projects/code-server; source ~/.profile; caddy run & code-server --disable-telemetry & cat ~/.config/code-server/config.yaml; fg;"
#CMD /bin/bash -c "cd /root/projects/code-server; source ~/.profile; caddy run & code-server --disable-telemetry"
CMD /bin/bash -c "cd /root/projects/code-server; eval $(ssh-agent -s) ssh-add ~/.ssh/id_rsa; source ~/.profile; caddy run & code-server --disable-telemetry"
#CMD /bin/bash -c "cd /config/code-server/workspace/code-server; caddy run & code-server --disable-telemetry"
