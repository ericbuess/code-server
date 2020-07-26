docker stop code-server
docker rm $(docker ps -aq)
docker system prune -f
docker rmi $(docker images -a -q)
docker system prune -f
docker build -t code-server .
#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/git/code-server:/root/.local/share/code-server -e CODESERVERPASSWORD --name=code-server code-server /bin/bash -c "yarn global add code-server; cd /root/.local/share/code-server/workspace/code-server; caddy run & code-server"
#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/git/code-server:/root/.local/share/code-server -v /home/eric/projects:/root/projects -e CODESERVERPASSWORD --name=code-server code-server
#docker run -d -p 8443:8443 -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/code-server:/root/.local/share/code-server -v /home/eric/projects:/root/projects -e CODESERVERPASSWORD --name=code-server code-server
#docker run -d -p 8443:8443 -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/code-server:/root/.local/share/code-server -v /home/eric/caddy:/root/.local/share/caddy -v /home/eric/projects:/root/projects -e CODESERVERPASSWORD --name=code-server code-server
docker run -d -p 8443:8443 -p 80:80 -p 443:443 -v /home/eric/.profile:/root/.profile -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/code-server:/root/.local/share/code-server -v /home/eric/caddy/certs:/root/.local/share/caddy -v /home/eric/caddy/caddyfile:/etc/caddy -v /home/eric/.ssh:/root/.ssh -v /home/eric/.gitconfig:/root/.gitconfig -v /home/eric/projects:/root/projects --name=code-server code-server
#docker run -d -p 8443:8443 -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/code-server:/root/.local/share/code-server -v /home/eric/caddy/certs:/root/.local/share/caddy -v /home/eric/caddy/caddyfile:/etc/caddy -v /home/eric/.ssh:/root/.ssh -v /home/eric/.gitconfig:/root/.gitconfig -v /home/eric/projects:/root/projects -e CODESERVERPASSWORD --name=code-server code-server
#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/projects/code-server:/config/code-server -e CODESERVERPASSWORD --name=code-server code-server /bin/bash -c "cd /config/code-server/workspace/code-server; caddy run & code-server"
docker logs code-server

#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/git/code-server/config:/config -e CODESERVERPASSWORD --name=code-server code-server /bin/bash -c 'cd /config/workspace/code-server; caddy run & code-server'
#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/git/code-server/config:/config -e CODESERVERPASSWORD --name=code-server code-server
#docker stop $(docker ps -aq)
#docker build -t rest /home/eric/git/rest/
#./cleanup.sh
#~/git/code-server/config/workspace/code-server/cleanup.sh
#~/git/code-server/config/workspace/rest/cleanup.sh
#cd ~/git/code-server/config/workspace/code-server/
#docker run -d -p 8080:8080 --mount source=git-rest,destination=/app --name rest rest
#docker run -d -p 8080:8080 --name rest rest
#docker run -d -p 8080:8080 --volume=/home/eric/git/rest --name rest rest
#docker run -p 8080:8080 -v /home/eric/git/rest:/app:ro --name rest rest
#docker run -p 8080:8080 -v /home/eric/git/rest:/app:ro --name rest rest

#docker run -d -p 8080:8080 -v /home/eric/git/rest:/app:ro --name rest rest
#docker run -d -p 8443:8443 -v /home/eric/git/code-server/config/workspace/code-server:/app:ro --name code-server code-server
#docker run -d -p 8443:8443 -v /home/eric/git/code-server/config:/config --name code-server code-server
#docker run -d -p 8443:8443 -v /home/eric/git/code-server/config:/config --name code-server code-server
#docker run -d -p 8443:8443 -v /var/run/docker.sock:/var/run/docker.sock -v /home/eric/git/code-server/config:/config --name=code-server code-server
#docker run -d -p 8080:8080 -v /home/eric/git/rest:/app --name rest rest