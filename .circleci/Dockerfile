
# Using python because I am looking at a yaml linting tool to introduce for
# future scanning
FROM python:3.6.2

ENV HELM_LATEST_VERSION="v2.6.1"

RUN wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz