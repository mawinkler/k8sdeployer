FROM alpine

ARG KUBECTL_VERSION=1.13.2
ARG HELM_VERSION=2.11.0
ARG DOCKER_VERSION=18.06.1-ce

RUN apk add --update curl && rm -rf /var/cache/apk/*

RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar xvzf - -C /usr/bin --strip-components=1 docker/docker
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl > /usr/bin/kubectl
RUN curl https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xvzf - -C /usr/bin --strip-components=1 linux-amd64/helm

RUN chmod +x /usr/bin/docker /usr/bin/kubectl /usr/bin/helm

CMD ["/usr/bin/kubectl"]
