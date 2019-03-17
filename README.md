# gitlab-server

dockerized gitlab server running behind HTTPS reverse-proxy

# dependencies

- [docker](https://github.com/docker/docker-ce). for ubuntu : `curl -s https://gist.githubusercontent.com/monkeydri/43c7533b4c3b854495416a1e607fc5bf/raw/c814934ff15fba474f38fb41e52285c056169ef0/docker-setup.sh | bash`
- [docker-compose](https://github.com/docker/compose). for ubuntu : `curl -s https://gist.githubusercontent.com/monkeydri/3c1c89d3c51d1692ef4df409ff6dc0d0/raw/ec34d23cd8bc1616157aad64714150ff719a9c10/docker-compose-setup.sh | bash`
- [docker-https-nginx-reverse-proxy](https://github.com:monkeydri/docker-https-nginx-reverse-proxy/README.md#quickstart) : `curl -s https://raw.githubusercontent.com/monkeydri/docker-https-nginx-reverse-proxy/master/setup.sh | bash`

# quickstart

- clone the repo : `git clone git@github.com/monkeydri/gitlab-server.git && cd gitlab-server`
- fill required env vars in `.env`
- run setup : `chmod +x setup.sh` && `./setup.sh`