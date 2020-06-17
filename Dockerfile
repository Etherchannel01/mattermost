ARG BASE_REGISTRY=nexus-docker-secure.levelup-dev.io
ARG BASE_IMAGE=ubi8
ARG BASE_TAG=8.2

FROM mattermost/mattermost-operator:v1.4.0 AS build

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

LABEL org.opencontainers.image.title="mattermost-operator" \
      org.opencontainers.image.description="Mattermost Operator creates, configures and helps manage Mattermost installations on Kubernetes." \
      org.opencontainers.image.licenses="Apache-2.0" \
      org.opencontainers.image.url="https://github.com/mattermost/mattermost-operator" \
      org.opencontainers.image.version="v1.4.0" \
      maintainer="cht@dsop.io"

ENV OPERATOR=/usr/local/bin/mattermost-operator \
    USER_UID=1001 \
    USER_NAME=mattermost-operator

COPY --from=build /usr/local/bin/mattermost-operator /usr/local/bin/mattermost-operator

ENTRYPOINT ["/usr/local/bin/mattermost-operator"]

USER ${USER_UID}
